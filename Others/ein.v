(**
The situation:
1. There are 5 houses in five different colors.
2. In each house lives a person with a different nationality.
3. These five owners drink a certain type of beverage, smoke a certain brand of cigar and keep a certain pet.
4. No owners have the same pet, smoke the same brand of cigar or drink the same beverage.

How do we encode these rules into Coq?

The situation stipulates that each person has a different house, drinks a different beverage,
own a different pet and smokes a different type of cigar. Thus we can have a function type for each
attribute that takes in the nationality and outputs the attribute. Then we require for different nationalities,
the attribute output must be distinct.

Hints:
1. the Brit lives in the red house
2. the Swede keeps dogs as pets
3. the Dane drinks tea
4. the green house is on the left of the white house
5. the green house's owner drinks coffee
6. the person who smokes Pall Mall rears birds
7. the owner of the yellow house smokes Dunhill
8. the man living in the center house drinks milk
9. the Norwegian lives in the first house
10. the man who smokes blends lives next to the one who keeps cats
11. the man who keeps horses lives next to the man who smokes Dunhill
12. the owner who smokes BlueMaster drinks beer
13. the German smokes Prince
14. the Norwegian lives next to the blue house
15. the man who smokes blend has a neighbor who drinks water

*)

Inductive nationality : Type :=
  | British : nationality
  | Swedish : nationality
  | Danish : nationality
  | Norwegian : nationality
  | German : nationality.
  
Inductive pet : Type :=
  | Dog : pet
  | Cat : pet
  | Bird : pet
  | Horse : pet
  | Fish : pet.
  
Inductive beverage : Type :=
  | tea : beverage
  | coffee : beverage
  | milk : beverage
  | beer : beverage
  | water : beverage.
  
Inductive house : Type :=
  | red : house
  | green : house
  | white : house
  | yellow : house
  | blue : house.
  
Inductive cigar : Type :=
  | PallMall : cigar
  | Dunhill : cigar
  | BlueMaster : cigar
  | Prince : cigar
  | Blend : cigar.


