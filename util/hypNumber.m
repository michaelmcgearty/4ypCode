function hypNum = hypNumber(type, D)
% hypNumber: Returns the number of hyper parameters required by a given
%            covariance function
%
% Inputs: - type - a string containing the name of a covariance function
%         - D - the number of dimensions in the input space
%
% Output: - hypNum - the number of hyper parameters required

if strcmp(type,'RQ') || strcmp(type,'Per')
    hypNum = 3;
elseif strcmp(type,'RQard')
    hypNum = 2 + D;
elseif strcmp(type,'SE') || strcmp(type,'Matern12') || ...
         strcmp(type,'Matern32') || strcmp(type,'Matern52')
    hypNum = 2;
elseif strcmp(type,'SEard') || strcmp(type,'Matern12ard') || ...
        strcmp(type,'Matern32ard') || strcmp(type,'Matern52ard') || ...
        strcmp(type,'Lin')
    hypNum = 1 + D;
else
    error('type must be a valid covariance')
end

end
