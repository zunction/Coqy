Definition even (n : nat) : Prop :=
  exists p, n = 2 * p.

Definition prime (n : nat) : Prop :=
  n >= 2 /\ 
  forall p q, n = p * q -> p = n \/ p = 1.
  
(* Lemma bogus : (2 : {x : nat & prime x}). *)


Lemma fixed : exists y : {x : nat & prime x}, 2 = projT1 y.
Proof. Admitted.

Lemma prime_two : prime 2.
Proof. unfold prime. split.
  {  }


Check even 1.