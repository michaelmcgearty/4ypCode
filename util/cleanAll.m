function [XClean,indClean] = cleanAll(XUnclean)
% Removes the data points for which the sensor was broken

% Size of the unclean data set
dim = size(XUnclean);
% Number of incidences of sensor failure
missingDataSize = numel(find(XUnclean(:,2)==0));
% Initialise matrix to store clean data
XClean = zeros((dim(1)-missingDataSize),dim(2));
% Initialise indice for clean data
indClean = zeros((dim(1)-missingDataSize),1);
ind = 1;
% Use second collumn to check for sensor failure
check = XUnclean(:,2);
% itterate over all time
for i = 1:dim(1)
    % if sensor reading was successful at time i
    if check(i) ~= 0
        % add set of sensor readings at time i to clean data
        XClean(ind,:) = XUnclean(i,:);
        % add the index of time i to the set of indices for which
        % measurements successful
        indClean(ind) = i;
        % increment the indice for the clean data
        ind = ind + 1;
    end
end
end