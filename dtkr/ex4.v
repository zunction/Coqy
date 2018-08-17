(*
 * a - wife of -> b -> father of -> c
 * a - mother of -> c
 *)
Local Unset Elimination Schemes.

Inductive P : Set := a | b | c.
Inductive W : P -> Type :=.
Inductive F : P -> Type :=.
Inductive M : P -> Type :=.

Definition a' : W b. Admitted.
Definition a_wife : prod P (W b) := (a, a').

Definition b' : F c. Admitted.
Definition b_father : prod P (F c) := (b, b').

(* Definition a'' : M c. Admitted.
Definition a_mother: prod P (M c) := (a, a'').
 *)

Definition g := fun (x:P) (y' : prod P (F x)) (z' : prod P (W (fst y')))
              => fst z'.

Check g.
(* g : forall (x : P) (y' : P * F x), P * W (fst y') -> P *)

Eval compute in (g c b_father a_wife).

Theorem fuu : forall (x:P) (y:prod P (F x)), (W (fst y)) -> M x. Admitted.

Check fuu c b_father a'.
(* fuu c b_father a' : M c *)

Definition a_mother : prod P (M c) := (a, fuu c b_father a').
Check a_mother.



