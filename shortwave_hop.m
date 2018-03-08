function [n, E] = shortwave_hop(f,angle,Yp)
    Ij = (1 + 0.0037 * 21.7) * (cos(0.881*29.95))^1.3;
    n = 667.2 * sec(angle) * Ij / (((f + 1200000)^1.98+10.2) * Li);
    Lbf = 32.45 + 20 * log(f/1e6) + 20*log(225000/angle);
    Lg = calm_ocean(angle, 81);
    Lb  = Lbf + Li + Lg + Yp;
    E = 137.2 + 20*log(f) + 100 + 1 - Lb;