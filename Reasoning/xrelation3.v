Definition person := Type.

Check person.
(* person : Type@{Top.1+1} *)

Definition x : person. Admitted.

Inductive W : person -> Type :=.

Definition y : W x. Admitted.

Check y.
(* y : W x *)

Inductive F : person -> Type :=.

Definition z : person. Admitted.

Check F z.


(* Definition x : F z := Prop.
The term "Prop" has type "Type@{Set+1}" while it is expected to have type
 "F z".
 *)
(* Definition x : F z := person.
The term "person" has type "Type@{Top.1+1}"
while it is expected to have type "F z". *)

(* Definition x : F z.
x already exists *)
