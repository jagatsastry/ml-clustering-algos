%% This script will load the data, and plot it
close all;

plotClusters('data/fourclouds.data', [0 5], [0 5], 1, 4, 'Four clouds', @k_means, 0)
plotClusters('data/twocircles.data', [0 6], [0 6], 2, 2, 'Two circles', @k_means, 0)
plotClusters('data/threecircles-joined.data', [0 8], [0 8], 3, 3, 'Three circles joined', @k_means, 0)

% figFile = 'fourclouds.eps';
% print('-depsc2', figFile);

% 2. twocircles
% figFile = 'twocircles.eps';
% print('-depsc2', figFile);

% 3. threecircles-joined
% figFile = 'threecircles-joined.eps';
% print('-depsc2', figFile);
