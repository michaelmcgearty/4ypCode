function invK = cholInv(K)
% cholInv: Inverts matrices using Cholesky decomposition
%
% Input: - K - the square matrix to be inverted
%
% Output: - invK - the inverse of K


try
    % Try to find the Cholesky factor of K
    R = chol(K);
catch
    % If R cannot be found due to excessive self similarity use the
    % nearestSPD function to find the closest semi positive definite matrix
    K = nearestSPD(K);
    
    % Find the Cholesky factor of K
    R = chol(K);
end

% Use the Cholesky factor to compute the inverse of K
invK = inv(R)*inv(R)';

end