% Clear the figure window
clf

PH_DATA = readFile('sample-data/water-quality-data/data.csv');

UpAThresh = input('Type an upper, Acute (one time) threshold value: ');
LowAThresh = input('Type a lower, Acute (one time) threshold value: ');

UpCThresh = input('Type an upper, Chronic (over time) threshold value: ');
LowCThresh = input('Type a lower, Chronic (over time) threshold value: ');

% Plot the PH data
[x y] = smoothData(PH_DATA(:,1), PH_DATA(:,5), 30);

plot(x,y);
hold on;

% Create linear space to act as the constant threshold
j = linspace(UpAThresh, UpAThresh, length(PH_DATA(:,1)));
k = linspace(LowAThresh, LowAThresh, length(PH_DATA(:,1)));
l = linspace(UpCThresh, UpCThresh, length(PH_DATA(:,1)));
m = linspace(LowCThresh, LowCThresh, length(PH_DATA(:,1)));


% Plot the threshold lines
plot(PH_DATA(:,1), j(:),'r');
plot(PH_DATA(:,1), k(:),'r');
plot(PH_DATA(:,1), l(:),'g');
plot(PH_DATA(:,1), m(:),'g');

[START, END, DURATION] = findLongestDuration(PH_DATA(:, 5), UpAThresh, true);

% Print out the upper acute pH values
fprintf('>> Acute upper pH properties\n', i);
UpAThresh_R = findMultipleEvents(y, UpAThresh, true);
[m n] = size(UpAThresh_R);
for i = 1:1:m
	fprintf('For region %d:\n', i);
	fprintf('The peak pH concentration is %0.4f\n', max(PH_DATA(UpAThresh_R(i:1):UpAThresh_R(i:2),5)));
	fprintf('Duration of the event: %d minutes\n\n', (UpAThresh_R(i,2) - UpAThresh_R(i,1)) * 5);
end

% Print out the lower acute pH values
fprintf('>> Acute lower pH properties\n', i);
LowAThresh_R = findMultipleEvents(y, LowAThresh, false);
[m n] = size(LowAThresh_R);
for i = 1:1:m
	fprintf('For region %d:\n', i);
	fprintf('The low pH concentration is %0.4f\n', max(PH_DATA(LowAThresh_R(i:1):LowAThresh_R(i:2),5)));
	fprintf('Duration of the event: %d minutes\n\n', (LowAThresh_R(i,2) - LowAThresh_R(i,1)) * 5);
end

% Print out the upper chronic pH values
fprintf('>> Chronic upper pH properties\n', i);
UpCThresh_R = findMultipleEvents(y, UpCThresh, true);
[m n] = size(UpCThresh_R);
for i = 1:1:m
	fprintf('For region %d:\n', i);
	fprintf('The peak pH concentration is %0.4f\n', max(PH_DATA(UpCThresh_R(i:1):UpCThresh_R(i:2),5)));
	fprintf('Duration of the event: %d minutes\n\n', (UpCThresh_R(i,2) - UpCThresh_R(i,1)) * 5);
end

% Print out the lower chronic pH values
fprintf('>> Chronic lower pH properties\n', i);
LowCThresh_R = findMultipleEvents(y, LowCThresh, false);
[m n] = size(LowCThresh_R);
for i = 1:1:m
	fprintf('For region %d:\n', i);
	fprintf('The low pH concentration is %0.4f\n', max(PH_DATA(LowCThresh_R(i:1):LowCThresh_R(i:2),5)));
	fprintf('Duration of the event: %d minutes\n\n', (LowCThresh_R(i,2) - LowCThresh_R(i,1)) * 5);
end
