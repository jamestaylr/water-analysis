function [DATA] = truncateData(RAW, LOWER_BOUNDS, UPPER_BOUNDS)

% Iterate over the entire data set
for i = 1:1:length(RAW)
 
    % If the value is greater than the upper bounds of the data, set it equal to the upper bound
    if (RAW(i) > UPPER_BOUNDS)
        RAW(i) = UPPER_BOUNDS;
    end
 
    % If the value is less than the lower bounds of the data, set it equal to the lower bound
    if (RAW(i) < LOWER_BOUNDS)
        RAW(i) = LOWER_BOUNDS;
    end
end

DATA = RAW;

%{
Sample usage:
DATA = truncateData(DATA, 0, max(DATA));
%}