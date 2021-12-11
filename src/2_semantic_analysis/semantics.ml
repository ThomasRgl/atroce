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

let rec analyze_expr expr env =
  match expr with
  | Syntax.Int n  -> Int n.value, Int_t
  | Syntax.Var v ->
     if Env.mem v.name env then
       Var v.name, Env.find v.name env
     else
       raise (Error (Printf.sprintf "unbound variable '%s'" v.name,
                     v.pos))
  | Syntax.Call c ->
     match Env.find_opt c.func env with
     | Some (Func_t (rt, at)) ->
        if List.length at != List.length c.args then
          raise (Error (Printf.sprintf "expected %d arguments but given %d"
                          (List.length at) (List.length c.args), c.pos)) ;
        let args = List.map2 (fun eat a -> let aa, at = analyze_expr a env
                                           in if at = eat then aa
                                              else errt eat at (expr_pos a))
                     at c.args in
        Call (c.func, args), rt
     | Some _ -> raise (Error (Printf.sprintf "'%s' is not a function" c.func,
                               c.pos))
     | None -> raise (Error (Printf.sprintf "undefined function '%s'" c.func,
                             c.pos))

let rec analyze_instr instr env =
    match instr with
    | Syntax.Assign a ->
        let ae, et = analyze_expr a.expr env in
        Assign (a.var, ae), Env.add a.var et env
    | Syntax.Return r ->
        let ae, _ = analyze_expr r.expr env in
        Return ae, env
    | Syntax.Cond aa ->
        let c,_ = analyze_expr  aa.cond  env in 
        let t,env = analyze_block aa.then_ env in 
        let e,env = analyze_block aa.else_ env in 
        Cond( c, t, e ), env
    | Syntax.Decl d ->
        Decl( d.type_, d.var), env
and analyze_block block env =
    match block with
    | [] -> [], env
    | instr :: rest ->
        let ai, env = analyze_instr instr env in
        let ab, env = analyze_block rest env in
        ai :: ab, env

let rec analyse_params params =
    match params with
    | [] -> []
    | Syntax.Param p :: rest -> 
        let param = Param( p.type_, p.name) in 
        [ param ] @ analyse_params rest  


let rec analyze_func def env =
    match def with
    | [] -> [], env
    | Syntax.Func f :: rest ->
        let ab, env = analyze_block f.block env in
        let ad = Func( f.type_,  f.name, analyse_params f.params, ab ) in
        let af, env = analyze_func rest env in 
        [ad] @ af, env

let analyze_prog parsed env =
    let af, env = analyze_func parsed env in 
    af

let analyze parsed =
    analyze_prog parsed Baselib._types_
    

(*
let rec analyze_def def env =
    match def with
    | Syntax.Func f  ->
        let ab, new_env = analyze_block f.block env in
        Func( f.type_,  f.name, analyse_params f.params, ab ), env
        

let rec analyze_prog prog env=
    match prog with
    | [] -> []
    | f :: rest ->
        let ad, env = analyze_def f env in
        [ad] @ (analyze_prog rest env)

let analyze parsed =
    analyze_prog parsed Baselib._types_

*)