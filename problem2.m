clear all;
close all;
clc;

I0 = imread('1.jpg');

I=rgb2gray(I0);

% Input values for manual (r1, s1) and (r2, s2)
r1 = input('Enter r1: ');
s1 = input('Enter s1: ');
r2 = input('Enter r2: ');
s2 = input('Enter s2: ');

% Slopes for s function outputs
m1 = s1/r1; %subtract by zero, so nothing
m2 = (s2-s1)/(r2-r1);
m3 = (255-s2)/(255-r2);
 
%  intercepts
b1 = 0;
b2 = s2 - (r2*m2);
b3 = s2 - (r2*m3);

[row, col]=size(I);

for i=1:row
    for j=1:col
        if (I(i,j) >= 0 || I(i,j) < r1)
            I(i,j) = floor(m1*I(i,j)+b1);
        elseif (I(i,j) >= r1 || I(i,j) <= r2)
            I(i,j) = floor(m2*I(i,j)+b2);
        else
            I(i,j) = floor(m3*I(i,j) + b3);
        end
    end
end

imwrite(I, 'problem2_2.jpg');
    