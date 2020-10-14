function [frequencia] = slidwindow6(s)
frequencia = zeros(1,4096);
s = strtrim(s);
[m,n]=size(s);
s = upper(s);
s = strtrim(s);
for i=1:(n-(6-1))

    janela = strcat(s(i),s(i+1), s(i+2),s(i+3),s(i+4),s(i+5));
    p = criapos6(janela);
    if p ~= 0
        frequencia(p) = frequencia(p)+1;
   
    end
end
frequencia = sparse(frequencia);
end

