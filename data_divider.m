%% Description
% in:
% data: is a nxm matrix where n is the number of samples and m the
% number of coordinates of the sample
% validation_ratio: the ratio in percentage that should be used from data
% as validation data
% test_ratio: the ratio in percentage that should be used from data
% as test data
% out: 
% train_data: random selected data which is used for training
% val_data: random selected data which is used for Validation
% test_data: random selected data which is used for testing
% all three data sets are disjoint
%%

function [train_data, val_data, test_data] = data_divider(data, validation_ratio,test_ratio)

[n,~] = size(data);

validation_amount = round(n * validation_ratio/100);
test_amount = round(n * test_ratio/100);

data_indizies = 1:n;
val_indizies = randi([1,n],1,validation_amount);
val_data = data(val_indizies,:);
data_indizies = setdiff(data_indizies, val_indizies);
data = data(data_indizies,:);
[n,~] = size(data);

data_indizies = 1:n;
test_indizies = randi([1,n],1,test_amount);
test_data = data(test_indizies,:);
data_indizies = setdiff(data_indizies,test_indizies);
train_data = data(data_indizies,:);
end