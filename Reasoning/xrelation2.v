Definition person := Type.

Check person.
(* person : Type@{Top.1+1} *)

Definition out := Type.

Check out.
(* out : Type@{Top.2+1} *)

Definition x : person. Admitted.

Inductive W : person -> out :=.

Definition y : W x. Admitted.

Check y.
(* y : W x *)

Inductive F : person -> out :=.

Definition z : person. Admitted.

Check F z.

Definition x : F z := out.

(* The term "out" has type "Type@{Top.2+1}" while it is expected to have type
 "F z". *)

