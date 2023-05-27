clc
clear all

i = 0;

while i<1000
   % ждет когда появятся фото в папке
   v = exist('TestImages/cube_vertical.jpg', 'file');
   if v==2
       % производим измерения при горизонтальном лазере
       [x, y] = mesurment('TestImages/cube_horizontal.jpg', false);
       % производим измерения при вертикальном лазере
       [y1, z] = mesurment('TestImages/cube_vertical.jpg', true);
       % сохраняем результат (z уменьшен на 100мм из-за статической ошибки)
       result = {x; y; z-100}
       json = jsonencode(result);
       % сохраняем результат в json файл
       file = fopen('TestImages/result.json','w');
       fprintf(file, json);
       fclose(file);
       % удаляем использованные фото, чтобы не обработать их повторно
       delete('TestImages/cube_vertical.jpg');
       delete('TestImages/cube_horizontal.jpg');
   else
       % если нет фото ждем 1 секунду
       i=i+1;
       pause(1);
   end
end