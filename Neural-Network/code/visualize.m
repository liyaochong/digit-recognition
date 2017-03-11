data=load('../data/mnist_all.mat')

train3=data.train3;
test3=data.test3;
train8=data.train8;
test8=data.test8;
save('../data/mnist_bin38.mat','train3','test3','train8','test8');

% 28 is the id of image in train3 to display
tmp=vec2mat(data.train3(90,:),28);
imshow(tmp,[])
