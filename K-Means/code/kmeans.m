file=fopen('../../data/q2_data/digitdata.txt');
line=fgetl(file);
tokens=strsplit(line);
a=zeros(size(tokens));
for i=1:length(tokens)
    a(i)=sscanf(char(tokens(i)),'"pixel%d"');
end




index=0;
line=fgetl(file);
data=[];
features=length(tokens);
while ischar(line)
    index=index+1
    tokens=strsplit(line);
    len=length(tokens);
    example=zeros(features,1);
    for i=2:len
        example(i-1)=str2double(tokens(i));
    end
    data=[data example];
    line=fgetl(file);
end

disp_ind=3;
img=zeros(784,1);
as=1;
for i=1:784
    if  as<=features && a(as)==i
        img(i)=data(as,disp_ind);
        as=as+1
    else
        img(i)=0;
    end
end

tmp=vec2mat(img,28);
imshow(tmp,[])


file=fopen('../../data/q2_data/digitlabels.txt');
 ind=0;
 labels=zeros(index,1);
 line=fgetl(file);
 line=fgetl(file);
 while ischar(line)
    ind=ind+1;
    tokens=strsplit(line);
    labels(ind)=str2double(tokens(2));
    line=fgetl(file);
 end
assign=zeros(size(data,2),1);
error=[];
shuffle=randperm(size(data,2));
data=data(:,shuffle);
labels=labels(shuffle);
clusters=[data(:,1) data(:,2) data(:,3) data(:,4)];
S_values=[];
for i=1:30
    sum_value=0;
    for j=1:index
        tmp=clusters-data(:,j)*ones(1,4);
        tmp=tmp.*tmp;
        tmp=sum(tmp);
        [temp,tp]=min(tmp);
        assign(j)=tp;
        sum_value=sum_value+temp;
    end
    err=0;
    for k=1:4
        arr=labels(find(assign==k));
        freq=[sum(arr==1) sum(arr==3) sum(arr==5) sum(arr==7)];
        freq=sort(freq);
        err=err+freq(1)+freq(2)+freq(3);
    end
    index
    error=[error err/index];
    S_values=[S_values sum_value];
    clusters=zeros(size(clusters));
    cnt=zeros(1,4);
    for j=1:index
        cnt(assign(j))=cnt(assign(j))+1;
        clusters(:,assign(j))=clusters(:,assign(j))+data(:,j);
    end
    clusters(:,1)=clusters(:,1)/cnt(1);
    clusters(:,2)=clusters(:,2)/cnt(2);
    clusters(:,3)=clusters(:,3)/cnt(3);
    clusters(:,4)=clusters(:,4)/cnt(4);
end


