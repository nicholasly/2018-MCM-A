clear;
%% Code for test and plot
n = 1:20;
theta = pi/180:pi/180:pi/2;
f = [input('Please input the frequency of the HF radio £º')];
%theta = [input('Please input the degree of the launching elevation angle £º')] * pi / 180;
deltaH = [input('Please input the root mean square height £º')];
% Calculate the SNR of smooth surface after nth hops
for i = 1:20
    for j = 1:90
        Lg1 = real(calm_ocean(theta(j), 3));
        E1(i,j) = real(shortwave_reflection(f,theta(j),1, n(i), Lg1));
    end
end
figure
mesh(E1);
n = 1:20;
theta = pi/180:pi/180:pi/2;
% Calculate the SNR of rough surface after nth hops
for i = 1:20
    for j = 1:90
        Lg2 = turbulent_ocean(theta(j), 82, f, deltaH);
        E2(i,j) = real(shortwave_reflection(f,theta(j),1, n(i), Lg1));
    end
end
figure
mesh(E2);