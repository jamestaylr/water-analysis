% Repeat the loop until an acceptable number is entered
while true
	% Prompt the user for the data parameter to call
	PART = input('Would you like to analyze quantity or quality data? (1 = Water Quantity, 2 = Water Quality): ');
	
	% Run the Part 1 script
	if PART == 1
	    run Part1Script;
	    break;

	% Run the Part 2 script
	elseif PART == 2
	    run Part2Script;
	    break;

	else
		% Ask the user to input another value
	    display('The entered value is incorrect! Please try again!');
	end

end