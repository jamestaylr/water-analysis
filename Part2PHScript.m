% Import the data from the file
PH_DATA_NAME = input('Please input the quantitative analysis data for water quality: ', 's');
PH_DATA = readFile(PH_DATA_NAME);

UpAThresh = input('Identify the upper acute threshold value: ');
LowAThresh = input('Identify the lower acute threshold value: ');

UpCThresh = input('Identify the upper chronic threshold value: ');
LowCThresh = input('Identify the lower chronic threshold value: ');

% Clear the figure window
clf;

% Plot the PH data
[x, y] = smoothData(PH_DATA(:,1), PH_DATA(:,5), 30);

p1 = plot(x, y);
xlabel('Time')
ylabel('pH Values')
title('Pollutograph for Fish')
hold on;
formatTime(x);

% Create linear space to act as the constant threshold
j = linspace(UpAThresh, UpAThresh, length(PH_DATA(:,1)));
k = linspace(LowAThresh, LowAThresh, length(PH_DATA(:,1)));
l = linspace(UpCThresh, UpCThresh, length(PH_DATA(:,1)));
m = linspace(LowCThresh, LowCThresh, length(PH_DATA(:,1)));


% Plot the threshold lines
p2 = plot(PH_DATA(:,1), j(:), 'r');
plot(PH_DATA(:,1), k(:), 'r');
p3 = plot(PH_DATA(:,1), l(:), 'g');
plot(PH_DATA(:,1), m(:), 'g');
legend([p1 p2 p3], 'pH Data', 'Acute Threshold', 'Chronic Threshold');

[START, END, DURATION] = findLongestDuration(PH_DATA(:, 5), UpAThresh, true);

% Print out the upper acute pH values
UpAThresh_R = findMultipleEvents(y, UpAThresh, true);
[m, n] = size(UpAThresh_R);

if (m == 0)
	fprintf('The upper acute pH level is not exceeded.\n');
else
	for i = 1:1:m
		fprintf('For the given region: ');
		fprintf('The peak pH concentration is %0.4f\n', max(PH_DATA(UpAThresh_R(i:1):UpAThresh_R(i:2),5)));
		fprintf('Duration of the event: %d minutes\n\n', (UpAThresh_R(i,2) - UpAThresh_R(i,1)) * 5);
	end
end

fprintf('\n');

% Print out the lower acute pH values
LowAThresh_R = findMultipleEvents(y, LowAThresh, false);
[m, n] = size(LowAThresh_R);

if (m == 0)
	fprintf('The lower acute pH level is not exceeded.\n');
else
	for i = 1:1:m
		fprintf('For the given data: ');
		fprintf('The low pH concentration is %0.4f\n', max(PH_DATA(LowAThresh_R(i:1):LowAThresh_R(i:2),5)));
		fprintf('Duration of the event: %d minutes\n', (LowAThresh_R(i,2) - LowAThresh_R(i,1)) * 5);
	end
end

fprintf('\n');

% Print out the upper chronic pH values
UpCThresh_R = findMultipleEvents(y, UpCThresh, true);
[m, n] = size(UpCThresh_R);

if (m == 0)
	fprintf('The upper chronic pH level is not exceeded.\n');
else
	for i = 1:1:m
		fprintf('For the given data: ');
		fprintf('The peak pH concentration is %0.4f\n', max(PH_DATA(UpCThresh_R(i:1):UpCThresh_R(i:2),5)));
		fprintf('Duration of the event: %d minutes\n', (UpCThresh_R(i,2) - UpCThresh_R(i,1)) * 5);
	end
end

fprintf('\n');

% Print out the lower chronic pH values
LowCThresh_R = findMultipleEvents(y, LowCThresh, false);
[m, n] = size(LowCThresh_R);

if (m == 0)
	fprintf('The lower chronic pH level is not exceeded.\n');
else
	for i = 1:1:m
		fprintf('For the given data: ');
		fprintf('The low pH concentration is %0.4f\n', max(PH_DATA(LowCThresh_R(i:1):LowCThresh_R(i:2),5)));
		fprintf('Duration of the event: %d minutes\n', (LowCThresh_R(i,2) - LowCThresh_R(i,1)) * 5);
	end
end

fprintf('\n');
