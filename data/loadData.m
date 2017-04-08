function [xd, yd, x_, time, airPres, airTemp, tideH, windDir, windGustS, windS, airTempTrue, tideHTrue] = loadData(varInt)
% X = [time, airPres, airTemp, tideH, windDir, windGustS, windS, airTempTrue, tideHTrue]
X = csvread('sotonmetData.csv');
time = X(:,1);
airPres = X(:,2);
airTemp = X(:,3);
tideH = X(:,4);
windDir = X(:,5);
windGustS = X(:,6);
windS = X(:,7);
airTempTrue = X(:,8);
tideHTrue = X(:,9);

if strcmp(varInt, 'airTemp')
    x_Size = numel(find(airTemp==0));
elseif strcmp(varInt, 'tideH')
    x_Size = numel(find(tideH==0));
else
    error('varInt must be a string equal to either airTemp to tideH')
end

dSize = length(time) - x_Size;
xd = zeros(dSize,1);
x_ = zeros(x_Size, 1);
yd = zeros(dSize,1);
dInd = 1;
x_Ind = 1;
if strcmp(varInt, 'airTemp')
    for i = 1:length(time)
            if airTemp(i) ~= 0
                xd(dInd) = time(i);
                yd(dInd) = airTemp(i);
                dInd = dInd + 1;
            else
                x_(x_Ind) = time(i);
                x_Ind = x_Ind + 1;
            end
    end
elseif strcmp (varInt, 'tideH')
    for i = 1:length(time)
            if airTemp(i) ~= 0
                xd(dInd) = time(i);         
                yd(dInd) = tideH(i);
                dInd = dInd + 1;
            else
                x_(x_Ind) = time(i);
                x_Ind = x_Ind + 1;
            end
    end
else
    error('varInt must be a string equal to either airTemp to tideH')
end

end
