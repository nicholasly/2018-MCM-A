%% Determine suitable the the root mean square height deltaH of the
%% turbulent ocean surface or moutainous terrain
n = linspace(0,20,10000);
for i = 1:10000
    D1(i) = wave_height_distribution(n(i), 1);
    D2(i) = wave_height_distribution(n(i), 2);
    D3(i) = wave_height_distribution(n(i), 4);
end
plot(n, D1, 'r');
hold on;
plot(n, D2, 'g');
hold on;
plot(n, D3, 'b');
legend('1','2','4');
axis([0 5 0 1]);
grid on;
xlabel('The Height of Turbulent Ocean(m)');
ylabel({'The Probability of Turbulent Ocean';'for Different RMS(root mean square) Height'});
title('Varying Curves of the Probability of Turbulent Ocean for Different RMS Height');
