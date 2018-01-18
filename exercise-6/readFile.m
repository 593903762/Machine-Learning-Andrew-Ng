function file_contents = readFile(filename)
%% 读入一个文件，并返回文件的内容

% 打开文件，返回与该文件对应的id，值大于等于3
fid = fopen(filename);
if fid
    % 扫描该id指向的文件，读取每一个字符（包括空格），直到文件结束
    % 这一句和上一句是固定搭配
    file_contents = fscanf(fid, '%c', inf);
else
    file_contents = '';
    fprintf('Unable to open %s\n', filename);
end
fclose(fid);
end
