close all; clear variables;
X = csvread('sotonmetData.csv');

time = X(:,1);
tideH = X(:,4);
tideHTrue = X(:,9);
tideHPred = zeros(length(time)-1,1);

for i = 1:length(tideHPred)
   tideHPred(i) = tideH(i);
   if tideHPred(i) == 0
       tideHPred(i) = tideHPred(i-1);
   end
end

RMSE = sqrt(sum((tideHPred-tideHTrue(2:end))'*(tideHPred-tideHTrue(2:end)))/length(tideHPred));


%{ 
missingDataSize = numel(find(airTemp==0));
newTimeSize = length(time) - missingDataSize;
newTime = zeros(newTimeSize,1);
newAirTemp = zeros(newTimeSize,1);
ind = 1;
for i = 1:length(time)
            if airTemp(i) ~= 0
                newTime(ind) = time(i);
                newAirTemp(ind) = airTemp(i);
                ind = ind + 1;
            end
end

plot(newTime,newAirTemp,'kd');
hold on
%}
plot(time(2:end),tideHPred)











