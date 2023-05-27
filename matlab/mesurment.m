function [xy,yz] = mesurment(imagePath,vertical)
    % считываем изображение
    image = imread(imagePath);
    img = las_segm(image);
    load('Omni_Calib_Results_kurs.mat'); % Calib parameters
    ocam_model = calib_data.ocam_model; % Calib parameters
    % для вертикального и горизонального измерения разные функции
    if(vertical)
        
        X_dist = 800; % Laser Plane parameters
        CVsyst_x = 0; % CV System position
        CVsyst_y = 0; % CV System position
        [y1,z1] = mapping_vertical(img,X_dist,ocam_model); % mapping function
       
        xy = max(y1) - min(y1);
        yz = max(z1) - min(z1);
    else
        x = 0; % Laser Plane parameters
        y = 0; % Laser Plane parameters
        las_dist = 1100; % Laser Plane parameters
        CVsyst_x = 0; % CV System position
        CVsyst_y = 0; % CV System position
        [x1,y1] = mapping(img,x,y,las_dist,ocam_model); % mapping function
       
        xy = max(x1) - min(x1);
        yz = max(y1) - min(y1);
    end

end

