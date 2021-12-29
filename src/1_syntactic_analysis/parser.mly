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
%token Lassign Laddadd Lsubsub Lsubassign Laddassign
%token Lesp Lptr Ldeclptr

%token Lwhile Lfor Ldo Lbreak Lif Lelse 
%token Lreturn 

%token Lend
%token LToDo






%left Lassign Laddadd Lsubsub Lsubassign Laddassign;
%left Land Lor;
%left Leq Lneq Llt Lgt Lle Lge;
%left Ladd Lsub;
%left Lmul Ldiv;
%left Ldeclptr;
%right Lesp;
%right Lptr;
%left Lif;
%left Lelse;


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
| Lobrace; a = list(instr); Lcbrace { List.flatten a }
| a = instr  { a } 
;


instr:
| a = returnInstr; Lsc    { a }
| a = declInstr;   Lsc    { a }
| a = ifthenelseInstr     { a }
| a = loopInstr           { a }
| a = exprInstr;  Lsc     { a }
| a = breakInstr;  Lsc    { a }
/* | a = expr; Lsc  { [Expr { expr = a; pos = $startpos(a) }] }  */ (*This is not clean, but this is the only way I found to parse the pointers *)
(*| a = assignExpr; Lsc  { [Expr { expr = a; pos = $startpos(a) }] } 
| a = callExpr; Lsc    { [Expr { expr = a; pos = $startpos(a) }] } *)
;



expr:
| a = opExpr              { a }
| a = intExpr             { a }
| a = callExpr            { a }
| a = assignExpr          { a }
| a = lvalueExpr          { a }
| a = addrExpr            { a }

/* | a = varExpr             { a }
| a = valueAdrrExpr       { a }
| a = dmaExpr             { a }  (*direct memory acess*) */

| Lopar; a = expr; Lcpar  { a }

;


lvalue:
| a = leftPtr            { a }
| a = leftVar            { a }
| a = leftdma            { a }
;
 




(* lvalue *)

leftPtr:
| Lptr; v = lvalueExpr { 
    LAddr{ addr = v; index = Int{ value = 0; pos = $startpos(v) }; pos = $startpos(v) }}

leftVar :
| v = Lvar { 
    LAddr{ addr = Addr{ name = v; pos = $startpos(v) }; index = Int{ value = 0; pos = $startpos(v) }; pos = $startpos(v) }}

leftdma :
| v = Lvar; Lobrack; e = expr; Lcbrack { 
    LAddr{ addr = Var{  name = v; pos = $startpos(v) }; index = e; pos = $startpos(v) }};


(* Expr *)


