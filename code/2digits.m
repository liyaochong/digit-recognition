theta1=(rand(785,100)-0.5);
theta2=(rand(101,1)-0.5);
data=load('../data/mnist_bin38.mat');
m=size(data.train8,1)+size(data.train3,1)
y=[zeros(size(data.train8,1),1); ones(size(data.train3,1),1)];
inp=[data.train8;data.train3];
inp=[ones(m,1) inp];
inp=double(inp);
disp('start iter')
z=randperm(m);
inp=inp(z,:);
y=y(z,:);



out_n=1./(1+exp(-[ones(m,1) 1./(1+exp(-(inp)*theta1))]*theta2));

out_n=sum((y-out_n).^2)/m;


for i=1:m
netp=(inp(i,:))*theta1;
out1=1./(1+exp(-netp));
out1=[1 out1];
out2=1/(1+exp(-out1*theta2));
del2=out2*(1-out2)*(y(i)-out2);
del1=del2*theta2'.*out1.*(1-out1);

theta2=theta2+(1/sqrt(i))*del2*out1';
theta1=theta1+(1/sqrt(i))*inp(i,:)'*(del1(2:end));
end

out_o=out_n
out_n=1./(1+exp(-[ones(m,1) 1./(1+exp(-(inp)*theta1))]*theta2));

out_n=sum((y-out_n).^2)/m;

eps=0.0001;
itercnt=1;
while  (out_o-out_n)>eps 
    out_n
    out_o
    itercnt=itercnt+1
    for i=1:m
        netp=(inp(i,:))*theta1;
        out1=1./(1+exp(-netp));
        out1=[1 out1];
        out2=1/(1+exp(-out1*theta2));
        del2=out2*(1-out2)*(y(i)-out2);
        del1=del2*theta2'.*out1.*(1-out1);
       
        theta2=theta2+(1/sqrt((itercnt-1)*m+i))*del2*out1';
        theta1=theta1+(1/sqrt((itercnt-1)*m+i))*inp(i,:)'*(del1(2:end));
        
    end
    
out_o=out_n;
out_n=1./(1+exp(-[ones(m,1) 1./(1+exp(-(inp)*theta1))]*theta2)) ;
out_n=sum((y-out_n).^2)/m;

end

disp('finished iter')
inp=[data.test8;data.test3];

y=[zeros(size(data.test8,1),1); ones(size(data.test3,1),1)];
inp=double(inp);

noofexamples=size(inp,1);
inp=[ones(noofexamples,1) inp];

acc=0


for i=1:noofexamples
    netp=(inp(i,:))*theta1;  
    out1=1./(1+exp(-netp));  
    out1=[1 out1];
    out2=1/(1+exp(-out1*theta2));  
    if out2>=0.5 && y(i)==1
        acc=acc+1;
    elseif out2<0.5 && y(i)==0
        acc=acc+1;
    end
    
end
acc/noofexamples
