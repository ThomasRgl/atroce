
module MenhirBasics = struct
  
  exception Error
  
  let _eRR : exn =
    Error
  
  type token = 
    | Lwhile
    | Lvar of (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 15 "src/1_syntactic_analysis/parser.ml"
  )
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
    | Lint of (
# 7 "src/1_syntactic_analysis/parser.mly"
       (int)
# 31 "src/1_syntactic_analysis/parser.ml"
  )
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
  
end

include MenhirBasics

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState100
  | MenhirState90
  | MenhirState79
  | MenhirState74
  | MenhirState71
  | MenhirState68
  | MenhirState65
  | MenhirState64
  | MenhirState63
  | MenhirState62
  | MenhirState58
  | MenhirState53
  | MenhirState51
  | MenhirState49
  | MenhirState47
  | MenhirState45
  | MenhirState43
  | MenhirState41
  | MenhirState39
  | MenhirState34
  | MenhirState32
  | MenhirState27
  | MenhirState17
  | MenhirState16
  | MenhirState15
  | MenhirState14
  | MenhirState12
  | MenhirState8
  | MenhirState3
  | MenhirState0

# 1 "src/1_syntactic_analysis/parser.mly"
  
    open Ast
    open Ast.Syntax


# 102 "src/1_syntactic_analysis/parser.ml"

let rec _menhir_goto_declInstr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_declInstr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv427 * _menhir_state * 'tv_declInstr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lsc ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv423 * _menhir_state * 'tv_declInstr) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv421 * _menhir_state * 'tv_declInstr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (a : 'tv_declInstr)) = _menhir_stack in
        let _v : 'tv_instr = 
# 72 "src/1_syntactic_analysis/parser.mly"
                       ( a )
# 122 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv422)) : 'freshtv424)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv425 * _menhir_state * 'tv_declInstr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv426)) : 'freshtv428)

and _menhir_goto_loption_separated_nonempty_list_Lcomma_expr__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_Lcomma_expr__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv419 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 140 "src/1_syntactic_analysis/parser.ml"
    ) * Lexing.position) * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_expr__) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lcpar ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv415 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 150 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_expr__) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv413 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 157 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_expr__) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (f : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 162 "src/1_syntactic_analysis/parser.ml"
        )), _startpos_f_), _), _, (xs : 'tv_loption_separated_nonempty_list_Lcomma_expr__)) = _menhir_stack in
        let _startpos = _startpos_f_ in
        let _v : 'tv_callExpr = let args = 
# 232 "<standard.mly>"
    ( xs )
# 168 "src/1_syntactic_analysis/parser.ml"
         in
        
# 138 "src/1_syntactic_analysis/parser.mly"
                                                              (
    Call { func = f; args = args; pos = _startpos_f_  }
)
# 175 "src/1_syntactic_analysis/parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv411) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_callExpr) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv409) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_callExpr) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv407) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((a : 'tv_callExpr) : 'tv_callExpr) = _v in
        let (_startpos_a_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos_a_ in
        let _v : 'tv_expr = 
# 89 "src/1_syntactic_analysis/parser.mly"
                     ( a )
# 196 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv408)) : 'freshtv410)) : 'freshtv412)) : 'freshtv414)) : 'freshtv416)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv417 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 206 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_expr__) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv418)) : 'freshtv420)

and _menhir_goto_lvalue : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lvalue -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv405 * _menhir_state * 'tv_lvalue * Lexing.position) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lassign ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv401 * _menhir_state * 'tv_lvalue * Lexing.position) = Obj.magic _menhir_stack in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Lesp ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lint _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lvar _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27) : 'freshtv402)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv403 * _menhir_state * 'tv_lvalue * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv404)) : 'freshtv406)

and _menhir_goto_instr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_instr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv399 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lif ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lreturn ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lvar _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lwhile ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lcbrace ->
        _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79) : 'freshtv400)

