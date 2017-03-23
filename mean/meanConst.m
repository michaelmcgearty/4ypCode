function mu = meanConst(hypMean, yd)
% meanConst: Constant mean function
%
% Inputs: - hypMean - the mean functions only hyper parameter (the constant)
%         - yd - N training outputs corresponding to the N training inputs
%           in an N * 1 vector 
%
% Output: - mu - the mean function in an N * 1 vector

% Check hypMean has only one parameter
if numel(hypMean) ~= 1
    error('hypMean should only contain a single parameter')
end

const = exp(hypMean);
mu = const * ones(size(yd));

end
