open Ast
open Ast.IR
open Baselib

exception Error of string * Lexing.position





(* fonctions d'aide à la gestion des erreurs *)

let expr_pos expr =
    match expr with 
    | Syntax.Int    n -> n.pos
    | Syntax.Call   c -> c.pos
    | Syntax.Var    c -> c.pos
    | Syntax.Assign c -> c.pos
    | Syntax.Addr   c -> c.pos

let errt expected given pos =
    raise (Error (Printf.sprintf "expected %s but given %s"
                    (var_of_type expected)
                    (var_of_type given),
                    pos))

(* analyse sémantique *)

let rec analyze_expr expr l_env g_env =
    match expr with
    | Syntax.Int  n  -> Int n.value,  (Builtin_t "int" ), l_env
    | Syntax.Call c ->
        (match Env.find_opt c.func g_env with
        | Some (Func_t (func_type, params_type)) ->
            if List.length params_type != List.length c.args then
                raise (Error (Printf.sprintf "expected %d arguments but given %d"
                            (List.length params_type) (List.length c.args), c.pos)) ;
            let args = List.map2 (fun param_type arg -> let a_arg, arg_type, _ = analyze_expr arg l_env g_env
                                                        in  if arg_type = param_type then a_arg
                                                            else errt param_type arg_type (expr_pos arg))
                                params_type c.args in
            Call (c.func, args), func_type, l_env
        | Some _ -> raise (Error (Printf.sprintf "'%s' is not a function" c.func, c.pos))
        | None -> raise (Error (Printf.sprintf "undefined function '%s'" c.func, c.pos)))
    | Syntax.Var v ->
        if Env.mem v.name l_env then
            Var v.name, Env.find v.name l_env, l_env
        else
            raise (Error (Printf.sprintf "unbound variable '%s'" v.name, v.pos))
    | Syntax.Assign a ->
        let ae, et, l_env = analyze_expr a.expr l_env g_env in
        let alv, lvt, l_env = analyze_lvalue a.lvalue l_env g_env in
        Assign (alv, ae),  lvt  ,l_env
    | Syntax.Addr v ->
        if Env.mem v.name l_env then
            Addr v.name, Env.find v.name l_env, l_env
        else
            raise (Error (Printf.sprintf "unbound variable '%s'" v.name, v.pos))

and analyze_lvalue lvalue l_env g_env =
    match lvalue with
    | Syntax.LeftVar v ->
        (match Env.find_opt v.name l_env with
        | Some (Builtin_t t) ->
                    LeftVar (v.name), (Builtin_t t ) ,l_env
        | None -> raise (Error (Printf.sprintf "'%s' undeclared " v.name , v.pos)) )

    | Syntax.LeftAddrValue v ->
        (match Env.find_opt v.name l_env with
        | Some (Builtin_t t) ->
                    LeftAddrValue (v.name), (Builtin_t t ) ,l_env
        | None -> raise (Error (Printf.sprintf "'%s' undeclared " v.name , v.pos)) )




let rec analyze_instr instr l_env g_env =
    match instr with
    | Syntax.Decl d ->
        if Env.mem d.var l_env then
            raise (Error (Printf.sprintf "redeclaration of '%s'" d.var, d.pos))
        else
            (* tester si le type existe *)
            let l_env = Env.add d.var  (Builtin_t d.type_ ) l_env in 
            Decl( d.type_, d.var), l_env, g_env
    | Syntax.Return r ->
        let ae, _, _ = analyze_expr r.expr l_env g_env in
        Return ae, l_env, g_env
    | Syntax.Cond aa ->
        let c, _   , l_env = analyze_expr  aa.cond  l_env g_env in 
        let t,l_env, g_env = analyze_block aa.then_ l_env g_env in 
        let e,l_env, g_env = analyze_block aa.else_ l_env g_env in 
        Cond( c, t, e ), l_env, g_env
    | Syntax.Loop l ->
        let c, _, l_env     = analyze_expr l.cond   l_env g_env in 
        let b, l_env, g_env = analyze_block l.block l_env g_env in 
        Loop( c, b ), l_env, g_env
    | Syntax.Expr e ->
        let ae, _, l_env = analyze_expr e.expr l_env g_env in
        Expr( ae ), l_env, g_env
and analyze_block block l_env g_env =
    match block with
    | [] -> [], l_env, g_env
    | instr :: rest ->
        let ai, l_env, g_env = analyze_instr instr l_env g_env in
        let ab, l_env, g_env = analyze_block rest  l_env g_env in
        ai :: ab, l_env, g_env

let rec analyse_params params l_env =
    match params with
    | [] -> [], l_env
    | Syntax.Param p :: rest -> 
        let param = Param( p.type_, p.name) in
        let l_env = Env.add p.name  (Builtin_t p.type_ ) l_env in
        (* peut etre un assign ou un declare ? *)
        let ap, env = analyse_params rest l_env in 
        [ param ] @ ap, l_env 


let rec analyze_func def l_env g_env =
    match def with
    | [] -> [], l_env, g_env
    | Syntax.Func f :: rest ->
        let params, new_l_env = analyse_params f.params Env.empty in 
        let params_type = List.map (fun param -> ( match param with Param(a,b) -> (Builtin_t a ) )) params in 
        let g_env = Env.add f.name  ( Func_t (Builtin_t f.type_, params_type )) g_env in
        let ab, _ , g_env = analyze_block f.block new_l_env g_env in
        let ad = Func( f.type_,  f.name, params, ab ) in
        let af, l_env, g_env = analyze_func rest l_env g_env in 
        [ad] @ af, l_env, g_env

let analyze_prog parsed l_env g_env =
    let af, l_env, g_env = analyze_func parsed l_env g_env in 
    af

let analyze parsed =
    analyze_prog parsed Env.empty Baselib.nom_provisoire 
    

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