function plotData( X, Y)
%% �������ܣ����������е��������
%{
%���д�����������ڣ���ʹ��legend����עͼ��ʾ��ʱ�������
figure;
for i =1:length(Y)
    if(Y(i) == 1)
        plot(X(i,1),X(i,2),'k+','LineWidth',2,'MarkerSize',7);
        hold on 
    end
    if(Y(i)==0)
        plot(X(i,1),X(i,2),'ko','MarkerFaceColor','yellow','MarkerSize',7);
        hold on
    end
end
%}
            
%find(x=m)���ҵ�x��ֵΪ1���±�����
pos = find(Y ==1);
neg = find(Y ==0);
plot(X(pos,1),X(pos,2),'k+','LineWidth',2,'MarkerSize',7);
hold on 
plot(X(neg,1),X(neg,2),'ko','MarkerFaceColor','yellow','MarkerSize',7);

end

