function phi = big_Phi(data,centrum,sigma)
[number_of_sample, ~] = size(data);
[number_of_centren,~] = size(centrum);

phi = zeros(number_of_sample,number_of_centren);
    
    for i=1:number_of_centren
        c_mat = repmat(centrum(i,:),number_of_sample,1);
        column_i_of_phi = exp((1/(2*sigma^2)) * sqrt(sum((data-c_mat).^2,2)));
        phi(:,i) = column_i_of_phi;
    end
   
end
