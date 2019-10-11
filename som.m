% note we update only the winning neuron

function W = som(data,numNeurons, learning_rate, epsilon, iter_limit)
    [~,m] = size(data);
    n_0 = learning_rate;
    W = randn(numNeurons,m); % the probability to get two equal rows is 0.
    W = W/norm(W);
    delta = epsilon +1;
    iter = 0;
    data_copy = data;
    while delta > epsilon && iter<iter_limit
        % random selection of sample from data set and making sure in the
        % next iteration it can not be drawn again
        iter2 = mod(iter,m);
        if iter2 == 0
            data_copy = data;
        end
        i = randi([1,m-iter2],1,1);
        x = data_copy(i,:);
        [n_2,~] = size(data_copy);
        filter_i =setdiff([1:n_2],i); 
        data_copy = data_copy(filter_i,:);
        
        % calculating the dists from sample vector x to every weight neuron
        % vector w, determine the m_ind = argmin(||x-w_j||)
        X_mat = repmat(x,numNeurons,1)';
        x_dists_to_W = sqrt(sum((X_mat-W').^2,1));
        % determine the winning neuron
        [min_val,min_ind] = min(x_dists_to_W);
        
        % update the neuron w_winning
        eta_n = n_0 * exp(-iter/1000);
        w_winning = W(min_ind,:);
        % note only the winning neuron is updated -> h_{j,i}(iter) = {1 if
        % neuron j is the winning neuron i, 0 otherwise.
        w_update = w_winning + eta_n *1 * min_val; 
        delta = norm(w_winning-w_update)

        iter = iter +1        
    end
end