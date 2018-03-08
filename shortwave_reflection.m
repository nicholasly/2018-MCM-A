%% A function to calculate the propagation loss of HF radio 
%% waves in free space, ionosphere and the ocean surface.
function E = shortwave_reflection(f, theta, Yp, n, Lg)
    % Calculate the loss in ionosphere at the location of New York, USA
    Ij = (1 + 0.0037 * 21.7) * (cos(0.881 * (29.95 * pi / 180)))^1.3;
    Li = 667.2 * sec(pi/2 - theta) * Ij * n / ...
        ((f * 1e6 + 1.2e6).^1.98 + 10.2);
    % Calculate the loss in free space
    Lbf = 32.45 + 20 * log(f) + 20 * ...
        log(225 * tan(pi/2 - theta) * 2 * n);
    % Sum up the losses
    Lb  = Lbf + Li + Yp + Lg;
    E = 137.2 + 20 * log(f) + 20 * log(100) + 1 - Lb;
end
