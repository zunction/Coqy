(* Require Import Notations.
Require Import Datatypes.
Require Import Logic.
 *)
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
  
Inductive person : Type :=
  | Mary : person
  | John : person.
  
Definition in_office (p : person) : Prop :=
  match p with
  | Mary => True
  | John => False
  end.

Compute in_office Mary.
Compute in_office John.

Check in_office Mary.

Eval compute in existT in_office Mary.

Compute existT in_office Mary.

Check existT in_office Mary.

Check {Mary | in_office Mary}.

Check sigT in_office Mary.



Lemma reflexivity : is_three 3.
Proof. reflexivity.
Qed.

  
  
Definition at_bathroom (p : person) : Prop :=  Location(Mary) /\ bathroom