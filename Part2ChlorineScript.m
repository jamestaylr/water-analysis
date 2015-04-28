% Clear the figure window
clf

% Import the data from the file
CHLORINE_DATA = readFile('sample-data/water-quality-data/data.csv');

THRESHOLD = input('Type a threshold value: ');
CHLORINE_DATA(:,2) = .33.*CHLORINE_DATA(:,7);

% Plot the chlorine data
plot(CHLORINE_DATA(:,1), CHLORINE_DATA(:,7));
hold on;

% Create linear space to act as the constant threshold
j = linspace(THRESHOLD, THRESHOLD, length(CHLORINE_DATA(:,1)));

% Plot the threshold line
plot(CHLORINE_DATA(:,1), j(:), 'r');

% Find all the regions that the threshold is exceeded
RESULTS = findMultipleEvents(CHLORINE_DATA(:, 7), THRESHOLD, true);

[m n] = size(RESULTS);

% Loop through all the rows of the response matrix
for i = 1:1:m
	fprintf('For region %d:\n', i)
	fprintf('The peak chlorine concentration is %0.4f\n', max(CHLORINE_DATA(RESULTS(i:1):RESULTS(i:2),7)));
	fprintf('Duration of the event: %d minutes\n\n', (RESULTS(i,2) - RESULTS(i,1)) * 5);
end
