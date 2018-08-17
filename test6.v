Local Unset Elimination Schemes.

Inductive P : Type := a | b.



Inductive W : P -> Type :=.

Fail Axiom b : W a.