% Part 1 Hydrograph
% Begin working with stormwater runoff data and hydrograph
FLOW_DATA = input('Please input the flow data you would like to run: ','s');
FLOW_DATA = readFile(FLOW_DATA);
FLOW_DATA(:,2) = truncateData(FLOW_DATA(:,2), 0, max(FLOW_DATA(:, 2)));
[START, STOP, DURATION] = findLongestDuration(FLOW_DATA(:,2), 0, 0.0001);

%Smooth duration graph
[FLOW_DATA(:,1), FLOW_DATA(:,2)] = smoothData(FLOW_DATA(START:STOP,1), FLOW_DATA(START:STOP,2), 20);
plot(FLOW_DATA(:,1),FLOW_DATA(:,2))