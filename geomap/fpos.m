function [lat,lon]=fpos(del,az,wlat,wlon)



f1=3.1415926/180.0;


[lt,ln]=locate(f1*wlat,f1*wlon,f1*del,f1*az);
lat=lt/f1;
lon=ln/f1;
end




function [newlat,newlon]=locate( oldlat, oldlon, angd, az)
PI=3.141592653;
[tlat1,tlon1]=rot2( PI / 2.-angd,PI-az, PI / 2.-oldlat);
[newlat,newlon]=rot3(tlat1,tlon1,oldlon);
end
