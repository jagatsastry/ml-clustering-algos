function [kM, kMInd] = k_means(X, k, ~)

sz = size(X);
r = sz(1);
c = sz(2);
rd = randperm(r);
M = X(rd(1:k), :);

cluster = zeros(r, c);

delta  = inf;
MInd = zeros(r, 1);
iter = 1;

while delta > 0.01
    delta = 0;
    for pt=1:r
        md = inf;
        mn = 0;
        for i=1:k
            dist = euclidean(X(pt, :), M(i, :));
            
            if dist < md
                mn = i;
                md = dist;
            end
        end
        diff = cluster(pt, :) - M(mn, :);
        delta = max(delta, sqrt(diff * diff'));
        cluster(pt, :) = M(mn, :);
        MInd(pt) = mn;
    end
    
    for i=1:k
        M(i, :) = mean(X(MInd == i, :));
    end
  %  plot(M(:, 1), M(:, 2), char(colors(iter, :)));
    iter = mod(iter, 7)+1;
end

kM = M;
kMInd = MInd;

end
