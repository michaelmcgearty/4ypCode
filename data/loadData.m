function [xd, yd, x_] = loadData(varOut, varIn)
% loadData: Imports the data from sotonmetData.csv
%
% Inputs: - varOut - a string indicating the variable of interest
%         - varIn - a structure containing strings indicating for all the 
%           input variables
% 
% Outputs: - xd - dependent variables for the training data in an N * D
%            matrix
%          - yd - variable of interest from the training data in an N * 1
%            vector
%          - x_ - the regression targets in an n * D matrix

