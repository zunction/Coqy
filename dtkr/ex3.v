(*
 * a - wife of -> b -> father of -> c
 * a - mother of -> c
 *)

Local Unset Elimination Schemes.

(* We start by inhabiting our type of person with the subjects involved.
 * Dependent type [W] depend on the value of [P] given to it, [W b] is
 * the wife type of person [b]. Ideally, we would like [a] to be an
 * inhabitant of [W b], however, [b] has been predefined as type [P].
 
 * Note: [F] and [M] denote father and mother respectively.
 *)
Inductive P : Set := a | b | c.

Inductive W : P -> Type :=.

Inductive F : P -> Type :=.

Inductive M : P -> Type :=.

(* Thus we inhabit [W b] with [a'] with it being a proof of existence
 * of a wife of [b], without any information on the identity of the wife.
 * Thus we create a product type [P * W b], when inhabited consists of 
 * the proof of the existence of the wife and the identity of the wife.
 *)

Definition a' : W b. Admitted.

Definition a_wife : prod P (W b) := (a, a').


Definition b' : F c. Admitted.

Definition b_father : prod P (F c) := (b, b').


Definition a'' : M c. Admitted.

Definition a_mother: prod P (M c) := (a, a'').


(* The reason for this construction is because we there are many 
 * interpretations of a type in coq... type after lunch
 *)
Definition g := fun (x:P) (y' : prod P (F x)) (z' : prod P (W (fst y')))
              => fst z'.

Check g.
(* g : forall (x : P) (y' : P * F x), P * W (fst y') -> P *)

Eval compute in (g c b_father a_wife).