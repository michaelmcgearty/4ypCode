function K = jitter(K)
% ensure the matrix is well conditioned by adding jitter
condK = cond(K);
while condK > 10e10
    K = K + 5e-9 * eye(size(K));
    condK = cond(K);
end
end