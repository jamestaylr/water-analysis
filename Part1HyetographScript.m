% Clear the figure window
clf;

% Prompt the user for the rainfall data
DATA = input('Please input the rainfall data you would like to analyze: ','s');
AREA = input('Please input the area of the watershed in km^2 (Webb Branch is 2.78km^2):');

PRECIPITATION_DATA = readFile(DATA);
INTENSITY = PRECIPITATION_DATA(:,2) .* 60;
INTENSITY = truncateData(INTENSITY, 0, max(INTENSITY));

X = PRECIPITATION_DATA(:,1);

bar(X, INTENSITY, 20);
formatTime(X); 
xlabel('Time[min]');
ylabel('Intensity[in/hr]');
title('Hyetograph: Rainfall Intensity');

PEAK_INTENSITY = max(INTENSITY);
VOLUME_HYETOGRAPH = (sum(INTENSITY .* 0.254 * AREA * 100000) / 60);
MASS_CENTER = centerOfMass(PRECIPITATION_DATA(:,1), PRECIPITATION_DATA(:,2));
DURATION_HYETOGRAPH = calculateDuration(INTENSITY);
