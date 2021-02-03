-------- MODULE TowerHanoi --------
EXTENDS Naturals, Sequences

CONSTANT Disks                 \* Set of disks in the problem
VARIABLE A, B, C

Ordered(s) ==          \* define ordering property for sequence s
    \A n \in 2..Len(s) \* for every element after the first
        : s[n-1]<s[n]  \* it is greater than its predecessor

TypeInv ==
    /\ A \in Seq(Disks) /\ Ordered(A)  \* A is some ordered sequence of Disks
    /\ B \in Seq(Disks) /\ Ordered(B)  \* B is some ordered sequence of Disks
    /\ C \in Seq(Disks) /\ Ordered(C)  \* C is some ordered sequence of Disks
--------
Init == 
    /\ A = [ n \in Disks |-> n] \* A has disks in order
    /\ B = << >>                \* B empty
    /\ C = << >>                \* C empty

Complete ==                     \* Puzzle is complete when
    \/ B = [ n \in Disks |-> n] \* B has disks in order, or
    \/ C = [ n \in Disks |-> n] \* C has disks in order
--------
MoveDisk(p,q) ==          \* Move a disk from the top of p to the top of q
    /\ p' = Tail(p)            \* p' is everything but the first disk
    /\ q' = << Head(p) >> \o q \* add the top disk on p to the pile on q

Move(p,q) == \* Move disk from one pole to another
    /\ p /= <<>>  \* From an occupied (not empty) pin
    /\ (
        \/  q = <<>>                       \* to empty pin
        \/  q /= <<>> /\ Head(p) < Head(q) \* to occupied pin
       )
    /\ MoveDisk(p,q)
--------
Next == 
        \/ Move(A,B) /\ UNCHANGED C
        \/ Move(A,C) /\ UNCHANGED B
        \/ Move(B,A) /\ UNCHANGED C
        \/ Move(B,C) /\ UNCHANGED A
        \/ Move(C,A) /\ UNCHANGED B
        \/ Move(C,B) /\ UNCHANGED A

================================

\* Modification History
\* Last modified Tue Feb 02 10:37:23 GMT 2021 by alunm
\* Last modified Tue Feb 02 10:00:35 GMT 2021 by alunm
\* Last modified Fri Oct 04 15:48:50 BST 2019 by cgam1
\* Last modified Fri Aug 02 09:09:00 BST 2019 by alun
\* Created Mon Jul 29 13:53:40 BST 2019 by alun
