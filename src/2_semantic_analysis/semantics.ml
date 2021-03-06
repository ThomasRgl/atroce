open Ast
open Ast.IR
open Baselib

open Lexing
exception Error of string * Lexing.position





(* fonctions d'aide à la gestion des erreurs *)
let warning msg pos =
	Printf.eprintf "Warning on line %d col %d: %s.\n"
    	pos.pos_lnum (pos.pos_cnum - pos.pos_bol) msg ;;

let expr_pos expr =
    match expr with 
    | Syntax.Int    n -> n.pos
    | Syntax.Call   c -> c.pos
    | Syntax.Var    c -> c.pos
    | Syntax.Assign c -> c.pos
    | Syntax.Addr   c -> c.pos
    | Syntax.Lval   c -> c.pos

let errt expected given pos =
    raise (Error (Printf.sprintf "expected %s but given %s"
                    (var_of_type expected)
                    (var_of_type given),
                    pos))


(* analyse sémantique *)
let checkTypes given expected pos = 
    (if( var_of_type expected = var_of_type given) then
        true
    else(
        if( type_expected expected = type_expected given) then(
            warning (Printf.sprintf "expected %s but given %s"
                        (var_of_type expected)
                        (var_of_type given)) pos;
            true)
        else
            false))
    
let rec analyze_expr expr l_env g_env t_env =
    match expr with
    | Syntax.Int  n  -> Int n.value,  (Int_t "int" ), l_env



    | Syntax.Call c ->
        (match Env.find_opt c.func g_env with
        | Some (Func_t (func_type, params_type)) ->
            if List.length params_type != List.length c.args then
                raise (Error (Printf.sprintf "expected %d arguments but given %d"
                            (List.length params_type) (List.length c.args), c.pos)) ;
            let args = List.map2 (fun param_type arg -> let a_arg, arg_type, _ = analyze_expr arg l_env g_env t_env
                                                        in  if (checkTypes arg_type param_type (expr_pos arg) ) then a_arg
                                                            else errt param_type arg_type (expr_pos arg))
                                params_type c.args in
            Call (c.func, args), func_type, l_env
        | Some _ -> raise (Error (Printf.sprintf "'%s' is not a function" c.func, c.pos))
        | None -> raise (Error (Printf.sprintf "undefined function '%s'" c.func, c.pos)))



    | Syntax.Var v ->
        if Env.mem v.name l_env then
            Var v.name, Env.find v.name l_env, l_env
        else
            raise (Error (Printf.sprintf "1 unbound variable '%s'" v.name, v.pos))



    | Syntax.Assign a ->
        let ae, et, l_env = analyze_expr a.expr l_env g_env t_env in
        let alv, lvt, l_env = analyze_lvalue a.lvalue l_env g_env t_env  in
        Assign (alv, ae),  lvt , l_env



    | Syntax.Addr v ->
        if Env.mem v.name l_env then
            Addr v.name, Env.find v.name l_env, l_env
        else
            raise (Error (Printf.sprintf "2 unbound variable '%s'" v.name, v.pos))


    | Syntax.Lval v ->
        let  alv, t, l_env =  analyze_lvalue v.lvalue l_env g_env t_env in
        Lval (alv), t, l_env


and analyze_lvalue lvalue l_env g_env t_env =
    match lvalue with
    | Syntax.LAddr a -> 
        let addr, t, l_env = analyze_expr a.addr l_env g_env t_env in 
        let index, t, l_env = analyze_expr a.index l_env g_env t_env in 
        LAddr (addr,index ),t, l_env

    | Syntax.LAddrStruct a -> 
        let addr, t, l_env = analyze_expr a.addr l_env g_env t_env in 
        (* let structType = Env.find (var_of_type t) g_env   in  *)
        let (elemType, index) = (match Env.find_opt (var_of_type t) g_env with
        | Some (Struct_t2 (mymap)) -> (match MapStruct.find_opt a.elem mymap with 
                                        | Some a -> a 
                                        | None -> raise (Error (Printf.sprintf "Cet element n'existe pas dans la structure", a.pos)))  
        | Some _ -> raise (Error (Printf.sprintf "This is not a struct", a.pos))
        | None -> raise (Error (Printf.sprintf "This is not a struct "  , a.pos))
        ) in 
         
        LAddr (addr,Int(index) ),elemType, l_env
    (* match lvalue with
    | Syntax.LeftVar v ->
        (match Env.find_opt v.name l_env with
        | Some t ->
                    LeftVar (v.name), t ,l_env
        | None -> raise (Error (Printf.sprintf "'%s' undeclared " v.name , v.pos)) )



    | Syntax.LeftAddrValue v ->
        (match Env.find_opt v.name l_env with
        | Some t ->
                    let e, _, l_env = analyze_expr v.offset l_env g_env in 
                    LeftAddrValue (v.name, e), t ,l_env
        | None -> raise (Error (Printf.sprintf "'%s' undeclared " v.name , v.pos)) ) *)
    


let rec analyze_instr instr l_env g_env t_env break =
    match instr with
    | Syntax.Decl d ->
        if Env.mem d.var l_env then
            raise (Error (Printf.sprintf "redeclaration of '%s'" d.var, d.pos))
        else
            (* tester si le type existe *)
            let l_env = Env.add d.var  d.type_  l_env in 
            Decl( d.type_, d.var), l_env, g_env
    | Syntax.DeclStruct d ->
        (* verifier que d.name  est dans g_env et est un Struct2 
        ajouter dans lenv  *)

        (match Env.find_opt d.type_ g_env with
        | Some (Struct_t2 a) -> 

                let vartype = Struct_t(d.type_) in 
                let newvartype = List.fold_left(fun var p -> Ptr_t(var) ) vartype d.ptr in 
                let l_env = Env.add d.var newvartype l_env in 
                Decl( newvartype, d.var), l_env, g_env

        | Some _ -> raise (Error (Printf.sprintf "'%s' is not a structure" d.var, d.pos))
        | None -> raise (Error (Printf.sprintf "is not a structure '%s'" d.var, d.pos)))  

        (*type_to_type*)
        


    | Syntax.Return r ->
        let ae, _, _ = analyze_expr r.expr l_env g_env t_env in
        Return ae, l_env, g_env
    | Syntax.Break b ->
        if break != 0 then 
            Break, l_env, g_env
        else 
            raise (Error (Printf.sprintf "break statement not within loop or switch", b.pos))
        
    | Syntax.Cond aa ->
        let c, _   , l_env = analyze_expr  aa.cond  l_env g_env t_env in 
        let t, _ , g_env = analyze_block aa.then_ l_env g_env t_env break in 
        let e, _ , g_env = analyze_block aa.else_ l_env g_env t_env break in 
        Cond( c, t, e ), l_env, g_env
    | Syntax.Loop l ->
        let c, _, l_env     = analyze_expr  l.cond  l_env g_env t_env  in 
        let b, l_env, g_env = analyze_block l.block l_env g_env t_env 1 in 
        Loop( c, b ), l_env, g_env
    | Syntax.Expr e ->
        let ae, _, l_env = analyze_expr e.expr l_env g_env t_env in
        Expr( ae ), l_env, g_env
and analyze_block block l_env g_env t_env break =
    match block with
    | [] -> [], l_env, g_env
    | instr :: rest ->
        let ai, l_env, g_env = analyze_instr instr l_env g_env t_env break in
        let ab, l_env, g_env = analyze_block rest  l_env g_env t_env break in
        ai :: ab, l_env, g_env

let rec analyse_params params l_env =
    match params with
    | [] -> [], l_env
    | Syntax.Param p :: rest -> 
        let param = Param( p.type_, p.name) in
        let l_env = Env.add p.name   p.type_ l_env in
        (* peut etre un assign ou un declare ? *)
        let ap, env = analyse_params rest l_env in 
        [ param ] @ ap, l_env 


let rec analyze_func def l_env g_env t_env =
    match def with
    | [] -> [], l_env, g_env, t_env
    | Syntax.Func f :: rest ->
        let params, new_l_env = analyse_params f.params Env.empty in 
        let params_type = List.map (fun param -> ( match param with Param(a,b) ->  a  )) params in 
        let g_env = Env.add f.name  ( Func_t ( f.type_, params_type )) g_env in
        let ab, _ , g_env = analyze_block f.block new_l_env g_env t_env 0 in
        let ad = Func( f.type_,  f.name, params, ab ) in
        let af, l_env, g_env, t_env = analyze_func rest l_env g_env t_env in 
        [ad] @ af, l_env, g_env, t_env
    | Syntax.Struct s :: rest ->
        let name = s.name     in 
        let params = s.params in
        (* let size, s_decl  = List.fold_left (fun s b-> 
                                    match b with 
                                    | Syntax.Param p -> 
                                                let (size, params) = s in 
                                                (size + 4, (params @ [(p.name, p.type_, size)]) ) 
                                    ) (0,[]) params in   *)
        let size, map  = List.fold_left (fun s b-> 
                                    match b with 
                                    | Syntax.Param p -> 
                                                let (size, env) = s in 
                                                (size + 4, MapStruct.add p.name ( p.type_, size) env ) 
                                    ) (0, MapStruct.empty) params in  
        (* let structMap = Env.add "" 10 Struct.empty in  *)
        (*let machin2 = Struct_t2( Struct.of_seq ( List.to_seq s_decl) ) in  *)
        let machin = Struct_t2 ( map )  in 
        let t_env = Env.add name size t_env in 
        let g_env = Env.add name machin g_env in 
        let af, l_env, g_env, t_env = analyze_func rest l_env g_env t_env in 
        [] @ af, l_env, g_env, t_env

let analyze_prog parsed l_env g_env t_env=
    let af, l_env, g_env, t_env = analyze_func parsed l_env g_env t_env in 
    af

let analyze parsed =
    analyze_prog parsed Env.empty Baselib.global_env Baselib._type_
    

(*
let rec analyze_def def l_env =
    match def with
    | Syntax.Func f  ->
        let ab, new_env = analyze_block f.block l_env in
        Func( f.type_,  f.name, analyse_params f.params, ab ), l_env
        

let rec analyze_prog prog l_env=
    match prog with
    | [] -> []
    | f :: rest ->
        let ad, l_env = analyze_def f l_env in
        [ad] @ (analyze_prog rest l_env)

let analyze parsed =
    analyze_prog parsed Baselib._types_

*)