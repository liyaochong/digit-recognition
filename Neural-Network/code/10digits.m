
theta1=0.1*(rand(785,100)-0.5);
theta2=0.1*(rand(101,10)-0.5);
data=load('../data/mnist_all.mat');
inp=[data.train0;data.train1;data.train2;data.train3;data.train4;data.train5;data.train6;data.train7;data.train8;data.train9];
inp=double(inp);

m=size(inp,1);
inp=[ones(m,1) inp];
y=zeros(m,10);
ind=1
y(ind:ind+size(data.train0,1)-1,1)=1;
ind=ind+size(data.train0,1);
y(ind:ind+size(data.train1,1)-1,2)=1;
ind=ind+size(data.train1,1);
y(ind:ind+size(data.train2,1)-1,3)=1;
ind=ind+size(data.train2,1);
y(ind:ind+size(data.train3,1)-1,4)=1;
ind=ind+size(data.train3,1);
y(ind:ind+size(data.train4,1)-1,5)=1;
ind=ind+size(data.train4,1);
y(ind:ind+size(data.train5,1)-1,6)=1;
ind=ind+size(data.train5,1);
y(ind:ind+size(data.train6,1)-1,7)=1;
ind=ind+size(data.train6,1);
y(ind:ind+size(data.train7,1)-1,8)=1;
ind=ind+size(data.train7,1);
y(ind:ind+size(data.train8,1)-1,9)=1;
ind=ind+size(data.train8,1);
y(ind:ind+size(data.train9,1)-1,10)=1;

disp('start iter')
z=randperm(m);
inp=inp(z,:);
y=y(z,:);
itercnt=1;
   out_n=inp*theta1;

    out_n=1./(1+exp(-out_n));
    size(out_n)
    size(ones(m,1))
    out_n=[ones(m,1) out_n];
    out_n=1./(1+exp(-out_n*theta2));
    out_n=(y-out_n).^2;
    out_n=sum(sum(out_n));
    out_n=out_n/m;
    for i=1:m
        itercnt=itercnt+1;
        netp=(inp(i,:))*theta1;
        out1=1./(1+exp(-netp));
        out1=[1 out1];
        out2=1./(1+exp(-out1*theta2));
        del2=out2.*(1-out2).*(y(i,:)-out2);
        del1=(del2*theta2').*out1.*(1-out1);
        theta2=theta2+(1/sqrt(itercnt))*out1'*del2;
        theta1=theta1+(1/sqrt(itercnt))*inp(i,:)'*(del1(2:end));
    end
eps=0.0001;

out_o=out_n;
   
out_n=inp*theta1;
  
    out_n=1./(1+exp(-out_n));
    out_n=[ones(m,1) out_n];
    out_n=1./(1+exp(-out_n*theta2));
    out_n=(y-out_n).^2;
    out_n=sum(sum(out_n));
    out_n=out_n/m
    out_o
while out_o-out_n>eps
 
    itercnt
    out_n
    out_o
    for i=1:m
           itercnt=itercnt+1;
        netp=(inp(i,:))*theta1;
        out1=1./(1+exp(-netp));
        out1=[1 out1];
        out2=1./(1+exp(-out1*theta2));
        del2=out2.*(1-out2).*(y(i,:)-out2);
        del1=(del2*theta2').*out1.*(1-out1);
        theta2=theta2+(1/sqrt(itercnt))*out1'*del2;
        theta1=theta1+(1/sqrt(itercnt))*inp(i,:)'*(del1(2:end));
    end
    out_o=out_n;
   
out_n=inp*theta1;
  
    out_n=1./(1+exp(-out_n));
    out_n=[ones(m,1) out_n];
    out_n=1./(1+exp(-out_n*theta2));
    out_n=(y-out_n).^2;
    out_n=sum(sum(out_n));
    out_n=out_n/m
end

disp('finished iter')
inp=[data.test0;data.test1;data.test2;data.test3;data.test4;data.test5;data.test6;data.test7;data.test8;data.test9];
inp=double(inp);
noofexamples=size(inp,1)
inp=[ones(noofexamples,1) inp];
y=zeros(noofexamples,10);
ind=1
y(ind:ind+size(data.test0,1)-1,1)=1;
ind=ind+size(data.test0,1);
y(ind:ind+size(data.test1,1)-1,2)=1;
ind=ind+size(data.test1,1);
y(ind:ind+size(data.test2,1)-1,3)=1;
ind=ind+size(data.test2,1);
y(ind:ind+size(data.test3,1)-1,4)=1;
ind=ind+size(data.test3,1);
y(ind:ind+size(data.test4,1)-1,5)=1;
ind=ind+size(data.test4,1);
y(ind:ind+size(data.test5,1)-1,6)=1;
ind=ind+size(data.test5,1);
y(ind:ind+size(data.test6,1)-1,7)=1;
ind=ind+size(data.test6,1);
y(ind:ind+size(data.test7,1)-1,8)=1;
ind=ind+size(data.test7,1);
y(ind:ind+size(data.test8,1)-1,9)=1;
ind=ind+size(data.test8,1);
y(ind:ind+size(data.test9,1)-1,10)=1;

acc=0


for i=1:noofexamples
    netp=(inp(i,:))*theta1;
  
    out1=1./(1+exp(-netp));
    out1=[1 out1];
    out2=1./(1+exp(-out1*theta2));
  
    if  max(out2)==max(out2.*y(i,:))
        acc=acc+1;
    end
    
end
disp('iter')
acc/noofexamples
