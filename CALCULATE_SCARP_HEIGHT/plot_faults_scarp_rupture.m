xbox1=[min(x) max(x) max(x) min(x)];ybox1=[t t t+swath_width t+swath_width];

faults_x_hand_east=[];faults_y_hand_east=[];
for j=1:length(faults)
    if faults(j).dip=='E'
[xe,ye] = coordinate_rotate([faults(j).X],[faults(j).Y],strike,coordinate_shift,0);       
faults_x_hand_east=[faults_x_hand_east;xe'];
faults_y_hand_east=[faults_y_hand_east;ye'];
end
end

faults_x_hand_west=[];faults_y_hand_west=[];
for j=1:length(faults)
    if faults(j).dip=='W'
[xe,ye] = coordinate_rotate([faults(j).X],[faults(j).Y],strike,coordinate_shift,0);  
faults_x_hand_west=[faults_x_hand_west;xe'];
faults_y_hand_west=[faults_y_hand_west;ye'];
end
end


fault_east=[];
for j=1:length(faults)
    if faults(j).dip=='E'
[xe,ye] = coordinate_rotate([faults(j).X],[faults(j).Y],strike,coordinate_shift,0);  
c1=inpolygon(xe,ye,xbox1,ybox1);c1=find(c1==1);

if ~isempty(c1)

 f=find(ye>t-strike_window/2&ye<t+strike_window/2);
g=[ones(size(xe(f)')),xe(f)'];
m=inv(g'*g)*g'*ye(f)';strike_fault=90-atand(m(2));

if strike_fault>90&strike_fault<270
    strike_fault=mod(strike_fault+180,360);
end
fault_east=[fault_east;[mean(xe(c1)) strike_fault]];
 end
end
end

fault_west=[];
for j=1:length(faults)
    if faults(j).dip=='W'
[xe,ye] = coordinate_rotate([faults(j).X],[faults(j).Y],strike,coordinate_shift,0);  
c1=inpolygon(xe,ye,xbox1,ybox1);c1=find(c1==1);

if ~isempty(c1)
 f=find(ye>t-strike_window/2&ye<t+strike_window/2);
g=[ones(size(xe(f)')),xe(f)'];
m=inv(g'*g)*g'*ye(f)';strike_fault=90-atand(m(2));
if strike_fault>90&strike_fault<270
    strike_fault=mod(strike_fault+180,360);
end
fault_west=[fault_west;[mean(xe(c1)) strike_fault]];
 end
end
end


faults_all=[fault_east;fault_west];

figure
plot(faults_x_hand_east,faults_y_hand_east,'-r');hold on
plot(faults_x_hand_west,faults_y_hand_west,'-b');hold on