function [DATA] = readFile(FILENAME)

% Try to open the file
FID = fopen(FILENAME, 'rt');

% If the file cannot be found, return
if (FID == - 1)
    disp('Error: File not found');
    DATA = - 1;
    return;
end

% Get the number of columns in the file, delimited by a comma
LINE = fgetl(FID);
L = length(find(LINE == ',')) + 1;

% Make the regex expression
D = '%s';

% Iterate each column in the file, building the regex
for i = 1:1:(L - 1)
    D = strcat(D, '%f');
end

% Get the data using textscan
DATA = textscan(FID, D, 'Delimiter', ',', 'HeaderLines', 1);

try
	A = datenum(DATA{1});

	for j=2:1:L
		A = horzcat(A, DATA{j}); % Octave bug #36563
	end
	
	DATA = A;

catch ME
    disp('The data is malformed!');
 
    return;
end

% Close the file
fclose(FID);

%{
Sample usage:
FILENAME = input('Type the name of the data set: ', 's');
DATA = readFile(FILENAME);
%}