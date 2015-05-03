% Runs all the Part 1 scripts, generating both a hydrograph and hyetograph
run Part1HydrographScript
run Part1HyetographScript

% Hydrograph Script
fprintf('\n>> Hydrograph Calculations:\n');
fprintf('The baseflow of the data is %0.4f\n', BASE_FLOW);
fprintf('The peak flow of the data is %0.4f\n', MAX_FLOW);
fprintf('The volume of the hydrograph omitting the baseflow: %0.2f [meters^3]\n', VOLUME_HYDROGRAPH);
fprintf('The flow event started at %0.2f and ended at %0.2f, with a peak flow at time %0.2f.\n', FLOW_START, FLOW_END, FLOW_DATA(i:i, 1));

% Hyetograph Script
fprintf('\n>> Hyetograph Calculations:\n');
fprintf('The duration of the rainstorm event is %0.2f minutes.\n', DURATION_HYETOGRAPH);
fprintf('The peak intensity calculated from the rainfall data is %0.2f inches per hour.\n', PEAK_INTENSITY);
fprintf('The volume calculated from the rainfall during the duration of the storm is %0.2f meters cubed.\n', VOLUME_HYETOGRAPH);
fprintf('The x coordinate of the center of mass is %0.2f.\n', MASS_CENTER);

% Lag time calculations
fprintf('\n>> Lag Time Calculations:\n');
fprintf('\nLag time: %0.2f [hours]\n', (MAX_FLOW - MASS_CENTER) * 24);