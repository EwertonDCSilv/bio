disp("Trabalho pratico 1");

% Define matrix A 
A = [0 0 0 1 0
    0 0 0 0 1 
    0 0 0 0 1
    1 0 1 0 0
    1 0 0 0 0
    0 1 0 0 0
    1 0 1 1 0
    0 1 1 0 0
    0 0 1 1 1
    0 1 1 0 0];

% Execute SVD for matrix A
[T, S, D] = svd(A);

% Get diagonal values
combinations = S * D';

% Get values for ploting
x = combinations(1,:);
y = combinations(2,:);
plot(x, y, '^r');
grid on;
hold on;
plot(0,0,'^b');

% Queryy vector column 
query = [ 0;
          0;
          0;
          0;
          0;
          0;
          0;
          1;
          1;
          1];

%query = zeros (1,10);
T2 = T(:, 1:2);
projection = T2' * query;
plot(projection(1), projection(2), 'sk'); 

% Set title of documents
for i=1:5
    istr = num2str(i);
    text(x(i), y(i), ['Doc' istr]);
end

% Set title of chart
text(projection(1), projection(2), 'Query');
title("Exemplo: recuperação de informação");
xlabel("Padrão 1");
ylabel("Padrão 2");

% Calc distances
distances = 1 - pdist2([x;y]',projection','cosine');
disp ("Disntancias:");
disp (distances);

% Check reconst]
disp("Checando reconstrução da matriz A (1 equals, 0 different):")
disp(norm(A - T*S*D',2) ~= 0)
