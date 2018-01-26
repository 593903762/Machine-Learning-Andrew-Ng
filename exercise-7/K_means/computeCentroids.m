function centroids = computeCentroids(X, idx, K)
%% step2:���´ص����ĵ�����Ϊ�ô�������������͵ľ�ֵ
centroids = zeros(K,size(X,2));

for i=1:K
    index = find(idx == i);
    centroids(i,:) = sum(X(index,:)) / size(X(index),1); %#ok<*FNDSB>
end

end

