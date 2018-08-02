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


Inductive Wife : nat -> nat -> Set :=
  | wife : Wife O O
  | Michelle : Wife 1 1.

Check Wife.
(* Wife : nat -> Set *)

Check Wife O O.
(* Wife 0 : Set *)

Check Michelle.
(* Michelle : Wife 0 *)

Inductive Husband : nat -> nat -> Set :=
  | husband : Husband O O
  | Barack : Husband 1 1.


