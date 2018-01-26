function [idx] = findClosestCentroids(X,init_centroids)
%% step1���ҵ�Xÿ�����������Ĵ�
% init_cetroids ��������X���������
[m,~] = size(X);
k = size(init_centroids,1);

distance = zeros(m,k);

for i =1:k
    distance(:,i) = sum(bsxfun(@minus,X,init_centroids(i,:)) .^ 2,2) ;
end
[~,I] = min(distance.');
idx = I.';

end
