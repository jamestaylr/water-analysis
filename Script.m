% Repeat the loop until an acceptable number is entered
flag = false;

while ~flag
	% Prompt the user for the data parameter to display
	PART = input('Would you like to test water quality or quantity? (1 = Water Quality, 2 = Water Quantity): ');
	
	if PART == 1
		flag = true;
	    run Part1Script;
	    break;

	elseif PART == 2
		flag = true;
	    run Part2Script;
	    break;

	else
	    display('The entered value is incorrect! Please try again!');
	end

end