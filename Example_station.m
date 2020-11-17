clc
clear all
close all
addpath('geomap/');addpath('src/')
close all
wlat_ft=33.5528;
wlon_ft=-116.5833;
rota=43*pi/180;
xmin=-105;
xmax=160;
ymin=-55;
ymax=105;
if 1
    fid=fopen('station.dat');
    fid_car=fopen('station.car','w');
    while ~feof(fid)
        line=fgetl(fid);
        %    disp(line)
        temp=strsplit(strtrim(line));
        staname=temp{1};
        lat_ft=str2num(temp{2});
        lon_ft=str2num(temp{3});
        dep_ft=str2num(temp{4});
        id = str2num(temp{4});
        [x,y,z]=sph2car_ft(lat_ft,lon_ft, 0,wlat_ft,wlon_ft, rota);
%        if (x>=xmin && x<=xmax) && (y>=ymin && y<=ymax)
            fprintf(fid_car,'%s  %10.6f %10.6f %10.6f  %10.6f %10.6f\n',staname,lat_ft,lon_ft,x,y,dep_ft);
%        end
    end
    fclose(fid_car);
    return
end


% fault=load('new_fault.xy');
% inversion_grids = load('inversion_grid_section.dat');
% grids =  inversion_grids(2:end,:);
% [m,n]=size(grids);
% Y=ones(m,1);
% X=ones(m,1);
% Z=X;
% for  i =1:size(grids,1)
%     lat_ft=grids(i,1);
%     lon_ft=grids(i,2);
%     dep_ft =0.0;
%     [x,y,z]=sph2car_ft(lat_ft,lon_ft, dep_ft,wlat_ft,wlon_ft, rota);
%     X(i,1) =  real(x);
%     Y(i,1) =  real(y) ;
%     Z(i,1) =  real(z);
% end
% x=X;
% y=Y;
% hold on
% % for n = 1:numel(x); %// loop over vertical lines
% %     plot([round(x(n)) round(x(n))], [round(y(1)) round(y(end))],'-k'); %// change 'k-' to whatever you need
% % end
% % % for n = 1:numel(y); %// loop over horizontal lines
% % %     plot([round(x(1)) round(x(end))], [round(y(n)) round(y(n))],'-k'); %// change 'k-' to whatever you need
% % % end
% xlim([-100 100])
% ylim([-50 100])
% plot(x,y,'r.')
% hold on
% plot(fault(:,1),fault(:,2),'-k','linewidth',1.5)
%
%
