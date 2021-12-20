
(* The type of tokens. *)

type token = 
  | Lwhile
  | Lvar of (string)
  | Lsub
  | Lsc
  | Lreturn
  | Lor
  | Lopar
  | Lobrack
  | Lobrace
  | Lneq
  | Lmul
  | Llt
  | Lle
  | Lint of (int)
  | Lif
  | Lgt
  | Lge
  | Lfor
  | Lesp
  | Leq
  | Lend
  | Lelse
  | Ldo
  | Ldiv
  | Lcpar
  | Lcomma
  | Lcbrack
  | Lcbrace
  | Lbreak
  | Lassign
  | Land
  | Ladd
  | LToDo

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.Syntax.prog)
