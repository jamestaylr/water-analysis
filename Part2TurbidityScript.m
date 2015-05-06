% Import the data from the file
TURBIDITY_DATA_NAME = input('Please input the quantitative analysis data for water quality: ', 's');
TURBIDITY_DATA = readFile(TURBIDITY_DATA_NAME);

ATHRESHOLD = input('Identify the acute threshold value: ');
CTHRESHOLD = input('Identify the chronic threshold value: ');

% Clear the figure window
clf;

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
[m, n] = size(ATHRESHOLD_R);

fprintf('\nFor the acute threshold:\n');
fprintf('Total time turbidity was greater than %d: %d [minutes]\n', ATHRESHOLD, sum(ATHRESHOLD_R(:,2)) - sum(ATHRESHOLD_R(:,1)));
fprintf('Total peaks exceeding the acute threshold turbidity values: %d\n\n', m);

% Find all the regions that the threshold is exceeded chronic values
CTHRESHOLD_R = findMultipleEvents(TURBIDITY_DATA(:, 4), CTHRESHOLD, true);
[o, p] = size(CTHRESHOLD_R);

fprintf('For the chronic threshold:\n');
fprintf('Total time turbidity was greater than %d: %d [minutes]\n', CTHRESHOLD, sum(CTHRESHOLD_R(:,2)) - sum(CTHRESHOLD_R(:,1)));
fprintf('Total peaks exceeding the chronic threshold turbidity values: %d\n\n', o);
