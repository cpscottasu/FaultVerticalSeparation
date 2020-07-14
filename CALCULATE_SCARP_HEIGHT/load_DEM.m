

x_UTM=[];y_UTM=[];height=[];
for j=1:length(dem_numbers)
dem_file=[dem_folder,base_name,num2str(dem_numbers(j)),'.tif'];
[DEM, REFMAT, BBOX] = geotiffread(dem_file);
gtiffinfo              = geotiffinfo(dem_file);
 
bb=gtiffinfo.BoundingBox;
pixel_size=gtiffinfo.RefMatrix;pixel_size=abs(pixel_size(2,1));

Z=flipud(double(DEM));
[xr,yr]=meshgrid([bb(1,1)+pixel_size/2:pixel_size:bb(2,1)-pixel_size/2],[+bb(1,2):pixel_size:bb(2,2)]);

a=find(Z(:)>0&Z(:)<9000);
x_UTM=[x_UTM;xr(a)]; y_UTM=[y_UTM;yr(a)]; height=[height;Z(a)];   
    
end
z=height;
clear DEM Z xr yr height
% figure
% scatter(x_UTM(1:1000:end),y_UTM(1:1000:end),5,Z(1:1000:end),'filled')


