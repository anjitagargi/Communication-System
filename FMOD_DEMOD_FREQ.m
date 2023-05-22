% Parameters
Fs = 1000;             % Sampling frequency (Hz)
t = 0:1/Fs:1;           % Time vector (1 second)
fc = 100;              % Carrier frequency (Hz)
kf = 50;                % Frequency deviation constant

% Message signal
fm = 10;               % Message frequency (Hz)
m = sin(2*pi*fm*t);     % Message signal

% FM modulation
sfm=5*sin((2*pi*fc*t)+kf*(m));
% FM demodulation
fdev=fc+10;
fdem=fmdemod(sfm,fc,Fs,fdev);

% Frequency spectrum
f = (-Fs/2):(Fs/length(t)):(Fs/2 - Fs/length(t));
m_spectrum = abs(fftshift(fft(m)));
sfm_spectrum = abs(fftshift(fft(sfm)));
fdem_spectrum = abs(fftshift(fft(fdem)));

% Plotting the Results
figure;

subplot(4, 1, 1);
plot(t, m);
title('Original Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4, 1, 2);
plot(t, sfm);
title('FM Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4, 1, 3);
plot(t, fdem);
title('Demodulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4, 1, 4);
plot(f, sfm_spectrum);
title('FM Modulated Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

figure;
plot(f, m_spectrum);
title('Original Message Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

figure;
plot(f, fdem_spectrum);
title('Demodulated Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
