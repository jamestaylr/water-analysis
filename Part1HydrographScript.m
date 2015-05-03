% Clear the figure window
clf;

FLOW_DATA = input('Please input the flow data you would like to analyze: ','s');
FLOW_DATA = readFile(FLOW_DATA);
FLOW_DATA(:,2) = truncateData(FLOW_DATA(:,2), 0, max(FLOW_DATA(:, 2)));

% Outputs baseflow of data
BASE_FLOW = calculateBaseFlow(FLOW_DATA(:,2));

% Smooth flow data graph
[X, Y] = smoothData(FLOW_DATA(:,1), FLOW_DATA(:,2), 40);
hold on;
plot(X, Y, '-', X, BASE_FLOW,':');
formatTime(X);
hold off;
title('Hydrograph: Flow Rate')
xlabel('Time [s]')
ylabel('Flow Rate [m^3/s]')
axis tight
legend('Flow Rate','Baseflow');

VOLUME = (sum(FLOW_DATA(:,2))*30) - (BASE_FLOW * length(FLOW_DATA(:,1)));
[m, i] = max(FLOW_DATA(:,2));

[DURATION, FLOW_START, FLOW_END] = calculateDuration(FLOW_DATA(:,2));

fprintf('The baseflow of the data is %0.4f\n', BASE_FLOW);
fprintf('The peak flow of the data is %0.4f\n', m);
fprintf('The volume of the hydrograph omitting the baseflow: %0.2f [meters^3]\n', VOLUME);
fprintf('The flow event started at %0.2f and ended at %0.2f, with a peak flow at time %0.2f.', FLOW_START, FLOW_END, FLOW_DATA(i:i, 1));
