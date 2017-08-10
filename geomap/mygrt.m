function [info]=mygrt( elt, eln, slt, sln)

PI=3.141592653;
% /*Go to radians*/
slat=slt*PI/180.0; slon=sln*PI/180.0;
elat=elt*PI/180.0; elon=eln*PI/180.0;

% /*Correct for ellipticity*/
slat=atan(.996647*tan(slat)); elat=atan(.996647*tan(elat));

% /*Got to colatitudes*/
slat=PI/2.0-slat; elat=PI/2.0-elat;

% /*Make all longitudes postive*/
if(slon<0.0)
    slon=slon+2.0*PI; end
if(elon<0.0)
    elon=elon+2.0*PI; end

% /*compute direction cosines*/
a=sin(elat)*cos(elon); b=sin(elat)*sin(elon); c=cos(elat);
a1=sin(slat)*cos(slon); b1=sin(slat)*sin(slon); c1=cos(slat);

cd=a*a1+b*b1+c*c1;
% /*Make sure acos won't barf*/
if(cd>1.0)
    cd=1.0; end
if(cd<-1.0)
    cd=-1.0; end

info.del=acos(cd)*180.0/PI;
info.dist=info.del*PI*6371.0/180.0;

tmp1=cos(elon)*cos(slon)+sin(elon)*sin(slon);
tmp2a=1.0-cd*cd;
if(tmp2a<=0.0)
    tmp2=0.0;
    tmp3=1.0;
else
    tmp2=sqrt(tmp2a);
    tmp3=(sin(elat)*cos(slat)-cos(elat)*sin(slat)*tmp1)/tmp2;
end
% /*Make sure acos won't barf*/
if(tmp3>1.0)
    tmp3=1.0; end
if(tmp3<-1.0) 
    tmp3=-1.0;
end
z=acos(tmp3);

% /*This test gets correct orientation for az. */
if((sin(slon)*cos(elon)-cos(slon)*sin(elon))<0.0)
    z=2.0*PI-z;
end


info.az=180.0*z/PI;

tmp1=cos(slon)*cos(elon)+sin(slon)*sin(elon);
tmp2a=1.0-cd*cd;
if(tmp2a<=0.0)
    tmp2=0.0;
    tmp3=1.0;
else
    tmp2=sqrt(tmp2a);
    tmp3=(sin(slat)*cos(elat)-cos(slat)*sin(elat)*tmp1)/tmp2;
% /*            tmp3=(sin(elat)*cos(slat)-cos(elat)*sin(slat)*tmp1)/tmp2;*/
end
% /*Make sure acos won't barf*/
if(tmp3>1.0)
    tmp3=1.0; end
if(tmp3<-1.0)
    tmp3=-1.0; end
bz=acos(tmp3);
% /*This test gets correct orientation for baz. */
if((sin(elon)*cos(slon)-cos(elon)*sin(slon))<0.0)
    bz=2.0*PI-bz;
    
end

info.baz=180.0*bz/PI;

return;

