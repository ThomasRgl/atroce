type type_t =
	| Int_t
	| Func_t of type_t * type_t list

let rec string_of_type_t t =
	match t with
	| Int_t  -> "int"
	| Func_t (r, a) ->
		 (if (List.length a) > 1 then "(" else "")
		 ^ (String.concat ", " (List.map string_of_type_t a))
		 ^ (if (List.length a) > 1 then ")" else "")
		 ^ " -> " ^ (string_of_type_t r)

module Syntax = struct
	type ident = string
	type param = 
		| Param of { type_: ident;
					 name: ident; 
					 pos: Lexing.position }
	type expr =
		| Int  of 	{ value: int
					; pos: Lexing.position }
		| Var  of 	{ name: ident
					; pos: Lexing.position }
		| Call of 	{ func: ident
					; args: expr list
					; pos: Lexing.position }
	type instr =
		| Assign of { var: ident
					; expr: expr
					; pos: Lexing.position }
		| Decl of 	{ type_: ident
					; var: ident
					; pos: Lexing.position }
		| Return of { expr: expr
					; pos: Lexing.position }
		| Cond   of { cond: expr
					; then_: block 
					; else_: block
					; pos : Lexing.position }

	and block = instr list

	type def = 
		| Func of { type_: ident;
					name: ident;
					params: param list;
					block: block;
					pos: Lexing.position }

	type prog = def list
end

module IR = struct
	type ident = string
	type param = 
		| Param of ident * ident 
	type expr =
		| Int  of int
		| Var  of ident
		| Call of ident * expr list
	type instr =
		| Assign of ident * expr
		| Return of expr
		| Decl   of ident * ident 
		| Cond   of expr * block * block
	and block = instr list

	type def = 
    |	Func of ident * ident * param list * block

	type prog = def list

	let string_of_ir ast =
		let rec fmt_e = function
			| Int n       -> "Int " ^ (string_of_int n)
			| Var v       -> "Var \"" ^ v ^ "\""
			| Call (f, a) -> "Call (\"" ^ f ^ "\", [ "
											 ^ (String.concat " ; " (List.map fmt_e a))
											 ^ " ])"
		and fmt_i = function
			| Assign (v, e) -> "Assign (\"" ^ v ^ "\", " ^ (fmt_e e) ^ ")"
			| Return e      -> "Return (" ^ (fmt_e e) ^ ")"
			| Decl (t,n)    -> "Decl (" ^ t ^ " " ^ n ^  ")"
			| Cond (c,t,e)  -> "If (" ^ fmt_e c ^  ") { \n" ^ fmt_b t ^ "\n } \n else {" ^ fmt_b e ^ "}" 

		and fmt_b b = "[ " ^ (String.concat "\n; " (List.map fmt_i b)) ^ " ]"
		and fmt_p = function
			Param (t,n) ->  " " ^ t ^ " " ^ n
		and fmt_d  = function
			| Func (t, n, p, b) -> "Func " ^ t ^ " " ^ n ^ " ( " ^ (String.concat ", " (List.map fmt_p p)) ^ " ){ " ^ "\n" ^  fmt_b b ^ "\n}"

		in String.concat "\n" (List.map fmt_d ast)
end