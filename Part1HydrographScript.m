% Clear the figure window
clf;

FLOW_DATA = input('Please input the flow data you would like to analyze: ','s');
FLOW_DATA = readFile(FLOW_DATA);
FLOW_DATA(:,2) = truncateData(FLOW_DATA(:,2), 0, max(FLOW_DATA(:, 2)));

% Outputs baseflow of data
BASE_FLOW = calculateBaseFlow(FLOW_DATA(:,2));

% Smooth flow data graph
[X, Y] = smoothData(FLOW_DATA(:,1), FLOW_DATA(:,2), 40);
hold on
plot(X, Y, '-', X, BASE_FLOW, ':');
% formatTime(X);
hold off
title('Hydrograph: Flow Rate')
xlabel('Time [minute]')
ylabel('Flow Rate [m^3/s]')
axis tight
legend('Flow Rate','Baseflow');
fprintf('The baseflow of the data is %0.4f\n', BASE_FLOW);
[m i] = max(FLOW_DATA(:,2));
PEAK_FLOW = FLOW_DATA(i:i, 1);
fprintf('The peak flow of the data is %0.4f\n', PEAK_FLOW);
