function [COMPLEMENT, DATA] = approximate(COMPLEMENT, RAW_DATA, INTERVAL)

% Takes every INTERVAL value start with the first term to make a left hand approximation
DATA = RAW_DATA(1:INTERVAL:end - mod(length(RAW_DATA), INTERVAL));

% Takes every INTERVAL value to make a complement to the modulated data
COMPLEMENT = COMPLEMENT(1:INTERVAL:end - mod(length(COMPLEMENT), INTERVAL));

%{
Sample usage:
DATA = readData(data.csv);
[COMPLEMENT, DATA] = approximate(DATA(:, 1), DATA(:, 2), 25);
%}