function [EVENT,DURATION] = stormDuration (RAINFALL_DATA)
%Event is the storm. DATA(:,1) is the first column, time, and
%DATA(:,2) is the rainfall data in the second column
EVENT = RAINFALL_DATA > 0;

EVENT = [0 EVENT 0];

BEFORE = find(diff(EVENT));
%Before is the event before the storm ends

DURATION = BEFORE(2:2:end) - BEFORE(1:2:end);
