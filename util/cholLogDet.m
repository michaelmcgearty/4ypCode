function logDetK = cholLogDet(K)
% cholLogDet: Finds the log of the determinant of matrix K using Cholesky 
% decomposition

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

