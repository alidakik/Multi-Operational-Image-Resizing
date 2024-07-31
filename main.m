 clear;clc;close all

img = imread("Samples dataset\Baby\Baby.png");

n = 150;

energyMap = energymap(img);

imageList = cell(1, n);
scoreList = cell(1, n);


[~,imageList{1}] = seam_curve(energyMap,img);
imageList{2} = scale(img);



flag = 0;

for i=3:n
    temp = imageList;
    for j=2:i-1

        energyMap = energymap(uint8(temp{j}));
        [~,sc_img] = seam_curve(energyMap,uint8(temp{j}));


        sl_img = scale(uint8(temp{j-1}));


        sc_score = bdw(img,sc_img);
        sl_score = bdw(img,sl_img);

        
        if sc_score<sl_score
            imageList{j} = uint8(sc_img);
            flag = 1;
        else
            imageList{j} = uint8(sl_img);
            flag = 2;
        end

    
        if i==n
            if flag == 1
                scoreList{j} = sc_score;
            else
                scoreList{j} = sl_score;
            end
        end
    
    end
    i
    energyMap = energymap(uint8(temp{1}));
    [~,imageList{1}] = seam_curve(energyMap,uint8(temp{1}));
    imageList{i} = scale(temp{i-1});
    
    if i==n
        scoreList{1} = bdw(img,imageList{1});
        scoreList{n} = bdw(img,imageList{n});
    end
    
end





best_image = imageList{1};
best_score = scoreList{1};

for i=2:n
    if best_score>scoreList{i}
        best_score = scoreList{i};
        best_image = imageList{i};
    end
end


imwrite(best_image, "Samples dataset\Baby\Baby_resized.png")

