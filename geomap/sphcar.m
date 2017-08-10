function  [x1,x2,x3]=sphcar(lat,lon)

x1=cos(lat)*cos(lon);
x2=cos(lat)*sin(lon);
x3=sin(lat);
