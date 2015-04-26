Data1 = readFile('sample-data/precipitation-data/data-1.csv');
Data2 = readFile('sample-data/precipitation-data/data-2.csv');
Data3 = readFile('sample-data/precipitation-data/data-3.csv');

Y = vertcat(Data1(:,2), Data2(:,2), Data3(:,2));
X = vertcat(Data1(:,1), Data2(:,1), Data3(:,1));

disp(size(X));
disp(size(Y));
disp(size(horzcat(X, Y)));
B = horzcat(X, Y);

E = findMultipleEvents(B(:,2), 0.0001);

disp(E);

