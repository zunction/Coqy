Module Type obama.

Inductive person : Set := barack | michelle | malia | sasha.

Parameter W : person -> Type.

Parameter F : person -> Type.

Parameter M : person -> Type.


Check W.
(* W : person -> Type *)

Check W barack.
(* W barack : Type *)




End obama.