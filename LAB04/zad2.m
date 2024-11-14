clear all;

freqSamp = 10e3;
N = 1000;
[y, tStart, tEnd] = zad2_func(freqSamp, N);

y_real = real(y);
y_imag = imag(y);

figure;
plot(linspace(tStart, tEnd, length(y)), y_real);
xlabel("Czas [s]");
ylabel("Część rzeczywista")
resolution_dpi = 400;
name = "images/zad2_real_signal.png";
exportgraphics(gcf, name, 'Resolution', resolution_dpi);

figure;
plot(linspace(tStart, tEnd, length(y)), y_imag);
xlabel("Czas [s]");
ylabel("Część zespolona")
name = "images/zad2_imag_signal.png";
exportgraphics(gcf, name, 'Resolution', resolution_dpi);

figure;
plotspec(y, 1);
name = "images/zad2_spectrum.png";
exportgraphics(gcf, name, 'Resolution', resolution_dpi);