and _menhir_goto_separated_nonempty_list_Lcomma_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_Lcomma_expr_ -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    match _menhir_s with
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_Lcomma_expr_) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv383) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((x : 'tv_separated_nonempty_list_Lcomma_expr_) : 'tv_separated_nonempty_list_Lcomma_expr_) = _v in
        let (_startpos_x_ : Lexing.position) = _startpos in
        ((let _v : 'tv_loption_separated_nonempty_list_Lcomma_expr__ = 
# 144 "<standard.mly>"
    ( x )
# 293 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_Lcomma_expr__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv384)) : 'freshtv386)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv389 * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_Lcomma_expr_) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv387 * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_separated_nonempty_list_Lcomma_expr_) : 'tv_separated_nonempty_list_Lcomma_expr_) = _v in
        let (_startpos_xs_ : Lexing.position) = _startpos in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_expr), _startpos_x_) = _menhir_stack in
        let _startpos = _startpos_x_ in
        let _v : 'tv_separated_nonempty_list_Lcomma_expr_ = 
# 243 "<standard.mly>"
    ( x :: xs )
# 312 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_separated_nonempty_list_Lcomma_expr_ _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv388)) : 'freshtv390)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv393 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 320 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_Lcomma_expr_) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv391 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 329 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((l : 'tv_separated_nonempty_list_Lcomma_expr_) : 'tv_separated_nonempty_list_Lcomma_expr_) = _v in
        let (_startpos_l_ : Lexing.position) = _startpos in
        ((let ((_menhir_stack, _menhir_s, (type_ : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 337 "src/1_syntactic_analysis/parser.ml"
        )), _startpos_type__), _, _startpos__2_) = _menhir_stack in
        let _v : 'tv_declInstr = 
# 184 "src/1_syntactic_analysis/parser.mly"
                                                                ( 
    List.flatten ( 
        List.map (fun e ->  (match e with 
                        | Var v    -> 
                            [ Decl{ type_ = type_^""; var = v.name; pos = _startpos_type__ } ] 
                        | Assign a -> 
                            let name = (match a.lvalue with 
                                        | LeftVar v -> v.name
                                        | _ -> "error" (* raise (Error  "should never happend "  )*)  )in 
                            let decl = [ Decl{ type_ = type_^""; var = name; pos = _startpos_type__ } ] in 
                            let myexpr = [ Expr{ expr = e; pos = _startpos_l_} ] in 
                            (*let mylvar    =  Var{ lvalue = a.lvalue; pos = $startpos(l) } in 
                            let myvarExpr =  [ Expr{ expr = mylvar; pos = $startpos(l) } ] in *)
                            decl @  myexpr
                        | _ -> []
                            (* raise (Error "error undeclared "  )*)
                        )) l )
)
# 359 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_declInstr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv392)) : 'freshtv394)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv397 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 367 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_Lcomma_expr_) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv395 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 376 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((l : 'tv_separated_nonempty_list_Lcomma_expr_) : 'tv_separated_nonempty_list_Lcomma_expr_) = _v in
        let (_startpos_l_ : Lexing.position) = _startpos in
        ((let (_menhir_stack, _menhir_s, (type_ : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 384 "src/1_syntactic_analysis/parser.ml"
        )), _startpos_type__) = _menhir_stack in
        let _v : 'tv_declInstr = 
# 165 "src/1_syntactic_analysis/parser.mly"
                                                          ( 
    List.flatten ( 
        List.map (fun e ->  (match e with 
                        | Var v    -> 
                            [ Decl{ type_ = type_; var = v.name; pos = _startpos_type__ } ] 
                        | Assign a -> 
                            let name = (match a.lvalue with 
                                        | LeftVar v -> v.name
                                        | _ -> "error" (*raise (Error  "should never happend "  )*) ) in 
                            let decl = [ Decl{ type_ = type_; var = name; pos = _startpos_type__ } ] in 
                            let myexpr = [ Expr{ expr = e; pos = _startpos_l_} ] in 
                            (*let mylvar    =  Var{ lvalue = a.lvalue; pos = $startpos(l) } in 
                            let myvarExpr =  [ Expr{ expr = mylvar; pos = $startpos(l) } ] in *)
                            decl @  myexpr
                        | _ -> []
                            (* raise (Error  "error undeclared "  ) *)
                        )) l )
)
# 406 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_declInstr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv396)) : 'freshtv398)
    | _ ->
        _menhir_fail ()

and _menhir_goto_opExpr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_opExpr -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv381) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_opExpr) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv379) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((a : 'tv_opExpr) : 'tv_opExpr) = _v in
    let (_startpos_a_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos_a_ in
    let _v : 'tv_expr = 
# 84 "src/1_syntactic_analysis/parser.mly"
                     ( a )
# 428 "src/1_syntactic_analysis/parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv380)) : 'freshtv382)

and _menhir_run32 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lvar _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

and _menhir_run41 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lvar _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_run34 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lvar _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34

and _menhir_run45 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lvar _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45

and _menhir_run47 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lvar _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47

and _menhir_run49 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lvar _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_run51 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lvar _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51

and _menhir_run53 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lvar _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53

and _menhir_run39 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lvar _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_run43 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lvar _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43

and _menhir_goto_list_instr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_instr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState12 | MenhirState62 | MenhirState90 | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv373) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_list_instr_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv371) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((a : 'tv_list_instr_) : 'tv_list_instr_) = _v in
        ((let _v : 'tv_block = 
# 64 "src/1_syntactic_analysis/parser.mly"
                  ( List.flatten a )
# 637 "src/1_syntactic_analysis/parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv369) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_block) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState74 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv321 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | Lcbrace ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv317 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | Lelse ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv313 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block)) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | Lobrace ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((((((('freshtv309 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block))) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | Lesp ->
                            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                        | Lif ->
                            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                        | Lint _v ->
                            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                        | Lmul ->
                            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                        | Lreturn ->
                            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                        | Lvar _v ->
                            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                        | Lwhile ->
                            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                        | Lcbrace ->
                            _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90) : 'freshtv310)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((((((('freshtv311 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block))) = Obj.magic _menhir_stack in
                        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)) : 'freshtv314)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((((('freshtv315 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block)) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)) : 'freshtv318)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv319 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)) : 'freshtv322)
        | MenhirState90 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((((('freshtv335 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block)))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | Lcbrace ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((((('freshtv331 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block)))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((((('freshtv329 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block)))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
                ((let ((((_menhir_stack, _menhir_s, _startpos__1_), _, (c : 'tv_expr), _startpos_c_), _, (t : 'tv_block)), _, (e : 'tv_block)) = _menhir_stack in
                let _v : 'tv_ifthenelseInstr = 
# 211 "src/1_syntactic_analysis/parser.mly"
                                                                                               (
    [ Cond{ cond = c;  then_ = t; else_ = e;  pos = _startpos__1_  }] 
)
# 728 "src/1_syntactic_analysis/parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv327) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_ifthenelseInstr) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv325) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_ifthenelseInstr) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv323) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((a : 'tv_ifthenelseInstr) : 'tv_ifthenelseInstr) = _v in
                ((let _v : 'tv_instr = 
# 73 "src/1_syntactic_analysis/parser.mly"
                       ( a )
# 745 "src/1_syntactic_analysis/parser.ml"
                 in
                _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv324)) : 'freshtv326)) : 'freshtv328)) : 'freshtv330)) : 'freshtv332)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((((((('freshtv333 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block)))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)) : 'freshtv336)
        | MenhirState62 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv349 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | Lcbrace ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv345 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv343 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s, _startpos__1_), _, (cond : 'tv_expr), _startpos_cond_), _, (b : 'tv_block)) = _menhir_stack in
                let _v : 'tv_loopInstr = 
# 217 "src/1_syntactic_analysis/parser.mly"
                                                           (
    [ Loop { cond = cond; block = b; pos = _startpos__1_ } ]
)
# 773 "src/1_syntactic_analysis/parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv341) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_loopInstr) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv339) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_loopInstr) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv337) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((a : 'tv_loopInstr) : 'tv_loopInstr) = _v in
                ((let _v : 'tv_instr = 
# 74 "src/1_syntactic_analysis/parser.mly"
                       ( a )
# 790 "src/1_syntactic_analysis/parser.ml"
                 in
                _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv338)) : 'freshtv340)) : 'freshtv342)) : 'freshtv344)) : 'freshtv346)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv347 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv348)) : 'freshtv350)
        | MenhirState12 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv367 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 805 "src/1_syntactic_analysis/parser.ml"
            ) * Lexing.position) * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 809 "src/1_syntactic_analysis/parser.ml"
            ) * Lexing.position)) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_param__))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | Lcbrace ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv363 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 819 "src/1_syntactic_analysis/parser.ml"
                ) * Lexing.position) * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 823 "src/1_syntactic_analysis/parser.ml"
                ) * Lexing.position)) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_param__))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv361 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 830 "src/1_syntactic_analysis/parser.ml"
                ) * Lexing.position) * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 834 "src/1_syntactic_analysis/parser.ml"
                ) * Lexing.position)) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_param__))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
                ((let ((((_menhir_stack, _menhir_s, (type_ : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 839 "src/1_syntactic_analysis/parser.ml"
                )), _startpos_type__), (name : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 843 "src/1_syntactic_analysis/parser.ml"
                )), _startpos_name_), _, (xs : 'tv_loption_separated_nonempty_list_Lcomma_param__)), _, (b : 'tv_block)) = _menhir_stack in
                let _v : 'tv_funcDef = let p = 
# 232 "<standard.mly>"
    ( xs )
# 848 "src/1_syntactic_analysis/parser.ml"
                 in
                
# 231 "src/1_syntactic_analysis/parser.mly"
                                                                                                         ( 
    Func { type_ = type_; name = name; params = p; block = b; pos = _startpos_name_ }
)
# 855 "src/1_syntactic_analysis/parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv359) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_funcDef) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv357) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_funcDef) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv355) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((a : 'tv_funcDef) : 'tv_funcDef) = _v in
                ((let _v : 'tv_def = 
# 59 "src/1_syntactic_analysis/parser.mly"
              ( a )
# 872 "src/1_syntactic_analysis/parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv353) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_def) = _v in
                ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv351 * _menhir_state * 'tv_def) = Obj.magic _menhir_stack in
                ((assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | Lend ->
                    _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState100
                | Lvar _v ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100) : 'freshtv352)) : 'freshtv354)) : 'freshtv356)) : 'freshtv358)) : 'freshtv360)) : 'freshtv362)) : 'freshtv364)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv365 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 899 "src/1_syntactic_analysis/parser.ml"
                ) * Lexing.position) * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 903 "src/1_syntactic_analysis/parser.ml"
                ) * Lexing.position)) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_param__))) * _menhir_state * 'tv_block) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv366)) : 'freshtv368)
        | _ ->
            _menhir_fail ()) : 'freshtv370)) : 'freshtv372)) : 'freshtv374)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv377 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_list_instr_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv375 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_list_instr_) : 'tv_list_instr_) = _v in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_instr)) = _menhir_stack in
        let _v : 'tv_list_instr_ = 
