function [COMPLEMENT, DATA] = calculateIntensity(COMPLEMENT, RAW_DATA)

    D = [];
    
    % Iterate through every 12th term in the vector (5 minutes times 12 is
    % 1 hour)
    for j = 1:12:length(RAW_DATA)
        % Catch the error when the modulation is off
        try
            D = horzcat(D, RAW_DATA(j:j+11));
        catch ME
            break;
        end
    end
    
    % Create the output and complement data, starting at the first term
    DATA = D;
    COMPLEMENT = COMPLEMENT(1:12:end - mod(length(COMPLEMENT), 12));
    
    
%{
Sample usage:
DATA = readData(data.csv);
[COMPLEMENT, DATA] = calculateIntensity(DATA(:, 1), DATA(:, 2));
%}