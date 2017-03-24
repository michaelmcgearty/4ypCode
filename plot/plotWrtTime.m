function plotWrtTime(xd, yd, thetaOpt, x_, f_, f_Var)
% plotWrtTime: Plots the data with respect to time showing predictive
%              uncertainies
%
% Inputs: - xd 
%         - yd 
%         - thetaOpt
%         - x_
%         - f_
%         - f_Var
%
% Figures: a graph showing the variable of interest with respect to time, 
%          including information about the predictive uncertainty

% Constant for 95% confidence interval
confInt95 = 1.96;

% Generate vectors containing the time coloumns of xd and x_
xdTime = xd(:,1);
x_Time = x_(:,1);

% Generate vectors containing the variance for yd (f_'s varaince is given
% by f_Var)
ydVar = (exp(thetaOpt(1)))^2 * ones(size(xdTime));

% Generate vectors containing the confidence intervals for yd and f_
ydConf = confInt95 * sqrt(ydVar);
f_Conf = confInt95 * sqrt(f_Var);

% Parse the inputs, outputs and confidence intervals into single vectors
xAll = [xdTime; x_Time];
fAll = [yd; f_];
confAll = [ydConf; f_Conf];

% Sort these vectors by time
[xdSorted, xdInd] = sort(xdTime);
[x_Sorted, x_Ind] = sort(x_Time);
[xAllSorted, xAllInd] = sort(xAll);
ydSorted = yd(xdInd);
f_Sorted = f_(x_Ind);
fAllSorted = fAll(xAllInd);
ydConfSorted = ydConf(xdInd);
f_ConfSorted = f_Conf(x_Ind);
confAllSorted = confAll(xAllInd);

% Plot the function
plot(xAllSorted, fAllSorted, 'Color', 'k')
hold on
% Add markers at training data point
plot(xdSorted, ydSorted, 'LineStyle', 'none', 'Marker', 'o', ...
    'MarkerFaceColor', 'b','MarkerSize',5)
% Add markers at predictions
plot(x_Sorted, f_Sorted, 'LineStyle', 'none', 'Marker', 'o', ...
    'MarkerFaceColor', 'r','MarkerSize',4)
% Add error bars
errorbar(xAllSorted,fAllSorted,confAllSorted)

% Shade the 95% confidence interval

% Order the different layers

% Label the axes

