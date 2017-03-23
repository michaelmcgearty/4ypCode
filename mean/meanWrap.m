function mu = meanWrap(type, hypMean, yd)
% meanWrap: A wrapper function for calling required mean function
%
% Inputs: - typeMean - string specifying the type of mean function to be
%           used
%         - hypMean - the mean functions only hyper parameter (the constant)
%         - yd - N training outputs corresponding to the N training inputs
%           in an N * 1 vector 
%
% Output: - mu - the mean function in an N * 1 vector


% Zero mean
if type.Mean == 'meanZeros'
    meanZeros = str2func(type.Mean);
    mu = meanZeros(yd); 
% Constant mean
elseif type.Mean == 'meanConst'
    meanConst = str2func(type.Mean);
    mu = meanConst(hypMean, yd);
% Arithmetic mean
elseif type.Mean == 'meanArith'
    meanArith = str2func(type.Mean);
    mu = meanArith(yd);
% Report errors
else
    error('type.Mean must be a string equal to either "meanZeros", "meanConst" or "meanArith')
end

end
