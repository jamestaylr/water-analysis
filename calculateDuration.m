function [DURATION] = calculateDuration(INTENSITY)

	START = 0;
	STOP = 0;

	for i = 1:1:length(INTENSITY)
	    if(INTENSITY(i) > 0)
	        START = i;
	        break;
	    end
	end


	for j = length(INTENSITY):-1:1
	    if(INTENSITY(j) > 0)
	        STOP = j;
	        break;
	    end
	end
	DURATION = (STOP - START) * 5;