function [START, END, DURATION] = findLongestDuration(DATA, THRESHOLD, UP)

% Make call the to the find multiple events function
d = findMultipleEvents(DATA, THRESHOLD, UP);

% Intialize variables
START = 0;
END = 0;
DURATION = 0;

% Cycle through the entire vector
for k = 1:1:length(d)

	% If the difference between between the indices is greater than the recorded difference

	try
		if ((d(k, 2) - d(k, 1)) > DURATION)
			% Record the values
			DURATION = d(k, 2) - d(k, 1);
			START = d(k, 1);
			END = d(k, 2);
		end
	catch ME
		break
	end
end

%{
Sample usage:
[START, END, DURATION] = findLongestDuration(DATA(:, 2), THRESHOLD);
%}