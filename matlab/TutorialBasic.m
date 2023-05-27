clc
clear all

i = 0;

while i<1000
   v = exist('TestImages/cube_vertical.jpg', 'file');
   if v==2
       [x, y] = mesurment('TestImages/cube_horizontal.jpg', false);
       [y1, z] = mesurment('TestImages/cube_vertical.jpg', true);
       x=round(x*100)/100
       y=round(y*100)/100
       z=round(z*100)/100
       result = {x; y; z-100};
       json = jsonencode(result);
       file = fopen('TestImages/result.json','w');
       fprintf(file, json);
       fclose(file);
       delete('TestImages/cube_vertical.jpg');
       delete('TestImages/cube_horizontal.jpg');
   else
       i=i+1;
       pause(1);
   end
end