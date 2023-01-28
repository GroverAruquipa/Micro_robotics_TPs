function [T1]=transform(phi, k, l)% function extrussion 

    T1=[cos(phi)*cos(k*l), -sin(phi), cos(phi)*sin(k*l), (cos(phi)*(1-cos(k*l)))/k ; sin(phi)*cos(k*l), cos(phi), sin(phi)*sin(k*l), (sin(phi)*(1-cos(k*l)))/k; 
-sin(k*l), 0, cos(k*l), sin(k*l)/k; 0 0 0 1];


end