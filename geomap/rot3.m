
function [newlat,newlon]=rot3(oldlat,oldlon, angle)

pi=3.141592653;

newlat=oldlat;

newlon=oldlon+angle;

if (newlon>2.0*pi)
    
    newlon = newlon - 2.0*pi;
    
elseif(newlon<-2.0*pi)
    
    newlon = newlon + 2.0*pi;
    
end

return;


