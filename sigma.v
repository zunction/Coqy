Set Implicit Arguments.

Require Import Notations.
Require Import Datatypes.
Require Import Logic.

(** * Subsets and Sigma-types *)

(* (sig A P), or more suggestively {x:A | P x}, denotes the subset of elements
of types A which satisfy the predicate P. Similarly (sig2 A P Q), or 
{x: A | P x & Q x}, denotes the subset of elements of the type A which 
satisfy both P and Q.
 *)

Inductive sig (A:Type) (P:A->Prop) : Type :=
  exist : forall x:A, P x -> sig P.
  
Inductive sig2 (A:Type) (P Q:A->Prop) : Type :=
  exist2 : forall x:A, P x -> Q x -> sig2 P Q.
  
(* (sigT A P), or more suggestively {x:A & (P x)} is a Sigma-type. Similarly for
(sigT2 A P Q), also written {x:A & (P x) & (Q x)}. *)

Inductive sigT (A:Type) (P:A -> Type) : Type :=
  existT : forall x:A, P x -> sigT P.
  
Inductive sigT2 (A:Type) (P Q:A -> Type) : Type :=
  existT2 : forall x:A, P x -> Q x -> sigT2 P Q.
  
  
Inductive person : Type :=
  | Mary : person
  | John : person.
  
Definition in_office (p : person) : Prop :=
  match p with
  | Mary => True
  | John => False
  end.
  
Check {Mary | in_office Mary}.

