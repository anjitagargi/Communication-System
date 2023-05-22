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
%% DSB SC MODULATION AND DEMODULATION.
%===========DSB SC IN TIME DOMAIN==================
dsb_sc = msg.*carrier; %dsb sc modulated wave
%=====DSB SC IN FREQUENCY DOMAIN============
ld=length(dsb_sc);
f=linspace(-fs/2,fs/2,ld);
DSB_SC=fftshift(fft(dsb_sc,ld)/ld); %frequency spectrum of dsb_sc modulated signal.
%=====DSB SC DEMODULATION TIME DOMAIN============
pmo = 2*dsb_sc.*carrier; %product modulator output
pmo = pmo/Ac;
nf = fm/fs; %normalised frequency
[num, den] = butter(5,3*nf); %butter worth lpf of 5th order
msg_r = filter(num,den,pmo); %demodulated signal after passing through lpf
%=====DSB SC DEMODULATION FREQUENCY DOMAIN============
lr=length(msg_r);
fr=linspace(-fs/2,fs/2,lr); %frequency bins
MSG_R=fftshift(fft(msg_r,lr)/lr); %frequency spectrum of demodulated signal
%================ PLOTTING =========================
subplot(4,1,1);
plot(t, msg);
title("MESSAGE SIGNAL (TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
subplot(4,1,2);
plot(t, carrier);
title("CARRIER SIGNAL (TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
subplot(4,1,3);
plot(t, dsb_sc);
title("MODULATED DSB SC SIGNAL (TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
subplot(4,1,4);
plot(t, msg_r);
title("DEMODULATED DSB SC SIGNAL (TIME DOMAIN)");
xlabel('time (sec)');
ylabel('amplitude');
grid on;
figure;
subplot(2,1,1);
plot(f, abs(DSB_SC));
xlim([-15 15]);
title('DSB SC MODULATION IN FREQUENCY DOMAIN');
xlabel('frequency(hz)');
ylabel('amplitude');
grid on;
subplot(2,1,2);
plot(fr, abs(MSG_R));
xlim([-6 6]);
title('DSB SC DE MODULATION IN FREQUENCY DOMAIN');
xlabel('frequency(hz)');
ylabel('amplitude');
grid on;