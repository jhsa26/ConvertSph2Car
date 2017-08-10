function [refstation,STA]=sph2car_and_set_refpoint(STA)
lat=STA.lat(:);
lon=STA.lon(:);
ele=STA.ele(:);

nsta=length(lat);
 
% cele=ele-sum(ele)/nsta;

wlat_ft=lat(1);
wlon_ft=lon(1);

sta_x=zeros(nsta,1);
sta_y=sta_x;
sta_z=sta_x;

for i = 1:nsta
    lat_ft=lat(i);
    lon_ft=lon(i);
    dep_ft=ele(i);
    [x,y,z]=sph2car_ft(lat_ft,lon_ft, dep_ft,wlat_ft,wlon_ft, 0.0);
    sta_x(i,1) =  real(x)*1000;
    sta_y(i,1) =  real(y)*1000 ;
    sta_z(i,1) =  real(z)*1000;
end
clat=sum(sta_x)/nsta;
clon=sum(sta_y)/nsta;

distance=(sta_x-clat).^2+(sta_y-clon).^2;
[~,refindex]=min(distance);
% refindex=9;
refstation = STA.name(refindex);

clear wlat_ft wlon_ft 
clear sta_x sta_y sta_z
wlat_ft=lat(refindex);
wlon_ft=lon(refindex);

sta_x=zeros(nsta,1);
sta_y=sta_x;
sta_z=sta_x;
for i = 1:nsta
    lat_ft=lat(i);
    lon_ft=lon(i);
    dep_ft=ele(i);
    [x,y,z]=sph2car_ft(lat_ft,lon_ft, dep_ft,wlat_ft,wlon_ft, 0.0);
    sta_x(i,1) =  real(x)*1000;
    sta_y(i,1) =  real(y)*1000 ;
    sta_z(i,1) =  real(z)*1000;
end
figure
plot(sta_x(:),sta_y(:),'^k','markersize',20)
hold on
plot(sta_x(refindex),sta_y(refindex),'^r','markersize',20)
hold off

STA.x=sta_x;
STA.y=sta_y;
STA.z=sta_z;
STA.truebaz= STA.baz(refindex);
STA.truedist= STA.dist(refindex);
disp(['Reference station is ' refstation])