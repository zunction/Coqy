Set Implicit Arguments.

Require Import Notations.
Require Import Logic.

Inductive Empty_set : Set :=.

Inductive unit : Set :=
  tt : unit.
  
Inductive bool : Set :=
  | true : bool
  | false : bool.
  
Add Printing If bool.

Delimit Scope bool_scope with bool.

