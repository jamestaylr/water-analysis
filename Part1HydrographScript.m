% Part 1 Hydrograph
% Begin working with stormwater runoff data and hydrograph
DATA4 = readFile('sample-data/flow-data/data-1.csv');
DATA5 = readFile('sample-data/flow-data/data-2.csv');
DATA6 = readFile('sample-data/flow-data/data-3.csv');
FLOW_DATA = truncateData(combine(DATA4, DATA5, DATA6));
plot(FLOW_DATA(:,1),FLOW_DATA(:,2))