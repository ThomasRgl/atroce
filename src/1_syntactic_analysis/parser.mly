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
| a = exprInstr;  Lsc  { a }
/* | a = expr; Lsc  { [Expr { expr = a; pos = $startpos(a) }] }  */ (*This is not clean, but this is the only way I found to parse the pointers *)
(*| a = assignExpr; Lsc  { [Expr { expr = a; pos = $startpos(a) }] } 
| a = callExpr; Lsc    { [Expr { expr = a; pos = $startpos(a) }] } *)
;



expr:
| a = opExpr         { a }
| a = intExpr        { a }
| a = varExpr        { a }
| a = addrExpr       { a }
| a = valueAdrrExpr  { a }
| a = callExpr       { a }
| a = assignExpr     { a }

;


lvalue:
| a = leftValueAdrrExpr { a }
| a = leftVar   { a }
;
 


(* lvalue *)


leftValueAdrrExpr:
| Lmul; v = Lvar { LeftAddrValue{ name = v; pos = $startpos($1)  } };

leftVar :
| v = Lvar { LeftVar{ name = v; pos = $startpos(v)  } };




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

intExpr  : n = Lint { Int { value = n ; pos = $startpos(n) } };
varExpr : n = Lvar { Var { name  = n ; pos = $startpos(n) } };



callExpr : 
| f = Lvar; Lopar; args = separated_list(Lcomma, expr) ;Lcpar {
    Call { func = f; args = args; pos = $startpos(f)  }
}
;

addrExpr:
| Lesp; v = Lvar { 
    Addr{ name = v; pos = $startpos(v) }   
}
;

valueAdrrExpr:
| Lmul; v = Lvar { Call {  func = "_valueAdrr";  args = [ Var {name=v; pos = $startpos(v) }  ]; pos = $startpos(v) } } 
;

assignExpr: 
| l = lvalue; Lassign; b = expr { 
    Assign { lvalue = l; expr = b; pos = $startpos($2) } };





(* Instr *)


declInstr:
| type_ = Lvar; l = separated_nonempty_list(Lcomma, expr) { 
    List.flatten ( 
        List.map (fun e ->  (match e with 
                        | Var v    -> 
                            [ Decl{ type_ = type_; var = v.name; pos = $startpos(type_) } ] 
                        | Assign a -> 
                            let name = (match a.lvalue with 
                                        | LeftVar v -> v.name
                                        | _ -> "error" (*raise (Error  "should never happend "  )*) ) in 
                            let decl = [ Decl{ type_ = type_; var = name; pos = $startpos(type_) } ] in 
                            let myexpr = [ Expr{ expr = e; pos = $startpos(l)} ] in 
                            (*let mylvar    =  Var{ lvalue = a.lvalue; pos = $startpos(l) } in 
                            let myvarExpr =  [ Expr{ expr = mylvar; pos = $startpos(l) } ] in *)
                            decl @  myexpr
                        | _ -> []
                            (* raise (Error  "error undeclared "  ) *)
                        )) l )
}

| type_ = Lvar; Lmul; l = separated_nonempty_list(Lcomma, expr) { 
    List.flatten ( 
        List.map (fun e ->  (match e with 
                        | Var v    -> 
                            [ Decl{ type_ = type_^""; var = v.name; pos = $startpos(type_) } ] 
                        | Assign a -> 
                            let name = (match a.lvalue with 
                                        | LeftVar v -> v.name
                                        | _ -> "error" (* raise (Error  "should never happend "  )*)  )in 
                            let decl = [ Decl{ type_ = type_^""; var = name; pos = $startpos(type_) } ] in 
                            let myexpr = [ Expr{ expr = e; pos = $startpos(l)} ] in 
                            (*let mylvar    =  Var{ lvalue = a.lvalue; pos = $startpos(l) } in 
                            let myvarExpr =  [ Expr{ expr = mylvar; pos = $startpos(l) } ] in *)
                            decl @  myexpr
                        | _ -> []
                            (* raise (Error "error undeclared "  )*)
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

exprInstr: 
| e  = expr { [ Expr{ expr = e; pos = $startpos(e) } ] }




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