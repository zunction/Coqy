Local Unset Elimination Schemes.
(*
 * a - wife of -> b -> father of -> c
 * a - mother of -> c
 *)

Inductive P : Set := a | b | c.

Inductive W : P -> Type :=.

Inductive F : P -> Type :=.

Inductive M : P -> Type :=.

Axiom ta : W b.

Axiom tb : F c.

Fail Axiom ta : M c.
(* => ta already exists *)

(* Axiom ta : (fun (x:Type) => x) (W b : M c). *)

(* We have a set [P] with the relationship defined above. Instead of reusing 
the terms of [P] to inhabit the dependent types [W _], [F _] and [M _], we 
use [t_]. Thus [ta : W b] means that the wife of [b] is [a]. We do this as
[a] is defined to be of type [P] and thus cannot be of type [W b]. This 
method works well, till we want to have that axiom that mother of [c] is 
[ta]. This clashes with the earlier definition that [ta : W b]. *)

Axiom ta' : M c.

Definition fathers_wife_is_mother :








