t=0:0.0001:1;
a=5;
fm=input('Enter Message Freq = ');
fc=input('Enter Carrier Freq = ');
fs=input('Enter Sampling Freq (fs>=2*fc) = ');
m=5;
sm=a*sin(2*pi*fm*t);
subplot(4,1,1);
plot(t,sm);
xlabel('time');
ylabel('amplitude');
title('Message signal');
grid on
sc=a*sin(2*pi*fc*t);
subplot(4,1,2);
plot(t,sc);
xlabel('time');
ylabel('amplitude');
title('carrier signal');
grid on
sfm=a*sin((2*pi*fc*t)+(m.*sin(2*pi*fm*t)));
subplot(4,1,3);
plot(t,sfm);
xlabel('time');
ylabel('amplitude');
title('Modulated signal');
grid on
fdev=fc+10;
fdem=fmdemod(sfm,fc,fs,fdev);
subplot(4,1,4);
plot(t,fdem);
xlabel('time');
ylabel('amplitude');
title('Demodulated signal');
grid on
