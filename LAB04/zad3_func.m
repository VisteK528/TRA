function [y_repeated, tStart, tEnd] = zad3_func(freqSamp, N)

[y, tStart, tEnd] = zad2_func(freqSamp, N);
reapeated_nb = 4;
y_repeated = repmat(y, 1, reapeated_nb);
tEnd = tEnd * reapeated_nb;

end