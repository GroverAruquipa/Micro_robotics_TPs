
%% Calculate f_Especific in matlab

k1=14.4;
k2=11.02;
Linit1=0.1;
Linit2=0.2;

T1=0.02;
T2=0.025;

R1=pi/2;
R2=pi/2;
R=[R1;R2];

OD1=1.07e-3;
OD2=0.65e-3;

ID1=0.77e-3;
ID2=0.42e-3;
E= 80*10^9;

Linit=[Linit1 ; Linit2];
T=[T1; T2];
ID=[ID1 ; ID2];
OD=[OD1; OD2];
k=[k1; k2];


[phi, curv, L]=f_specific(T,R, Linit, E, ID, OD,k)



%%

