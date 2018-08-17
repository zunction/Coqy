Inductive person : Type := barack | michelle | malia.

Inductive W : person -> Type :=
  | w_michelle : W barack
  | w_malia : W michelle.

Check W.
(* W : person -> Prop *)

Check W barack.
(* W barack : Prop *)

Check w_michelle.
(* w_michelle : W barack *)

Search W _.
(* w_malia: W michelle
w_michelle: W barack *)