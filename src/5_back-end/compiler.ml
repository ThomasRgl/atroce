open Mips
open Ast.IR(*2
open Ast.V2*)

module Env = Map.Make(String)

type cinfo = { code: Mips.instr list
			 ; env: Mips.loc Env.t
			 ; fpo: int
			 ; counter: int
			 ; return: string }

(* let compile_value v =
  match v with
  | Nil    -> [ Li (V0, 0) ]
  | Bool b -> [ Li (V0, if b then 1 else 0) ]
  | Int n  -> [ Li (V0, n) ]
  | Data l -> [ La (V0, Lbl l)] *)

let rec compile_expr e env =
	match e with
	(* | Value v -> compile_value v *)
	| Int n  -> [ Li (V0, n) ]
	| Var v   -> [ Lw (V0, Env.find v env) ]
	| Call (f, args) ->
		let ca = List.map (fun a ->
						compile_expr a env
						@ [ Addi (SP, SP, -4);
							Sw (V0, Mem (SP, 0)) ])
		args in
		List.flatten ca 
				@ [ Jal f;
	   				Addi (SP, SP, 4 * (List.length args)) ]
	| Assign (lv, e) ->
		compile_expr e env
		@ [ Sw (V0, Env.find lv env) ]
		(* @ (match lv with
			| LVar  v -> [ Sw (V0, Env.find v env) ]
			| LAddr a -> []
						@ [ Addi (SP, SP, -4)
						; Sw (V0, Mem (SP, 0)) ]
						@ compile_expr a env
						@ [ Lw (T0, Mem (SP, 0))
						; Addi (SP, SP, 4)
						; Sw (T0, Mem (V0, 0)) ])  *)

let rec compile_instr i info =
    match i with
    | Decl (todo,v) ->
        { info with
        env = Env.add v (Mem (FP, -info.fpo)) info.env; 
        fpo = info.fpo + 4 }
    | Return e ->
        { info with
        code = info.code
                @ compile_expr e info.env
                @ [ B info.return ] }
    | Expr e ->
	    { info with
	        code = info.code
			        @ compile_expr e info.env } 
    | Cond (c, t, e) ->
	    let uniq = string_of_int info.counter in
	    let ct = compile_block t { info with code = []
										; counter = info.counter + 1 } in
	    let ce = compile_block e { info with code = []
										; counter = ct.counter } in
        { info with
        code = info.code
                @ compile_expr c info.env
                @ [ Beqz (V0, "else" ^ uniq) ]
                @ ct.code
                @ [ B ("endif" ^ uniq)
                    ; Label ("else" ^ uniq) ]
                @ ce.code
                @ [ Label ("endif" ^ uniq) ]
        ; counter = ce.counter }
    | Loop (c, b) -> 
        let uniq = string_of_int info.counter in
        let cb = compile_block b { info with code = []
										; counter = info.counter + 1 } in
        { info with
        code = info.code
                @ [ Label ("condLoop" ^ uniq) ]
                @ compile_expr c info.env
                @ [ Beqz (V0, "endloop" ^ uniq) ]
                @ cb.code
                @ [ B ("condLoop" ^ uniq) ]
                @ [ Label ("endloop" ^ uniq) ]
        ; counter = cb.counter }

and compile_block b info =
    match b with
    | [] -> info
    | i :: r ->
	    compile_block r (compile_instr i info)

let rec param_to_args args =
    match args with 
    | [] -> []
    | Param (type_, name) :: rest -> [name] @ param_to_args rest

let compile_def (Func (type_,name, params, b)) counter =
    (*faire une liste de params *)
    let args = param_to_args params in 
    let cb = compile_block b
			    { code = []
			    ; env =  List.fold_left
						(fun e (i, a) -> Env.add a (Mem (FP, 4 * i)) e)
						Env.empty (List.mapi (fun i a -> i + 1, a) args)
			    ; fpo = 8
			    ; counter = counter + 1
			    ; return = "ret" ^ (string_of_int counter) }
  in cb.counter,
	 []
	 @ [ Label name
	   ; Addi (SP, SP, -cb.fpo)
	   ; Sw (RA, Mem (SP, cb.fpo - 4))
	   ; Sw (FP, Mem (SP, cb.fpo - 8))
	   ; Addi (FP, SP, cb.fpo - 4) ]
	 @ cb.code
	 @ [ Label cb.return
	   ; Addi (SP, SP, cb.fpo)
	   ; Lw (RA, Mem (FP, 0))
	   ; Lw (FP, Mem (FP, -4))
	   ; Jr (RA) ]

let rec compile_prog p counter =
    match p with
    | [] -> []
    | d :: r ->
        let new_counter, cd = compile_def d counter in
        cd @ (compile_prog r new_counter)

(* let compile (code, data) =
  { text = Baselib.builtins @ compile_prog code 0
  ; data = List.map (fun (l, s) -> (l, Asciiz s)) data } *)

let compile (code) =
    { text = Baselib.builtins @ compile_prog code 0
    ; data = List.map (fun (l, s) -> (l, Asciiz s)) [] }