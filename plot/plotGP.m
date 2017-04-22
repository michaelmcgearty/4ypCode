function plotGP(xd, yd, theta, x_, f_, f_Var, varInt)

% Constant for 95% confidence interval
confInt95 = 1.96;

% Convert the variances into confidence intervals
ydConf = confInt95 * sqrt(exp(2*theta(1)));
f_Conf = confInt95 * sqrt(f_Var);

% Ensure data is correctly sorted w.r.t. time
[xdSorted, xdInd] = sort(xd);
ydSorted = yd(xdInd);
[x_Sorted, x_Ind] = sort(x_);
f_Sorted = f_(x_Ind);
f_ConfSorted = f_Conf(x_Ind);

% Plot the measurements
plot(xdSorted, ydSorted, 'o', ...
    'MarkerEdgeColor', 'r', ...
    'MarkerFaceColor', 'r')

hold on

% Plot error bars showing the 95% confidence interval on the measurements
for i = 1:length(xd)
    errorbar(xdSorted(i),ydSorted(i),ydConf,'r');
end

% Plot the precitions
plot(x_Sorted, f_Sorted, 'k')

hold on

% Shade the confidence interval
x_Fill = [x_Sorted', fliplr(x_Sorted')];
f_Fill = [f_Sorted' + abs(f_ConfSorted'), fliplr(f_Sorted' - abs(f_ConfSorted'))];
confRegion = fill(x_Fill,f_Fill,[0.7, 0.7, 0.7]);
set(confRegion,'facealpha',0.5); 
set(confRegion,'edgealpha',0); 
uistack(confRegion,'down',1000); 

end





