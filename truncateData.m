function [DATA] = truncateData(RAW, LOWER_BOUNDS, UPPER_BOUNDS)

	for i=0:1:length(RAW)
		if(RAW(i) > UPPER_BOUNDS)
			RAW(i) = UPPER_BOUNDS;
		end

		if(RAW(i) < LOWER_BOUNDS)
			RAW(i) = LOWER_BOUNDS;
		end
	end

	DATA = RAW;

%{
	Sample usage:
	DATA = truncateData(DATA, 0, max(DATA));
%}