type var_t =
    | Builtin_t of string 

type type_t =
    | Var_t of var_t
    | Func_t of var_t * var_t list
    (* | Int_t   *)

let  var_of_type v =
    match v with 
    | Builtin_t b -> b 

let rec string_of_type_t t =
    match t with
    (* | Int_t  -> "int" *)
    | Func_t (r, a) ->
         (if (List.length a) > 1 then "(" else "")
         ^ (String.concat ", " (List.map var_of_type a))
         ^ (if (List.length a) > 1 then ")" else "")
         ^ " -> " ^ (var_of_type r)
    | Var_t (v) -> var_of_type v



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
        | Addr of   { name: ident
                    ; pos: Lexing.position }
        | Call of 	{ func: ident
                    ; args: expr list
                    ; pos: Lexing.position }
        | Assign of { lvalue: lvalue
                    ; expr: expr
                    ; pos: Lexing.position }
    and lvalue =  
        | LeftVar of { name: ident
                     ; pos: Lexing.position }
        | LeftAddrValue of {  name: ident
                            ; offset: expr 
                            ; pos: Lexing.position }

    type instr =
        | Decl of 	{ type_: ident
                    ; var: ident
                    ; pos: Lexing.position }
        | Return of { expr: expr
                    ; pos: Lexing.position }
        | Break of { pos: Lexing.position }
        | Cond   of { cond: expr
                    ; then_: block 
                    ; else_: block
                    ; pos : Lexing.position }
        | Loop   of { cond: expr
                    ; block: block 
                    ; pos : Lexing.position }
        | Expr   of { expr: expr
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
        | Int    of int
        | Var    of ident
        | Addr   of ident 
        | Call   of ident * expr list
        | Assign of lvalue * expr
    and lvalue =
        | LeftVar       of ident
        | LeftAddrValue of ident * expr

    type instr =
        | Expr   of expr
        | Return of expr
        | Break 
        | Decl   of ident * ident 
        | Cond   of expr * block * block
        | Loop   of expr * block  
    and block = instr list

    type def = 
    |	Func of ident * ident * param list * block

    type prog = def list

    let string_of_ir ast =
        let rec fmt_e = function
            | Int n          -> "Int " ^ (string_of_int n)
            | Var v          -> "Var \"" ^ v ^ "\""
            | Call (f, a)    -> "Call (\"" ^ f ^ "\", [ "
                                             ^ (String.concat " ; " (List.map fmt_e a))
                                             ^ " ])"
            | Assign (lv, e) -> "Assign (\"" ^ fmt_lv lv ^ "\", " ^ (fmt_e e) ^ ")"

            | Addr v -> "&Var \"" ^ v ^ "\""
        and fmt_lv = function   
            | LeftVar v        ->  "Var \"" ^ v ^ "\""
            | LeftAddrValue (v,o)  -> "*Var \"" ^ v ^ "\" [" ^ fmt_e o ^ "]"
        and fmt_i = function
            | Break         -> "Break"
            | Return e      -> "Return (" ^ (fmt_e e) ^ ")"
            | Decl (t,n)    -> "Decl (" ^ t ^ " " ^ n ^  ")"
            | Cond (c,t,e)  -> "If (" ^ fmt_e c ^  ") { \n" ^ fmt_b t ^ "\n } \n else {" ^ fmt_b e ^ "}" 
            | Loop (c,b )   -> "while (" ^ fmt_e c ^  ") { \n" ^ fmt_b b ^ "\n } \n " 
            | Expr e ->  fmt_e e

        and fmt_b b = "[ " ^ (String.concat "\n; " (List.map fmt_i b)) ^ " ]"
        and fmt_p = function
            Param (t,n) ->  " " ^ t ^ " " ^ n
        and fmt_d  = function
            | Func (t, n, p, b) -> "Func " ^ t ^ " " ^ n ^ " ( " ^ (String.concat ", " (List.map fmt_p p)) ^ " ){ " ^ "\n" ^  fmt_b b ^ "\n}"

        in String.concat "\n" (List.map fmt_d ast)
end
