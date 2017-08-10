function [newlat,newlon]=rot2(oldlat,oldlon, angle)
	[x1,x2,x3]=sphcar(oldlat,oldlon);
	temp = x1;
	x1 = x1 * cos(angle) + x3 * sin(angle);
	x3 = x3 * cos(angle) - temp * sin(angle);
	[newlat,newlon]=carsph(x1,x2,x3);
 
