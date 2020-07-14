%apparent_dip
abs_height=abs(average_height(:,1)-fault_points(3));
df=find(abs_height==min(abs_height));
x_dip=average_height(df-1:df+1,1);y_dip=average_height(df-1:df+1,2);
g_dip=[ones(size(x_dip))  x_dip];
m=inv(g_dip'*g_dip)*g_dip'*y_dip;
dip_apparent=atand(m(2));

%true dip 
if isempty(faults_all)
  true_dip=NaN;  
else
fa=abs(faults_all(:,1)-fault_points(6));
fa=find(fa==min(fa));
true_dip=atand(tand(dip_apparent)/cosd(faults_all(fa,2)));
end




