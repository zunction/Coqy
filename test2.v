Universes x y z.

Constraint x < y, y < z.

Definition X := Type@{x}.
Definition Y := Type@{y}.
Definition Z := Type@{z}.

Inductive W : Z -> X :=.

Definition a : Z. Admitted.

Definition b : W a. Admitted.

Fail Check b : X. 

Check b : W a : X.

Inductive F : Z -> Y :=.

Definition c : F a. Admitted.

Check c. Check F a. Check X : Y : Z. 

Definition p : X. Admitted. Check p : Z.

Check X:Y.
Check Y:Z.
Check X:Z.
Fail Check Z:Y.
Fail Check Y:X.
Fail Check Z:X.