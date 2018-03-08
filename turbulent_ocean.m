%% A function to calculate the propagation loss of HF radio
%% waves in the turbulent ocean surface or moutainous  
%% terrain by the determing the permitivity of surface 
%% epsilon and the root mean square height deltaH .
function Lg = turbulent_ocean(theta, epsilon, f, deltaH)
    % Reflection Coefficient on smooth surface
    RV = (sin(theta) - (epsilon - cos(theta)^2 / epsilon)^0.5) / ...
        (sin(theta) + (epsilon - cos(theta)^2 / epsilon) ^0.5);
    % Light speed
    c = 299792458;
    lamda = c / (f * 1e6);
    % Calculate the correction coefficient of the surface roughness
    syms x;
    inte = double(int(x^-0.5 * exp(-x) * cos(8 * (2)^0.5 * pi * ...
        deltaH * x^0.5 / lamda)* besselk(0, x),x,0.001,1e5));
    factor = (2)^0.5 * inte / pi^1.5;
    % Reflection Coefficient
    RC = abs(RV) * abs(factor);
    Lg = -10 * log(RC);
end
