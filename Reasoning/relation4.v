Inductive person : Type := barack | michelle | malia | sasha.

Inductive W : person -> Type :=.

Inductive F : person -> Type :=.

Inductive M : person -> Type :=.

(* Definition michelle : W barack.
==> michelle already exists. *)

(* Axiom michelle : W barack.
==> michelle already exists. *)

Check W barack.
(* W barack : Prop *)

Check michelle.
(* michelle : person *)

Definition m : W barack. Admitted.

Check m.
(* m : W barack *)