# 213 "<standard.mly>"
    ( x :: xs )
# 922 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_list_instr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv376)) : 'freshtv378)
    | _ ->
        _menhir_fail ()

and _menhir_reduce25 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 931 "src/1_syntactic_analysis/parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (v : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 937 "src/1_syntactic_analysis/parser.ml"
    )), _startpos_v_) = _menhir_stack in
    let _startpos = _startpos_v_ in
    let _v : 'tv_leftVar = 
# 109 "src/1_syntactic_analysis/parser.mly"
           ( LeftVar{ name = v; pos = _startpos_v_  } )
# 943 "src/1_syntactic_analysis/parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv307) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_leftVar) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv305) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_leftVar) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv303) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((a : 'tv_leftVar) : 'tv_leftVar) = _v in
    let (_startpos_a_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos_a_ in
    let _v : 'tv_lvalue = 
# 97 "src/1_syntactic_analysis/parser.mly"
                ( a )
# 964 "src/1_syntactic_analysis/parser.ml"
     in
    _menhir_goto_lvalue _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv304)) : 'freshtv306)) : 'freshtv308)

and _menhir_reduce54 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 971 "src/1_syntactic_analysis/parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (n : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 977 "src/1_syntactic_analysis/parser.ml"
    )), _startpos_n_) = _menhir_stack in
    let _startpos = _startpos_n_ in
    let _v : 'tv_varExpr = 
# 133 "src/1_syntactic_analysis/parser.mly"
                   ( Var { name  = n ; pos = _startpos_n_ } )
