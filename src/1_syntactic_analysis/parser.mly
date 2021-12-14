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
| a = instr ;   b = block { [a]  @  b } 
| a = instr ;  { [a] } 
;


instr:
| a = assignInstr; Lsc { a }
| a = returnInstr; Lsc { a }
| a = declInstr;   Lsc { a }
| a = ifthenelseInstr  { a }
;



expr:
| a = intExpr{ a }
| a = varExpr{ a }
| a = opExpr { a }
;







(* Expr *)

intExpr : n = Lint { Int {value = n ; pos = $startpos(n) } };
varExpr : v = Lvar { Var { name = v; pos = $startpos(v) } };

 
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


(* Instr *)



assignInstr: 
| v = Lvar; Lassign; b = expr { 
    Assign { var = v; expr = b; pos = $startpos($2) }
}
;

returnInstr: 
| Lreturn; e = expr {
  Return {  expr = e; pos = $startpos($1) }
}
;

declInstr:
| type_ = Lvar; name = Lvar { 
    Decl{ type_ = type_; var = name; pos = $startpos(type_) }
}
;

ifthenelseInstr:
| Lif; Lopar; c = expr; Lcpar; Lobrace; t = block; Lcbrace; Lelse; Lobrace; e = block; Lcbrace {
    Cond{ cond = c;  then_ = t; else_ = e;  pos = $startpos($1)  }}   
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

