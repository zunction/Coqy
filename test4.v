Universe X Y Z.
Notation X := Type@{X}.
Notation Y := Type@{Y}.
Notation Z := Type@{Z}.
Axiom a: (fun (x:Type) => x)(X:Y).

Check a.
(* a : X *)

Check a : Y.
(* a : Y
     : Y
(*  |= X <= Y
        *) *)

Check a : X.
(* a : X : X *)

(* This means that the term a is in Types X, Y *)

Inductive W : X -> Z :=.
Inductive F : Y -> Z :=.

Check W a.

Fail Definition b : W a := Z.



Axiom b : (fun (x:Type) => x)((W (a)):Z). Check b.

Check b : W a.

Fail Check b : Z.

