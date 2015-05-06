function formatTime(TIME_DATA)
    
    % Labels the x-coordinate axis as time in hours and minutes
    set(gca, 'XTickLabel', datestr(TIME_DATA, 'HH:MM PM'));

%{
Sample usage:
formatTime(DATA(:,1));
%}