function [figurePane , display_array] = displayData(X,image_width)
% ��exercise-4�е�����һ��
%% ����˵�����������ͼ�����ݽ����������У���ʾ��һ�����figurePane�У�������ж��Сimge������ʾÿһ������
% image_width��ÿһ��Сimgae�Ŀ��
%��ȡX�ľ���ߴ�
[m,n] =size(X);
%% ����ÿһ��image�ĳߴ�
%���û������image_width����Ĭ��Ϊ��X�����Ŀ���������������
if ~exist('image_width','var') || isempty(image_width)
    image_width = round(sqrt(size(X,2)));
end
%ÿһ��image�ĸ߶�
image_height = n / image_width;

%% ����figurePane��figure���Ĳ���
%�������figurePaneͼƬ��ɫ��Ϊ�Ҷ�ͼ
colormap(gray);
%�������figurePane��image������������
%floor ---- ������ȡ����ceil ---- ��������ȡ��
figure_rows = floor(sqrt(m));
figure_cols = ceil(m / figure_rows);

%% �������figurePane��Ӧ�����飬��������X�е�����ֵ
%ÿһ��image֮��ļ��
pad = 1;
%��ʼֵ����-1����ʾΪ��ɫ
display_array = -ones(pad+(image_width+pad)*figure_rows, ...
                                     pad+(image_height +pad)*figure_cols);
                                 
%% ��X�е�ÿһ������ֵ�����ƽ�display_array�Ķ�Ӧλ��
%��ǰ��ʾ�ĵڼ���image��ֵҪС��m
current_image=1;
for row =1 : figure_rows
    for col =1:figure_cols
        %�ж�current_image�Ĵ�С
        if current_image > m
            break;
        end
        %�ҵ����ֵ�����������ݹ�һ����[-1,1]֮��
        max_val = max(max(X(current_image,:)));
        %�������ݿ�������·������ݣ�ʹ�� reshape��������λ������
        %һ��ͼ�����������ų�һ�е�ʱ��Ҳ����reshape�������еģ���ʹ��reshape�������ָ�
        display_array(pad + (row-1)*(image_height+pad)+(1:image_height),pad + (col-1)*(image_width+pad)+(1:image_width))=...
            reshape(X(current_image,:),image_height,image_width)/max_val;
       current_image=current_image+1;
    end
    if current_image > m
            break;
    end
end
%��ʾͼ�񣬲��Ұ�ɫ�ʣ������ǻҶȣ���Χ����Ϊ[-1,1]
figurePane = imagesc(display_array,[-1 1]);

axis image off
drawnow;
end