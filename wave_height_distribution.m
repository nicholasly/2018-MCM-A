%% A function to calculate the distribution of wave height or altitude
%% of terrain
function D =  wave_height_distribution(n, h)
    D = (1/(2 * pi^1.5 * h)) * exp(-1 * n * n / (8 * h^2))...
        * besselk(0, n * n / (8 * h^2));
end