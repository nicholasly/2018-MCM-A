function E = Pierson_Moskowitz(f)
    E = 0.0081 * 9.8 * 9.8 * exp(-1.25 * 0.13 * 9.8/(8 * f)) / ((2 * pi)^4 * f^5);
end