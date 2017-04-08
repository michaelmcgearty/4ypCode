function plotWrtTime(xd, yd, theta, x_, f_, f_Var)
% plotWrtTime: Plots the data with respect to time showing predictive
%              uncertainies
%
% Inputs: - xd - the training inputs in an N * D matrix
%         - yd - the training targets in an N * 1 vector
%         - theta - the hyper parameters for the GP model
%         - x_ - the test targets in an n * D matrix
%         - f_ - the predicted values of the test targets in an n * 1
%           vector
%         - f_Var - the variance on the predictions at each of the test
%           targets in an n * 1 vector
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
ydVar = exp(2*theta(1)) * ones(size(xdTime));

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
figure
plot(xAllSorted, fAllSorted, 'Color', 'k')
hold on
% Add markers at training data point
plot(xdSorted, ydSorted, 'LineStyle', 'none', 'Marker', 'o', ...
    'MarkerFaceColor', 'b','MarkerSize',5)
% Add markers at predictions
plot(x_Sorted, f_Sorted, 'LineStyle', 'none', 'Marker', 'o', ...
    'MarkerFaceColor', 'r','MarkerSize',4)
% Add error bars
errorbar(xdSorted, ydSorted,ydConfSorted)
errorbar(x_Sorted, f_Sorted,f_ConfSorted )

% Shade the 95% confidence interval

% Order the different layers

% Label the axes

