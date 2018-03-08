%% A function to calculate the propagation loss of HF radio 
%% waves in the calm ocean surface or smooth terrain by the  
%% determing the permitivity of surface epsilon.
function Lg = calm_ocean(theta, epsilon)
    RV = (sin(theta) - (epsilon - cos(theta)^2 / epsilon)^0.5) / ...
        (sin(theta) + (epsilon - cos(theta)^2 / epsilon) ^0.5);
    RC = RV;
    % Reflection Coefficient
    Lg = -10 * log(RC);
end