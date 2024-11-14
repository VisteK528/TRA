clear all;

freqSamp = 10e3;
N = 1000;
[y_repeated, tStart, tEnd] = zad3_func(freqSamp, N);

y_real = real(y_repeated);
y_imag = imag(y_repeated);

figure;
plot(linspace(tStart, tEnd, length(y_repeated)), y_real);
xlabel("Czas [s]");
ylabel("Część rzeczywista")
resolution_dpi = 400;
name = "images/zad3_real_signal.png";
exportgraphics(gcf, name, 'Resolution', resolution_dpi);

figure;
plot(linspace(tStart, tEnd, length(y_repeated)), y_imag);
xlabel("Czas [s]");
ylabel("Część zespolona")
name = "images/zad3_imag_signal.png";
exportgraphics(gcf, name, 'Resolution', resolution_dpi);

figure;
plotspec(y_repeated, 1);
name = "images/zad3_spectrum.png";
exportgraphics(gcf, name, 'Resolution', resolution_dpi);