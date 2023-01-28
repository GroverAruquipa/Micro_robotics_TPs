function [ ecarti ] = MGI_indiv(qi, cTm, param_i) %% Function to calculate the cost function for each leg

    Li=param_i(1); %m %Length of the leg 
    cAi=param_i(2:4); %Parameter 1 to optimize 
    mBi=param_i(5:7); % Parameter 2 to optimize

    cRm=cTm(1:3,1:3);
    cTm1=cTm(1:3,4);
    %ecarti=(qi+Li)^2-norm(cAi-cRm*mBi -cTm1)^2; % ecarti is the cost funmction
    ecarti=(qi+Li)^2-norm(cAi-(cRm*mBi) -cTm1)^2; % ecarti is the cost funmction

end