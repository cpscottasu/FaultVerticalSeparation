% this code fits lines to the hanging wall and footwall surfaces. The lines
% are then projected to the fault location. 


a=find(average_height(:,1)>fault_points(1)&average_height(:,1)<fault_points(2));
a1=find(average_height(:,1)>fault_points(4)&average_height(:,1)<fault_points(5));

if length(a)<2 |length(a1)<2
disp('Lines not long enough')
return
end
g=[ones(size(a)),average_height(a,1)];
m=inv(g'*g)*g'*average_height(a,2);
g_proj=[1 average_height(a(1),1); 1 fault_points(3)];
pts_proj1=g_proj*m;

plot( [average_height(a(1),1); fault_points(3)],pts_proj1,'-m','LineWidth',3)



g=[ones(size(a1)),average_height(a1,1)];
m=inv(g'*g)*g'*average_height(a1,2);
g_proj=[1 fault_points(3); 1  average_height(a1(end),1)];
pts_proj2=g_proj*m;

plot( [ fault_points(3) average_height(a1(end),1)],pts_proj2,'-c','LineWidth',3)
fault_VS=pts_proj2(1)-pts_proj1(2);
text(fault_points(3),pts_proj2(2)+5,num2str(round(fault_VS,2)))