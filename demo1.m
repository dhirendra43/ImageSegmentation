clc
clear
[filename pathname]=uigetfile('*.*','Pick Image ')
filename=strcat(pathname,filename)
a=imread(filename)
figure
imshow(a)
[r c p]=size(a)
Red=a(:,:,1)
Green=a(:,:,2)
Blue=a(:,:,3)
maskwhite=zeros(r,c);
maskblack=zeros(r,c);
for i=1:r
    for j=1:c
        if Red(i,j)>250 && Green(i,j)>250 &&Blue(i,j)>250
            maskwhite(i,j)=255
        end
    end
end
figure;
imshow(maskwhite);

for i=1:r
    for j=1:c
        if Red(i,j)<50 && Green(i,j)<50 &&Blue(i,j)<50
            maskblack(i,j)=255
        end
    end
end
figure;
imshow(maskblack);
[B num]=bwlabel(maskblack);
% Trace region boundaries in a binary image.
[B,L,N,A] = bwboundaries(maskblack);


imshow(a); hold on;
%plot the boundary
for k=1:length(B),
    if(~sum(A(k,:)))
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'b','LineWidth',2);
    end
end
