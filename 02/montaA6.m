function [nomes, A] = montaA6(seqs)
%montaA6 transforma as sequencias descritas em
%   seqs (obtidas pelo readfasta) em pontos (colunas de A)
%   
m = size(seqs, 2);
nomes = cell(m);
n = 4^6;
A = sparse (n, m);
for j = 1:m
    j
    s = seqs(j).Sequence;
    A(:, j) = slidwindow6(s);
end
end

