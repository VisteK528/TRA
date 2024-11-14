clear all;
freqSamp = 10e3; N = 1000;
[y, ~, ~] = zad2_func(freqSamp, N);
[y_repeated, tStart, tEnd] = zad3_func(freqSamp, N);

y = y.';
B = conj(y(end:-1:1, 1));
y_repeated_filtered = filter(B, 1, y_repeated);
y_filtered_real = abs(real(y_repeated_filtered));

figure;
plot(linspace(tStart, tEnd, length(y_repeated)), abs(y_filtered_real));
xlabel("Czas [s]");
ylabel("Część rzeczywista")

resolution_dpi = 400;
name = "images/zad4_real_signal.png";
exportgraphics(gcf, name, 'Resolution', resolution_dpi);
