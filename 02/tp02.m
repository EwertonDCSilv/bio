# Loading primates dataset
load primates;
[nomes, A] = montaA6(primates);

# Calculate svd truncated
[T, S, D] = svds(A, 12); 

# Plot diagonal values
s = diag(S);
plot(s, '*');
plot(s);

s = s*(1/sum(s));
plot(s, '*');


Aux = S*D';
Aux5 = Aux(1:5,:);