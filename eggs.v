(* Searching with Eggs *)


Require Import Arith.

Inductive strategy : Type :=
  | guess (floor : nat)
  | drop (floor : nat) (broken intact : strategy).

(** The [Inductive] type definition above says that there are only two ways
    to construct a strategy, one is to just guess, the other is to drop.
    
*)

(** Pure guessing strategy without dropping any eggs *)
Check guess (5).

(** Dropping strategy where you drop at most two eggs before guessing. The
    first drop 
    
*)
Check drop 3 (guess 7) (guess 3).
Check drop 3 (guess 3) (drop 2 (guess 7) (guess 3)).
Check drop 3 (drop 2 (guess 7) (guess 3)) (guess 3).
Check guess 3.

Fixpoint play (target : nat) (s : strategy) : bool :=
  match s with
  | guess floor => beq_nat floor target
  | drop floor broken intact => 
    play target (if leb target floor then broken else intact)
end.

(** The recursion in play 
*)

Check play 7 (guess 6).

Eval compute in play 7 (guess 6).
Eval compute in play 7 (guess 7).

Check play 7 (drop 3 (guess 7) (guess 3)).
Eval compute in play 7 (drop 3 (guess 3) (guess 7)).

Fixpoint eggs (s : strategy) : nat :=
  match s with 
  | guess _ => 0
  | drop _ broken intact => max (S (eggs broken)) (eggs intact)
end.

Eval compute in eggs (drop 3 (guess 7) (guess 3)).

Eval compute in eggs (drop 3 (drop 3 (guess 7) (guess 5)) (guess 3)).

Fixpoint drops (s : strategy) : nat :=
  match s with
  | guess _ => 0
  | drop _ broken intact => S( max (drops broken) (drops intact))
end.


Definition winning (lower range : nat) (s : strategy) : Prop :=
  forall target, lower <= target < lower + range ->
                 play target s = true.