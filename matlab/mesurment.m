function [xy,yz] = mesurment(imagePath,vertical)
    image = imread(imagePath);
    img = las_segm(image);
    load('Omni_Calib_Results_kurs.mat'); % Calib parameters
    ocam_model = calib_data.ocam_model; % Calib parameters
    if(vertical)
        X_dist = 800; % Laser Plane parameters
        CVsyst_x = 0; % CV System position
        CVsyst_y = 0; % CV System position
        [y1,z1] = mapping_vertical(img,X_dist,ocam_model); % mapping function
        % Finally figure:
        %figure;
       % scatter(y1,z1,5,'filled'); % Laser intersections
       % hold on;
       % plot(CVsyst_x,-CVsyst_y,'r*'); % CV System location
       % grid on;
        xy = max(y1) - min(y1);
        yz = max(z1) - min(z1);
    else
        x = 0; % Laser Plane parameters
        y = 0; % Laser Plane parameters
        las_dist = 1000; % Laser Plane parameters
        CVsyst_x = 0; % CV System position
        CVsyst_y = 0; % CV System position
        [x1,y1] = mapping(img,x,y,las_dist,ocam_model); % mapping function
        % Finally figure:
        %figure;
        %scatter(x1,y1,5,'filled'); % Laser intersections
        %hold on;
        %plot(CVsyst_x,-CVsyst_y,'r*'); % CV System location
        %grid on;
        xy = max(x1) - min(x1);
        yz = max(y1) - min(y1);
    end

end

