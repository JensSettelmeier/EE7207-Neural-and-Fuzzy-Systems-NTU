function [train_data, val_data, test_data] = data_divider2(data, validation_ratio,test_ratio)
%% Divides a set of Data into subsets: Validation, Test and Train set.
% Input:
%       data: data in nxn matrix form where n is the number of samples and m the
%             number of coordinates of the sample
%       validation_ratio: Percentage of the data that is used as
%                         Validation set
%       test_ratio: Percentage of the data that is used as Test set
% Output:
%       train_data: the remaining data beside val and test set
%       val_data: Validation set
%       test_data: Test set
%%

[n,~] = size(data);

validation_amount = round(n * validation_ratio/100);
test_amount = round(n * test_ratio/100);

data_indizies = 1:n;

tmp = randperm(length(data_indizies),validation_amount);
val_indizies = data_indizies(tmp);

data_indizies = setdiff(data_indizies,val_indizies);
tmp = randperm(length(data_indizies),test_amount);
test_indizies = data_indizies(tmp);

data_indizies= setdiff(data_indizies,test_indizies);

test_data = data(test_indizies,:);
val_data = data(val_indizies,:);
train_data = data(data_indizies,:);
end
data_indizies = 1:n;
test_indizies = randi([1,n],1,test_amount);
test_data = data(test_indizies,:);
data_indizies = setdiff(data_indizies,test_indizies);
train_data = data(data_indizies,:);
end
