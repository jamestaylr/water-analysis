function RESULT = findMultipleEvents(DATA, THRESHOLD, UP)
% Returns the indices of multiple regions above the threshold in a given data set

	% Initialize the starting index and the boolean flag to denote the threshold
	i = 1;
	triggered = false;
	RESULT = [];
	STARTIDX = -1;
    STOPIDX = -1;

	% Iterate through the entire data set
	while(i <= length(DATA))

		% If the data is above the threshold and the start hasn't been declared already, when configured to find upward regions
		% Or if the data is below the threshold and the start hasn't been declared already, when configured to find downward regions
		if(((DATA(i) > THRESHOLD) && (~triggered) && (UP)) || ((DATA(i) < THRESHOLD) && (~triggered) && (~UP)))
			triggered = true;
			STARTIDX = i;
		end

		% If the data is below the threshold and the start has already been declared, when configured to find upward regions
		% If the data is above the threshold and the start has already been declared, when configured to find downward regions
        if(((DATA(i) <= THRESHOLD) && (triggered) && (UP)) || ((DATA(i) >= THRESHOLD) && (triggered) && (~UP)))
			% Assume that the data vector values will contain a single threshold event
			STOPIDX = (i-1);
			triggered = false;

			a = [STARTIDX STOPIDX];
            RESULT = [RESULT;a];
        end
        
        i = i + 1;

	end
	
end