function plotClusters(dataFile, xlm, ylm, fignum, k, ttl, func, sigma)

colors = ['gh'; 'rd'; 'co'; 'ms'; 'yh';  'wo'; 'gs'; 'rh'; 'cd'; 'mo'; 'ys'; 'wd'; 'go'; 'rs'; 'ch'; 'md'; 'yo'; 'wh'];


data = dlmread(dataFile);
figure(fignum); clf; 
hold on;
axis equal
xlim(xlm);
ylim(ylm);
[Mean, MInd] = func(data, k, sigma);

for i=1:k
    scatter(data(MInd == i,1), data(MInd == i,2), 15,  char(colors(i, :)));
end

%plot(Mean(:, 1), Mean(:, 2), 'kh', 'MarkerSize', 10);
title(ttl,'FontSize',14);

set(gca, 'FontSize', 14);
hold off;

end