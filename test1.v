Universes x y.

Constraint x < y.

Definition X := Type@{x}.
Definition Y := Type@{y}.

Check X.
(* X : Type@{Top.1+1} *)

Check Y.
(* Y : Type@{Top.2+1} *)

Inductive W : X -> Y :=.

Definition x : X. Admitted.

Definition y : (W x : Y). Admitted.

Check x : X.
(* x : X : X *)

Fail Check y : Y.
(* The command has indeed failed with message:
The term "y" has type "W x" while it is expected to have type "Y". *)


Check y : W x : Y.

Definition Z := Type.

Inductive F : Y -> Z :=.

Check F y.