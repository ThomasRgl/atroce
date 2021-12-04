%{
    open Ast
    open Ast.Syntax
%}

%token <int> Lint
%token <string> Lvar
%token Ladd Lsub Lmul Ldiv Lopar Lcpar
%token Lreturn Lassign Lsc Lend

%left Ladd Lsub
%left Lmul Ldiv

%start block

%type <Ast.Syntax.block> block

%%

block:
| a = instr ; b = block {
    [a]  @  b
} 
| Lend { [] }
;

expr:
| n = Lint {
    Int {value = n ; pos = $startpos(n) }
}
| v = Lvar {
    Var { name = v; pos = $startpos(v) }
}
| a = expr; Lmul; b = expr {
    Call {  func = "%mul";
            args = [a ; b];
            pos = $startpos($2) }
}
| a = expr; Ladd; b = expr {
    Call {  func = "%add";
            args = [a ; b];
            pos = $startpos($2) }
}

;

instr:
| v = Lvar; Lassign; b = expr; Lsc { 
    Assign {    var = v;
                expr = b;
                pos = $startpos($2) }
}
| Lreturn; e = expr; Lsc {
  Return {  expr = e;
            pos = $startpos($1) }
}
;