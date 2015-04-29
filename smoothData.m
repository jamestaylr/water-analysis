function [COMPLEMENT, SMOOTHED] = smoothData(COMPLEMENT, RAW, SMOOTHING_CONSTANT)

% Seperates the data into a matrix, with SMOOTHING_CONSTANT columns
J = [];
for i = 1:1:SMOOTHING_CONSTANT
    J = horzcat(J, RAW(i:SMOOTHING_CONSTANT:end - mod(length(RAW), SMOOTHING_CONSTANT)));
end

SMOOTHED = [];

% Iterates over the rows of the matrix and takes the average of each row
for j = 1:1:size(J)[1];
    try
        SMOOTHED = [SMOOTHED; mean(J(j, :))];
    catch ME
        % Throws an error exception if the data cannot be averaged
        disp('The data is malformed! It cannot be averaged!');
        return;
    end
end

% Takes every SMOOTHING_CONSTANT value to make a complement to the smoothed data
COMPLEMENT = COMPLEMENT(1:SMOOTHING_CONSTANT:end - mod(length(COMPLEMENT), SMOOTHING_CONSTANT));

%{
Sample usage:
DATA = readData(data.csv);
[COMPLEMENT, SMOOTHED] = smoothData(DATA(:, 1), DATA(:, 2), 20);
%}