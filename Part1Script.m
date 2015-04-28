% Read in the data files
DATA1 = readFile('sample-data/precipitation-data/data-1.csv');
DATA2 = readFile('sample-data/precipitation-data/data-2.csv');
DATA3 = readFile('sample-data/precipitation-data/data-3.csv');

% Combine all the data sets
DATA = combine(DATA1, DATA2, DATA3);

%Converts rainfall data to intensity
[INTENSITY, DATA] = calculateIntensity (DATA(:,1), DATA(:,2));

%Calculates duration of longest storm-NOT DONE. TROY IS WORKING ON LOOP
[EVENT, DURATION] = stormDuration (DATA);
disp(DURATION)

%Hyetograph plot
TIME = DATA(0:5:end); %5 minute time intervals
plot(INTENSITY, TIME)
xlabel('Time[min]')
ylabel('Intensity[in/hr]')
title('Hyetograph: Rainfall Intensity')
%Should be able to add hydrograph to hyetograph using hold on

%Calculates peak intensity in duration of storm
PEAK_INTENSITY = max(DATA(:,1)); %Should this be 2 or 1 for the peak intensity?
VOLUME = %Need to output the volume of the rainfall during the duration of the storm
fprintf('\nThe peak intensity calculated from the rainfall data is %0.2f\n',PEAK_INTENSITY);
fprintf('\nThe volume calculated from the rainfall during the duration of the storm is %0.2f\n', VOLUME);

%Begin working with stormwater runoff data and hydrograph

