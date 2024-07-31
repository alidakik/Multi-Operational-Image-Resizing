function energyImage = energymap(image)

    grayImage = rgb2gray(image);
    [Gx, Gy] = imgradientxy(grayImage);
    energyImage = sqrt(Gx.^2 + Gy.^2);
    
    minValue = min(energyImage(:));
    maxValue = max(energyImage(:));
    
    energyImage = (energyImage - minValue) / (maxValue - minValue);
    
    
   
end