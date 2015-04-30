% Runs all the Part 1 scripts, generating both a hydrograph and hyetograph
run Part1HydrographScript
run Part1HyetographScript

fprintf('\nLag time: %0.2f [hours]\n', (PEAK_FLOW-COM)*24);