clear all;
N = 1000;
A = 1;
y = A*complex(randn(1, N), randn(1, N));

y = y.';
B = conj(y(end:-1:1, 1));
%% Dodaj szum
y2_with_noise = repmat(y, 1, 4);


%% Filtracja
y2_with_noise_filtered = filter(B, 1, y2_with_noise);
y2_with_noise_filtered = real(y2_with_noise_filtered);

figure;
plot(linspace(0, 0.8, length(y2_with_noise)), real(y2_with_noise));
xlabel("Czas [s]");
ylabel("Część rzeczywista")

resolution_dpi = 400;
name = "images/zad8_real_signal_unfiltered.png";
exportgraphics(gcf, name, 'Resolution', resolution_dpi);

figure;
plot(linspace(0, 0.8, length(y2_with_noise_filtered)), y2_with_noise_filtered);
xlabel("Czas [s]");
ylabel("Część rzeczywista")

name = "images/zad8_real_signal_filtered.png";
exportgraphics(gcf, name, 'Resolution', resolution_dpi);

