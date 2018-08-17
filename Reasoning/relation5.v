Inductive person : Type := barack | michelle | malia.

Inductive W : person -> Type :=.

Inductive F : person -> Type :=.

Inductive M : person -> Type :=.


Definition wife (x : person) : option person :=
  match x with
  | barack => Some michelle
  | michelle => None
  | malia => None
  end.

Definition option_elim (x : person) (o : option person) : person :=
  match o with
  | Some n' => n'
  | None => x
  end.

Definition wife' (x : person) := option_elim barack (wife x).

Eval compute in wife' barack.
(* = michelle : person *)



Eval compute in wife barack.
(* = Some michelle : option person *)

Eval compute in wife michelle.
(* = None : option person *)

(* Definition w (p : person) (): W p. 

Check w michelle.

Check W barack.

Print w.

Definition R (p : person):= person -> W p. *)

Definition w (p : person) : Prop := 
  match p with
  | barack => W malia
  | michelle => W barack
  | malia => W michelle
  end.
Check w.
Eval compute in w michelle.


Check R.
(* R : person -> Prop *)

Check R barack.
(* R barack : Prop *)

