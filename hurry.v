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

Fixpoint sum_n2 n s :=
  match n with
  | 0 => s
  | S p => sum_n2 p (p + s)
  end.
  
Fixpoint evenb n :=
  match n with
  | 0 => true
  | 1 => false
  | S (S p) => evenb p
  end.

Require Import List.

Check 1::2::3::nil.

Check (nil : list nat).

Eval compute in map (fun x => x+3) (1::3::2::nil).

Eval compute in map S (1::22::3::nil).

Eval compute in let l := (1::2::3::nil) in l ++ map (fun x => x+3) l.

Definition head_evb l :=
  match l with 
  | nil => false 
  | a :: tl => evenb a 
  end.

Fixpoint sum_list l :=
  match l with
  | nil => 0
  | n::tl => n + sum_list tl 
  end.

Fixpoint insert n l:=
  match l with
  | nil => n::nil
  | a::tl => if leb n a then n::l else a::insert n tl
  end.
  
Check 1::2::3::nil.

Eval compute in insert 7 (5::9::nil).

Fixpoint sort l :=
  match l with
  | nil => nil
  | a::tl => insert a (sort tl)
  end.
  
Eval compute in sort (1::4::3::22::5::16::7::nil).

Search True.

SearchPattern (_ + _ <= _ + _).

SearchRewrite (_ + (_-_)).

SearchAbout leb.

Lemma example2 : forall a b:Prop, a /\ b -> b /\ a.
Proof. intros a b H. split.
  destruct H as [H1 H2].
  exact H2.
  intuition.
Qed.

Lemma example3 : forall a b: Prop, a \/ b -> b \/ a.
Proof. intros a b H.
  destruct H as [H1 | H1].
  right; assumption.
  left; assumption.
Qed.




