function [x,y,z] = sph2car( del,az, dep) 
ddel = del;
daz = az;
ddep = dep;

sfac=180.0/3.1415926;

d1=6371.0;
d3=d1-ddep;
d2=sqrt(d1*d1+d3*d3-2.0*d1*d3*cos(ddel/sfac));

z=0.5*(d1*d1+d2*d2-d3*d3)/d1;

dist=sqrt(d2*d2 -z*z);

x=dist*sin(daz/sfac);
y=dist*cos(daz/sfac);

return;
 