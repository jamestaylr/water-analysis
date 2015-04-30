% Clear the figure window
clf

% Prompt the user for the rainfall data
DATA = input('Please input the rainfall data you would like to analyze:','s');

AREA = input('Please input the area of the watershed in km^2 (Webb Branch is 2.78km^2):');

PRECIPITATION_DATA = readFile(DATA);
INTENSITY = PRECIPITATION_DATA(:,2).*60;
INTENSITY = truncateData(INTENSITY, 0, max(INTENSITY));

X = PRECIPITATION_DATA(:,1);

bar(X, INTENSITY, 20);
formatTime(X); 
xlabel('Time[min]');
ylabel('Intensity[in/hr]');
title('Hyetograph: Rainfall Intensity');

PEAK_INTENSITY = max(INTENSITY);
VOLUME = (sum(INTENSITY.*.254*AREA*100000)/60);
COM = centerOfMass(PRECIPITATION_DATA(:,1), PRECIPITATION_DATA(:,2));
DURATION = calculateDuration(INTENSITY);
fprintf('The duration of the rainstorm event is %0.2f minutes.\n',DURATION);
fprintf('The peak intensity calculated from the rainfall data is %0.2f inches per hour.\n', PEAK_INTENSITY);
fprintf('The volume calculated from the rainfall during the duration of the storm is %0.2f meters cubed.\n', VOLUME);
fprintf('The x coordinate of the center of mass is %0.2f.\n',COM);