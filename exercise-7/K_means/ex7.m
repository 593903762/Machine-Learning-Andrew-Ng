%% Machine Learning  Online Class === Exercise 7 |K-Means Clustering and Principle Component Analysis 
clear all;clc
%% 1.Load data
fprintf('load ex7data2 ....\n');
addpath(genpath('.\data\'));
X = importdata('ex7data2.mat');
figure(1);
plot(X(:,1),X(:,2),'ko','LineWidth',2);
xlabel('Feature 1');
ylabel('Feature 2');
title('Visualizing data');
hold off;

%% 2. Find clusters index
% ��figure1�У����Կ��������ݿ��Էֳ�3��
K=3;
init_centroids = [3,3; 6,2; 8,5];
% �ҵ�ÿ�������������������ţ�1~K
idx = findClosestCentroids(X,init_centroids);

%% 3. Compute K-means and run K-means
fprintf('Compute K-means ... \n');
centroids  = computeCentroids(X,idx,K);
% ����K-means����ͼ��
maxIter =10;
[~,~] = runkMeans(X,init_centroids,maxIter,true);
