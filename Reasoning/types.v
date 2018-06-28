(* Product Types *)

Inductive prod {A B : Type} : Type :=
  pair : A -> B -> @prod A B.
  
Definition is_three (n : nat) : Prop := n = 3.

Check is_three.

Check is_three 1.

Lemma three_notequal_one : ~is_three 1.
Proof. unfold is_three. intros contra. inversion contra.
Qed.

(* Dependent Pair Types *)

Inductive sigT {A : Type} (P: A -> Type) : Type:=
  existT : forall x : A, P x -> sigT P.



Lemma reflexivity : is_three 3.
Proof. reflexivity.
Qed.

Inductive person : Type :=
  | Mary : person
  | John : person.
  
  
Definition at_bathroom (p : person) : Prop :=  Location(Mary) /\ bathroom