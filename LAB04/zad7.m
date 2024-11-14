clear all;
freqSamp = 10e3;
N = 1000;
[y, ~, ~] = zad2_func(freqSamp, N);
[y2, tStart, tEnd] = zad3_func(freqSamp, N);


y = y.';
B = conj(y(end:-1:1, 1));
%% Dodaj szum
A = 100;
noise = A*complex(randn(size(y2)), randn(size(y2)));
y2_with_noise = y2 + noise;


%% Filtracja
y2_with_noise_filtered = filter(B, 1, y2_with_noise);
y2_with_noise_filtered = abs(y2_with_noise_filtered);

% SNR_in
signal_power_in = mean(abs(y2).^2);   
noise_power_in = mean(abs(noise).^2);       
SNR_in = 10 * log10(signal_power_in / noise_power_in);

% SNR_out
spike_max = max(y2_with_noise_filtered);
noise_out = y2_with_noise_filtered;
noise_out(noise_out > A*200) = 0;
noise_power_out = mean(noise_out);
SNR_out = 10 * log10(spike_max / noise_power_out);

fprintf("Noise amplitude: %d\r\n", A);
fprintf("SNR_in: %.03f\r\n", SNR_in);
fprintf("SNR_out: %.03f\r\n", SNR_out);

figure;
plot(noise_out);