# 983 "src/1_syntactic_analysis/parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv301) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_varExpr) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv299) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_varExpr) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv297) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((a : 'tv_varExpr) : 'tv_varExpr) = _v in
    let (_startpos_a_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos_a_ in
    let _v : 'tv_expr = 
# 86 "src/1_syntactic_analysis/parser.mly"
                     ( a )
# 1004 "src/1_syntactic_analysis/parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv298)) : 'freshtv300)) : 'freshtv302)

and _menhir_run16 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 1011 "src/1_syntactic_analysis/parser.ml"
) * Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lvar _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lcpar ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv295) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState16 in
        ((let _v : 'tv_loption_separated_nonempty_list_Lcomma_expr__ = 
# 142 "<standard.mly>"
    ( [] )
# 1033 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_Lcomma_expr__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv296)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16

and _menhir_reduce24 : _menhir_env -> ('ttv_tail * _menhir_state * Lexing.position) * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 1044 "src/1_syntactic_analysis/parser.ml"
) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, _startpos__1_), _, (v : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 1050 "src/1_syntactic_analysis/parser.ml"
    )), _startpos_v_) = _menhir_stack in
    let _startpos = _startpos__1_ in
    let _v : 'tv_leftValueAdrrExpr = 
# 106 "src/1_syntactic_analysis/parser.mly"
                 ( LeftAddrValue{ name = v; pos = _startpos__1_  } )
# 1056 "src/1_syntactic_analysis/parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv293) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_leftValueAdrrExpr) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv291) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_leftValueAdrrExpr) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv289) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((a : 'tv_leftValueAdrrExpr) : 'tv_leftValueAdrrExpr) = _v in
    let (_startpos_a_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos_a_ in
    let _v : 'tv_lvalue = 
# 96 "src/1_syntactic_analysis/parser.mly"
                        ( a )
# 1077 "src/1_syntactic_analysis/parser.ml"
     in
    _menhir_goto_lvalue _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv290)) : 'freshtv292)) : 'freshtv294)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 1084 "src/1_syntactic_analysis/parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lopar ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | Ladd | Lcomma | Lcpar | Ldiv | Leq | Lge | Lgt | Lle | Llt | Lmul | Lneq | Lsc | Lsub ->
        _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack)
    | Lassign ->
        _menhir_reduce25 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv171 * _menhir_state * 'tv_lvalue * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ladd ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Leq ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lge ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lgt ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lle ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Llt ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lneq ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsub ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lcomma | Lcpar | Lsc ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv167 * _menhir_state * 'tv_lvalue * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (l : 'tv_lvalue), _startpos_l_), _startpos__2_), _, (b : 'tv_expr), _startpos_b_) = _menhir_stack in
            let _startpos = _startpos_l_ in
            let _v : 'tv_assignExpr = 
# 154 "src/1_syntactic_analysis/parser.mly"
                                ( 
    Assign { lvalue = l; expr = b; pos = _startpos__2_ } )
