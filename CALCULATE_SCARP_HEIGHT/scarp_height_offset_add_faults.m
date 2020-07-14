
plot_fault_before_pick
Prompt0='Do you want to pick any faults? (Yes=1/No=0)';
pick_any_faults = input(Prompt0);
if pick_any_faults==0
    return
end
Prompt1='Do you want to keep this measurement? (Yes=1/No=0)';
Prompt2='Do you want to make another measurement? (Yes=1/No=0)';
Prompt3='What is your quality ranking? (1-4)';
Prompt4='1983? yes=1, probably=2, not for sure=3, 4 = DONT KNOW';
Prompt5='rupture or scarp? ruture=1, scarp=2, Do not know=3';
pick_another_fault=1;

%hui
while pick_another_fault==1;
pick_fault=0;

while pick_fault==0
    
    close all
plot_fault_before_pick
disp('pick 6 points')
% close all
% make_fault_plot
pause
[xl,yl]=ginput(6);
fault_points=xl;
line_fitting
[xl2,yl2]=ginput(1);
xl(3)=xl2;yl(3)=yl2;

fault_calcs
pick_fault = input(Prompt1);
end
fault_6points=[fault_6points;xl'];
qual=input(Prompt3);
quality_fault = [quality_fault;qual];
single_1983=input(Prompt4);
fault_1983=[fault_1983;single_1983];
ruture_scarp_ind=input(Prompt5);
ruture_scarp=[ruture_scarp;ruture_scarp_ind];

pick_another_fault = input(Prompt2);
end


for j=1:6
plot([xl(j) xl(j)],ylim,'b')    
end


