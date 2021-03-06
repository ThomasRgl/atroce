open Mips
open Ast.IR(*2
open Ast.V2*)

module Env = Map.Make(String)

type cinfo = { code: Mips.instr list
			 ; env: int Env.t
			 ; fpo: int
			 ; counter: int
			 ; return: string 
             ; break: string }

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
	| Var v   -> [ Lw (V0, Mem( FP, Env.find v env) ) ]
    | Addr v   -> [ Addi(V0, FP, Env.find v env) ]
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
		(* compile_expr e env
		@ [ Sw (V0, Mem( FP, Env.find lv env)) ] *)
        compile_lvalue lv env   @
        [ Addi (SP, SP, -4)]    @ 
        [Sw (V0, Mem (SP, 0)) ] @ 
        compile_expr e env      @  (*valeur expr dans V0 *)
        [ Lw (T0, Mem (SP, 0))] @  (*adresse lv dans T0 *)
        [Addi (SP, SP, 4)]      @  
        [Sw (V0, Mem( T0, 0))]  

                            
    | Lval (lv) ->
        let lv = compile_lvalue lv env in (*adresse lv dans V0 *)
        lv @ [Lw (V0, Mem (V0, 0))]

and compile_lvalue l env =
    match l with 
    (*
    | LAddr (a,i) -> 
        compile_expr a env      @
        [ Addi (SP, SP, -4)]    @ 
        [Sw (T0, Mem (SP, 0)) ] @ 
        [ Mul( T0,T0, T0 ) ]@
        (*compile_expr i env      @  (*valeur index dans V0 *)*)
        [ Lw (T0, Mem (SP, 0))] @  (*adresse lv dans T0 *)
        [Addi (SP, SP, 4)]      
        (*[ Li  (T3, 4) ]         @
        [ Mul( V0,V0, T3 ) ]    @
        [ Add(V0, V0, T0)]         (*v0 = adresse + index  *)*)*)

    | LAddr (a,i) -> 
        compile_expr a env      @
        [ Addi (SP, SP, -4)]    @ 
        [Sw (V0, Mem (SP, 0)) ] @ 
        compile_expr i env      @  (*valeur index dans V0 *)
        [ Lw (T0, Mem (SP, 0))] @  (*adresse lv dans T0 *)
        [Addi (SP, SP, 4)]      @  
        [ Li  (T3, 4) ]         @
        [ Mul( V0,V0, T3 ) ]    @
        [ Add(V0, V0, T0)]         (*v0 = adresse + index  *)

let rec compile_instr i info =
    match i with
    | Decl (todo,v) ->
        { info with
        env = Env.add v ( -info.fpo) info.env; 
        fpo = info.fpo + 4 }
    | Return e ->
        { info with
        code = info.code
                @ compile_expr e info.env
                @ [ B info.return ] }
    | Break  ->
        { info with
                code = info.code
                    @ [ B info.break ] }
                    
        
        
    | Expr e ->
	    { info with
	        code = info.code
			        @ compile_expr e info.env } 
    | Cond (c, t, e) ->
	    let uniq = string_of_int info.counter in
	    let ct = compile_block t { info with code = []
										; counter = info.counter + 1 } in
	    let ce = compile_block e { info with code = []
										; counter = ct.counter 
                                        ; fpo = ct.fpo } in
        { info with
        code = info.code
                @ compile_expr c info.env
                @ [ Beqz (V0, "else" ^ uniq) ]
                @ ct.code
                @ [ B ("endif" ^ uniq)
                    ; Label ("else" ^ uniq) ]
                @ ce.code
                @ [ Label ("endif" ^ uniq) ]
        ; counter = ce.counter 
        ; fpo = ce.fpo }
    | Loop (c, b) -> 
        let uniq = string_of_int info.counter in
        let oldBreakpoint = info.break in 
        let cb = compile_block b { info with code = []
										; counter = info.counter + 1 
                                        ; break = "endloop" ^ uniq } in
        { info with
        code = info.code
                @ [ Label ("condLoop" ^ uniq) ]
                @ compile_expr c info.env
                @ [ Beqz (V0, "endloop" ^ uniq) ]
                @ cb.code
                @ [ B ("condLoop" ^ uniq) ]
                @ [ Label ("endloop" ^ uniq) ]
        ; counter = cb.counter 
        ; break = oldBreakpoint 
        ; fpo = cb.fpo }

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
						(fun e (i, a) -> Env.add a ( 4 * i) e)
						Env.empty (List.mapi (fun i a -> i + 1, a) args)
			    ; fpo = 8
			    ; counter = counter + 1
			    ; return = "ret" ^ (string_of_int counter) 
                ; break = "" }
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