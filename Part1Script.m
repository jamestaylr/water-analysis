% Read in the data files
DATA1 = readFile('sample-data/precipitation-data/data-1.csv');
DATA2 = readFile('sample-data/precipitation-data/data-2.csv');
DATA3 = readFile('sample-data/precipitation-data/data-3.csv');

% Combine all the data sets
DATA = combine(DATA1, DATA2, DATA3);



