function bTe=pose(Rx_deg,Ry_deg,Rz_deg,Tx,Ty,Tz)

Rx=Rx_deg*pi/180;
Ry=Rx_deg*pi/180;
Rz=Rx_deg*pi/180;
Rotx =[1 0 0 0; 0 cos(Rx) -sin(Rx) 0; 0 sin(Rx) cos(Rx) 0; 0 0 0 1];
Roty =[cos(Ry) 0 sin(Ry) 0; 0 1 0 0; -sin(Ry) 0 cos(Ry) 0; 0 0 0 1];
Rotz =[cos(Rz) -sin(Rz) 0 0; sin(Rz) cos(Rz) 0 0; 0 0 1 0; 0 0 0 1];
Trans=[1 0 0 Tx;0 1 0 Ty;0 0 1 Tz;0 0 0 1];
bTe=Trans*Rotz*Roty*Rotx;