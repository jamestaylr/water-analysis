PART = input('Which water quantity date parameter would you like to test?/n(1 = Chlorine Concentration, 2 = PH, 3 = Turbidity): ');
if PART == 1;
    run Part2ChlorineScript
elseif PART == 2;
    run Part2PHScript
elseif PART == 3;
    run Part2TurbidityScript
else
    display('The entered value is incorrect!');
    PART = input('Which water quantity date parameter would you like to test?/n(1 = Chlorine Concentration, 2 = PH, 3 = Turbidity): ');
end
