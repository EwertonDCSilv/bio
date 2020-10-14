function [endereco] = criapos6(janela)
alfabeto = 'GCAT';
endereco = 0;
i = find(alfabeto==janela(1));
if isempty(i) == 1
    i = 0;
end
j = find(alfabeto==janela(2));
if isempty(j) == 1
    j = 0;
end
k = find(alfabeto==janela(3));
if isempty(k) == 1
    k = 0;
end
l = find(alfabeto==janela(4));
if isempty(l) == 1
    l = 0;
end
m = find(alfabeto==janela(5));
if isempty(m) == 1
    m = 0;
end
n = find(alfabeto==janela(6));
if isempty(n) == 1
    n = 0;
end
if (i ==0)||(j==0)||(k==0)||(l==0)||(m==0)||(n==0)
    disp('janela invalida...')
     
else
    endereco = 1024*(i-1)+256*(j-1)+64*(k-1)+16*(l-1)+4*(m-1)+n;
end
end

