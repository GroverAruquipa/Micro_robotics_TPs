alpha = (120-5)*pi/180;
Re = 80;


eB=Re*[ cos(-2*pi/3+alpha), sin(-2*pi/3+alpha), 0
       cos(2*pi/3-alpha), sin(2*pi/3-alpha), 0;
       cos(alpha), sin(alpha), 0;
       cos(-2*pi/3-alpha), sin(-2*pi/3-alpha), 0;
       cos(2*pi/3+alpha), sin(2*pi/3+alpha), 0;
       cos(-alpha), sin(-alpha), 0;
      ]';

eB=[eB; ones(1,6)];
          
   