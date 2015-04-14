function [DATA] = readFile(FILENAME)

	% Try to open the file
	FID = fopen(FILENAME, 'rt');

	% If the file cannot be found, return
	if (FID == -1)
		disp('Error: File not found');
		DATA = -1;
		return;
	end

	% Get the number of columns in the file, delimited by a comma
	LINE = fgetl(FID);
    L = length(find(LINE==',')) + 1;

    % Make the regex expression
    D = '%s';

    % Iterate each column in the file, building the regex
    for i = 1:1:(L-1)
    	D = strcat(D, '%f');
    end

    % Get the data using textscan
	DATA = textscan(FID, D,'Delimiter',',', 'HeaderLines', 1);
	DATA = [datenum(DATA{1}) DATA{2}]; % Octave bug #36563

	% close the file
	fclose(FID);

end

%{
	Sample usage:
	FILENAME = input('Type the name of the data set: ', 's');
	DATA = readFile(FILENAME);
}