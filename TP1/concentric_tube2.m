
dr=pi/200; %rotation angle 
R1=2.8e-3; %radius of the external tube 1
r1=2.5e-3; %radius of the internal tube 1
k1=-100; %60%10 %curvature of the tube 
phi_1=-150*dr; %angle of the tube
l1=0.03; %length of the tube

R2=2.1e-3; %radius of the external tube 2
r2=1.9e-3; %radius of the internal tube 2
k2=30; %curvature of the tube
phi_2=-50*dr; %Angle rotation of the tube  
l2=0.01; %Section length of the tube 2
%%% Eztra tube 3:

R3=1.6e-3;
r3=1.4e-3;
k3=60;
phi_3=50*dr;
l3=0.03;


%
figure(1)
% Add title with  convert string and rad to deg of phi_1, phi_2, phi_3, l1, l2, l3
% convert rad to deg with 180/pi
% convert number to string with num2str
% to string


%Axis 1
T1=transform(phi_1, k1, l1); % this function is used to calculate the transformation matrix
T=T1; %T is the transformation matrix
r11=1/k1; %radius of the tube
theta_1=k1*l1; %angle of the tube
theta_range=linspace(0,theta_1,20); %range of the angle
P1=translation_concentric(r11,theta_range); %P1=[r11*(1-cos(theta_range)); theta_range*0; r11*sin(theta_range); 1+theta_range*0];
Rz=[cos(phi_1) -sin(phi_1) 0 0; sin(phi_1) cos(phi_1) 0 0; 0 0 1 0; 0 0 0 1]; %Rotation matrix
traj=Rz*P1; %traj is the trajectory of the tube
traj1=traj(1:3,:); %traj1 is the trajectory of the tube in the x,y,z plane
c1=linspace(0, 2*pi, 20); %range of the angle
int1=r1*[cos(c1); sin(c1)]; %int1 is the internal tube
ext1=R1*[cos(c1); sin(c1)]; %ext1 is the external tube
[X,Y,Z]=extrude(int1,traj1); %this function is used to create the tube
surf(X,Y,Z); %axis equal; hold on;
[X1,Y1,Z1]=extrude(ext1,traj1);
surf(X1,Y1,Z1); %axis equal; hold on;
hold on
% Axis 2  
%%%%%%%%%%%%%%%%%%
theta2=k2*l2;
r22=1/k2;
theta_range2=linspace(0,theta2,20);
T2=transform(phi_2, k2, l2);
P2=translation_concentric(r22,theta_range2); %P2=[r22*(1-cos(theta_range2)); theta_range2*0; r22*sin(theta_range2); 1+theta_range2*0];
Rz2=[cos(phi_2) -sin(phi_2) 0 0; sin(phi_2) cos(phi_2) 0 0; 0 0 1 0; 0 0 0 1];

traj2=T1*Rz2*P2;
traj22=traj2(1:3,:);
c2=linspace(0, 2*pi, 20);
int2=r2*[cos(c2); sin(c2)];
ext2=R2*[cos(c2); sin(c2)];
[X2,Y2,Z2]=extrude(int2,traj22);
surf(X,Y,Z);% axis equal; hold on;
[X22,Y22,Z22]=extrude(ext2,traj22);
surf(X22,Y22,Z22);% axis equal; hold on;


%
T3=transform(phi_3, k3, l3);
theta_3=k3*l3;
r33=1/k3;
theta_range3=linspace(0,theta_3,20);
P3=translation_concentric(r33,theta_range3); %P2=[r22*(1-cos(theta_range2)); theta_range2*0; r22*sin(theta_range2); 1+theta_range2*0];

Rz3=[cos(phi_3) -sin(phi_3) 0 0; sin(phi_3) cos(phi_3) 0 0; 0 0 1 0; 0 0 0 1];

% move the tube 3 to the end of the tube 2
traj3=T1*T2*Rz3*P3;
%traj3=T1*Rz3*P3;
traj33=traj3(1:3, :)
c3=linspace(0, 2*pi , 20);

int3=r3*[cos(c3); sin(c3)];
ext3=R3*[cos(c3); sin(c3)];
[X3, Y3, Z3]= extrude(int3,traj33);
surf(X,Y,Z); axis equal; hold on;

[X33,Y33,Z33]=extrude(ext3,traj33);
surf(X33,Y33,Z33); axis equal; hold on;

title(['\phi_1 = ', num2str(phi_1*180/pi), ' deg, \phi_2 = ', num2str(phi_2*180/pi), ' deg, \phi_3 = ', num2str(phi_3*180/pi), ' deg, l_1 = ', num2str(l1), ' m, l_2 = ', num2str(l2), ' m, l_3 = ', num2str(l3), ' m'])
xlabel('x')
ylabel('y')
zlabel('z')

  grid off
  set(gcf,'color','w');



