function filter = createBLPFFilter(rows, cols)
    P = rows;
    Q = cols;

    % Initialize variables used to make filter H
    D0 = 0.05 * P;
    u = 0:(P-1);
    v = 0:(Q-1);

    % Create mesh grid
    idx = find(u > P/2);
    u(idx) = u(idx) - P;
    idy = find(v > Q/2);
    v(idy) = v(idy) - Q;
    [V, U] = meshgrid(v, u);
    D = sqrt(U.^2 + V.^2);

    % Calculate H
    n = 1;
    H = 1./(1 + (D./D0).^(2*n));

    filter = H;
end