# 1141 "src/1_syntactic_analysis/parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv165) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_assignExpr) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv163) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_assignExpr) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv161) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((a : 'tv_assignExpr) : 'tv_assignExpr) = _v in
            let (_startpos_a_ : Lexing.position) = _startpos in
            ((let _startpos = _startpos_a_ in
            let _v : 'tv_expr = 
# 90 "src/1_syntactic_analysis/parser.mly"
                     ( a )
# 1162 "src/1_syntactic_analysis/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv162)) : 'freshtv164)) : 'freshtv166)) : 'freshtv168)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv169 * _menhir_state * 'tv_lvalue * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)) : 'freshtv172)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv177 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Ladd | Lcomma | Lcpar | Leq | Lge | Lgt | Lle | Llt | Lneq | Lsc | Lsub ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv173 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (a : 'tv_expr), _startpos_a_), _startpos__2_), _, (b : 'tv_expr), _startpos_b_) = _menhir_stack in
            let _startpos = _startpos_a_ in
            let _v : 'tv_opExpr = 
# 119 "src/1_syntactic_analysis/parser.mly"
                           ( Call {  func = "_sub"; args = [a ; b]; pos = _startpos__2_ } )
# 1190 "src/1_syntactic_analysis/parser.ml"
             in
            _menhir_goto_opExpr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv174)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv175 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)) : 'freshtv178)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv181 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (a : 'tv_expr), _startpos_a_), _startpos__2_), _, (b : 'tv_expr), _startpos_b_) = _menhir_stack in
        let _startpos = _startpos_a_ in
        let _v : 'tv_opExpr = 
# 120 "src/1_syntactic_analysis/parser.mly"
                           ( Call {  func = "_mul"; args = [a ; b]; pos = _startpos__2_ } )
# 1210 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_opExpr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv180)) : 'freshtv182)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv185 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv183 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (a : 'tv_expr), _startpos_a_), _startpos__2_), _, (b : 'tv_expr), _startpos_b_) = _menhir_stack in
        let _startpos = _startpos_a_ in
        let _v : 'tv_opExpr = 
# 121 "src/1_syntactic_analysis/parser.mly"
                           ( Call {  func = "_div"; args = [a ; b]; pos = _startpos__2_ } )
# 1223 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_opExpr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv184)) : 'freshtv186)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv191 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ladd ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsub ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lcomma | Lcpar | Leq | Lge | Lgt | Lle | Llt | Lneq | Lsc ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv187 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (a : 'tv_expr), _startpos_a_), _startpos__2_), _, (b : 'tv_expr), _startpos_b_) = _menhir_stack in
            let _startpos = _startpos_a_ in
            let _v : 'tv_opExpr = 
# 123 "src/1_syntactic_analysis/parser.mly"
                           ( Call {  func = "_neq"; args = [a ; b]; pos = _startpos__2_ } )
# 1248 "src/1_syntactic_analysis/parser.ml"
             in
            _menhir_goto_opExpr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv188)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv189 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)) : 'freshtv192)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv197 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Ladd | Lcomma | Lcpar | Leq | Lge | Lgt | Lle | Llt | Lneq | Lsc | Lsub ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv193 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (a : 'tv_expr), _startpos_a_), _startpos__2_), _, (b : 'tv_expr), _startpos_b_) = _menhir_stack in
            let _startpos = _startpos_a_ in
            let _v : 'tv_opExpr = 
# 118 "src/1_syntactic_analysis/parser.mly"
                           ( Call {  func = "_add"; args = [a ; b]; pos = _startpos__2_ } )
# 1276 "src/1_syntactic_analysis/parser.ml"
             in
            _menhir_goto_opExpr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv194)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv195 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)) : 'freshtv198)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv203 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ladd ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsub ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lcomma | Lcpar | Leq | Lge | Lgt | Lle | Llt | Lneq | Lsc ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv199 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (a : 'tv_expr), _startpos_a_), _startpos__2_), _, (b : 'tv_expr), _startpos_b_) = _menhir_stack in
            let _startpos = _startpos_a_ in
            let _v : 'tv_opExpr = 
# 124 "src/1_syntactic_analysis/parser.mly"
                           ( Call {  func = "_lt";  args = [a ; b]; pos = _startpos__2_ } )
# 1308 "src/1_syntactic_analysis/parser.ml"
             in
            _menhir_goto_opExpr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv200)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv201 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)) : 'freshtv204)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv209 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ladd ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsub ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lcomma | Lcpar | Leq | Lge | Lgt | Lle | Llt | Lneq | Lsc ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv205 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (a : 'tv_expr), _startpos_a_), _startpos__2_), _, (b : 'tv_expr), _startpos_b_) = _menhir_stack in
            let _startpos = _startpos_a_ in
            let _v : 'tv_opExpr = 
# 125 "src/1_syntactic_analysis/parser.mly"
                           ( Call {  func = "_le";  args = [a ; b]; pos = _startpos__2_ } )
# 1340 "src/1_syntactic_analysis/parser.ml"
             in
            _menhir_goto_opExpr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv206)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv207 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)) : 'freshtv210)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv215 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ladd ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsub ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lcomma | Lcpar | Leq | Lge | Lgt | Lle | Llt | Lneq | Lsc ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv211 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (a : 'tv_expr), _startpos_a_), _startpos__2_), _, (b : 'tv_expr), _startpos_b_) = _menhir_stack in
            let _startpos = _startpos_a_ in
            let _v : 'tv_opExpr = 
# 126 "src/1_syntactic_analysis/parser.mly"
                           ( Call {  func = "_gt";  args = [a ; b]; pos = _startpos__2_ } )
# 1372 "src/1_syntactic_analysis/parser.ml"
             in
            _menhir_goto_opExpr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv212)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv213 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)) : 'freshtv216)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv221 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ladd ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsub ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lcomma | Lcpar | Leq | Lge | Lgt | Lle | Llt | Lneq | Lsc ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv217 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (a : 'tv_expr), _startpos_a_), _startpos__2_), _, (b : 'tv_expr), _startpos_b_) = _menhir_stack in
            let _startpos = _startpos_a_ in
            let _v : 'tv_opExpr = 
# 127 "src/1_syntactic_analysis/parser.mly"
                           ( Call {  func = "_ge";  args = [a ; b]; pos = _startpos__2_ } )
# 1404 "src/1_syntactic_analysis/parser.ml"
             in
            _menhir_goto_opExpr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv218)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv219 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)) : 'freshtv222)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv227 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ladd ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsub ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lcomma | Lcpar | Leq | Lge | Lgt | Lle | Llt | Lneq | Lsc ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv223 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (a : 'tv_expr), _startpos_a_), _startpos__2_), _, (b : 'tv_expr), _startpos_b_) = _menhir_stack in
            let _startpos = _startpos_a_ in
            let _v : 'tv_opExpr = 
# 122 "src/1_syntactic_analysis/parser.mly"
                           ( Call {  func = "_eq";  args = [a ; b]; pos = _startpos__2_ } )
# 1436 "src/1_syntactic_analysis/parser.ml"
             in
            _menhir_goto_opExpr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv224)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv225 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)) : 'freshtv228)
    | MenhirState63 | MenhirState64 | MenhirState58 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv235 * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ladd ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lcomma ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv229 * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | Lesp ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | Lint _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | Lmul ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | Lvar _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58) : 'freshtv230)
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Leq ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lge ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lgt ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lle ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Llt ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lneq ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsub ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lcpar | Lsc ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv231 * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_expr), _startpos_x_) = _menhir_stack in
            let _startpos = _startpos_x_ in
            let _v : 'tv_separated_nonempty_list_Lcomma_expr_ = 
# 241 "<standard.mly>"
    ( [ x ] )
