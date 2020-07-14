make_fault_plot
[num_fault,junk]=size(fault_6points);

fault_points=xl;

line_fitting
dip_calc

for b=1:num_fault
fault_points=[fault_6points(b,:)];

line_fitting
dip_calc

end

