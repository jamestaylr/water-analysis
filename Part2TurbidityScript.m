% Clear the figure window
clf

% Import the data from the file
TURBIDITY_DATA = readFile('sample-data/water-quality-data/data.csv');

ATHRESHOLD = input('Type an acute (one time) threshold value: ');
CTHRESHOLD = input('Type a chronic (over time) threshold value: ');

% Plot the turbidity data
plot(TURBIDITY_DATA(:,1), TURBIDITY_DATA(:,4));
xlabel('Time in Five Minute Intervals')
ylabel('Turbidity (NTU)')
title('Pollutograph for Invertebrate')
hold on;

% Create linear space to act as the constant threshold
j = linspace(ATHRESHOLD, ATHRESHOLD, length(TURBIDITY_DATA(:,1)));
k = linspace(CTHRESHOLD, CTHRESHOLD, length(TURBIDITY_DATA(:,1)));

% Plot the threshold line
plot(TURBIDITY_DATA(:,1), j(:), 'r');
plot(TURBIDITY_DATA(:,1), k(:), 'g');

% Find all the regions that the threshold is exceeded acute values
ATHRESHOLD_R = findMultipleEvents(TURBIDITY_DATA(:, 4), THRESHOLD, true);
[m n] = size(ATHRESHOLD_R);
fprintf('>> Acute turbidty threshold properties\n');
for i = 1:1:m
	fprintf('For region %d:\n', i)
	fprintf('The peak turbidty is %0.4f\n', max(TURBIDITY_DATA(ATHRESHOLD_R(i:1):ATHRESHOLD_R(i:2),5)));
	fprintf('Duration of the event: %d minutes\n\n', (ATHRESHOLD_R(i,2) - ATHRESHOLD_R(i,1)) * 5);
end

% Find all the regions that the threshold is exceeded chronic values
CTHRESHOLD_R = findMultipleEvents(TURBIDITY_DATA(:, 4), THRESHOLD, true);
[m n] = size(CTHRESHOLD_R);
fprintf('>> Chronic turbidty threshold properties\n');
for i = 1:1:m
	fprintf('For region %d:\n', i)
	fprintf('The peak turbidty is %0.4f\n', max(TURBIDITY_DATA(CTHRESHOLD_R(i:1):CTHRESHOLD_R(i:2),5)));
	fprintf('Duration of the event: %d minutes\n\n', (CTHRESHOLD_R(i,2) - CTHRESHOLD_R(i,1)) * 5);
end
