
clc
clear 
close all
% code by Jing Hu at ustc 
% date 2020-11-17
addpath('geomap/');addpath('src/')
%% build origin
wlat_ft=33.5528;
wlon_ft=-116.5833;
rota=43*pi/180;
xmin=-105;
xmax=160;
ymin=-55;
ymax=105;
spheroid=referenceEllipsoid('wgs84');
%% load geographic position lon,lat,elevation
fid=fopen('station.dat');
while ~feof(fid)
    line=fgetl(fid);
    temp=strsplit(strtrim(line));
    staname=temp{1};
    lat_ft=str2num(temp{2});
    lon_ft=str2num(temp{3});
    dep_ft=str2num(temp{4});
    id = str2num(temp{4});
    %% convert (lon,lat,elevation) to (x,y,z)
    [xNorth,yEast,z1]=geodetic2ned(lat_ft,lon_ft,0,wlat_ft,wlon_ft,0,spheroid); % unit m
    [x,y,z]=sph2car_ft(lat_ft,lon_ft, 0,wlat_ft,wlon_ft, rota); % unit km
    tmp=[cos(-rota),-sin(-rota);sin(-rota),cos(-rota)]*[xNorth,yEast]'/1000; % rotation matrix
    disp([x,y,tmp(2),tmp(1)])
    plot(x,y,'r*')
    hold on
    plot(tmp(2),tmp(1),'^k')
end
fclose(fid);
%% some useful links for coordinate transformation
% https://whu-cveo.com.io/archives
% https://blog.csdn.net/sinat_28797501/article/details/75635439
% https://www.osgeo.cn/pygis/proj-pyproj.html # for python
% https://blog.csdn.net/hqs_09/article/details/100624829
