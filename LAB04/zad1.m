clear all;
freqSamp = 10e3;
N = 1000;
tStart = 0;
tEnd = 1/(freqSamp/2)*N;
t = linspace(0, tEnd, N);


freqStart = 0;
freqEnd = 0.1*freqSamp/2;
method = 'linear';
y = chirp(t, freqStart, tEnd, freqEnd, method);

figure;
plot(linspace(tStart, tEnd, length(y)), y);
xlabel("Czas [s]");
ylabel("Amplituda")
name = "images/zad1_signal.png";
resolution_dpi = 400;
exportgraphics(gcf, name, 'Resolution', resolution_dpi);

figure;
plotspec(y, 1);
name = "images/zad1_spectrum.png";
exportgraphics(gcf, name, 'Resolution', resolution_dpi);
