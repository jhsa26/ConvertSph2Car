function [xr,yr]=rotate(x, y,theta)

xr=x*cos(theta)-y*sin(theta);
yr=x*sin(theta)+y*cos(theta);
