function [DURATION, START, STOP] = calculateDuration(INTENSITY)

	START = 0;
	STOP = 0;

	% Starts from the right of the intensity data and breaks when encountering data
	for i = 1:1:length(INTENSITY)
	    if(INTENSITY(i) > 0)
	        START = i;
	        break;
	    end
	end

	% Starts from the left of the intensity data and breaks when encountering data
	for j = length(INTENSITY):-1:1
	    if(INTENSITY(j) > 0)
	        STOP = j;
	        break;
	    end
	end
	
	% Returns the difference between the time values, scaled for 5 minute intervals
	DURATION = (STOP - START) * 5;

%{
Sample usage:
[DURATION_HYETOGRAPH, HYETOGRAPH_START, HYETOGRAPH_END] = calculateDuration(INTENSITY);
%}