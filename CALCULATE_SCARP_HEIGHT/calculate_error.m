
transect_line=load([top_directory,datafolders{k},'\transect_',num2str(i),'.xyz']);

[xtran,ytran] = coordinate_rotate(transect_line(:,1),transect_line(:,2), transect_results(1).strike_major_fault,transect_results(1).coordinate_shift,0);


count_for_error=1;
for p=1:length(transect_results)
    
  if transect_results(p).ruture_scarp==ruture_scarp_test;
      
      
pts=transect_results(p).x_rot; 
c1=find(xtran>pts(1)&xtran<=pts(2));
g=[ones(size(c1)) xtran(c1)-pts(3)];

dfault=fault_height(count_for_error,3)*.25;
ginv=inv(g'*g)*g';
m=ginv*transect_line(c1,3);
err=std(g*m-transect_line(c1,3));
cov=err^2*inv(g'*g);
dm1=sqrt(cov(2,2));db1=sqrt(cov(1,1));
dh1=sqrt((m(2)*dfault)^2+db1^2);

c1=find(xtran>pts(4)&xtran<=pts(5));
g=[ones(size(c1)) xtran(c1)-pts(3)];
ginv=inv(g'*g)*g';
m=ginv*transect_line(c1,3);
err=std(g*m-transect_line(c1,3));
cov=err*inv(g'*g);

dm2=cov(2,2);db2=cov(1,1);
dh2=sqrt((m(2)*dfault)^2+db2^2);


dh=sqrt(dh2^2+dh1^2);
error_tran=[error_tran;dh];
count_for_error=count_for_error+1;
  end

end