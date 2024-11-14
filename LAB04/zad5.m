clear all;
freqSamp = 10e3;
N = 1000;

[y, ~, ~] = zad2_func(freqSamp, N);
[y2, tStart, tEnd] = zad3_func(freqSamp, N);


y = y.';
B = conj(y(end:-1:1, 1));
%% Dodaj szum
A = 0.01;
noise = A*complex(randn(size(y2)), randn(size(y2)));
y2_with_noise = y2 + noise;


%% Filtracja
y2_with_noise_filtered = filter(B, 1, y2_with_noise);
y2_with_noise_filtered = abs(real(y2_with_noise_filtered));

figure;
plot(linspace(tStart, tEnd, length(y2_with_noise)), real(y2_with_noise));
xlabel("Czas [s]");
ylabel("Część rzeczywista")

resolution_dpi = 400;
name = "images/zad5_real_signal_unfiltered_noise_A=" + string(A) + ".png";
exportgraphics(gcf, name, 'Resolution', resolution_dpi);

figure;
plot(linspace(tStart, tEnd, length(y2_with_noise_filtered)), abs(y2_with_noise_filtered));
xlabel("Czas [s]");
ylabel("Część rzeczywista")

name = "images/zad5_real_signal_filtered_noise_A=" + string(A) + ".png";
exportgraphics(gcf, name, 'Resolution', resolution_dpi);