%%


%%




%% Simulation 

dr=pi/200; %rotation angle 
k1=-100; %60%10 %curvature of the tube 
phi_1=2*dr; %angle of the tube
k2=30; %curvature of the tube
phi_2=60*dr; %Angle rotation of the tube  
phi_vect=linspace(phi_2,phi_1,4);
k_vect=linspace(30,100,50);
writerObj = VideoWriter('tube.avi');
writerObj.FrameRate = 10;
open(writerObj);
count=1;
figure()
 % Create simulation 
 for i=1 : length(phi_vect)
    for j=1 : length(k_vect)
       cla
        k1=k_vect(j);
        phi_1=phi_vect(i);
        %Axis 1
        T1=transform(phi_1, k1, l1);
        T=T1;
        r11=1/k1;
        theta_1=k1*l1;
        theta_range=linspace(0,theta_1,20);
        P1=translation_concentric(r11,theta_range); %P1=[r11*(1-cos(theta_range)); theta_range*0; r11*sin(theta_range); 1+theta_range*0];
        Rz=[cos(phi_1) -sin(phi_1) 0 0; sin(phi_1) cos(phi_1) 0 0; 0 0 1 0; 0 0 0 1];
        traj=Rz*P1;
        traj1=traj(1:3,:);
        c1=linspace(0, 2*pi, 20);
        int1=r1*[cos(c1); sin(c1)];
        ext1=R1*[cos(c1); sin(c1)];
        [X,Y,Z]=extrude(int1,traj1);
        figure(1)
        axis  equal
        surf(X,Y,Z); %axis equal; hold on;
        [X1,Y1,Z1]=extrude(ext1,traj1);
        surf(X1,Y1,Z1); %axis equal; hold on;
        hold on
        % Axis 2  
        theta2=k2*l2;
        r22=1/k2;
        theta_range2=linspace(0,theta2,20);
        T2=transform(phi_2, k2, l2);
        P2=translation_concentric(r22,theta_range2); %P2=[r22*(1-cos(theta_range2)); theta_range2*0; r22*sin(theta_range2); 1+theta_range2*0];
        Rz2=[cos(phi_2) -sin(phi_2) 0 0; sin(phi_2) cos(phi_2) 0 0; 0 0 1 0; 0 0 0 1];
        traj2=T1*Rz2*P2;
        traj22=traj2(1:3,:);
        c2=linspace(0, 2*pi, 20);
        int2=r2*[cos(c2); sin(c2)];
        ext2=R2*[cos(c2); sin(c2)];
        [X2,Y2,Z2]=extrude(int2,traj22);
        surf(X,Y,Z);% axis equal; hold on;
        [X22,Y22,Z22]=extrude(ext2,traj22);
        surf(X22,Y22,Z22);% axis equal; hold on;
       %Axis 3
       
        T3=transform(phi_3, k3, l3);
        theta_3=k3*l3;
        r33=1/k3;
        theta_range3=linspace(0,theta_3,20);
        P3=translation_concentric(r33,theta_range3); %P2=[r22*(1-cos(theta_range2)); theta_range2*0; r22*sin(theta_range2); 1+theta_range2*0];

        Rz3=[cos(phi_3) -sin(phi_3) 0 0; sin(phi_3) cos(phi_3) 0 0; 0 0 1 0; 0 0 0 1];

        % move the tube 3 to the end of the tube 2
        traj3=T1*T2*Rz3*P3;
        %traj3=T1*Rz3*P3;
        traj33=traj3(1:3, :)
        c3=linspace(0, 2*pi , 20);

        int3=r3*[cos(c3); sin(c3)];
        ext3=R3*[cos(c3); sin(c3)];
        [X3, Y3, Z3]= extrude(int3,traj33);
        surf(X,Y,Z); axis equal; hold on;

        [X33,Y33,Z33]=extrude(ext3,traj33);
        surf(X33,Y33,Z33); axis equal; hold on;

       
       
       title(['\phi_1 = ', num2str(phi_1*180/pi), ' deg, \phi_2 = ', num2str(phi_2*180/pi), ' deg, \phi_3 = ', num2str(phi_3*180/pi), ' deg, l_1 = ', num2str(l1), ' m, l_2 = ', num2str(l2), ' m, l_3 = ', num2str(l3), ' m'])
        xlabel('x')
        ylabel('y')
        zlabel('z')

       
       
        grid off
        set(gcf,'color','w');

        pause(0.05);
        Fvideo(count) = getframe(gcf) ;
        frame = Fvideo(count) ; 
        writeVideo(writerObj, frame);
        count=count+1;
        %clf
    end
end
close(writerObj);


