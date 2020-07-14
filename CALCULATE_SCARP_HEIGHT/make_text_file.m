% list=[min(y(:))+25:swath_spacing:max(y(:))-25];
% 

figure

scatter(x_UTM(1:1000:end),y_UTM(1:1000:end),5,z(1:1000:end),'filled');axis equal;hold on 
fileID = fopen([folder_to_save,'/transect_locations.txt'],'w');
for i=1:length(list)
t=list(i);  
xbox1=[min(x) max(x) ];ybox1=[t+swath_width/2 t+swath_width/2];
[x_points,y_points]=coordinate_rotate(xbox1,ybox1,strike,coordinate_shift,1);
fprintf(fileID,'%1.0f %8.0f %8.0f %8.0f %8.0f \n',[i x_points(1) y_points(1) x_points(2) y_points(2)]);

plot(x_points,y_points,'-r');hold on 
end
axis equal

fclose(fileID)