function reducedImg=scale(img)
    
    h = size(img,1);
    w = size(img,2);

    reducedImg = imresize(img, [h,w-1], 'bicubic');


end