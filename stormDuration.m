function [EVENT,DURATION] = stormDuration (RAINFALL_DATA)

EVENT = RAINFALL_DATA > 0;

EVENT = [0 EVENT 0];

% Before the event before the storm ends
BEFORE = find(diff(EVENT));

DURATION = BEFORE(2:2:end) - BEFORE(1:2:end);
