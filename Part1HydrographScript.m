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

% Format the graph
formatTime(X);
hold off;
title('Hydrograph: Flow Rate')
xlabel('Time [s]')
ylabel('Flow Rate [m^3/s]')
axis tight;
legend('Flow Rate','Baseflow');

VOLUME_HYDROGRAPH = (sum(FLOW_DATA(:,2)) * 30) - (BASE_FLOW * length(FLOW_DATA(:,1)));
[MAX_FLOW, i] = max(FLOW_DATA(:,2));

[DURATION_HYDROGRAPH, FLOW_START, FLOW_END] = calculateDuration(FLOW_DATA(:,2));
