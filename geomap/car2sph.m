function [del,az,dep]=car2sph(x, y,z) 
 
 
sfac=180.0/3.1415926;
dx=x;
dy=y;
dz=z;

[az]=get_az(x,y);

d1=6371.0;
d2=sqrt(dx*dx+dy*dy+dz*dz);
d3=sqrt(dx*dx+dy*dy+(dz-6371.0)*(dz-6371.0));

del=(sfac*acos((d2*d2-d1*d1-d3*d3)/(-2.0*d1*d3)));
dep=d1-d3;
 

