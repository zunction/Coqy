(* Movie Night

Four boys are at home to watch some movies. Figure out which is the favorite kind of movie of each one.

1. Joshua is in one of the ends.
2. The boy wearing the Black shirt is somewhere to the left of the youngest boy.
3. Joshua likes Horror movies.
4. The 14 years old boy is at third position.
5. The boy wearing the Red shirt is somewhere between the 13 years old boy and the one who likes Action movies, in that order.
6. Daniel likes Thriller movies.
7. The boy who is going to eat Cookies is in one of the ends.
8. The boy wearing the Black shirt is exactly to the left of the one who likes Thriller movies.
9. The boy who is going to eat Crackers is exactly to the right of the boy who likes Comedy movies.
10. The boy wearing the Red shirt is somewhere between the boy who is going to eat Popcorn and Nicholas, in that order.
11. In one of the ends is the boy who likes Thriller movies.
12. Nicholas is somewhere between Joshua and Daniel, in that order.
13. At first position is the boy wearing the Green shirt

Source: https://www.brainzilla.com/logic/zebra/movies-night/ *)


Inductive Name: Type :=
  | Joshua
  | Ryan
  | Nicholas
  | Daniel.
  
Inductive Shirt: Type :=
  | green
  | red 
  | black
  | blue.
  
Inductive Movie: Type :=
  | horror
  | comedy
  | action
  | thriller.
  
Inductive Snack: Type :=
  | popcorn
  | chips
  | crackers
  | cookies.
  
