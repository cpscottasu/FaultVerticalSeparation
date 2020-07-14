
close all
%take derivative of topo 
average_height_med=(average_height(1:end-1,2)+average_height(2:end,2))/2;
dtopo=-average_height_med(1:end-1)+average_height_med(2:end);
x_dtopo=(average_height(1:end-2,1)+average_height(3:end,1))/2;



figure
plot(average_height(:,1),average_height(:,2),'-k','LineWidth',2);axis equal;hold on
plot(x_dtopo,(dtopo*nanstd(average_height(:,2)))+nanmean(average_height(:,2)),'-b');hold on 
plot(average_height(:,1),average_height(:,2),'-k','LineWidth',2);axis equal;hold on 

[fault_east_len,junk]=size(fault_east);
for j=1:fault_east_len
plot( (fault_east(j,1))*[1 1],ylim,'-b')
end
[fault_west_len,junk]=size(fault_west);
for j=1:fault_west_len
plot( (fault_west(j,1))*[1 1],ylim,'-r')
end

title(['transect # ',num2str(i)])
legend('Topographic profile','First derivative of topography')



