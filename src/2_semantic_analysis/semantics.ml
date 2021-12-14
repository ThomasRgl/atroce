open Ast
open Ast.IR
open Baselib

exception Error of string * Lexing.position





(* fonctions d'aide à la gestion des erreurs *)

let expr_pos expr =
    match expr with 
    | Syntax.Int n  -> n.pos
    | Syntax.Var v  -> v.pos
    | Syntax.Call c -> c.pos

let errt expected given pos =
    raise (Error (Printf.sprintf "expected %s but given %s"
                    (string_of_type_t expected)
                    (string_of_type_t given),
                    pos))

(* analyse sémantique *)

let rec analyze_expr expr l_env g_env =
    match expr with
    | Syntax.Int n  -> Int n.value, Int_t
    | Syntax.Var v ->
        if Env.mem v.name l_env then
            Var v.name, Env.find v.name l_env
        else
            raise (Error (Printf.sprintf "unbound variable '%s'" v.name, v.pos))
    | Syntax.Call c ->
        (match Env.find_opt c.func g_env with
        | Some (Func_t (rt, at)) ->
            if List.length at != List.length c.args then
                raise (Error (Printf.sprintf "expected %d arguments but given %d"
                            (List.length at) (List.length c.args), c.pos)) ;
            let args = List.map2 (fun eat a -> let aa, at = analyze_expr a l_env g_env
                                                in  if at = eat then aa
                                                    else errt eat at (expr_pos a))
                                at c.args in
            Call (c.func, args), rt
        | Some _ -> raise (Error (Printf.sprintf "'%s' is not a function" c.func, c.pos))
        | None -> raise (Error (Printf.sprintf "undefined function '%s'" c.func, c.pos)))

let rec analyze_instr instr l_env g_env =
    match instr with
    | Syntax.Decl d ->
        if Env.mem d.var l_env then
            (* tester si d est une fonction *)
            raise (Error (Printf.sprintf "redeclaration of '%s'" d.var, d.pos))
        else
            let l_env = Env.add d.var Int_t l_env in 
            Decl( d.type_, d.var), l_env, g_env
    | Syntax.Assign a ->
        (* verifier que la var existe *)
        (* verifier que la var est du bon type *)
        (match Env.find_opt a.var l_env with
        | Some (Int_t ) ->
                    let ae, et = analyze_expr a.expr l_env g_env in
                    Assign (a.var, ae), l_env, g_env
        | Some _ -> raise (Error (Printf.sprintf "'%s' is not a variable" a.var, a.pos))
        | None -> raise (Error (Printf.sprintf "'%s' undeclared " a.var , a.pos)) )

    | Syntax.Return r ->
        let ae, _ = analyze_expr r.expr l_env g_env in
        Return ae, l_env, g_env
    | Syntax.Cond aa ->
        let c,_ = analyze_expr  aa.cond  l_env g_env in 
        let t,l_env, g_env = analyze_block aa.then_ l_env g_env in 
        let e,l_env, g_env = analyze_block aa.else_ l_env g_env in 
        Cond( c, t, e ), l_env, g_env

and analyze_block block l_env g_env =
    match block with
    | [] -> [], l_env, g_env
    | instr :: rest ->
        let ai, l_env, g_env = analyze_instr instr l_env g_env in
        let ab, l_env, g_env = analyze_block rest  l_env g_env in
        ai :: ab, l_env, g_env

let rec analyse_params params =
    match params with
    | [] -> []
    | Syntax.Param p :: rest -> 
        let param = Param( p.type_, p.name) in 
        [ param ] @ analyse_params rest  


let rec analyze_func def l_env g_env =
    match def with
    | [] -> [], l_env, g_env
    | Syntax.Func f :: rest ->
        let g_env = Env.add f.name Int_t g_env in
        let ab, l_env, g_env = analyze_block f.block Env.empty g_env in
        let ad = Func( f.type_,  f.name, analyse_params f.params, ab ) in
        let af, l_env, g_env = analyze_func rest l_env g_env in 
        [ad] @ af, l_env, g_env

let analyze_prog parsed l_env g_env =
    let af, l_env, g_env = analyze_func parsed l_env g_env in 
    af

let analyze parsed =
    analyze_prog parsed Env.empty Baselib._types_ 
    

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