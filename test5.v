Definition R := forall A:Type, A -> A.


Definition W : R := fun A x => x.

Check R.
(* R : Type@{Top.1+1} *)

Check W.
(* W : R *)

Print W.

Definition A := Type.

Definition a : A. Admitted.

Definition b : A. Admitted.

Check a.
(* a : A *)

Check W A a.

(* W A a
     : A
(*  |= Top.2 < Top.1
        *)
 *)

Fail Check b : W A a.

Check W A (W A a) : A.

Check W A b.
(* W A b
     : A
(*  |= Top.2 < Top.1
        *)
 *)

Definition F : R := fun A x => x.

Definition c : A. Admitted.

Check F A c : A.
