function [CMASS] = centerOfMass(COMPLEMENT, DATA)

% Set the initial values
NUMSUM = 0;
DENOSUM = 0;

% Iterates through all the time values
for i = 1:1:numel(COMPLEMENT);
	% Calculates the center of mass
	NUMSUM = (COMPLEMENT(i) * DATA(i)) + NUMSUM;
	DENOSUM = DATA(i) + DENOSUM;

end

% Return the center of mass
CMASS = NUMSUM / DENOSUM;

%{
Sample usage:
CMASS = centerOfMass(DATA(:,1), DATA(:,2));
%}