function [ Jparam_i ] = Regresseur_indiv(qi, cTm, param_i) % function2
    Li=param_i(1); %m %Length of the leg 
    cAi=param_i(2:4); %Parameter 1 to optimize 
    mBi=param_i(5:7) ;% Parameter 2 to optimize

    cRm=cTm(1:3,1:3);
    cTm1=cTm(1:3,4);
    Li=40;
    J11=qi+Li;
    J22=-(cAi-cRm*mBi -cTm1)';
    J33=(cAi-cRm*mBi -cTm1)'*cRm;
    rest=(qi+Li)^2 - (norm(cAi -(cRm*mBi) - cTm1))^2;
    Jparam_i= rest*[J11 J22 J33];
    Jparam_i= [J11 J22 J33];




end