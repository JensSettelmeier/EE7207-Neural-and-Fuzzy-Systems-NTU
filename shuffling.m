%% function which shuffels the data
%%
function data= shuffling(data)
[n,~] = size(data);
data = data(randperm(n),:);
end