function [START, END, DURATION] = stormDuration(RAINFALL_DATA)

% Make call the to the find multiple events function
d = findMultipleEvents(RAINFALL_DATA, 0.00001);

% Intialize variables
START = 0;
END = 0;
DURATION = 0;

% Cycle through the entire vector
for k = 1:1:length(d)

	% If the difference between between the indices is greater than the recorded difference
	if ((d(k, 2) - d(k, 1)) > DURATION)
		% Record the values
		DURATION = d(k, 2) - d(k, 1);
		START = d(k, 1);
		END = d(k, 2);
	end
end

%{
Sample usage:
[START, END, DURATION] = stormDuration(DATA(:, 2));
%}