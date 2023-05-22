clear all; 
close all;
fs = 25;
t = 0:1/fs:1; 
pi = 3.14;
xt = sin(2*pi*t);
subplot (3,1,1);
[t1,x1] = stairs (t,xt);
[d, n] = butter (1,2*pi*0.5/1000);
fl = filter(d,n,x1);
plot(t, xt); 
xlabel("Time");
ylabel("x(t)"); 
title("Modulating Signal")
subplot (3,1,2);
stairs (t, xt);
title("Pulse Amplitude Modulation by Sample Hold")
xlabel("Time"); 
ylabel("m(t)");
subplot (3,1,3);
plot (t1, fl);
title("Demodulated signal of Pulse Amplitude Modulation")
xlabel("Time"); 
ylabel("x(t)");
