%% This script will load the data, and plot it
sigma = 0.1;

close all;

plotClusters('data/fourclouds.data', [0 5], [0 5], 1, 4, 'Four clouds', @spectral_clustering, sigma)
plotClusters('data/twocircles.data', [0 6], [0 6], 2, 2, 'Two circles', @spectral_clustering, sigma)
plotClusters('data/threecircles-joined.data', [0 8], [0 8], 3, 3, 'Three circles joined', @spectral_clustering, sigma)

sigma = sigma * 2;

% figFile = 'fourclouds.eps';
% print('-depsc2', figFile);

% 2. twocircles
% figFile = 'twocircles.eps';
% print('-depsc2', figFile);

% 3. threecircles-joined
% figFile = 'threecircles-joined.eps';
% print('-depsc2', figFile);
