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
%token Lesp

%token Lwhile Lfor Ldo Lbreak Lif Lelse 
%token Lreturn 

%token Lend
%token LToDo


%left Lassign;
%left Land Lor;
%left Leq Lneq Llt Lgt Lle Lge;
%left Ladd Lsub;
%left Lmul Ldiv;
%right Lesp


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
| a = loopInstr        { a }
/* | a = expr; Lsc  { [Expr { expr = a; pos = $startpos(a) }] }  */ (*This is not clean, but this is the only way I found to parse the pointers *)
| a = lvarExpr; Lsc  { [Expr { expr = a; pos = $startpos(a) }] } 
| a = callExpr; Lsc  { [Expr { expr = a; pos = $startpos(a) }] } 
;



expr:
| a = intExpr  { a }
| a = opExpr   { a }
| a = valueAdrrExpr { a }
| a = callExpr { a }
| a = lvarExpr { a }

;


lvar:
| a = assignVar { a }
| a = addrExpr { a }
| a = varExpr   { a }
;
 


(* lvar *)

assignVar: 
| v = Lvar; Lassign; b = expr { 
    Assign { name = v; expr = b; pos = $startpos($2) } };

addrExpr:
| Lesp; v = Lvar { Addr{ name = v; pos = $startpos(v) }   };

varExpr : v = Lvar { 
    Var { name = v; pos = $startpos(v) } };



 



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
(*| a = expr; Land;  b = expr {  } todo*)
(*| a = expr; Lor;   b = expr {  } todo*)
;


valueAdrrExpr:
| Lmul; v = Lvar { Call {  func = "_valueAdrr";  args = [Lvar{ lvar = Var {name=v; pos = $startpos(v) } ; pos = $startpos(v) } ]; pos = $startpos(v) } } 

callExpr : 
| f = Lvar; Lopar; args = separated_list(Lcomma, expr) ;Lcpar {
    Call { func = f; args = args; pos = $startpos(f)  }
}
;



intExpr  : n = Lint { Int { value = n ; pos = $startpos(n) } };
lvarExpr : n = lvar { Lvar{ lvar  = n ; pos = $startpos(n) } };



(* Instr *)


declInstr:
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
                        | Addr a   ->
                            [ Decl{ type_ = type_; var = a.name; pos = $startpos(type_) } ] 
                        )) l )
}

| type_ = Lvar; Lmul; l = separated_nonempty_list(Lcomma, lvar) { 
    List.flatten ( 
        List.map (fun e ->  (match e with 
                        | Var v    -> 
                            [ Decl{ type_ = type_^""; var = v.name; pos = $startpos(type_) } ] 
                        | Assign a -> 
                            let decl = [ Decl{ type_ = type_; var = a.name; pos = $startpos(type_) } ] in 
                            let mylvar    =  Lvar{ lvar = e; pos = $startpos(l) } in 
                            let myvarExpr =  [ Expr{ expr = mylvar; pos = $startpos(l) } ] in 
                            decl @ myvarExpr;
                        | Addr a   ->
                            [ Decl{ type_ = type_; var = a.name; pos = $startpos(type_) } ] 
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

loopInstr:
| Lwhile Lopar cond = expr Lcpar Lobrace b = block Lcbrace {
    [ Loop { cond = cond; block = b; pos = $startpos($1) } ]
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