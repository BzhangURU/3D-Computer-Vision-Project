%%%%%%%%%%%%%%%%%%%%%%%%
% inputs : I - Image
%          sigma - filter width
% output: smoothed image    

%%%%%%%%%%%%%%%%%%%%%%
function I2 = gaussian_filter(I,sigma)
dist = sigma*3;
dim = dist+1;
%convert to grayscale if in color
if size(I,3) == 3
I = 0.2989*I(:,:,1) + 0.5870*I(:,:,2) + 0.0144*I(:,:,3);
end
%generate normalized 1D mask
%mask = gaussianMask(sigma,sigma*3);

mask=zeros(1,2*(sigma*3) +1);
x=zeros(1,2*(sigma*3) +1);
n=1;
for i = -(sigma*3):1:(sigma*3)
    x(n)=n;
    mask(n)=(1/(sigma*sqrt(2*pi)))*exp((i).^2/(-2*sigma.^2));
    n=n+1;
end

%size of the mask
sizeXMask=size(mask,1);
sizeYMask=size(mask,2);

t=0;
for i=1:1:sizeXMask
    for j=1:1:sizeYMask
        t=t+mask(i,j);
    end
end
y=t
        
mask=mask/y;
k=y;

%size of original image
sizeX = size(I,1);
sizeY = size(I,2);
%convolve in the horizontal direction
I2a = zeros(sizeX, sizeY);
for i = dim:1:sizeX-dim
    for j = dim:1:sizeY-dim 
        tmp = I(i:i, j-dist:j+dist);
        val = 0.0;
        for l = 1:1:size(tmp,2)
            val = val + (double(tmp(l))*mask(l));
        end
        I2a(i,j) = round(val);
    end
end
%convolve in the vertical direction
I2 = zeros(sizeX, sizeY);
for i = dim:1:sizeX-dim
    for j = dim:1:sizeY-dim 
        tmp = I2a(i-dist:i+dist, j:j);
        val = 0.0;
        for l = 1:1:size(tmp,1)
        val = val + (double(tmp(l))*mask(l));
        end
        I2(i,j) = val;
    end
end

figure();
imagesc(I2); colormap(gray); axis image;
figure();
imagesc(I); colormap(gray); axis image;
end