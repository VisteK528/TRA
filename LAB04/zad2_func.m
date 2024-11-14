function [y, tStart, tEnd] = zad2_func(freqSamp, N)
    tStart = 0;
    tEnd = 1/(freqSamp/2)*N;
    t = linspace(0, tEnd, N);
    
    
    freqStart = 0;
    freqEnd = 0.1*freqSamp/2;
    method = 'complex';
    y = chirp(t, freqStart, tEnd, freqEnd, 'linear', method);
end