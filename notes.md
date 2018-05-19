# coq notes

## Logic

### Falsehood and Negation

|     P     |    Q    |  P -> Q  |
| :-------: |:-------:| :-------:|
|     T     |    T    |     T    |
|     F     |    T    |     T    |
|     T     |    F    |     F    |
|     F     |    F    |     T    |

'''coq
Definition not (P:Prop) := P -> False.
Notation "¬ x" := (not x) : type_scope.
'''

where `False` is a specific contradictory proposition defined in the standard library.
