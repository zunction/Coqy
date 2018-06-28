From mathcomp Require Import ssreflect ssrfun ssrbool ssrnat eqtype fintype seq fingroup perm.

Set Implicit Arguments.
Unset Strict Implicit.
Unset Printing Implicit Defensive.

(** Each house is represented as a number, starting with 0 on the left.  The
    [Ordinal] constructor is used to represent natural numbers bounded by 5; the
    corresponding type is noted ['I_5]. *)

Definition o0 : 'I_5 := @Ordinal 5 0 erefl.
Definition o1 : 'I_5 := @Ordinal 5 1 erefl.
Definition o2 : 'I_5 := @Ordinal 5 2 erefl.
Definition o3 : 'I_5 := @Ordinal 5 3 erefl.
Definition o4 : 'I_5 := @Ordinal 5 4 erefl.

Lemma aux : enum 'I_5 = [:: o0; o1; o2; o3; o4].
Proof. by apply: (inj_map val_inj); rewrite val_enum_ord. Qed.

(** We represent each property of the house as a number on the same range. *)

(* Colors *)
Definition Red := o0.
Definition White := o1.
Definition Green := o2.
Definition Blue := o3.
Definition Yellow := o4.

(* Countries *)
Definition Britain := o0.
Definition Sweden := o1.
Definition Denmark := o2.
Definition Germany := o3.
Definition Norway := o4.

(* Beverages *)
Definition Tea := o0.
Definition Coffee := o1.
Definition Milk := o2.
Definition Beer := o3.
Definition Water := o4.

(* Cigars *)
Definition PallMall := o0.
Definition Dunhill := o1.
Definition Blends := o2.
Definition BlueMaster:= o3.
Definition Prince := o4.

(* Pets *)
Definition Fish := o0.
Definition Dogs := o1.
Definition Birds := o2.
Definition Cats := o3.
Definition Horses := o4.

Section Puzzle.

(** ['S_5] is the type of permutations of the type ['I_5].  Each one of the
    variables below is used to map an attribute to the corresponding house
    number; e.g. [country Britain] represents the house number where the British
    lives, [color Green] represents the number of the green house, etc.  Since
    these are permutations, we guarantee that each house number corresponds to
    one unique attribute of each kind.  *)

Variables color country beverage cigar pet : 'S_5.

(** The following predicate states that two houses are next to each other.
    Here, [val] denotes the conversion function from ['I_5] into [nat]. *)
Definition next_to (n1 n2 : 'I_5) :=
  (val n1 == (val n2).+1) || (val n2 == (val n1).+1).

(** The constraints of the problem translated as Coq hypothesis.  Note that:

    - [h3] states that the green house is to the left of the white house;

    - [h8] means that the owner of the middle house drinks milk, and

    - [h9] states that the Norwegian man owns the first (left-most) house. *)

Hypothesis h1 : country Britain = color Red.
Hypothesis h2 : country Sweden = pet Dogs.
Hypothesis h3 : country Denmark = beverage Tea.
Hypothesis h4 : color White = (color Green).+1 :> nat.
Hypothesis h5 : color Green = beverage Coffee.
Hypothesis h6 : cigar PallMall = pet Birds.
Hypothesis h7 : color Yellow = cigar Dunhill.
Hypothesis h8 : beverage Milk = o2.
Hypothesis h9 : country Norway = o0.
Hypothesis h10 : next_to (cigar Blends) (pet Cats).
Hypothesis h11 : next_to (pet Horses) (cigar Dunhill).
Hypothesis h12 : cigar BlueMaster = beverage Beer.
Hypothesis h13 : country Germany = cigar Prince.
Hypothesis h14 : next_to (country Norway) (color Blue).
Hypothesis h15 : next_to (cigar Blends) (beverage Water).

Open Scope group_scope.

(** Using these hypotheses, we can prove a series of lemmas describing the
    properties of each house.  Most of them follow by excluding all the other
    possibilities; e.g., in [f2], we conclude that the first house is yellow by
    arguing that it cannot be red, white, green or blue. Similarly for [f4],
    [f6], [f7], [f8], [f10] and [f12].

    [f1], [f3], [f5] and [f14] do the same thing, but using the [next_to]
    hypotheses to reduce the number of cases to rule out from 4 to 1.

    [f11], [f13] and [f15] reason by exclusion in a slightly different way; e.g,
    [f11] says that since the Norwegian lives in [o0], the Dane lives in [o1],
    the Brit lives in [o2] and the Swede lives in [o4], only the German can live
    in [o3].

    [f15] is the solution of the puzzle.*)

Fact f1 : color Blue = o1.
Proof.
by move: h14; rewrite h9 /next_to /= => /eqP e; apply: val_inj.
Qed.

Fact f2 : color Yellow = o0.
Proof.
have : color^-1 o0 \in enum 'I_5 by rewrite mem_enum.
rewrite aux -[[:: o0; o1; o2; o3; o4]]/([:: Red; White; Green; Blue; Yellow]) !inE.
rewrite !(canF_eq (@permKV _ _)).
rewrite -{1}h9 -h1 (inj_eq (@perm_inj _ _)) /=.
rewrite -(inj_eq val_inj o0) /= h4 /=.
case: (o0 =P color Green) => [e _|_] /=.
  suff: color White = o1 by rewrite -f1=> /perm_inj.
  by apply/val_inj; rewrite /= h4 -e.
by rewrite f1 /= => /eqP <-.
Qed.

Fact f3 : pet Horses = o1.
Proof.
apply/val_inj; move: h11; rewrite -h7 f2 /next_to /= orbF.
by move/eqP.
Qed.

Fact f4 : beverage Water = o0.
Proof.
have : beverage^-1 o0 \in enum 'I_5 by rewrite mem_enum.
rewrite aux -[[:: o0; o1; o2; o3; o4]]/([:: Tea; Coffee; Milk; Beer; Water]) !inE.
rewrite !(canF_eq (@permKV _ _)).
rewrite -h3 -{1}h9 (inj_eq (@perm_inj _ _)) /=.
rewrite -h5 -{1}f2 (inj_eq (@perm_inj _ _)) /=.
rewrite h8 /=.
rewrite -h12 -{1}f2 h7 (inj_eq (@perm_inj _ _)) /=.
by move/eqP=> ->.
Qed.

Fact f5 : cigar Blends = o1.
Proof.
apply/val_inj; move: h15; rewrite f4 /next_to /= orbF.
by move/eqP.
Qed.

Fact f6 : beverage Tea = o1.
Proof.
have : beverage^-1 o1 \in enum 'I_5 by rewrite mem_enum.
rewrite aux -[[:: o0; o1; o2; o3; o4]]/([:: Tea; Coffee; Milk; Beer; Water]) !inE.
rewrite !(canF_eq (@permKV _ _)).
rewrite f4 -h12 -{4}f5 (inj_eq (@perm_inj _ _)) h8 -h5 -{2}f1 (inj_eq (@perm_inj _ _)).
by rewrite !orbF => /eqP ->.
Qed.

Fact f7 : beverage Beer = o4.
Proof.
have : beverage^-1 o4 \in enum 'I_5 by rewrite mem_enum.
rewrite aux -[[:: o0; o1; o2; o3; o4]]/([:: Tea; Coffee; Milk; Beer; Water]) !inE.
rewrite !(canF_eq (@permKV _ _)).
rewrite f4 orbF /= f6 h8 /=.
case/orP=> [/eqP e|/eqP -> //].
move: h4; rewrite h5 -{}e => e.
by move: (valP (color White)); rewrite /= e.
Qed.

Fact f8 : beverage Coffee = o3.
Proof.
have : beverage^-1 o3 \in enum 'I_5 by rewrite mem_enum.
rewrite aux -[[:: o0; o1; o2; o3; o4]]/([:: Tea; Coffee; Milk; Beer; Water]) !inE.
by rewrite !(canF_eq (@permKV _ _)) f4 h8 f6 f7 !orbF /= => /eqP ->.
Qed.

Fact f9 : color White = o4.
Proof. by apply/val_inj=> /=; rewrite h4 h5 f8. Qed.

Fact f10 : color Red = o2.
Proof.
have : color^-1 o2 \in enum 'I_5 by rewrite mem_enum.
rewrite aux -[[:: o0; o1; o2; o3; o4]]/([:: Red; White; Green; Blue; Yellow]) !inE.
by rewrite !(canF_eq (@permKV _ _)) f2 h5 f8 f9 f1 !orbF => /eqP ->.
Qed.

Fact f11 : country Germany = o3.
Proof.
have : country Germany \in enum 'I_5 by rewrite mem_enum.
rewrite aux !inE -h9 (inj_eq (@perm_inj _ _)) /=.
rewrite -f6 -h3 (inj_eq (@perm_inj _ _)) /=.
rewrite -f10 -h1 (inj_eq (@perm_inj _ _)) /=.
by rewrite {2}h13 -f7 -h12 (inj_eq (@perm_inj _ _)) orbF => /eqP ->.
Qed.

Fact f12 : country Sweden = o4.
Proof.
have : country^-1 o4 \in enum 'I_5 by rewrite mem_enum.
rewrite aux -[[:: o0; o1; o2; o3; o4]]/([:: Britain; Sweden; Denmark; Germany; Norway]) !inE.
by rewrite !(canF_eq (@permKV _ _)) h1 f10 h3 f6 f11 h9 !orbF /= => /eqP ->.
Qed.

Fact f13 : cigar PallMall = o2.
have : cigar PallMall \in enum 'I_5 by rewrite mem_enum.
rewrite aux !inE -f2 h7 -f5 -f11 -f7 -h12 h13 !(inj_eq (@perm_inj _ _)) !orbF /=.
by move/eqP=> ->.
Qed.

Fact f14 : pet Cats = o0.
Proof.
apply/val_inj; move: h10; rewrite /next_to f5 /=.
case/orP=> [/eqP [<-]//|].
by rewrite (inj_eq val_inj (pet Cats) o2) -f13 h6 (inj_eq (@perm_inj _ _)).
Qed.

Fact f15 : pet Fish = o3.
Proof.
have : pet Fish \in enum 'I_5 by rewrite mem_enum.
rewrite aux !inE -f14 -f3 -f13 h6 -f12 h2 !(inj_eq (@perm_inj _ _)) orbF /=.
by move/eqP=> ->.
Qed.

End Puzzle.
