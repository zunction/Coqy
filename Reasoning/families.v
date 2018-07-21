Set Implicit Arguments.

Require Import Notations.
Require Import Logic.
Require Setoid.
Require Import PeanoNat Le Gt Minus Bool Lt.
Require Import List.

Module ListNotations.
Notation "[ ]" := nil (format "[ ]") : list_scope.
Notation "[ x ]" := (cons x nil) : list_scope.
Notation "[ x ; y ; .. ; z ]" := (cons x (cons y .. (cons z nil) ..)) : list_scope.
End ListNotations.

Import ListNotations.

(* Inhabitants of family type *)
Inductive family : Set := Obama | Trump.

(* Inhabitants of obama type *)

Inductive obama : Type :=
  | barack : obama
  | michelle : obama
  | malia : obama
  | sasha : obama.

(* Inhabitants of trump type *)

Inductive trump : Type :=
  | Donald : trump
  | Melania : trump
  | Doanld_Jr : trump
  | Ivanka : trump
  | Eric : trump
  | Tiffany : trump
  | Barron : trump.

(* Relationship operator *)

Inductive rsop : Type :=
  | husband : rsop
  | wife : rsop
  | father : rsop
  | mother : rsop
  | son : rsop
  | daughter : rsop.

Inductive 

Definition husband_of (p : person) : list person :=
  match p with
  | Barack => []
  | Michelle => [Barack]
  | Malia => []
  | Sasha => []
  end.

Definition wife_of (p : person) : list person :=
  match p with
  | Barack => [Michelle]
  | Michelle => []
  | Malia => []
  | Sasha => []
  end.

Definition father_of (p : person) : list person :=
  match p with
  | Barack => []
  | Michelle => []
  | Malia => [Barack]
  | Sasha => [Barack]
  end.

Definition mother_of (p : person) : list person :=
  match p with
  | Barack => []
  | Michelle => []
  | Malia => [Michelle]
  | Sasha => [Michelle]
  end.

Definition son_of (p : person) : list person :=
  match p with
  | Barack => []
  | Michelle => []
  | Malia => []
  | Sasha => []
  end.


Definition daughter_of (p : person) : list person :=
  match p with
  | Barack => [Malia; Sasha]
  | Michelle => [Malia; Sasha]
  | Malia => []
  | Sasha => []
  end.

Eval compute in wife_of Barack.

Eval compute in daughter_of Michelle.





Definition unlist (l : (list person)) : option person :=
  match l with
  | [] => None
  | h :: tl => Some h
  end.

Definition unoption (p : option person) : person :=
  match p with 
  | None =>


Eval wife_of father_of Malia.








