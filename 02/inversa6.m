function s = inversa6(endereco)
% computa a sequencia correspondente ao endereco
alfabeto = 'GCAT';
p = zeros (1, 6);
k = endereco;
p(1) = floor(k/1024);
if (k - p(1)*1024) > 1.00E-10 
  p(1) = p(1) + 1;
end
k = k - (p(1) - 1)*1024;
p(2) = floor(k/256);
if (k - p(2)*256) > 1.00E-10
  p(2) =  p(2) + 1;
end
k = k - (p(2) - 1)*256;
p(3) = floor(k/64);
if (k - p(3)*64) > 1.00E-10
    p(3) = p(3) + 1;
end
k = k - (p(3)-1)*64;
p(4) = floor(k/16);
if (k - p(4)*16) > 1.00E-10
    p(4) = p(4) +1;
end
k= k -(p(4)-1)*16;
p(5) = floor(k/4);
if (k - p(5)*4) > 1.00E-10
    p(5) = p(5)+1;
end


k = k - (p(5)-1)*4;
p(6) = k;
if p(6) == 0
  p(6) = 1;
end
s = '';
p
for i = 1:6
    s = [s, alfabeto(p(i))];
end

end
