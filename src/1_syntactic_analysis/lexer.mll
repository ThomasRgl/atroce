{
  open Lexing
  open Parser

  exception Error of char
}

let alpha = ['a'-'z' 'A'-'Z']
let num = ['0'-'9']
let identifier = alpha (alpha | num  | '_')*


rule token = parse
| eof                       { Lend }
| [ ' ' '\t' ]              { token lexbuf }
| '\n'                      { Lexing.new_line lexbuf; token lexbuf }
| '#'                       { comment lexbuf }

(* Symbols *)
| ","      { Lcomma }
| ";"      { Lsc }
| "="      { Lassign }
| "."      { Ldot }
| "("      { Lopar }
| ")"      { Lcpar }
| "{"      { Lobrace }
| "}"      { Lcbrace }
| "["      { Lobrack }
| "]"      { Lcbrack }
| "+"      { Ladd }
| "-"      { Lsub }
| "*"      { Lmul }
| "/"      { Ldiv }
| "=="     { Leq }  
| "!="     { Lneq }
| "<"      { Llt }
| "<="     { Lle }
| ">"      { Lgt }
| ">="     { Lge }
| "&&"     { Land } 
| "||"     { Lor }    
| "->"     { LToDo } 
| "&"      { Lesp }               
| "!"      { Lptr } 
| "^"      { Ldeclptr }  
| "++"     { Laddadd }  
| "--"     { Lsubsub }  
| "-="     { Lsubassign }  
| "+="     { Laddassign }    

(* Keywords *)

| "struct" { Lstruct }
| "return" { Lreturn }
| "while"  { Lwhile }
| "for"    { Lfor }
| "do"     { Ldo }
| "break"  { Lbreak }
| "if"     { Lif }
| "else"   { Lelse }

(* Identifiers *)

| identifier as c           { Lvar (c) }
| num+ as n                 { Lint (int_of_string n) }


| _ as c                    { raise (Error c) }
and comment = parse
| eof  { Lend }
| '\n' { Lexing.new_line lexbuf; token lexbuf }
| _    { comment lexbuf }
