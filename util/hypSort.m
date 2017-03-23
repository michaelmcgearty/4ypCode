function [hyp1, hyp2] = hypSort(type, hypCov, dim)

% Organise the hyper parameters
if type(2).Cov == 'covLin'
    hyp1 = hypCov(1:2);
    hyp2 = hypCov(3:end);
elseif type(2).Cov == 'covMatern12'
    hyp1 = hypCov(1:2);
    hyp2 = hypCov(3:end);
elseif type(2).Cov == 'covMatern12ard'
    hyp1 = hypCov(1:(dim(2)+1));
    hyp2 = hypCov((dim(2)+2):end);
elseif type(2).Cov == 'covMatern32'
    hyp1 = hypCov(1:2);
    hyp2 = hypCov(3:end);
elseif type(2).Cov == 'covMatern32ard'
    hyp1 = hypCov(1:(dim(2)+1));
    hyp2 = hypCov((dim(2)+2):end);
elseif type(2).Cov == 'covMatern52'
    hyp1 = hypCov(1:2);
    hyp2 = hypCov(3:end);
elseif type(2).Cov == 'covMatern52ard'
    hyp1 = hypCov(1:(dim(2)+1));
    hyp2 = hypCov((dim(2)+2):end);
elseif type(2).Cov == 'covPer'
    hyp1 = hypCov(1:3);
    hyp2 = hypCov(4:end);
elseif type(2).Cov == 'covRQ'
    hyp1 = hypCov(1:3);
    hyp2 = hypCov(3:end);
elseif type(2).Cov == 'covRQard'
    hyp1 = hypCov(1:(dim(2)+2));
    hyp2 = hypCov((dim(2)+3):end);
elseif type(2).Cov == 'covSE'
    hyp1 = hypCov(1:2);
    hyp2 = hypCov(3:end);
elseif type(2).Cov == 'covSEard'
    hyp1 = hypCov(1:(dim(2)+1));
    hyp2 = hypCov((dim(2)+2):end);
else
    error('type(2).Cov must be a valid covariance function')
end
end