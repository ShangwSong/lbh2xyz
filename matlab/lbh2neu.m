% BLH --> NEU used in Gamit/GLOBK
function neu=lbh2neu(lbh,fm)
if nargin<2
    disp('You must input the units of BLH:\n');
    disp('0: decimal degree\n');
    disp('1: radian\n');
    return;
end
[m,n]=size(lbh);
if n~=3 && m==1, lbh=lbh'; end
if fm == 0
    lbh(1:2)=lbh(1:2)*pi/180;  % units: radian
end
if lbh(1) < 0
    lbh(1)=lbh(1)+2*pi;
end
a=6378137; % radius of WGS84 in meter
theta0=fix((pi/2-lbh(2))/0.00005+0.5)*0.00005;
r0=a*sin(theta0);
neu(1,1)=a*lbh(2);
neu(2,1)=r0*lbh(1);
neu(3,1)=lbh(3);
