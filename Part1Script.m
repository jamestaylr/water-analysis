% Runs all the Part 1 scripts, generating both a hydrograph and hyetograph
run Part1HydrographScript
run Part1HyetographScript

% Hydrograph Script
fprintf('\n>> Hydrograph Calculations:\n');
fprintf('The baseflow of the data is %0.4f\n', BASE_FLOW);
fprintf('The peak flow of the data is %0.4f\n', MAX_FLOW);
fprintf('The volume of the hydrograph omitting the baseflow is %0.2f [meters^3]\n', VOLUME_HYDROGRAPH);
fprintf('The flow event started at %s and ended at %s, with a peak flow at time %s.\n',...
    datestr(FLOW_DATA(FLOW_START:FLOW_START,1), 'mmmm dd, HH:MM PM'), datestr(FLOW_DATA(FLOW_END:FLOW_END,1),...
    'mmmm dd, HH:MM PM'), datestr(MAX_FLOW_TIME, 'mmmm dd, HH:MM PM'));

% Hyetograph Script
fprintf('\n>> Hyetograph Calculations:\n');
fprintf('The duration of the rainstorm event started at %s and ended at %s.\n',...
    datestr(PRECIPITATION_DATA(HYETOGRAPH_START:HYETOGRAPH_START,1), 'mmmm dd, HH:MM PM'), ...
    datestr(PRECIPITATION_DATA(HYETOGRAPH_END:HYETOGRAPH_END,1), 'mmmm dd, HH:MM PM'));
fprintf('The total duration of the rainstorm event is %0.1f [minutes].\n', DURATION_HYETOGRAPH);
fprintf('The peak intensity calculated from the rainfall data is %0.2f [inches per hour].\n', PEAK_INTENSITY);
fprintf('The volume calculated from the rainfall during the duration of the storm is %0.2f [meters cubed].\n', VOLUME_HYETOGRAPH);
fprintf('The center of mass is %0.2f.\n', datestr(MASS_CENTER, 'mmmm dd, HH:MM PM'));

% Lag time calculations
fprintf('\n>> Lag Time Calculations:\n');
fprintf('Lag time: %0.2f [hours]\n', (MAX_FLOW_TIME - MASS_CENTER) * 24);

% Runoff calculations
RUNOFF = (VOLUME_HYDROGRAPH / VOLUME_HYETOGRAPH)*100;
fprintf('\n>> Runoff Calculations:\n');
fprintf('Runoff: %0.2f percent\n', RUNOFF);
