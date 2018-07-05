Require Import Coq.Strings.String.

Class Show A : Type :=
  {
    show : A -> string
  }.


Inductive color := Red | Green | Blue.

Check color.

Instance showBool : Show bool :=
  {
    show := fun b : bool => if b then "true" else "false"
  }.