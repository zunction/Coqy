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

(* Inductive person : Set := Barack | Michelle | Malia | Sasha. *)

Inductive person : Set := Malia | Sasha.

Inductive type : Set := Person.

Inductive Mother : person -> Set :=
  | Michelle : Mother Malia.


Check Mother Malia. Check Michelle. Check Mother.


  