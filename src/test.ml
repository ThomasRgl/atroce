(* ocamlbuild -use-menhir test.byte *)

open Lexing
open Ast

let err msg pos =
	Printf.eprintf "Error on line %d col %d: %s.\n"
    	pos.pos_lnum (pos.pos_cnum - pos.pos_bol) msg ;
  	exit 1

let () =
	if (Array.length Sys.argv) != 2 then begin
    	Printf.eprintf "Usage: %s <file>\n" Sys.argv.(0) ;
    	exit 1
    end;
	let f = open_in Sys.argv.(1) in
	let buf = Lexing.from_channel f in
	try
    	let parsed = Parser.prog Lexer.token buf in
    	close_in f ;
        let oc = open_out "test.asm" in
    	let ast = Semantics.analyze parsed in
    	print_endline (IR.string_of_ir ast);
		let compiled = Compiler.compile ast in
        Mips.print_asm oc compiled;
        close_in f ;
    	(* Mips.print_asm Stdlib.stdout compiled *)
  	with
  	| Lexer.Error c ->
    	err (Printf.sprintf "unrecognized char '%c'" c) (Lexing.lexeme_start_p buf)
  	| Parser.Error ->
    	err "syntax error" (Lexing.lexeme_start_p buf)
  	| Semantics.Error (msg, pos) ->
    	err msg pos
    (* | _ ->  exit 1 *)
    (* | Compiler.Error (msg) ->
    	Printf.eprintf "Error : %s.\n" msg; exit 1 *)
