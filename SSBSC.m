clear;
clc;
t = 0:0.001:5; %time.
fm = 1;%frequency of message signal.
fc = 10;%frequency of carrier signal.
fs=100*fc;%sampling frequency.
Am = 5;%Amplitude of message signal.
Ac = 5;%Amplitude of carrier signal.
msg =Am.*cos(2*pi*fm*t);%message signal.
carrier = Ac.*cos(2*pi*fc*t);%carrier signal.
%% SSB SC MODULATION AND DEMODULATION.
%===========SSB SC IN TIME DOMAIN==================
ssb_scu = (Ac*Am)/2*cos(2*pi*(fc+fm)*t); %ssb sc modulated wave
ssb_scl = (Ac*Am)/2*cos(2*pi*(fc-fm)*t);
%=====SSB SC IN FREQUENCY DOMAIN============
ld=length(ssb_scu);
f=linspace(-fs/2,fs/2,ld);
SSB_SCU=fftshift(fft(ssb_scu,ld)/ld); %frequency spectrum of ssb_sc modulated signal.
SSB_SCL=fftshift(fft(ssb_scl,ld)/ld);
%=====SSB SC DEMODULATION TIME DOMAIN============
pmou = ssb_scu.*cos(2*pi*fc*t); %product modulator output
pmol = ssb_scl.*cos(2*pi*fc*t);
nf = fm/fs; %normalised frequency
[num, den] = butter(5,3*nf); %butter worth lpf of 5th order
msg_ru = filter(num,den,pmou); %demodulated signal after passing through lpf
msg_rl = filter(num,den,pmol);
%=====SSB SC DEMODULATION FREQUENCY DOMAIN============
lr=length(msg_ru);
fr=linspace(-fs/2,fs/2,lr); %frequency bins
MSG_R=fftshift(fft(msg_ru,lr)/lr); %frequency spectrum of demodulated signal
%================ PLOTTING =========================
subplot(3,2,1);
plot(t, msg);
title("MESSAGE SIGNAL (TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
subplot(3,2,2);
plot(t, carrier);
title("CARRIER SIGNAL (TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
subplot(3,2,3);
plot(t, ssb_scu);
title("MODULATED SSB SC SIGNAL UPPER SIDEBAND (TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
subplot(3,2,4);
plot(t, ssb_scl);
title("MODULATED SSB SC SIGNAL LOWER SIDEBAND (TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
subplot(3,2,5);
plot(t, msg_ru);
title("DEMODULATED SSB SC SIGNAL USB(TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
subplot(3,2,5);
plot(t, msg_rl);
title("DEMODULATED SSB SC SIGNAL LSB(TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
figure;
subplot(3,1,1);
plot(f, abs(SSB_SCU));
xlim([-15 15]);
title('SSB SC USB MODULATION IN FREQUENCY DOMAIN');
xlabel('frequency(hz)');
ylabel('amplitude');
grid on;
subplot(3,1,2);
plot(f, abs(SSB_SCL));
xlim([-15 15]);
title('SSB SC LSB MODULATION IN FREQUENCY DOMAIN');
xlabel('frequency(hz)');
ylabel('amplitude');
grid on;
subplot(3,1,3);
plot(fr, abs(MSG_R));
xlim([-6 6]);
title('SSB SC DE MODULATION IN FREQUENCY DOMAIN');
xlabel('frequency(hz)');
ylabel('amplitude');
grid on;