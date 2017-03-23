function logDetK = cholLogDet(K)
% cholLogDet: Finds the log of the determinant of matrix K using Cholesky 
% decomposition

% Check K is square
dim = size(K);
if dim(1) ~= dim(2)
    error('K must be a square matrix')
end

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

logDetK = 2 * sum(log(diag(R)));

end
