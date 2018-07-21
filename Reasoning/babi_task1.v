(* Task 1: Single Supporting Fact *)

(* 1 Mary moved to the bathroom.
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
15 Where is Sandra? 	bathroom	8 *)

Inductive person : Set := Mary | John | Daniel | Sandra.


Inductive place : Set := bathroom | hallway | office | garden | bedroom.

Inductive loc : person -> place -> Set :=
  | initialm : forall l, loc Mary l
  | subm : forall p l l', loc p l -> loc p l'.

Check subm Mary bathroom office.


Check initialm. Check loc.
(* initial : forall (p : person) (l : place), loc p l
   loc : person -> place -> Set *)

Check initialm bathroom. Check loc Mary garden.
(* initial Mary bathroom : loc Mary bathroom
   loc Mary bathroom : Set *)

(* We see that initial Mary bathroom is a term of type 
location Mary bathroom. Thus if Mary has not been to the garden,
we would not have the term initial Mary garden and also the type
location Mary bathroom. *)

Inductive sub_loc

Check initial_location Mary bathroom. Check initial_location.

Inductive sub_location : initial_location -> person -> location -> Set :=
  | sub : forall p l, initial_location p l -> person -> location.

Check initial John bathroom.