opExpr  : 
| a = expr; Ladd; b = expr { Call {  func = "_add"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Lsub; b = expr { Call {  func = "_sub"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Lmul; b = expr { Call {  func = "_mul"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Ldiv; b = expr { Call {  func = "_div"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Leq;  b = expr { Call {  func = "_eq";  args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Lneq; b = expr { Call {  func = "_neq"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Llt;  b = expr { Call {  func = "_lt";  args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Lle;  b = expr { Call {  func = "_le";  args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Lgt;  b = expr { Call {  func = "_gt";  args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Lge;  b = expr { Call {  func = "_ge";  args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Land; b = expr { Call {  func = "_and"; args = [a ; b]; pos = $startpos($2) } } 
| a = expr; Lor;  b = expr { Call {  func = "_or";  args = [a ; b]; pos = $startpos($2) } } 
;

intExpr  : n = Lint { Int { value = n ; pos = $startpos(n) } };

/* varExpr : n = Lvar { Var { name  = n ; pos = $startpos(n) } };
 
dmaExpr :
| v = Lvar; Lobrack; e = expr; Lcbrack { Call {  func = "_valueAdrr";  args = [ Call {  func = "_add";  args = [ Var {name=v; pos = $startpos(v) }; Call {  func = "_mul"; args = [e ; Int { value = 4 ; pos = $startpos(v) }]; pos = $startpos(e) } ]; pos = $startpos(v) } ]; pos = $startpos(v) } } 

valueAdrrExpr:
| Lptr; v = Lvar { Call {  func = "_valueAdrr";  args = [ Var {name=v; pos = $startpos(v) }  ]; pos = $startpos(v) } } ; */


callExpr : 
| f = Lvar; Lopar; args = separated_list(Lcomma, expr) ;Lcpar {
    Call { func = f; args = args; pos = $startpos(f) }  };

addrExpr:
| Lesp; v = Lvar { 
    Addr{ name = v; pos = $startpos(v) }  };


lvalueExpr:
| l = lvalue{ Lval{ lvalue= l; pos = $startpos(l) } }

assignExpr:  
| l = lvalue; Lassign; b = expr { 
    Assign { lvalue = l; expr = b; pos = $startpos($2) } }
| l = lvalue; Laddadd {
    let e = Call {  func = "_add";  args = [ Lval {lvalue = l; pos = $startpos(l) } ; Int{value = 1; pos = $startpos(l) } ] ; pos = $startpos(l) } in 
    Assign { lvalue = l; expr = e; pos = $startpos($2) } 
}   
| l = lvalue; Lsubsub {
    let e = Call {  func = "_sub";  args = [ Lval {lvalue = l; pos = $startpos(l) } ; Int{value = 1; pos = $startpos(l) } ] ; pos = $startpos(l) } in 
    Assign { lvalue = l; expr = e; pos = $startpos($2) } 
} 
| l = lvalue; Laddassign; e = expr {
    let e = Call {  func = "_add";  args = [ Lval {lvalue = l; pos = $startpos(l) } ; e ] ; pos = $startpos(l) } in 
    Assign { lvalue = l; expr = e; pos = $startpos($2) } 
}   
| l = lvalue; Lsubsub; e = expr {
    let e = Call {  func = "_sub";  args = [ Lval {lvalue = l; pos = $startpos(l) } ; e ] ; pos = $startpos(l) } in 
    Assign { lvalue = l; expr = e; pos = $startpos($2) } 
}   
;
;




(* Instr *)

decl : 
|  p = list(Ldeclptr); v = Lvar;  { (p, v, 0, Int { value = 0 ; pos = $startpos(p) } ) }
|  p = list(Ldeclptr); pair = separated_pair(Lvar,Lassign, expr )  { let (var, expr) = pair in  (p, var, 1, expr) }

declInstr:
| type_ = Lvar;  l = separated_nonempty_list(Lcomma, decl ) { 
   
    List.flatten ( 
        List.map (fun d ->  (
            
            let (p, var, bol, e ) = d in 
            let varType = type_to_type type_ p in 
            if bol = 1 then (*assign*)
                let decl = [ Decl{ type_ = varType; var = var; pos = $startpos(type_) } ] in 
                let lvalue = LAddr{ addr = Addr{ name = var; pos = $startpos(l) }; index = Int{ value = 0; pos = $startpos(l) }; pos = $startpos(l) } in 
                let assign = Assign { lvalue = lvalue; expr = e; pos = $startpos(l) } in 
                let myexpr = [ Expr{ expr = assign; pos = $startpos(l)} ] in 
                decl @  myexpr
            else (*no assign*)
                [ Decl{ type_ = varType; var = var; pos = $startpos(type_) } ]  )) l )
             
}  
;

returnInstr: 
| Lreturn; e = expr {
  [ Return {  expr = e; pos = $startpos($1) } ] 
}
;

breakInstr:
| Lbreak  {
  [ Break {  pos = $startpos($1) } ]
}
;

ifthenelseInstr:
| Lif; Lopar; c = expr; Lcpar; t = block; Lelse;  e = block {
    [ Cond{ cond = c;  then_ = t; else_ = e;  pos = $startpos($1)  }] 
}
/* | Lif; Lopar; c = expr; Lcpar; t = block  {
    [ Cond{ cond = c;  then_ = t; else_ = [];  pos = $startpos($1)  }] 
}   */
;

loopInstr:
| Lwhile Lopar cond = expr Lcpar b = block  {
    [ Loop { cond = cond; block = b; pos = $startpos($1) } ] 
}
| Lfor Lopar d = declInstr; Lsc; cond = expr; Lsc; a = assignExpr; Lcpar; b = block  {
    let b = b @ [Expr{ expr = a; pos = $startpos(a) }] in 
    d @ [ Loop { cond = cond; block = b; pos = $startpos($1) } ]
}   
;

exprInstr: 
| e  = expr { [ Expr{ expr = e; pos = $startpos(e) } ] }




(* Def; *)

funcDef: 
| type_ = Lvar; ptr = list(Ldeclptr); name = Lvar; Lopar; p = separated_list(Lcomma, param) ; Lcpar;  b=block { 
    let varType = type_to_type type_ ptr in 
    Func { type_ = varType; name = name; params = p; block = b; pos = $startpos(name) }
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
| type_ = Lvar; p = list(Ldeclptr); name = Lvar { 
    let varType = type_to_type type_ p in
    Param{ type_ = varType; name = name; pos = $startpos(name) } 
    
    }
;

/* register $0 toujours à 0 dans mips */