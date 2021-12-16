%{
    open Ast
    open Ast.Syntax
%}

%token <int> Lint
%token <string> Lvar

%token Lsc Lcomma
%token Ladd Lsub Lmul Ldiv 
%token Land Lor 
%token Leq Lneq Llt Lle Lgt Lge 
%token Lopar Lcpar Lobrace Lcbrace Lobrack Lcbrack
%token Lassign

%token Lwhile Lfor Ldo Lbreak Lif Lelse 
%token Lreturn 

%token Lend
%token LToDo


%left Land Lor;
%left Leq Lneq Llt Lgt Lle Lge;
%left Ladd Lsub;
%left Lmul Ldiv;
%left Lassign;

%start prog

%type <Ast.Syntax.prog> prog















%%

prog  :
| a = def ; b = prog { [a]  @  b } 
| Lend { [] }
;

def :
| a = funcDef { a }
;


block:
| a = list(instr) { List.flatten a }
/* | a = instr ;   b = block { a  @  b } 
| a = instr ;  { a }  */
;


instr:
| a = returnInstr; Lsc { a }
| a = declInstr;   Lsc { a }
| a = ifthenelseInstr  { a }
| a = expr; Lsc  { [Expr { expr = a; pos = $startpos(a) }] } 
;



expr:
| a = intExpr { a }
| a = opExpr  { a }
| a = callExpr { a }
| a = lvarExpr { a }

;


lvar:
| a = varExpr   { a }
| a = assignVar { a }
;
 


(* lvar *)

assignVar: 
| v = Lvar; Lassign; b = expr { 
    Assign { name = v; expr = b; pos = $startpos($2) } };

varExpr : v = Lvar { 
    Var { name = v; pos = $startpos(v) } };

 



(* Expr *)


opExpr  : 
| a = expr; Ladd; b = expr { Call {  func = "%add"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Lsub; b = expr { Call {  func = "%sub"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Lmul; b = expr { Call {  func = "%mul"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Ldiv; b = expr { Call {  func = "%div"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Leq;  b = expr { Call {  func = "%mul"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Lneq; b = expr { Call {  func = "%mul"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Llt;  b = expr { Call {  func = "%mul"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Lle;  b = expr { Call {  func = "%mul"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Lgt;  b = expr { Call {  func = "%mul"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Lge;  b = expr { Call {  func = "%mul"; args = [a ; b]; pos = $startpos($2) } } 
(*| a = expr; Land;  b = expr {  } todo*)
(*| a = expr; Lor;   b = expr {  } todo*)
;

callExpr : 
| f = Lvar; Lopar; args = separated_list(Lcomma, expr) ;Lcpar {
    Call { func = f; args = args; pos = $startpos(f)  }
}
;



intExpr  : n = Lint { Int { value = n ; pos = $startpos(n) } };
lvarExpr : n = lvar { Lvar{ lvar  = n ; pos = $startpos(n) } };



(* Instr *)


declInstr:
(*
| type_ = Lvar; name = Lvar { 
    Decl{ type_ = type_; var = name; pos = $startpos(type_) }}
*)
/* | type_ = Lvar; e = lvar { 
    (match e with 
	| Var v    -> 
        [ Decl{ type_ = type_; var = v.name; pos = $startpos(type_) } ] 
	| Assign a -> 
        let decl = [ Decl{ type_ = type_; var = a.name; pos = $startpos(type_) } ] in 
        let mylvar    =  Lvar{ lvar = e; pos = $startpos(e) } in 
        let myvarExpr =  [ Expr{ expr = mylvar; pos = $startpos(e) } ] in 
        decl @ myvarExpr;
    )
} 
; */
| type_ = Lvar; l = separated_nonempty_list(Lcomma, lvar) { 
    List.flatten ( 
        List.map (fun e ->  (match e with 
                        | Var v    -> 
                            [ Decl{ type_ = type_; var = v.name; pos = $startpos(type_) } ] 
                        | Assign a -> 
                            let decl = [ Decl{ type_ = type_; var = a.name; pos = $startpos(type_) } ] in 
                            let mylvar    =  Lvar{ lvar = e; pos = $startpos(l) } in 
                            let myvarExpr =  [ Expr{ expr = mylvar; pos = $startpos(l) } ] in 
                            decl @ myvarExpr;
                        )) l )
} 
;

returnInstr: 
| Lreturn; e = expr {
  [ Return {  expr = e; pos = $startpos($1) } ]
}
;

ifthenelseInstr:
| Lif; Lopar; c = expr; Lcpar; Lobrace; t = block; Lcbrace; Lelse; Lobrace; e = block; Lcbrace {
    [ Cond{ cond = c;  then_ = t; else_ = e;  pos = $startpos($1)  }] 
}  
;

(* Def; *)

funcDef: 
| type_ = Lvar; name = Lvar; Lopar; p = separated_list(Lcomma, param) ; Lcpar; Lobrace; b=block; Lcbrace { 
    Func { type_ = type_; name = name; params = p; block = b; pos = $startpos(name) }
}
;


(* misc *)

params: 
| a = nonemptyparams { a } 
;

nonemptyparams: 
| b = param { [b] }
| a = nonemptyparams Lcomma b = param { a @ [ b ] }
;

param: 
| type_ = Lvar; name = Lvar { Param{ type_ = type_; name = name; pos = $startpos(name) } }
;

/* register $0 toujours à 0 dans mips */