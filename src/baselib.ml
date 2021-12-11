open Ast

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
