function [START, STOP] = findEvent(RAW_DATA, TOLERANCE)
    [m i] = max(RAW_DATA);
    
    zone = false;
    t = 0;
    
    for j = i:-1:2
        START = j;
        if(RAW_DATA(j) > RAW_DATA(j-1))
            zone = true;
            continue;
        elseif zone
            zone = false;
            t = t + 1;
            if(t >= TOLERANCE)
                break;
            end
        else
            continue;
        end
    end
    
    zone = false;
    t = 0;
    
    for k = i:1:length(RAW_DATA)-1
        STOP = k;
        if(RAW_DATA(k) < RAW_DATA(k-1))
            zone = true;
            continue;
        elseif zone
            zone = false;
            t = t + 1;
            if(t >= TOLERANCE)
                break;
            end
        else
            continue;
        end
    end
    
    