% Step 1: Generate the message signal
fs = 1000;                    % Sample rate (Hz)
t = 0:1/fs:1;                 % Time vector (1 second duration)
f_message = 10;               % Message signal frequency (Hz)
message_signal = sin(2*pi*f_message*t);  % Sinusoidal message signal

% Step 2: Generate the carrier signal
f_carrier = 100;              % Carrier frequency (Hz)
carrier_signal = sin(2*pi*f_carrier*t);  % Sinusoidal carrier signal

% Step 3: Perform amplitude modulation
modulated_signal = message_signal .* carrier_signal;

% Step 4: Demodulate using an envelope detector
rectified_signal = abs(modulated_signal);  % Rectify the modulated signal
cutoff_freq = 10;                          % Cutoff frequency for the low-pass filter (adjust as needed)
demodulated_signal = lowpass(rectified_signal, cutoff_freq, fs);  % Apply low-pass filter

% Plotting
figure;
subplot(4, 1, 1);
plot(t, message_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message Signal');

subplot(4, 1, 2);
plot(t, modulated_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Modulated Signal');

subplot(4, 1, 3);
plot(t, rectified_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Rectified Signal');

subplot(4, 1, 4);
plot(t, demodulated_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Demodulated Signal');

% Under modulation
under_modulation_factor = 0.5;
under_modulated_signal = (1 + under_modulation_factor * message_signal) .* carrier_signal;
under_demodulated_signal = lowpass(abs(under_modulated_signal), cutoff_freq, fs);

% Critical modulation
critical_modulation_factor = 1;
critical_modulated_signal = (1 + critical_modulation_factor * message_signal) .* carrier_signal;
critical_demodulated_signal = lowpass(abs(critical_modulated_signal), cutoff_freq, fs);

% Over modulation
over_modulation_factor = 1.5;
over_modulated_signal = (1 + over_modulation_factor * message_signal) .* carrier_signal;
over_demodulated_signal = lowpass(abs(over_modulated_signal), cutoff_freq, fs);

% Plotting under, critical, and over modulation cases
figure;
subplot(3, 2, 1);
plot(t, message_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message Signal');

subplot(3, 2, 2);
plot(t, under_modulated_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Under Modulated Signal');

subplot(3, 2, 3);
plot(t, message_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message Signal');

subplot(3, 2, 4);
plot(t, critical_modulated_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Critical Modulated Signal');

subplot(3, 2, 5);
plot(t, message_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message Signal');

subplot(3, 2, 6);
plot(t, over_modulated_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Over Modulated Signal');
