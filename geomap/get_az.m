function [az] = get_az( x,y)


dx= x;
dy= y;
sfac=180.0/3.1415926;

if(abs(dx)<1.0e-10)
    if(dy>0.0)
        az = 0.0;
        return;
    else
        az=180.0;
        return;
    end
end

if(dx>=0.0)
    az = 90.0-(sfac*atan(dy/dx));
    return;
else
    az = 270.0-(sfac*atan(dy/dx));
    return;
end