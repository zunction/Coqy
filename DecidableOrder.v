Require Import Coq.Unicode.Utf8.

(* File: DecidableOrder.v
 * Part 1
 *)

Module Type Sig.

Parameter A : Type.
Parameter le : A -> A -> Prop.
Infix "<=" := le : order_scope.
Open Scope order_scope.

Axiom le_refl : forall x, x <= x.
Axiom le_antisym : forall x y, x <= y -> y <= x -> x = y.
Axiom le_trans : forall x y z, x <= y -> y <= z -> x <= z.
Axiom le_total : forall x y, {x <= y} + {y <= x}.
Parameter le_dec : forall x y, {x <= y} + {~x <= y}.
End Sig.