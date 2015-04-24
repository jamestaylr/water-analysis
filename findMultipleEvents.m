function RESULT = findMultipleEvents(DATA, THRESHOLD)
% Returns the indices of multiple regions above the threshold in a given data set

	% Initialize the starting index and the boolean flag to denote the threshold
	i = 1;
	triggered = false;
	RESULT = [];
	STARTIDX = -1;
    STOPIDX = -1;

	% Iterate through the entire data set
	while(i <= length(DATA))

		% If the data is above the threshold and the start hasn't been declared already
		if((DATA(i) > THRESHOLD) && (~triggered))
			triggered = true;
			STARTIDX = i;
		end

		% If the data is below the threshold and the start has already been declared
        if((DATA(i) <= THRESHOLD) && (triggered))
			% Assume that the data vector values will contain a single threshold event
			STOPIDX = (i-1);
			triggered = false;

			a = [STARTIDX STOPIDX];
            RESULT = [RESULT;a];
        end
        
        i = i + 1;

	end
end