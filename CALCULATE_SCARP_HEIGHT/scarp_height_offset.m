%prompt user for input about fault location; calculate the vertical
%separation. 

fault_6points=[];
plot_fault_before_pick
Prompt0='Do you want to pick any faults? (Yes=1/No=0)';
pick_any_faults = input(Prompt0);
if pick_any_faults==0
    return
end
Prompt1='Do you want to keep this measurement? (Yes=1/No=0)';
Prompt2='Do you want to make another measurement? (Yes=1/No=0)';
Prompt3='What is your quality ranking? (1-4)';
Prompt5='rupture or scarp? ruture=1, scarp=2, Do not know=3';
pick_another_fault=1;
fault_6points=[];
quality_fault=[];
rupture_scarp=[];

while pick_another_fault==1;
pick_fault=0;

while pick_fault==0
    
close all
plot_fault_before_pick
disp('pick 6 points')

pause
[xl,yl]=ginput(6);
fault_points=xl;
line_fitting %vertical separation 
[xl2,yl2]=ginput(1);
xl(3)=xl2;yl(3)=yl2;

fault_calcs %vertical separation after reselecting the ideal fault location. 
pick_fault = input(Prompt1);
end
fault_6points=[fault_6points;xl'];
qual=input(Prompt3);
quality_fault = [quality_fault;qual];
rupture_scarp_ind=input(Prompt5);
rupture_scarp=[rupture_scarp;rupture_scarp_ind];

pick_another_fault = input(Prompt2);
end


for j=1:6
plot([xl(j) xl(j)],ylim,'b')    
end


