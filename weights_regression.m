function W = weights_regression(phi, label)
 W = (phi'*phi)\(phi'* label);
end