# 1498 "src/1_syntactic_analysis/parser.ml"
             in
            _menhir_goto_separated_nonempty_list_Lcomma_expr_ _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv232)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv233 * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)) : 'freshtv236)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv245 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ladd ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lcpar ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv241 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | Lobrace ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv237 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | Lesp ->
                    _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lif ->
                    _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lint _v ->
                    _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lmul ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lreturn ->
                    _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lvar _v ->
                    _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lwhile ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lcbrace ->
                    _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack) MenhirState62
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62) : 'freshtv238)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv239 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)) : 'freshtv242)
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Leq ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lge ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lgt ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lle ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Llt ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lneq ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsub ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv243 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)) : 'freshtv246)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv261 * _menhir_state * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ladd ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Leq ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lge ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lgt ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lle ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Llt ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lneq ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsub ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsc ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv257 * _menhir_state * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _v : 'tv_returnInstr = 
# 205 "src/1_syntactic_analysis/parser.mly"
                    (
  [ Return {  expr = e; pos = _startpos__1_ } ]
)
# 1615 "src/1_syntactic_analysis/parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv255) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_returnInstr) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv253 * _menhir_state * 'tv_returnInstr) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | Lsc ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv249 * _menhir_state * 'tv_returnInstr) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv247 * _menhir_state * 'tv_returnInstr) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (a : 'tv_returnInstr)) = _menhir_stack in
                let _v : 'tv_instr = 
# 71 "src/1_syntactic_analysis/parser.mly"
                       ( a )
# 1637 "src/1_syntactic_analysis/parser.ml"
                 in
                _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv248)) : 'freshtv250)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv251 * _menhir_state * 'tv_returnInstr) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)) : 'freshtv254)) : 'freshtv256)) : 'freshtv258)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv259 * _menhir_state * Lexing.position) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)) : 'freshtv262)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv271 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ladd ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lcpar ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv267 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | Lobrace ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv263 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | Lesp ->
                    _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lif ->
                    _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lint _v ->
                    _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lmul ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lreturn ->
                    _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lvar _v ->
                    _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lwhile ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | Lcbrace ->
                    _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack) MenhirState74
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74) : 'freshtv264)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv265 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)) : 'freshtv268)
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Leq ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lge ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lgt ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lle ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Llt ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lneq ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsub ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv269 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)) : 'freshtv272)
    | MenhirState12 | MenhirState62 | MenhirState90 | MenhirState74 | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287 * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ladd ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Ldiv ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Leq ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lge ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lgt ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lle ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Llt ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lneq ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsub ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lsc ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv283 * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (e : 'tv_expr), _startpos_e_) = _menhir_stack in
            let _v : 'tv_exprInstr = 
# 223 "src/1_syntactic_analysis/parser.mly"
            ( [ Expr{ expr = e; pos = _startpos_e_ } ] )
# 1759 "src/1_syntactic_analysis/parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv281) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_exprInstr) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv279 * _menhir_state * 'tv_exprInstr) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | Lsc ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv275 * _menhir_state * 'tv_exprInstr) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv273 * _menhir_state * 'tv_exprInstr) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (a : 'tv_exprInstr)) = _menhir_stack in
                let _v : 'tv_instr = 
# 75 "src/1_syntactic_analysis/parser.mly"
                       ( a )
# 1781 "src/1_syntactic_analysis/parser.ml"
                 in
                _menhir_goto_instr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv274)) : 'freshtv276)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv277 * _menhir_state * 'tv_exprInstr) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)) : 'freshtv280)) : 'freshtv282)) : 'freshtv284)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv285 * _menhir_state * 'tv_expr * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv286)) : 'freshtv288)
    | _ ->
        _menhir_fail ()

and _menhir_reduce26 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_instr_ = 
# 211 "<standard.mly>"
    ( [] )
# 1806 "src/1_syntactic_analysis/parser.ml"
     in
    _menhir_goto_list_instr_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lopar ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Lesp ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lint _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lvar _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14) : 'freshtv158)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv159 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 1845 "src/1_syntactic_analysis/parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv155 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 1861 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState63 in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Lesp ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lint _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lvar _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv153 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState64 in
            let (_v : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 1882 "src/1_syntactic_analysis/parser.ml"
            )) = _v in
            let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | Lopar ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | Ladd | Lcomma | Ldiv | Leq | Lge | Lgt | Lle | Llt | Lmul | Lneq | Lsc | Lsub ->
                _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack)
            | Lassign ->
                _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65) : 'freshtv154)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64) : 'freshtv156)
    | Lopar ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | Lvar _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Ladd | Ldiv | Leq | Lge | Lgt | Lle | Llt | Lneq | Lsc | Lsub ->
        _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack)
    | Lassign ->
        _menhir_reduce25 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63

and _menhir_run68 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lesp ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lint _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lmul ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | Lvar _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lvar _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState17 in
        let (_v : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 1948 "src/1_syntactic_analysis/parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Ladd | Lcomma | Lcpar | Ldiv | Leq | Lge | Lgt | Lle | Llt | Lmul | Lneq | Lsc | Lsub ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv147 * _menhir_state * Lexing.position) * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 1960 "src/1_syntactic_analysis/parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _startpos__1_), _, (v : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 1965 "src/1_syntactic_analysis/parser.ml"
            )), _startpos_v_) = _menhir_stack in
            let _startpos = _startpos__1_ in
            let _v : 'tv_valueAdrrExpr = 
# 150 "src/1_syntactic_analysis/parser.mly"
                 ( Call {  func = "_valueAdrr";  args = [ Var {name=v; pos = _startpos_v_ }  ]; pos = _startpos_v_ } )
