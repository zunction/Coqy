(* Task 1: Single Supporting Fact *)

(*
1 Mary moved to the bathroom.
2 John went to the hallway.
3 Where is Mary? 	bathroom	1
4 Daniel went back to the hallway.
5 Sandra moved to the garden.
6 Where is Daniel? 	hallway	4
7 John moved to the office.
8 Sandra journeyed to the bathroom.
9 Where is Daniel? 	hallway	4
10 Mary moved to the hallway.
11 Daniel travelled to the office.
12 Where is Daniel? 	office	11
13 John went back to the garden.
14 John moved to the bedroom.
15 Where is Sandra? 	bathroom	8
*)

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


Inductive person : Type := Mary | John | Daniel | Sandra.


Inductive place : Set := bathroom | hallway | office | garden | bedroom | Unknown.

(* Inductive nat : Type :=
  | O : nat
  | S : nat -> nat. *)

(* Inductive natlist : Type :=
  | nil : natlist
  | cons : nat → natlist → natlist. *)

(* Definition update_location := 
fun p plList (l : location p plList) (pl : place) =>
  match l with
  | locate p plList => locate p (pl :: plList)
  end. *)

Inductive location : person -> list place -> Set :=
  | locate : forall p plList, location p plList.

(* Our definition of [location] has type [person -> list place -> Set]
which says that [location] is a dependent type indexed by [person]
and [list place]. The constructor of [location] is [locate] which
creates a term with its corresponding type. *)

Check location.
(* location : person -> list place -> Set *)

Check locate. 
(* locate : forall (p : person) (l : list place), locate p plList *)

Check location Mary [bathroom; hallway].
(* location Mary [bathroom; hallway] : Set *)

Check location Sandra [garden; bathroom].
(* location Sandra [garden; bathroom] : Set *)

Check locate Mary [bathroom; hallway].
(* locate Mary [bathroom; hallway] : location Mary [bathroom; hallway] *)

(* Next we want a function that updates the location of a [person] while preserving
the history of places visited by using the function [update_location]. *)

Definition update_location :=
fun p plList (l : location p plList) (pl : place) =>
  match l with
  | locate p plList => locate p (pl :: plList)
  end.


Check update_location.
(* update_location : forall (p : person) (plList : list place),
       location p plList -> forall pl : place, location p (pl :: plList) *)

Eval compute in update_location (locate Mary []) bathroom.
(*   = locate Mary [bathroom] : location Mary [bathroom] *)

Eval compute in update_location (locate Mary [bathroom]) garden.
(*   = locate Mary [garden; bathroom] : location Mary [garden; bathroom] *)

Check locate Mary [bathroom; hallway].
(* locate Mary [bathroom; hallway] : location Mary [bathroom; hallway] *)

Check update_location (locate Mary []) bathroom.
(* update_location (locate Mary []) bathroom : location Mary [bathroom] *)

Check update_location (locate Mary [garden; bathroom]) office.

Lemma record_location: forall (p : person) (pl : place) (plList : list place),
locate p (pl :: plList) = update_location (locate p plList) pl.
Proof.
  intros. unfold update_location. reflexivity.
Qed.

Definition current_loc :=
fun p plList (l : location p plList) =>
  match l with
  | locate p plList => nth O plList Unknown
  end.

Check locate Mary [garden].

Check current_loc.

Eval compute in current_loc (locate Mary [garden]).



Module test.

Definition location := prod person (list place).

Check location. Check pair Mary [bathroom].

End test.
