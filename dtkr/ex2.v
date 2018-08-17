Universe X Y.
Notation X := Type@{X}.
Notation Y := Type@{Y}.
Axiom fuh: (fun (x:Type) => x)(X:Y).

Inductive W : X -> Type :=.
Inductive F : Y -> Type :=.

Check fuh : X.

Check fuh : Y.

Check W fuh.

Check F fuh.

