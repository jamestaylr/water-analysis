function [BASE_FLOW] = calculateBaseFlow(DATA)

	MODE = mode(DATA);
	STD = std(DATA);

	DATA = DATA(DATA < MODE + STD);
	DATA = DATA(DATA > MODE - STD);

	BASE_FLOW = mean(DATA);
