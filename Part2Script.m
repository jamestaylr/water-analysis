% Repeat the loop until an acceptable number is entered
while true
	% Prompt the user for the data parameter to display
	PART = input('Which water quantity parameter would you like to test? (1 = Chloride Concentration, 2 = PH, 3 = Turbidity): ');
	
	if PART == 1
	    run Part2ChlorideScript;
	    break;

	elseif PART == 2
	    run Part2PHScript;
	    break;

	elseif PART == 3
	    run Part2TurbidityScript;
	    break;

	else
	    display('The entered value is incorrect! Please try again!');
	end

end
