open Ast
open Mips

module Env = Map.Make(String)

let global_env =
	Env.of_seq
		(List.to_seq
			[ "_add", Func_t (Int_t "int", [ Int_t "int" ; Int_t "int" ])
			; "_sub", Func_t (Int_t "int", [ Int_t "int" ; Int_t "int" ])
			; "_mul", Func_t (Int_t "int", [ Int_t "int" ; Int_t "int" ])
			; "_div", Func_t (Int_t "int", [ Int_t "int" ; Int_t "int" ])
			
			; "_eq",  Func_t (Int_t "int", [ Int_t "int" ; Int_t "int" ])
			; "_neq", Func_t (Int_t "int", [ Int_t "int" ; Int_t "int" ]) 
			; "_lt" , Func_t (Int_t "int", [ Int_t "int" ; Int_t "int" ])
			; "_le" , Func_t (Int_t "int", [ Int_t "int" ; Int_t "int" ])
			; "_gt" , Func_t (Int_t "int", [ Int_t "int" ; Int_t "int" ]) 
			; "_ge" , Func_t (Int_t "int", [ Int_t "int" ; Int_t "int" ])

            ; "_and" , Func_t (Int_t "int", [ Int_t "int" ; Int_t "int" ]) 
			; "_or" ,  Func_t (Int_t "int", [ Int_t "int" ; Int_t "int" ])

			; "puti", Func_t (Int_t "void", [ Int_t "int"  ])
			; "puts", Func_t (Int_t "void", [ Int_t "int"  ])

            ; "_valueAdrr" , Func_t (Int_t "int", [ Int_t "int" ])

            ; "malloc" , Func_t (Int_t "int", [ Int_t "int" ])

            (* ; "teststruct" , Struct_t2( [("a", Int_t "int", 0); ("b", Int_t "int", 4) ] ) *)
            (* ; "teststruct" , Struct_t2( Struct.of_seq ( List.to_seq [(0, Int_t "int", 0)] )) *)
		])

let _type_ =
	Env.of_seq
		(List.to_seq
			[ "int" , 4;
            "teststruct", 8
			])


let builtins =
	[ Label "_add"
	; Lw (T0, Mem (SP, 0))
	; Lw (T1, Mem (SP, 4))
	; Add (V0, T0, T1)
	; Jr RA
		
	; Label "_sub"
	; Lw (T0, Mem (SP, 0))
	; Lw (T1, Mem (SP, 4))
	; Sub (V0, T1, T0)
	; Jr RA

	; Label "_mul"
	; Lw (T0, Mem (SP, 0))
	; Lw (T1, Mem (SP, 4))
	; Mul (V0, T0, T1)
	; Jr RA

	; Label "_div"
	; Lw (T0, Mem (SP, 0))
	; Lw (T1, Mem (SP, 4))
	; Div (V0, T1, T0)
	; Jr RA

	; Label "puti"
	; Lw (A0, Mem (SP, 0))
	; Li (V0, Syscall.print_int)
	; Syscall
	; Jr RA

	; Label "true"
	; Li (V0, 1)
	; Jr RA

	; Label "false"
	; Li (V0, 0)
	; Jr RA

	; Label "_eq"
	; Lw (T0, Mem (SP, 0))
	; Lw (T1, Mem (SP, 4))
	; Li (V0, 0)
	; Beq (T1, T0, "true")
	; Jr RA

	; Label "_neq"
	; Lw (T0, Mem (SP, 0))
	; Lw (T1, Mem (SP, 4))
	; Li (V0, 0)
	; Bne (T1, T0, "true")
	; Jr RA

	; Label "_lt"
	; Lw (T0, Mem (SP, 0))
	; Lw (T1, Mem (SP, 4))
    ; Sub( T2, T0, T1)
	; Li (V0, 0)
	; Bgtz (T2, "true")
	; Jr RA

	; Label "_le"
	; Lw (T0, Mem (SP, 0))
	; Lw (T1, Mem (SP, 4))
    ; Sub( T2, T1, T0)
	; Li (V0, 0)
	; Blez (T2, "true")
	; Jr RA

	; Label "_gt"
	; Lw (T0, Mem (SP, 0))
	; Lw (T1, Mem (SP, 4))
    ; Sub( T2, T1, T0)
	; Li (V0, 0)
	; Bgtz (T2, "true")
	; Jr RA

	; Label "_ge"
	; Lw (T0, Mem (SP, 0))
	; Lw (T1, Mem (SP, 4))
    ; Sub( T2, T0, T1)
	; Li (V0, 0)
	; Blez (T2, "true")
	; Jr RA

	; Label "_and"
	; Lw (T0, Mem (SP, 0))
	; Lw (T1, Mem (SP, 4))
    ; Li (T2, 0)
    ; Li (V0, 0)
    ; Bne (T0, T2, "true")
    ; Move (T3, V0)
    ; Li (V0, 0)
    ; Bne (T1, T2, "true")
    ; Move (T4, V0)
    ; Mul(V0, T4, T3)
	; Jr RA

    ; Label "_or"
	; Lw (T0, Mem (SP, 0))
	; Lw (T1, Mem (SP, 4))
    ; Li (T2, 0)
    ; Li (V0, 0)
    ; Bne (T0, T2, "true")
    ; Move (T3, V0)
    ; Li (V0, 0)
    ; Bne (T1, T2, "true")
    ; Move (T4, V0)
    ; Add(V0, T4, T3)
	; Jr RA

	; Label "geti"
	; Lw (A0, Mem (SP, 0))
	; Li (V0, Syscall.read_int)
	; Syscall
	; Jr RA

	; Label "puts"
	; Lw (A0, Mem (SP, 0))
	; Li (V0, Syscall.print_char)
	; Syscall
	; Jr RA

    (* wtf are you doing ??? la pile est refaite à chaque appel de fonction tu as pas l'adresse de la variable fdp 
    ; Label "_adrr"
	; Lw (V0, Mem (SP, 0) )
    (* ; Move (V0, SP ) *)
	; Jr RA *)

    ; Label "_valueAdrr"
	; Lw (T0, Mem (SP, 0))
    ; Lw (V0, Mem (T0, 0))
	; Jr RA

    ; Label "malloc"
	; Lw (A0, Mem (SP, 0))
    ; Li (T0, 4)
    ; Mul( A0, A0, T0)
	; Li (V0, Syscall.sbrk)
	; Syscall
	; Jr RA


	]
