function [BASE_FLOW] = calculateBaseFlow(DATA)

	% Gets the mode and the standard deviation of the data
	MODE = mode(DATA);
	STD = std(DATA);

	% Removes data outside one standard deviation of the mode
	DATA = DATA(DATA < MODE + STD);
	DATA = DATA(DATA > MODE - STD);

	% Averages the resulting value
	BASE_FLOW = mean(DATA);

%{
Sample usage:
BASE_FLOW = calculateBaseFlow(FLOW_DATA(:,2));
%}