% coded by hujing
function [lat_ft,lon_ft,dep_ft]=car2sph_ft(x_ft, y_ft, z_ft,wlat_ft,wlon_ft,theta_ft)
wlat=wlat_ft;
wlon=wlon_ft;
x=x_ft;
y=y_ft;
z=z_ft;
theta=theta_ft;
% 	/* rotate first */
theta=-theta;
[	xr, yr]=rotate(x,y,theta);

[del,az,dep]=car2sph(xr,yr,z);
[lat,lon]=fpos(del,az,wlat, wlon);

lat_ft=lat;
lon_ft=lon;
dep_ft=dep;
return
