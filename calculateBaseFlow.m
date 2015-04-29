function [BASE_FLOW] = calculateBaseFlow(DATA)

	MEDIAN = median(DATA);
	STD = std(DATA);

	DATA = DATA(DATA<MEDIAN+STD);
	DATA = DATA(DATA>MEDIAN-STD);

	BASE_FLOW = mean(DATA);
