clc
clear
% load('Calib_Results_stereo.mat');

L=[747.307,735,773.1;845.406,845,845.1];
R=[707.312,707,707.1;873.853,873,873.1];
om=[  -0.006900048257620 ; 0.000491137632459 ; -0.002345173472491];
T=[ -24.237273986389372;  -0.251181568387558;   0.520500367166552];
fc_left = [   2446.618732294607;   2431.345995419245];
cc_left=[   547.4811320285728;   996.0968806391842];
kc_left = [   0.101014232522466;   0.154255909831776;   0.000447956105922;  -0.001055752405093;  -2.561896379854703];
alpha_c_left = 0.00004166557819675856;
fc_right = [   2416.551433027090;   2403.201950994452];
cc_right = [560.145770013662;   1006.844535117649];
kc_right=[   0.103752385721881;  -0.222257146618321;   0.000048631452716;  -0.000354006531194;  -0.466704230034254];
alpha_c_right = 0.0002867641599387890;
[Xc_1_left,Xc_1_right] = stereo_triangulation(L,R,om,T,fc_left,cc_left,kc_left,alpha_c_left,fc_right,cc_right,kc_right,alpha_c_right);