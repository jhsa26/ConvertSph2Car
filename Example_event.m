clc
close all
clear
addpath('geomap/');addpath('src/')
close all
wlat_ft=-4.596197;   % orig
wlon_ft=-105.9481; % orig,  0 km depth  fixed in there
rota=12*pi/180;
%1  -4.596197 -105.9481  0  1  12
%xmin=-105;
%xmax=160;
%ymin=-55;
%ymax=105;
count=0;
if 1
    fid=fopen('EventCatlog');
    fid_car=fopen('event.car','w');
    while ~feof(fid)
        count=count+1
        line=fgetl(fid);
        %    disp(line)
        temp=strsplit(strtrim(line));
%         staname=temp{15};
        lat_ft=str2num(temp{3});
        lon_ft=str2num(temp{4});
        dep_ft=str2num(temp{5});
        mag=temp{6};
        evid = temp{10};
        [x,y,z]=sph2car_ft(lat_ft,lon_ft, 0,wlat_ft,wlon_ft, rota);
%        if (x>=xmin && x<=xmax) && (y>=ymin && y<=ymax)
            fprintf(fid_car,'%s  %10.6f %10.6f %10.6f  %10.6f %10.6f %s\n',evid,lat_ft,lon_ft,dep_ft,x,y,mag);
%        end
    end
    fclose(fid_car);
    return
end
%%
evpos=load('event.car');
plot(evpos(:,5),evpos(:,6),'.')

