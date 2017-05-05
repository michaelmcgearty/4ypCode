function [x, y] = clean(xUnclean, yUnclean)
% Removes the data points for which the sensor was broken


% Clean training data
missingDataSize = numel(find(yUnclean==0));
y = zeros((length(yUnclean)-missingDataSize),1);
x = zeros((length(xUnclean)-missingDataSize),1);
indClean = 1;
for i = 1:length(xUnclean)
    if yUnclean(i) ~= 0
        y(indClean) = yUnclean(i);
        x(indClean) = xUnclean(i);
        indClean = indClean + 1;
    end
end
end