function [START, STOP] = findEvent(RAW_DATA, TOLERANCE)

    % Gets the max index of the data set
    [m i] = max(RAW_DATA);
    
    % Sets the Boolean flag to false
    zone = false;
    t = 0;
    
    % Starts maximum index and works backwards
    for j = i:-1:2
        START = j;

        % Conintue algorithmic progression
        if(RAW_DATA(j) > RAW_DATA(j-1))
            zone = true;
            continue;

        % If the progression has just been broken
        elseif zone
            zone = false;

            % Increment the counter and break if the value is over the accepted tolerance value
            t = t + 1;
            if(t >= TOLERANCE)
                break;
            end
        else
            % The progression is broken, but it was also previously broken during the last iteration
            continue;
        end
    end
    
    % Sets the Boolean flag to false
    zone = false;
    t = 0;
    
    % Starts maximum index and works forwards
    for k = i:1:length(RAW_DATA)-1
        STOP = k;

        % Conintue algorithmic progression
        if(RAW_DATA(k) < RAW_DATA(k-1))
            zone = true;
            continue;

        % If the progression has just been broken
        elseif zone
            zone = false;

            % Increment the counter and break if the value is over the accepted tolerance value
            t = t + 1;
            if(t >= TOLERANCE)
                break;
            end
        else
            % The progression is broken, but it was also previously broken during the last iteration
            continue;
        end
    end
    
%{
Sample usage:
RESULTS = findEvent(DATA(:, 4), THRESHOLD);
>> This function is deprecated in the current project build
%}