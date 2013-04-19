function [kM, kMInd] = spectral_clustering(X, k, sigma)

sz = size(X);
n = sz(1);
m = sz(2);

A = zeros(n, n);
D = zeros(n, n);

for i=1:n
    for j=1:n
        if i ~= j
            dist = euclidean(X(i, :), X(j, :));
            A(i, j) = exp(-(dist * dist)/(2*sigma*sigma));
        end
    end
    D(i, i) = sum(A(i, :));
end

DSR = inv(sqrtm(D));

L = DSR *  A * DSR;
[X1, ~] = eigs(L, k);

%S = zeros(n, 1);
Z = zeros(1, k);
Y = zeros(n, k);
for i=1:n
    S = euclidean(X1(i, :), Z);
    Y(i, :) = X1(i, :)./S;
end

[kM, kMInd] = k_means(Y, k, sigma);

distortion = 0;

for i=1:n
    distortion = distortion + euclidean(Y(i, :), kM(kMInd(i, 1), :));
end
fprintf('%f : %f\n', sigma, distortion, 1);