# 1971 "src/1_syntactic_analysis/parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv145) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_valueAdrrExpr) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv143) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_valueAdrrExpr) = _v in
            let (_startpos : Lexing.position) = _startpos in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv141) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((a : 'tv_valueAdrrExpr) : 'tv_valueAdrrExpr) = _v in
            let (_startpos_a_ : Lexing.position) = _startpos in
            ((let _startpos = _startpos_a_ in
            let _v : 'tv_expr = 
# 88 "src/1_syntactic_analysis/parser.mly"
                     ( a )
# 1992 "src/1_syntactic_analysis/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv142)) : 'freshtv144)) : 'freshtv146)) : 'freshtv148)
        | Lassign ->
            _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv149 * _menhir_state * Lexing.position) * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2004 "src/1_syntactic_analysis/parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)) : 'freshtv152)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 7 "src/1_syntactic_analysis/parser.mly"
       (int)
# 2016 "src/1_syntactic_analysis/parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv139) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((n : (
# 7 "src/1_syntactic_analysis/parser.mly"
       (int)
# 2026 "src/1_syntactic_analysis/parser.ml"
    )) : (
# 7 "src/1_syntactic_analysis/parser.mly"
       (int)
# 2030 "src/1_syntactic_analysis/parser.ml"
    )) = _v in
    let (_startpos_n_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos_n_ in
    let _v : 'tv_intExpr = 
# 132 "src/1_syntactic_analysis/parser.mly"
                    ( Int { value = n ; pos = _startpos_n_ } )
# 2037 "src/1_syntactic_analysis/parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv137) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_intExpr) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv135) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_intExpr) = _v in
    let (_startpos : Lexing.position) = _startpos in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv133) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((a : 'tv_intExpr) : 'tv_intExpr) = _v in
    let (_startpos_a_ : Lexing.position) = _startpos in
    ((let _startpos = _startpos_a_ in
    let _v : 'tv_expr = 
# 85 "src/1_syntactic_analysis/parser.mly"
                     ( a )
# 2058 "src/1_syntactic_analysis/parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv134)) : 'freshtv136)) : 'freshtv138)) : 'freshtv140)

and _menhir_run70 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lopar ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Lesp ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lint _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lmul ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | Lvar _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv130)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lvar _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let (_v : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2106 "src/1_syntactic_analysis/parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv123 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        let ((v : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2115 "src/1_syntactic_analysis/parser.ml"
        )) : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2119 "src/1_syntactic_analysis/parser.ml"
        )) = _v in
        let (_startpos_v_ : Lexing.position) = _startpos in
        ((let (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let _startpos = _startpos__1_ in
        let _v : 'tv_addrExpr = 
# 144 "src/1_syntactic_analysis/parser.mly"
                 ( 
    Addr{ name = v; pos = _startpos_v_ }   
)
# 2129 "src/1_syntactic_analysis/parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_addrExpr) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_addrExpr) = _v in
        let (_startpos : Lexing.position) = _startpos in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv117) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((a : 'tv_addrExpr) : 'tv_addrExpr) = _v in
        let (_startpos_a_ : Lexing.position) = _startpos in
        ((let _startpos = _startpos_a_ in
        let _v : 'tv_expr = 
# 87 "src/1_syntactic_analysis/parser.mly"
                     ( a )
# 2150 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v _startpos) : 'freshtv118)) : 'freshtv120)) : 'freshtv122)) : 'freshtv124)) : 'freshtv126)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)

and _menhir_goto_separated_nonempty_list_Lcomma_param_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_Lcomma_param_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_Lcomma_param_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((x : 'tv_separated_nonempty_list_Lcomma_param_) : 'tv_separated_nonempty_list_Lcomma_param_) = _v in
        ((let _v : 'tv_loption_separated_nonempty_list_Lcomma_param__ = 
# 144 "<standard.mly>"
    ( x )
# 2176 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_Lcomma_param__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv110)) : 'freshtv112)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv115 * _menhir_state * 'tv_param)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_Lcomma_param_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv113 * _menhir_state * 'tv_param)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_separated_nonempty_list_Lcomma_param_) : 'tv_separated_nonempty_list_Lcomma_param_) = _v in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_param)) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_Lcomma_param_ = 
# 243 "<standard.mly>"
    ( x :: xs )
# 2192 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_separated_nonempty_list_Lcomma_param_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv114)) : 'freshtv116)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_loption_separated_nonempty_list_Lcomma_param__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_Lcomma_param__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv107 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2210 "src/1_syntactic_analysis/parser.ml"
    ) * Lexing.position) * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2214 "src/1_syntactic_analysis/parser.ml"
    ) * Lexing.position)) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_param__) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lcpar ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv103 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2224 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2228 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position)) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_param__) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Lobrace ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv99 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2238 "src/1_syntactic_analysis/parser.ml"
            ) * Lexing.position) * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2242 "src/1_syntactic_analysis/parser.ml"
            ) * Lexing.position)) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_param__)) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | Lesp ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | Lif ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | Lint _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | Lmul ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | Lreturn ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | Lvar _v ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | Lwhile ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | Lcbrace ->
                _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack) MenhirState12
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12) : 'freshtv100)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv101 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2274 "src/1_syntactic_analysis/parser.ml"
            ) * Lexing.position) * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2278 "src/1_syntactic_analysis/parser.ml"
            ) * Lexing.position)) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_param__)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)) : 'freshtv104)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv105 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2289 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2293 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position)) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_param__) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)) : 'freshtv108)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2301 "src/1_syntactic_analysis/parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lvar _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2313 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_v : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2318 "src/1_syntactic_analysis/parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2326 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let ((name : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2331 "src/1_syntactic_analysis/parser.ml"
        )) : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2335 "src/1_syntactic_analysis/parser.ml"
        )) = _v in
        let (_startpos_name_ : Lexing.position) = _startpos in
        ((let (_menhir_stack, _menhir_s, (type_ : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2341 "src/1_syntactic_analysis/parser.ml"
        )), _startpos_type__) = _menhir_stack in
        let _v : 'tv_param = 
# 249 "src/1_syntactic_analysis/parser.mly"
                            ( Param{ type_ = type_; name = name; pos = _startpos_name_ } )
# 2346 "src/1_syntactic_analysis/parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_param) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Lcomma ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv83 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | Lvar _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8) : 'freshtv84)
        | Lcpar ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv85 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_param)) = _menhir_stack in
            let _v : 'tv_separated_nonempty_list_Lcomma_param_ = 
