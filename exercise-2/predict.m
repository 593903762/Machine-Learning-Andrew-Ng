function p = predict(theta,X )
%% �������ܣ����ݵõ��Ĳ����������ݽ���Ԥ�⣬�������
p=X*theta;
for i = 1:length(p)
    if(p(i) >= 0.5)
        p(i)=1;
    else
        p(i)=0;
    end
end

end
