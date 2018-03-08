%% Code for test and plot
n = linspace(0,50);
f = [input('Please input the frequency of the HF radio £º')];
theta = [input('Please input the degree of the launching elevation angle £º')]* pi / 180;
deltaH = [input('Please input the root mean square height £º')];
% Calculate the SNR of smooth surface after nth hops
Lg1 = calm_ocean(theta, 3);
E1 = real(shortwave_reflection(f,theta,1, n, Lg1));
% Calculate the SNR of rough surface after nth hops
Lg2 = turbulent_ocean(theta, 82, f, deltaH);
E2 = real(shortwave_reflection(f,theta,1, n, Lg2));
% Calculate the difference of SNR between smooth surface and  
% rough surface after nth hops
Difference(1) = abs(E1(2) - E2(2));
for i = 2:99
    Difference(i) = Difference(i - 1) + abs(E1(i + 1) - E2(i + 1));
end
% Plot the SNR curve of smooth surface and rough surface with the variation
% of n
figure;
subplot(1,2,1);
plot(n,E1,'g',n,E2,'r');
hold on
line([0 50],[10 10],'LineStyle','--');
axis([0 50 0 100]);
xlabel('Number of Hops');
ylabel('Signal-To-Noise Ratio (SNR)');
title({'Varying Curve of SNR between Calm Oceans and Turbulent Oceans';...
    'for f = 3 MHz, theta = 60 degrees'});
legend('Calm Oceans','Turbulent Oceans')
grid on;
% Plot the difference of SNR between smooth surface and rough surface with
% the variation of n
subplot(1,2,2);
plot(Difference);
axis([0 50  0 1200]);
xlabel('Number of Hops');
ylabel('The Difference of SNR between Calm Oceans and Turbulent Oceans');
grid on;
title({'Curve of the Difference of SNR between Calm Oceans and ...Turbulent Oceans';'for f = 3 MHz, theta = 60 degrees'});