clc
clear all
addpath('geomap/')
close all
temp=importdata('station_latlon.txt');
data=temp.data;
nsta=length(data);
lat=data(:,2);
lon=data(:,1);
ele=zeros(length(lat),1);
wlat_ft=sum(lat)/nsta;
wlon_ft=sum(lon)/nsta;

for i = 1:nsta
    lat_ft=lat(i);
    lon_ft=lon(i);
    dep_ft=ele(i);
    [x,y,z]=sph2car_ft(lat_ft,lon_ft, dep_ft,wlat_ft,wlon_ft, 0.0);
    sta_x(i,1) =  real(x);
    sta_y(i,1) =  real(y) ;
    sta_z(i,1) =  real(z);
end
plot(0,0,'r^','markersize',10)
hold on
plot(sta_x-min(sta_x),sta_y-min(sta_y),'^','markersize',10)
X=sta_x-min(sta_x);
Y=sta_y-min(sta_y);
save  tanyuyang.mat X Y 