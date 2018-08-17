Inductive Tt := a | b | c.

Definition filt (x : bool): Tt :=
  match x with 
  | true => a
  | false => b
  end.


Check filt true.
(* filt true : Tt *)

Eval compute in filt true.
(* = a : Tt *)

Notation _Tt := ltac: (let T := type of (forall {x:bool}, filt x) in exact T).

Fail Check a: _Tt. (*The term "filt x" has type "Tt" which should be Set, Prop or Type.*)

(* By using type classes? *)

Class s_Tt: Type := s: Tt.
Instance a':s_Tt := a.
Instance b':s_Tt := b.
Check a: s_Tt.
Check b': Tt.
Check c: s_Tt.