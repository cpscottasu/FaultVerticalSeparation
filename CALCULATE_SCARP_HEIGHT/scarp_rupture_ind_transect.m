
fault_6points=[fault_6points;transect_results(p).x_rot];
quality_fault=[quality_fault;transect_results(p).quality];
fault_1983=[fault_1983;transect_results(p).fault_1983];

make_fault_plot
[num_fault,junk]=size(fault_6points);


Prompt5='rupture or scarp? ruture=1, scarp=2, Do not know=3';


for b=1:num_fault
fault_points=[fault_6points(b,:)];

line_fitting
dip_calc

end


hold on 
plot([fault_6points(end,3),fault_6points(end,3)],ylim,'y--','LineWidth',3);hold on 

ruture_scarp_ind=input(Prompt5);
ruture_scarp=[ruture_scarp;ruture_scarp_ind];