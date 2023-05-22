clc;
close all;
clear all;
pi=3.14;
a_m=input("Enter Am :");
a_c=input("Enter Ac :");
f_m=input("Enter fm :");
f_c=input("Enter fc :");


t=0:0.01:10;
x_m=a_m*cos(2*pi*f_m*t);
x_c=a_c*cos(2*pi*f_c*t);
s_ssb1=(a_c*a_m*cos(2*pi*(f_c+f_m)*t))/2;
s_ssb2=(a_c*a_m*cos(2*pi*(f_c-f_m)*t))/2;

x_m1=fft(x_m);
x_c1=fft(x_c);
s_ssb11=fft(s_ssb1);
s_ssb21=fft(s_ssb2);
subplot(4,1,1);
plot(x_m1);
title("Message Signal")
xlabel("Time");
ylabel("Message signal amplitude");

subplot(4,1,2);
plot(x_c1);
title("Carrier Signal");
xlabel("Time");
ylabel("Carrier Signal amplitude");

subplot(4,1,3);
plot(s_ssb11);
title("SSB-SC Signal");
xlabel("Time");
ylabel("AM signal amplitude");

subplot(4,1,4);
plot(s_ssb21);
title("SSB-SC Signal");
xlabel("Time");
ylabel("AM signal amplitude");
