function [Pi]=translation_concentric(ri,theta_range)% function extrussion 


    Pi=[ri*(1-cos(theta_range)); theta_range*0; ri*sin(theta_range); 1+theta_range*0];


end