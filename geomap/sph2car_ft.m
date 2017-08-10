%coded by hujing
function [x_ft,y_ft,z_ft]=sph2car_ft(lat_ft,lon_ft,dep_ft,wlat_ft,wlon_ft, theta_ft)

wlat=wlat_ft;
wlon=wlon_ft;
dep=dep_ft;
lat=lat_ft;
lon=lon_ft;
theta=theta_ft;

[dat]=mygrt(wlat, wlon, lat, lon);

 
del=dat.del;
az=dat.az;

[x,y,z]=sph2car(del, az, dep);

% 	/* rotate */
[xr,yr]=rotate(x,y,theta);
x_ft=xr;
y_ft=yr;
z_ft=z;
	 

 
