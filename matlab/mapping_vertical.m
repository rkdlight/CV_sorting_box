function [y1,z1] = mapping_vertical(image,X_dist,ocam_model)
[height,width] = size(image);
a = 1;
y1=[];
z1=[];
t = [0;X_dist;0];
r = compose_rotation(0, 0, 0);
r = [r(:,1),r(:,3),t];
for i=1:height      % working image region
    for j=1:width
        if image(i,j)>0 
            m=[i;j];       % image pixels
            M = cam2world(m,ocam_model); % transform from image plane to the camera plane          
            a1 = M(1)*r(2,1)-M(2)*r(1,1);
            b1 = M(1)*r(2,2)-M(2)*r(1,2);
            c1 = M(1)*r(2,3)-M(2)*r(1,3);
            a2 = M(3)*r(1,1)-M(1)*r(3,1);
            b2 = M(3)*r(1,2)-M(1)*r(3,2);
            c2 = M(3)*r(1,3)-M(1)*r(3,3);

            Z = (a2*c1-a1*c2)/(a1*b2-a2*b1);
            Y = (-c1-b1*Z)/a1;
              
            z1(a)=Z;
            y1(a)=Y; 
            a=a+1;
        end
    end
end
end
