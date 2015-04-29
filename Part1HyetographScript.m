% Clear the figure window
clf

% Prompt the user for the rainfall data
DATA = input('Please input the rainfall data you would like to analyze:','s');

PRECIPITATION_DATA = readFile(DATA);
INTENSITY = PRECIPITATION_DATA(:,2).*60;
INTENSITY = truncateData(INTENSITY, 0, max(INTENSITY));

X = PRECIPITATION_DATA(:,1);
plot(X, INTENSITY)
bar(X, INTENSITY)

% axis([0 PRECIPITATION_DATA(:,1) 0 max(INTENSITY)]) 
% [START, STOP, DURATION] = findLongestDuration(PRECIPITATION_DATA(:,2), 0, 0.00001);

% bar(PRECIPITATION_DATA(START:STOP,1), PRECIPITATION_DATA(START:STOP,2));
% xlabel('Time[min]');
% ylabel('Intensity[in/hr]');
% title('Hyetograph: Rainfall Intensity');

% PEAK_INTENSITY = max(PRECIPITATION_DATA(START:STOP,2));
% VOLUME = ((sum(PRECIPITATION_DATA(:,2))*5)/60); % James is creating a function for Volume
% COM = centerOfMass(PRECIPITATION_DATA(:,1), PRECIPITATION_DATA(:,2));
% fprintf('The duration of the longest rainstorm event is %0.2f minutes.\n',DURATION);
% fprintf('The peak intensity calculated from the rainfall data is %0.2f inches per hour.\n', PEAK_INTENSITY);
% fprintf('The volume calculated from the rainfall during the duration of the storm is %0.2f inches cubed.\n', VOLUME);
% fprintf('The x coordinate of the center of mass is %0.2f.\n',COM);