# 241 "<standard.mly>"
    ( [ x ] )
# 2377 "src/1_syntactic_analysis/parser.ml"
             in
            _menhir_goto_separated_nonempty_list_Lcomma_param_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv86)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv87 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)) : 'freshtv90)) : 'freshtv92)) : 'freshtv94)) : 'freshtv96)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2394 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)

and _menhir_goto_prog : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 35 "src/1_syntactic_analysis/parser.mly"
      (Ast.Syntax.prog)
# 2402 "src/1_syntactic_analysis/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 35 "src/1_syntactic_analysis/parser.mly"
      (Ast.Syntax.prog)
# 2413 "src/1_syntactic_analysis/parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 35 "src/1_syntactic_analysis/parser.mly"
      (Ast.Syntax.prog)
# 2421 "src/1_syntactic_analysis/parser.ml"
        )) : (
# 35 "src/1_syntactic_analysis/parser.mly"
      (Ast.Syntax.prog)
# 2425 "src/1_syntactic_analysis/parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv76)) : 'freshtv78)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state * 'tv_def) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 35 "src/1_syntactic_analysis/parser.mly"
      (Ast.Syntax.prog)
# 2435 "src/1_syntactic_analysis/parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * _menhir_state * 'tv_def) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((b : (
# 35 "src/1_syntactic_analysis/parser.mly"
      (Ast.Syntax.prog)
# 2443 "src/1_syntactic_analysis/parser.ml"
        )) : (
# 35 "src/1_syntactic_analysis/parser.mly"
      (Ast.Syntax.prog)
# 2447 "src/1_syntactic_analysis/parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (a : 'tv_def)) = _menhir_stack in
        let _v : (
# 35 "src/1_syntactic_analysis/parser.mly"
      (Ast.Syntax.prog)
# 2453 "src/1_syntactic_analysis/parser.ml"
        ) = 
# 54 "src/1_syntactic_analysis/parser.mly"
                     ( [a]  @  b )
# 2457 "src/1_syntactic_analysis/parser.ml"
         in
        _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v) : 'freshtv80)) : 'freshtv82)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * _menhir_state * 'tv_def) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv17 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) * _menhir_state * 'tv_block)))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state * 'tv_instr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv21 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv23 * _menhir_state * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv27 * _menhir_state * Lexing.position) * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2501 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv29 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2510 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2519 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv33 * _menhir_state * Lexing.position)) * _menhir_state * 'tv_expr * Lexing.position))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv35 * _menhir_state * 'tv_expr * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv37 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv39 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv41 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv43 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv45 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv47 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv49 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * 'tv_expr * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv57 * _menhir_state * 'tv_lvalue * Lexing.position) * Lexing.position) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2598 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2607 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv65 * _menhir_state * Lexing.position)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv67 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2621 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2625 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position)) * _menhir_state * 'tv_loption_separated_nonempty_list_Lcomma_param__))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * _menhir_state * 'tv_param)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv71 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2639 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2643 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _, _), _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv74)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2655 "src/1_syntactic_analysis/parser.ml"
) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lvar _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2667 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        let (_v : (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2672 "src/1_syntactic_analysis/parser.ml"
        )) = _v in
        let (_startpos : Lexing.position) = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        ((let _menhir_stack = (_menhir_stack, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | Lopar ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv7 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2684 "src/1_syntactic_analysis/parser.ml"
            ) * Lexing.position) * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2688 "src/1_syntactic_analysis/parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | Lvar _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | Lcpar ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState3 in
                ((let _v : 'tv_loption_separated_nonempty_list_Lcomma_param__ = 
# 142 "<standard.mly>"
    ( [] )
# 2702 "src/1_syntactic_analysis/parser.ml"
                 in
                _menhir_goto_loption_separated_nonempty_list_Lcomma_param__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv6)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv8)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv9 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2716 "src/1_syntactic_analysis/parser.ml"
            ) * Lexing.position) * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2720 "src/1_syntactic_analysis/parser.ml"
            ) * Lexing.position) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _, _), _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv10)) : 'freshtv12)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13 * _menhir_state * (
# 8 "src/1_syntactic_analysis/parser.mly"
       (string)
# 2731 "src/1_syntactic_analysis/parser.ml"
        ) * Lexing.position) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv14)

and _menhir_run97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _v : (
# 35 "src/1_syntactic_analysis/parser.mly"
      (Ast.Syntax.prog)
# 2744 "src/1_syntactic_analysis/parser.ml"
    ) = 
# 55 "src/1_syntactic_analysis/parser.mly"
       ( [] )
# 2748 "src/1_syntactic_analysis/parser.ml"
     in
    _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and prog : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 35 "src/1_syntactic_analysis/parser.mly"
      (Ast.Syntax.prog)
# 2767 "src/1_syntactic_analysis/parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = Obj.magic ();
      _menhir_error = false;
    } in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Lend ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | Lvar _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 269 "<standard.mly>"
  

# 2793 "src/1_syntactic_analysis/parser.ml"
