# ConvertSph2Car
Those codes are used to make transformation between  Cartesian coordinate system and  Spherical coordinate system . If you have  stations' longitudes and latitudes , and want to show them in Cartesian coordinate system, so you should choose a reference point or reference station before converting coordinate.

Note: function [xft,yft,zft]=sph2car_ft(lat_ft,lon_ft,dep_ft,wlat_ft,wlon_ft, theta_ft)
      theta_ft: rotation degree, the degree should multiply by pi/180. because
      we you cos function to compute the cosine value instead of cosd function
      negative theta_ft: clockwise rotation
      positive theta_ft: anticlockwise rotation.
