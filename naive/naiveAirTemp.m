close all; clear variables;
X = csvread('sotonmetData.csv');

time = X(:,1);
airTemp = X(:,3);
airTempTrue = X(:,8);

airTempPred = zeros(length(time)-1,1);

for i = 1:length(airTempPred)
   airTempPred(i) = airTemp(i);
   if airTempPred(i) == 0
       airTempPred(i) = airTempPred(i-1);
   end
end

RMSE = sqrt(sum((airTempPred-airTempTrue(2:end))'*(airTempPred-airTempTrue(2:end)))/length(airTempPred));


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
plot(time(2:end),airTempPred)











