### Description
This project trains neural network to recongnise digits in images. A neural network with one hidden layer(100 units) is used . The neural network is trained using the backpropagation algorithm. Stochastic gradient variant of backpropagation algorithm is used. 
The code is in matlab. The visualise script helps to visualise different examples in the dataset. 2digits script contains neural network to differentiate between two digits. 10digits script contain neural network to differentiate 10 digits.

### Dataset
The MNIST handwritten digit dataset  (mnist all.mat) that contains 60K training and 10K testing examples of handwritten digits. Each example in the dataset is represented by 784 features corresponding to (28 × 28) pixel values ([0, 255]). The classes are 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9 corresponding to each digit. Examples are partitioned based on the class to which they belong.

### Usage
The scripts would work with matlab and octave. Change visualise.m script if you want to differentiate not different sets of digits. Currently, it produces dataset for 3 and 8 dataset. 2digits.m script uses the dataset produced by visualise.m script.m . Change it according to the set of digits .
