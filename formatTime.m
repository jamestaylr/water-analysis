function formatTime(TIME_DATA)
    % Make sure the the plot function is called before calling this
    % function
    
    % Labels the x-coordinate axis as time in hours and minutes
    set(gca, 'XTickLabel', datestr(TIME_DATA, 'HH:MM PM'));