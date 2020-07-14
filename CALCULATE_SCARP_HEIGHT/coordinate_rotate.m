function [xrot,yrot] = coordinate_rotate(x,y,strike,coordinate_shift,to_utm)

if to_utm==0
xrot=x*cosd(strike)-y*sind(strike)-coordinate_shift(1);
yrot=x*sind(strike)+y*cosd(strike)-coordinate_shift(2);
end


if to_utm==1
x=x+coordinate_shift(1);y=y+coordinate_shift(2);
xrot=x*cosd(-strike)-y*sind(-strike);
yrot=x*sind(-strike)+y*cosd(-strike);
end

end

