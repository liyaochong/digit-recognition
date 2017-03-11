### Description
This project trains neural network to recongnise digits in images. A neural network with one hidden layer(100 units) is used . The neural network is trained using the backpropagation algorithm. Stochastic gradient variant of backpropagation algorithm is used. 
The code is in matlab. A script is there to draw/reproduce digits in the dataset. The script named 2digit.m trains the neural network to differentiate two digits i.e. classify an image of the digit into one of the two classes of digits. The script named 10digit.m trains the neural network to output the digit an image represents . The network is given all the ten classes of digit as input to learn a.

### Dataset
The MNIST handwritten digit dataset  (mnist all.mat) that contains 60K training and 10K testing examples of handwritten digits. Each example in the dataset is represented by 784 features corresponding to (28 × 28) pixel values ([0, 255]). The classes are 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9 corresponding to each digit. Examples are partitioned based on the class to which they belong.

### Usage
The scripts would work with matlab and octave. Change visualise.m script if you want to differentiate  different sets of digits. Currently, it produces dataset for 3 and 8 dataset. 2digits.m script uses the dataset produced by visualise.m script. Change it according to the set of digits .

## Accuracy
92% accuracy is observed  when the model learns to classify the images into all possible 10 categories.

