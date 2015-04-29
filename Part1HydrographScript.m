% Clear the figure window
clf;

FLOW_DATA = input('Please input the flow data you would like to run: ','s');
FLOW_DATA = readFile(FLOW_DATA);
FLOW_DATA(:,2) = truncateData(FLOW_DATA(:,2), 0, max(FLOW_DATA(:, 2)));

% Smooth flow data graph
[X, Y] = smoothData(FLOW_DATA(:,1), FLOW_DATA(:,2), 40);
plot(X, Y);
title('Hydrograph: Flow Rate')
xlabel('Time[sec]')
ylabel('Flow Rate[m^3/s]')
