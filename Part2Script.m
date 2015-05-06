% Repeat the loop until an acceptable number is entered
while true
	% Prompt the user for the data parameter to call
	PART = input('Which water quantity parameter would you like to test? (1 = Chloride Concentration, 2 = PH, 3 = Turbidity): ');
	
	% Run the Part 2 chloride script
	if PART == 1
	    run Part2ChlorideScript;
	    break;

	% Run the Part 2 pH script
	elseif PART == 2
	    run Part2PHScript;
	    break;

	% Run the Part 2 turbidity script
	elseif PART == 3
	    run Part2TurbidityScript;
	    break;

	else
		% Ask the user to input another value
	    display('The entered value is incorrect! Please try again!');
	end

end
