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

(* Members in a family *)

Inductive Members : Set := Father | Mother | Son | Daughter.

(* Typed unary operator *)

Inductive tuop : Members -> Members -> Set :=
  | TFather_of : forall m, tuop m Father
  | TMother_of : forall m, tuop m Mother
  | TSon_of : forall m, tuop m Son
  | TDaughter_of : forall m, tuop m Daughter.

Inductive texp : Members -> Set :=
  | TFather : person -> texp Father
  | TMother :
  | TSon
  | TDaughter
  | TUop : forall m1 m2, tuop m1 m2 




Inductive person : Type :=
  | Barack : person
  | Michelle : person
  | Malia : person
  | Sasha : person.

Inductive Mother : person -> Set :=
  | p : Mother Malia
  | q : Mother Sasha.


