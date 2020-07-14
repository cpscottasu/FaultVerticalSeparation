%save matlab structure with the results; Save graphics with output of the
%mapped faults and vertical separation. 

[num_fault,junk]=size(fault_6points);
transect_results=[];
for b=1:num_fault
   fault_points= fault_6points(b,:);
   line_fitting
   dip_calc 
   
   start_x=find(min(xc)==xc); start_x= start_x(1);[startx,starty]=coordinate_rotate(xc(start_x),t,strike,coordinate_shift,1);
   end_x=find(max(xc)==xc);[endx,endy]=coordinate_rotate(xc(end_x),t,strike,coordinate_shift,1);
   [fault_points_x,fault_points_y]=coordinate_rotate(fault_points,t*ones(size(fault_points)),strike,coordinate_shift,1);
   
   transect_results(b).number=i;
   transect_results(b).strike_major_fault=strike;
   transect_results(b).coordinate_shift=coordinate_shift;
   transect_results(b).start=[startx,starty]';
   transect_results(b).end=[endx,endy]';
   transect_results(b).rupture_dist=fault_points(3);
   transect_results(b).x=fault_points_x;
   transect_results(b).y=fault_points_y;
   transect_results(b).x_rot=fault_points;
   transect_results(b).VS=fault_VS;
   if isempty(faults_all)
        transect_results(b).rupture_oblique=NaN;
   else
        transect_results(b).rupture_oblique=faults_all(fa,2);
   end
   transect_results(b).true_dip=true_dip;
   transect_results(b).apparent_dip=dip_apparent;
   transect_results(b).quality=quality_fault(b);
   transect_results(b).rupture_scarp=rupture_scarp(b);
end



save([folder_to_save,'\transect_',num2str(i+first_transect_number-1),'.mat'],'transect_results')

saveas(gcf,[folder_to_save,'\transect_',num2str(i+first_transect_number-1)],'epsc')
saveas(gcf,[folder_to_save,'\transect_',num2str(i+first_transect_number-1)],'jpg')
saveas(gcf,[folder_to_save,'\transect_',num2str(i+first_transect_number-1)],'fig')

[transect_points_x_utm,transect_points_y_utm]=coordinate_rotate(average_height(:,1),t*ones(size(average_height(:,1))),strike,coordinate_shift,1);

fileID = fopen([folder_to_save,'/transect_',num2str(i+first_transect_number-1),'.xyz'],'w');
for b=1:length(transect_points_x_utm)
fprintf(fileID,'%8.2f %8.2f %6.3f\n',[transect_points_x_utm(b) transect_points_y_utm(b),average_height(b,2)]);
end
fclose(fileID)

