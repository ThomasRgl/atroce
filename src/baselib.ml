open Ast
open Mips

module Env = Map.Make(String)

let _types_ =
    Env.of_seq
        (List.to_seq
            [ "%add", Func_t (Int_t, [ Int_t ; Int_t ])
            ; "%sub", Func_t (Int_t, [ Int_t ; Int_t ])
            ; "%mul", Func_t (Int_t, [ Int_t ; Int_t ]) 
            ; "%div", Func_t (Int_t, [ Int_t ; Int_t ])
            
            ; "%seq", Func_t (Int_t, [ Int_t ; Int_t ])
            ; "%neq", Func_t (Int_t, [ Int_t ; Int_t ]) 
            ; "%lt" , Func_t (Int_t, [ Int_t ; Int_t ])
            ; "%le" , Func_t (Int_t, [ Int_t ; Int_t ])
            ; "%gt" , Func_t (Int_t, [ Int_t ; Int_t ]) 
            ; "%ge" , Func_t (Int_t, [ Int_t ; Int_t ])
            ; "%div", Func_t (Int_t, [ Int_t ; Int_t ])
       
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
