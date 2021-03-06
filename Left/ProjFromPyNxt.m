% reproject physics to image
im = double(imread('..\Target\origin.jpg'));
G = fspecial('gaussian', [5 5], 2);

im = imfilter(im,G);


[my,mx] = meshgrid(-20+0.1:0.1:394, -20+0.1:0.1:271);% 构造物理点
my=fliplr(my);
px = reshape(mx,4140*2910,1);
py = reshape(my,4140*2910,1);
imorigin = [px,py,zeros(length(px),1)]';
for I=1:n_ima
    if active_images(I)==0
        continue;
    end
    eval(['omc=omc_' num2str(I) ';']);
    eval(['Tc=Tc_' num2str(I) ';']);
    [repmap] = project_points2(imorigin,omc,Tc,fc,cc,kc,alpha_c); % 物理点投影到像面  转为像面坐标
    repmap = repmap';
    % scatter(repmap(:,1),repmap(:,2))
    dx = reshape(repmap(:,1),2910,4140);
    dy = reshape(repmap(:,2),2910,4140);
    dx = fliplr(dx);
    dy = fliplr(dy);
    
    [mx,my] = meshgrid(1:1728, 1:1296);
    Vq = griddata(dx,dy,im,mx,my);
    Vq=mat2gray(Vq);
    imwrite(Vq,sprintf('RndPrjNxt%d.tif',I),'tif');
end


