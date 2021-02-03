---- MODULE MC ----
EXTENDS TowerHanoi, TLC

\* CONSTANT definitions @modelParameterConstants:0Disks
const_16123741244926000 == 
1 .. 8
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_16123741244927000 ==
\lnot Complete
----
=============================================================================
\* Modification History
\* Created Wed Feb 03 17:42:04 GMT 2021 by alunm
