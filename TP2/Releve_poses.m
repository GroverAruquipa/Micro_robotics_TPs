clc
 % Extraction des valeurs de qi+Li
 file='Releve_mesures_hexapode.xls';
 sheet = 1;
 xlRange = 'H2:M41';
 x2Range = 'B2:G41';
 T=xlsread(file,sheet,x2Range);
 bTe=[];
 for ligne=1:size(T,1)
     bTe=cat(3,bTe,pose(T(ligne,4),T(ligne,5),T(ligne,6),T(ligne,1),T(ligne,2),144+T(ligne,3)));
 end
 
 
 Q=xlsread(file,sheet,xlRange);
 q1=Q(:,1);
 q2=Q(:,2);
 q3=Q(:,3);
 q4=Q(:,4);
 q5=Q(:,5);
 q6=Q(:,6);
 
 
 
 vars={'file','sheet','xlRange','vars'};
 clear(vars{:})