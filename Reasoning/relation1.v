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

(* Inductive Members : Set := Father | Mother | Son | Daughter. *)

Inductive person : Set := Barack | Michelle | Malia | Sasha.

(* Inductive relation : Type := husband | wife | father | mother | son | daughter. *)


(* Inductive Wife : Set :=
  | wife_of : Husband -> Wife
with Husband : Set :=
  | husband_of : Wife -> Husband.


Lemma husband_and_wife : forall (h : Husband) (w: Wife),
  wife_of(h) = w /\ husband_of(w) = h -> 
  husband_of (wife_of h) = h /\ wife_of (husband_of w) = w.
Proof. intros h w [H1 H2]. split.
  - rewrite -> H1. apply H2.
  - rewrite -> H2. apply H1.
Qed. *)

Inductive Wife : Set :=
  | wife : Wife
  | wife_of : Husband -> Wife
  | mother_of : Child -> Wife
with Husband : Set :=
  | husband : Husband
  | husband_of : Wife -> Husband
  | father_of : Child -> Husband
with Child : Set :=
  | child_of : Husband -> Wife -> Child.

Lemma husband_and_wife : forall (h : Husband) (w: Wife),
  wife_of(h) = w /\ husband_of(w) = h -> 
  husband_of (wife_of h) = h /\ wife_of (husband_of w) = w.
Proof. intros h w[H1 H2]. split.
  - rewrite -> H1. apply H2.
  - rewrite -> H2. apply H1.
Qed.

(* Can we add any conditions for the lemma above to be iff? *)

Lemma same_child : forall (h : Husband) (w : Wife),
  wife_of(h) = w /\ husband_of(w) = h ->
  child_of h (wife_of h) = child_of (husband_of w) w.
Proof. intros h w [H1 H2]. rewrite -> H1. rewrite -> H2. reflexivity.
Qed. 

Lemma mother_and_child : forall (w : Wife) (c : Child),
  mother_of c = w -> child_of (husband_of w) w = c.
Proof. intros w c.

Lemma family : forall (h : Husband) (w : Wife) (c : Child),
  wife_of h = w -> child_of h (wife_of h) = c -> 
Proof. intros w c.
