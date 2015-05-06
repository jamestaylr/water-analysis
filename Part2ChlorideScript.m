% Clear the figure window
clf

% Import the data from the file
CHLORIDE_DATA_NAME = input('Please input the quantitative analysis data for water quality: ','s');
CHLORIDE_DATA = readFile(CHLORIDE_DATA_NAME);

THRESHOLD = input('Type a threshold value: ');
CONVERTED = .33.*CHLORIDE_DATA(:,7);

% Plot the chloride data
plot(CHLORIDE_DATA(:,1), CONVERTED);
xlabel('Time')
ylabel('Specific Conductivity (microSiemens/cm)')
title('Specific Conductivity Events ')
hold on;
formatTime(CHLORIDE_DATA(:,1));

% Create linear space to act as the constant threshold
j = linspace(THRESHOLD, THRESHOLD, length(CHLORIDE_DATA(:,1)));

% Plot the threshold line
plot(CHLORIDE_DATA(:,1), j(:), 'r');

% Find all the regions that the threshold is exceeded
RESULTS = findMultipleEvents(CONVERTED, THRESHOLD, true);

[m, n] = size(RESULTS);

fprintf('Total time Specific Conductivity was greater than the threshold: %d [minutes]\n', (RESULTS(:,2) - RESULTS(:,1)) * 5);
fprintf('Total peaks exceeding the threshold conductivity values: %d\n\n', m);
