open Ast
open Mips

module Env = Map.Make(String)

let nom_provisoire =
    Env.of_seq
        (List.to_seq
            [ "%add", Func_t (Builtin_t "int", [ Builtin_t "int" ; Builtin_t "int" ])
            ; "%sub", Func_t (Builtin_t "int", [ Builtin_t "int" ; Builtin_t "int" ])
            ; "%mul", Func_t (Builtin_t "int", [ Builtin_t "int" ; Builtin_t "int" ])
            ; "%div", Func_t (Builtin_t "int", [ Builtin_t "int" ; Builtin_t "int" ])
            
            ; "%seq", Func_t (Builtin_t "int", [ Builtin_t "int" ; Builtin_t "int" ])
            ; "%neq", Func_t (Builtin_t "int", [ Builtin_t "int" ; Builtin_t "int" ]) 
            ; "%lt" , Func_t (Builtin_t "int", [ Builtin_t "int" ; Builtin_t "int" ])
            ; "%le" , Func_t (Builtin_t "int", [ Builtin_t "int" ; Builtin_t "int" ])
            ; "%gt" , Func_t (Builtin_t "int", [ Builtin_t "int" ; Builtin_t "int" ]) 
            ; "%ge" , Func_t (Builtin_t "int", [ Builtin_t "int" ; Builtin_t "int" ])
            ; "%div", Func_t (Builtin_t "int", [ Builtin_t "int" ; Builtin_t "int" ])
       
        ])

let _type_ =
    Env.of_seq
        (List.to_seq
            [ "int" , 4
            ; "int2", 8
            ])


let builtins =
  [ Label "_add"
  ; Lw (T0, Mem (SP, 0))
  ; Lw (T1, Mem (SP, 4))
  ; Add (V0, T0, T1)
  ; Jr RA
      
  ; Label "_mul"
  ; Lw (T0, Mem (SP, 0))
  ; Lw (T1, Mem (SP, 4))
  ; Mul (V0, T0, T1)
  ; Jr RA

  ; Label "puti"
  ; Lw (A0, Mem (SP, 0))
  ; Li (V0, Syscall.print_int)
  ; Syscall
  ; Jr RA

  ; Label "geti"
  ; Lw (A0, Mem (SP, 0))
  ; Li (V0, Syscall.read_int)
  ; Syscall
  ; Jr RA

  ; Label "puts"
  ; Lw (A0, Mem (SP, 0))
  ; Li (V0, Syscall.print_str)
  ; Syscall
  ; Jr RA

  ]
