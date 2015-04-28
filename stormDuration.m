function [EVENT,DURATION] = stormDuration ((DATA(:,1)), DATA(:,2))
%Event is the storm. DATA(:,1) is the first column, time, and
%DATA(:,2) is the rainfall data in the second column
EVENT = DATA(:,2) > 0;

EVENT = [0 EVENT 0];

BEFORE = find(diff(EVENT));
%Before is the event before the storm ends

DURATION = BEFORE(2:2:end) - BEFORE(1:2:end);
