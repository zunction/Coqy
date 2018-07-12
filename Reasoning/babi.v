Require Import Notations.
Require Import Datatypes.
Require Import Logic.

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

