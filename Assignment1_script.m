clear all
clc
%%
load('data_train.mat')
load('label_train.mat')
data_and_label = [data_train,label_train];

data_and_label = shuffling(data_and_label);

[train_set,val_set,test_set] = data_divider(data_and_label,9,0);

train_labels = train_set(:,end);
val_labels = val_set(:,end);
test_label = test_set(:,end);

train_data = train_set(:,1:end-1);
val_data =  val_set(:,1:end-1);
test_data = test_set(:,1:end-1);
%% Find the centers for the RBF neural network
epsilon = 10^-5;
learning_rate = 0.1;
iter_limit = 100000;
numNeurons = 20;
C = som(train_data,numNeurons, learning_rate, epsilon, iter_limit);

%%  calculate Phi of f = Phi * W where f is the network's output
sigma = 8; % should be = d_max * sqrt(2*m)
Phi = big_Phi(train_data,C,sigma);
[rows, ~] = size(Phi);
Phi = [Phi, ones(rows,1)];

%% train the weights
W = weights_regression(Phi, train_labels);

%% test the Network on train set:
output_train = Phi * W;

indexes_minus = find(output_train<0);
indexes_plus = find(output_train>=0);

output_train(indexes_minus) = -1;
output_train(indexes_plus) = 1;

abweichung = output_train - train_labels;

accurcy_train = 1 - length(nonzeros(abweichung))/length(output_train)

%% test the Network on val set:
Phi = big_Phi(val_data,C,sigma);
[rows, ~] = size(Phi);
Phi = [Phi, ones(rows,1)];
output_val = Phi * W;

indexes_minus = find(output_val<0);
indexes_plus = find(output_val>=0);

output_val(indexes_minus) = -1;
output_val(indexes_plus) = 1;

abweichung = output_val - val_labels;

accurcy_val = 1 - length(nonzeros(abweichung))/length(output_val)

%% Classification on provided test data
load('data_test.mat')
Phi = big_Phi(data_test,C,sigma);
[rows, ~] = size(Phi);
Phi = [Phi, ones(rows,1)];
output_test = Phi * W

%% modified output
output_test_modified = output_test;

indexes_minus = find(output_test_modified<0);
indexes_plus = find(output_test_modified>=0);

output_test_modified(indexes_minus) = -1;
output_test_modified(indexes_plus) = 1;

output_test_modified



