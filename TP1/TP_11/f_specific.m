function [ phi, curv, L ] = f_specific(T,R,Linit,E,ID,OD,k)
    
%R is the vector corresponding to tubes rotation
%T is the vector corresponding to tubes translation
%E is the elastic modulus of the tube
%ID is the vector of internal diameters of the tubes
%OD is the vector of outter diameters of the tubes
%k is the vector corresponding to the precurvatures of the tubes
%Linit initial position of each tube

    n=size(R);   
    for i=1:n
        I(i)=(pi/64)*(power(OD(i),4)-power(ID(i),4)); % The moment of inertia
    end
    
    %Curvature component of the first section
    kx(1)=(E*I(1)*k(1)*cos(R(1))+(E*I(2)*k(2)*cos(R(2))))/(E*I(1)+E*I(2));
    ky(1)=(E*I(1)*k(1)*sin(R(1))+(E*I(2)*k(2)*sin(R(2))))/(E*I(1)+E*I(2));

    %Curvature component of the Second section
    kx(2)=k(2)*cos(R(2));
    ky(2)=k(2)*sin(R(2));
    
    for i=1:n
        phi(i)=atan(kx(i)/ky(i));
        curv(i)=sqrt(power(kx(i),2)+power(ky(i),2));
        L(i)=Linit(i)+T(i);
    end
end

