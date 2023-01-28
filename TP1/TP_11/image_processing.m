clear;
close;
clc;
BW = imread('your_image.png'); %load the image to be processed
BWg = rgb2gray(BW);
imshow(BWg);

reference=30; %reference of the plate to scale the image, in our case 30mm
[p1,p2]=ginput(2); %get two point to do the scaling of the image from pixel to mm
n = norm([p1(2)-p1(1) p2(2)-p2(1)]); %get the norm vector of the two known reference point measured
scale=reference/n; % coeffecient of scaling (ratio of mm to pixel)
result1 = scale*([p1(2)-p1(1) p2(2)-p2(1)]) % mm to pixel refernce points display the output to verify the physical known reference point
[x,y]=ginput(20); %image processing to get the point along the curvature of 1 section
% scale the acquistion point to mm
x = x*scale;
y = -y*scale; %little trick multiply by minus
[xc,yc,R]=circfit(x,y); % call the circle fit function to get the x-cordinate,y-cordinate and radius of curvature
radius_of_curv = R % display the radius of curvature

figure(3);
hold on
plot(x,y,'+');
axis equal
theta=linspace(0,2*pi,100);
X=R*cos(theta)+xc;
Y=R*sin(theta)+yc;
plot(X,Y);
Curvature = 1/(R*0.001) 








