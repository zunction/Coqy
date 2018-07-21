Require Import List Tactics.
Set Implicit Arguments.

(* Arithmetic Expression Over Natural Numbers *)

(* Source Language *)

(** The algebraic datatype _binop_ to stand for the binary operators
of our source language. *)

Inductive binop : Set := Plus | Times.


(* Type of arithmetic expression *)

Inductive exp : Set :=
  | Const : nat -> exp
  | Binop : binop -> exp -> exp -> exp.

(** A constant can be built from a single argument, a natural number and
a binary operation may be built from a choice of an operator and two
operand expressions. *)


Definition binopDenote (b : binop) : nat -> nat -> nat :=
  match b with 
  |Plus => plus
  |Times => mult
  end.

Fixpoint expDenote (e : exp) : nat :=
  match e with 
  | Const n => n
  | Binop b e1 e2 => (binopDenote b) (expDenote e1) (expDenote e2)
end.

Eval simpl in expDenote (Const 42).

Eval simpl in expDenote (Binop Plus (Const 2) (Const 2)).

Eval simpl in expDenote (Binop Times (Binop Plus (Const 2) (Const 2)) (Const 7)).

(* Target Language *)


Inductive instr : Set :=
  | IConst : nat -> instr
  | IBinop : binop -> instr.

Definition prog := list instr.
Definition stack := list nat.

Definition instrDenote (i : instr) (s : stack) : option stack :=
  match i with
  | IConst n => Some (n :: s) (* pushes constant into stack *)
  | IBinop b =>               (* applies binop, pushes result to stack *)
    match s with
      | arg1 :: arg2 :: s' => Some ((binopDenote b) arg1 arg2 :: s')
      | _ => None
      end
  end.

Fixpoint progDenote (p : prog) (s : stack) {struct p} : option stack :=
  match p with
  | nil => Some s
  | i :: p' =>
    match instrDenote i s with
      | None => None
      | Some s' => progDenote p' s'
      end
  end.

(* Translation *)

Fixpoint compile (e : exp) : prog :=
  match e with
  | Const n => IConst n :: nil
  | Binop b e1 e2 => compile e2 ++ compile e1 ++ IBinop b :: nil
  end.

Eval simpl in compile (Const 42).

Eval simpl in compile (Binop Plus (Const 2) (Const 2)).

Eval simpl in compile (Binop Times (Binop Plus (Const 2) (Const 2)) (Const 7)).

Eval simpl in progDenote (compile (Const 42)) nil.

Eval simpl in progDenote (compile (Binop Plus (Const 2) (Const 2))) nil.

Eval simpl in progDenote (compile (Binop Times (Binop Plus (Const 2) (Const 2)) (Const 7))) nil.

(* Translation correctness *)

Theorem compile_correct : forall e : exp, 
  progDenote (compile e) nil = Some (expDenote e :: nil).

Lemma compile_correct' : forall (e : exp) (p :prog) (s : stack),
  progDenote (compile e ++ p) s = progDenote p (expDenote e :: s).
Proof.
  induction e.
  - intros. unfold compile. unfold expDenote. unfold progDenote at 1. 
    simpl. fold progDenote. reflexivity.
  - intros. unfold compile. fold compile. unfold expDenote. fold expDenote.
    rewrite app_ass. rewrite IHe2. rewrite app_ass. rewrite IHe1.
    unfold progDenote at 1. simpl. fold progDenote. reflexivity.


Abort.

Lemma compile_correct' : forall e s p,
  progDenote (compile e ++ p) s = progDenote p (expDenote e :: s).
  induction e; crush.
Qed.

