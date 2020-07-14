# FaultVerticalSeparation

Supplementary information for:
A surface faulting database of the Idaho Lost River Fault from a systematic-high-quality topographic analysis

Simone Bello1-2, Chelsea P. Scott3, Federica Ferrarini1-2, Francesco Brozzetti1-2, Tyler Scott3, Daniele Cirillo1-2, Rita De Nardis1-2, J Ramon Arrowsmith3, Giusy Lavecchia1-2

1DiSPUTer- Department of Psychological, Humanistic and Territorial Sciences, University G. d’Annunzio Chieti-Pescara, Italy.
2CRUST- InterUniversity Center for 3D Seismotectonics with territorial applications, Italy
3School of Earth and Space Exploration – Arizona State University

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

In the folder you just downloaded there is everything you need to perform a test and start using this tool.
If you want to view the sample data before using the tool, upload the contents of the "DEM" folder and the "FAULTS" folder to ArcMap.
The shapefile has in the attributes table the characteristics useful for categorizing the faults in E-dip and W-dip and the type of trace.

Use the DEM in ArcMap to create a hillshade map.

Let's start using the tool:

1) In the folder "CODE", run "calculate_scarp_height_EXAMPLE.m"
In the main script everything is already set up with the correct paths; if an error appears, proceed as follows:

2) In "dem_folder=' \' " paste the path of the the folder "DEM"
3) In "base_name= '' " paste "DEM"
4) In "dem_numbers=[] " paste "0:1"

5) In "first_transect_number=;" paste "1" 
6) In "faults=shaperead('');" paste the path of the the folder "FAULTS" and add the name of the shapefile "\fault_test.shp"
7) In "folder_to_save='';"  paste the path of the the folder "FOLDER_TO_SAVE"

8) In "strike=;" paste "350"
9) In "swath_spacing=;" paste "50"
10) In "swath_width=;" paste 2
11) In "strike_window=;" paste "swath_spacing"

12) Run "load_DEM"
13) Run coordinate_shift=[0 0];
	[xt,yt] = coordinate_rotate(x_UTM,y_UTM,strike,coordinate_shift,0);
	coordinate_shift=[min(xt) min(yt)];
	[x,y] = coordinate_rotate(x_UTM,y_UTM,strike,coordinate_shift,0);
	clear xt yt

14) Run figure
	scatter(x(1:1000:end)/1e3,y(1:1000:end)/1e3,5,z(1:1000:end),'filled')
	axis equal
	xlabel('rotated x (km)');ylabel('rotated y (km)');title('elevation (m)')

15) Run list=[min(y(:))+25:swath_spacing:max(y(:))-25];
	make_text_file

16)Go to the folder "CODE" and open "FOLDER_TO_SAVE"
17) Open the file "transect_location.txt" in a Microsoft Excel spreadsheets (XLS) and order the data in columns using the "TEXT.TO.COLUMNS" function with a ‘space’ column separator.
18) To generate the traces of the topographic profiles, you can use an ArcMap (ESRI ArcGIS®) tool called “XY To Line”; the procedure is as follows:
	In "Data Management" choose the "XY To Line" tool.
	In the window that opens, drag the "transect_location.txt" file to the "Input Table";
	In "Output Feature Class" indicate the path and name for the saved file.
	In the following four fields, indicate the column position for the latitude and longitude coordinates.
	In "Line Type" leave the default.
	In “ID” choose the field where the number assigned to the profiles is positioned in the .txt (first column);
	In "Spatial Reference" indicate the same Coordinate System of the DEMs.
	Click "OK".
	Upload the newly created shapefile into ArcMap (ESRI ArcGIS®)

19) Comment the first part of the script up to "make_text_file"
20) RUN 
21) A graphical interface has opened; 

22) In the Command Window: press 1 to make a measurement, press 2 to move to the next profile
23) A If you pressed 1 will begin the following:
	The graphic interface shows vertical lines indicating the fault traces position along the topographic profile;
	Pick two points on the hanging wall of the trace;
	Pick two points on the footwall of the trace;
	Pick a fifth point to the vertical line corresponding to the fault intersection with the profile. This is used to associate the measurement with the fault ID;
	Pick a sixth point at the fault position, considering scarp degradation and slope deposit accumulation;
	The graphical interface closes after the sixth click and reopens showing the footwall and the hangingwall best-fit lines, and the vertical displacement (in centimetres);
	Confirm the position of the fault with a seventh click after seeing the projected lines
	Decide to keep the measurement or delete it and start again.
	If you keep the measurement, the following parameters are saved.
	Type of object (coseismic displacement (1) or long-term scarp (2));
	Quality ranking (1 to 4);
	The user can make another measurement by answering ‘yes’ to "Do you want to pick another fault?" or move to the next profile
24) Make sure the measurements and figures have been saved in the folder "FOLDER_TO_SAVE"

In order to allow users to compare the first acquired measurements, we acquired the vertical separations of the first three topographic profiles; along these, from west to east, the vertical separations are:

topographic profile 1: ~0.45 m; ~0.20 m
topographic profile 2: ~1.20 m; ~0.3 m; ~0.3 m
topographic profile 3: ~0.65 m

Measurements may vary slightly based on the points chosen for the fault position, and the points chosen for the projection of the lines at the footwall and at the hanging wall.
The outputs of our measurements are saved in the folder "MEASURES_EXAMPLE".



