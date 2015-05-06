function [COMBINED] = combine(varargin)

	% Extracts the dimensions of the first cell
	[m n] = size(varargin{1});
    B = [];
   
    % Iterating through each of the columns
    for i = 1:1:n
        % For each column, go through all the data sets in the variable
        % arguments
        S = varargin{1}(:,i);
        for d = 2:1:length(varargin)
            S = vertcat(S, varargin{d}(:,i));
        end
        
        B = horzcat(B, S);
    end
    
    COMBINED = B;

%{
Sample usage:
Data1 = readFile('data-1');
Data2 = readFile('data-2');
DATA = combine(Data1, Data1);
>> This function takes a variable number of arguments
>> This function is deprecated in the current project build
%}
