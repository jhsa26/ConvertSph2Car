function  [p]=prem_p(dep_ft)



dep = dep_ft;
r=6371.0-dep;
x=r/6371.0;

if(r<1221.15)
    p = 11.2622-6.3640*x*x;
    return
elseif((r>=1221.5)&&(r<3480.0))
    p = 11.0487-4.0362*x+4.8023*x*x-13.5732*x*x*x;
    return;
elseif((r>=3480.0)&&(r<3630.1))
    p = 15.3891-5.3181*x+5.5242*x*x-2.5514*x*x*x;
    return;
elseif((r>=3630.1)&&(r<5600.1))
    p = 24.9520-40.4673*x+51.4832*x*x-26.6419*x*x*x;
    return
elseif((r>=5600.1)&&(r<5701.1))
    p = 29.2766-23.6027*x+5.5242*x*x-2.5514*x*x*x;
    return;
elseif((r>=5701.1)&&(r<5771.1))
    p = 19.0957-9.8672*x;
    return
elseif((r>=5771.1)&&(r<5971.1))
    p = 39.7027-32.6166*x;
    return;
elseif((r>=5971.1)&&(r<6151.1))
    p = 20.3926-12.2569*x;
    return;
elseif((r>=6151.1)&&(r<6346.7))
    p = 0.8317+7.218*x;
    return
elseif((r>=6346.7)&&(r<6356.1))
    p = 6.8;
    return;
elseif((r>=6356.1)&&(r<=6371.0))
    p=5.8;
    return ;
else
    p=-1.0;
    return;
end

