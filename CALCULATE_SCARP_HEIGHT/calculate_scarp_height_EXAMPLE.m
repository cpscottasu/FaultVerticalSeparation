clear all;close all


%info to load DEM
dem_folder='..\DEM\';%This is the path where the clipped DEMs were saved (see paragraph 3.1 of the guide provided);
%dem folder ends with \
base_name='DEM';%This is the prefix for each of the raster datasets created without the number that has been appended to each prefix by ArcMap;
dem_numbers=[0:1];%This indicate the numbers that have been appended to each prefix [from:to]

first_transect_number=1;%This indicate the number of the first topographic profile
faults=shaperead('../FAULTS\faults_test.shp');%This indicate the shapefile’s path (see paragraph 3.2 of the guide provided)
folder_to_save='../FOLDER_TO_SAVE';%indicate the path where to save the measurements

strike=350;%strike of major faults. Transects perpendicular to this. 
swath_spacing=50;%Indicate here (in meters) the topographic profiles spacing
swath_width=2;%indicate (in meters) the width (perpendicular to the transect) of the of the topographic profile. %We recommend ~2/5 m.
strike_window=swath_spacing;

%CHANGE ABOVE 

load_DEM %load DEM 

%below, this rotate to be parallel to the major fault system. Translate to
%have (0m,0m) near DEM. 
coordinate_shift=[0 0];
[xt,yt] = coordinate_rotate(x_UTM,y_UTM,strike,coordinate_shift,0);
coordinate_shift=[min(xt) min(yt)];
[x,y] = coordinate_rotate(x_UTM,y_UTM,strike,coordinate_shift,0);
clear xt yt


figure
scatter(x(1:1000:end)/1e3,y(1:1000:end)/1e3,5,z(1:1000:end),'filled')
axis equal
xlabel('rotated x (km)');ylabel('rotated y (km)');title('elevation (m)')


list=[min(y(:))+25:swath_spacing:max(y(:))-25];
make_text_file%This create and save a text file (.txt) in the output folder. The text file reports the number and the x and y coordinate values of the start-points and end-points of the topographic profiles.

for i=1:1:length(list)%Indicate the number of the topographic profile from which you want to start measuring and the measurement step (all the profiles or 1 every 2 etc.)
%i=

close all
disp(['Transect #', num2str(i)])
  
t=list(i);  
xbox1=[min(x) max(x) max(x) min(x)];ybox1=[t t t+swath_width t+swath_width];
c=inpolygon(x,y,xbox1,ybox1);c=find(c==1);
close all
zc=z(c);
xc=x(c);   
  
transect_base_map %This show the DEM with created topographic profiles on it

close all

scarp_height_offset %prompt user for input about fault location; calculate the vertical separation. 
scarp_height_save %Once a profile is complete, MATLAB saves the xyz position of each clicked point, the FW- and HW-linear projections, the vertical separation, the measure-quality ranking, and the type of object measured (coseismic displacement or long-term scarp) as a .mat file. 
                  %The MATLAB interface also saves the graphical output as PDF files (or any format preferred by the user such as .jpeg, or .eps).


close all


end