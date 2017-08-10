
function [lat,lon]=carsph( x1, x2,x3)

PI=3.141592653;

if(x3>1.0)
    x3=1.0;
end

if(x3<-1.0)
    x3=-1.0;
end

lat=asin(x3);

if(x1==0.0)
    if(x2>0.0)
        lon=PI/2.0 ;
    end
    if(x2<0.0)
        lon=3.0*PI/2.0;
    end
else
    lon=atan(x2/x1);
    
    if(x1<0.0)
        lon=lon+PI;
    end
    
    if(x1>0.0&&x2<0.0)
        lon=lon+2.0*PI;
    end
    
end