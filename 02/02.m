% Load primates
load primates;

% Monata sequencia de comprimento 6
[nomes, A] = montaA6(primates);

% Calcula o svd truncado para matrizes esparsas
[U, S, V] = svds(A,12);

% Exibe padroes mais relevantes 
s = diag(S);
s = s*(1/sum(s));
plot(s, '*')

% Combinacao dos padroes
Aux = S*V';
Aux5 = Aux(1:5, :); 

% Calculando distancias e montando resultado
calculateDist(Aux5, 'D')
generateSolution(Aux5, 3, 'D', 'result')

% Carrega resultado obitidos da projecao
load result

% Plotando resultado no espaco R3
x = result(1,:); 
y = result(2,:);  
z = result(3,:); 
plot3(x,y,z, 'sr')
grid on

% Cria matriz de distancia para construcao da arvore filogenetica
Dist = pdist(Aux5');
arvore = seqlinkage(Dist, 'single', primates)
view(arvore)

% Agrupa dados para o algoritmo Kmeans
X = [x',y',z'];
opts = statset('Display', 'final');

% Executa o algoritmo de Kmeans
[idx, ctrs] = kmeans(X, 4, 'Distance', 'sqEuclidean', 'Replicates', 10, 'Options', opts);

%Plotando resultado Kmeans do algoritmo no espaco R3
title('Complete genome of the Mithocondrial D-loop for 12 primates')
plot3(X(idx==1,1),X(idx==1,2),X(idx==1,3),'rs', 'MarkerSize', 12)
hold on

plot3(X(idx==2,1),X(idx==2,2),X(idx==2,3),'bo', 'MarkerSize', 12)
hold on

plot3(X(idx==3,1),X(idx==3,2),X(idx==3,3),'m^', 'MarkerSize', 12)
hold on

plot3(X(idx==4,1),X(idx==4,2),X(idx==4,3),'k<', 'MarkerSize', 12)
hold on

% Plotando centroides
plot3(ctrs(:,1),ctrs(:,2),ctrs(:,3),'kx', 'MarkerSize', 12)
plot3(ctrs(:,1),ctrs(:,2),ctrs(:,3),'ko', 'MarkerSize', 12)
grid on

% Adicioando legenda aos centroids
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4', 'Centroides', 'Location', 'NW')