function hypNum = hypNumber(type, D)

if strcmp(type,'covRQ') || strcmp(type,'covPer')
    hypNum = 3;
elseif strcmp(type,'covRQard')
    hypNum = 2 + D;
elseif strcmp(type,'covSE') || strcmp(type,'covMatern12') || ...
         strcmp(type,'covMatern32') || strcmp(type,'covMatern52')
    hypNum = 2;
elseif strcmp(type,'covSEard') || strcmp(type,'covMatern12ard') || ...
        strcmp(type,'covMatern32ard') || strcmp(type,'covMatern52ard') || ...
        strcmp(type,'covLin')
    hypNum = 1 + D;
else
    error('type must be a valid covariance')
end

end
