% Clear the figure window
clf

% Import the data from the file
TURBIDITY_DATA_NAME = input('Please input the data you would like to analyze:','s');
TURBIDITY_DATA = readFile(TURBIDITY_DATA_NAME);

ATHRESHOLD = input('Identify the acute threshold value: ');
CTHRESHOLD = input('Identify the chronic threshold value: ');

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
formatTime(TURBIDITY_DATA(:,1));

% Find all the regions that the threshold is exceeded acute values
ATHRESHOLD_R = findMultipleEvents(TURBIDITY_DATA(:, 4), ATHRESHOLD, true);
[m n] = size(ATHRESHOLD_R);
for i = 1:1:m
	fprintf('For region %d:\n', i)
	fprintf('The peak turbidty is %0.4f\n', max(TURBIDITY_DATA(ATHRESHOLD_R(i:1):ATHRESHOLD_R(i:2),5)));
	fprintf('Duration of the event: %d minutes\n\n', (ATHRESHOLD_R(i,2) - ATHRESHOLD_R(i,1)) * 5);
end

% Find all the regions that the threshold is exceeded chronic values
CTHRESHOLD_R = findMultipleEvents(TURBIDITY_DATA(:, 4), CTHRESHOLD, true);
[m n] = size(CTHRESHOLD_R);


