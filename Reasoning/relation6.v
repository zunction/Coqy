Inductive person : Type := barack | michelle | malia | sasha.

Inductive R (A : Type) : person -> Type :=.

Check R nat barack.