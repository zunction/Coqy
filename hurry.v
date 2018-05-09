Check True.

Check False.

Check 3.

Check (3+4).

Check (3=5).

Check (3,4).

Check ((3=5) /\ True).

Check nat -> Prop.

Check (3,3=5).

Check (fun x:nat => x = 3).

Check (forall x:nat, x < 3 \/ (exists y:nat, x=y+3)).

Check (let f := fun x => (x*3,x) in f 3).

Locate "_ <= _".

Check and.

Check (and True False).

Locate "_ /\ _".

Eval compute in
  let f := fun x => (x*3,x) in f 3.

Check (fun a b c d e => a+b+c+d+e).

Eval compute in
  let f := (fun a b c d e => a+b+c+d+e) in f 1 2 3 4 5.

Definition example1 := fun x:nat => x*x+2*x+1.

Definition example1' (x:nat) := x*x+2*x+1.

Check example1.

Eval compute in example1 1.

Print example1.

Require Import Bool.

Eval compute in if true then 3 else 5.

Search bool.

Require Import Arith.

Definition is_zero (n:nat) :=
  match n with
  | 0 => True
  |S p => False
  end.

Print pred.

Fixpoint sum_n n:=
  match n with
  | 0 => 0
  | S p => p + sum_n p
  end.



