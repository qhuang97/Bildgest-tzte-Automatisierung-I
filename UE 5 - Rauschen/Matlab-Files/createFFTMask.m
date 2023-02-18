function [FFTMask] = createFFTMask(imageSizeX, imageSizeY, radius, pass)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[columnsInImage, rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
% Create the circle in the image.
centerX = imageSizeX/2;
centerY = imageSizeY/2;

FFTHighpassMask = (rowsInImage - centerY).^2 ...
    + (columnsInImage - centerX).^2 <= radius.^2;
if pass == "highpass"
    FFTMask=1.-FFTHighpassMask;
else
    FFTMask=FFTHighpassMask;
end    
end

