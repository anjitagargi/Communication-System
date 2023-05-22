t=0:0.0001:1;
fm=1;
fc=10;
fs=10000;
Am=1;
m=Am*sin(2*pi*fm*t);
s=1.03*Am.*sawtooth(2*pi*fc*t);
n=length(s);
pwm=[];
for i=1:n
    if(m(i)>=s(i))
        pwm(i)=1;
    else
        pwm(i)=0;
    end
end
ppm=[];
for i=1:n
    if(m(i)>=s(i))
        ppm(i)=1;
    else
        ppm(i)=0;
    end
end
for i=1:(length(s)-1)
    if(ppm(i)==1 && ppm(i+1)==0)
        ppm(i)=1;
    else
        ppm(i)=0;
    end
end
subplot(4,1,1);
plot(t,m);
xlabel("Time");
ylabel("Magnitude");
title("Message Signal");
subplot(4,1,2);
plot(t,pwm);
xlabel("Time");
ylabel("Magnitude");
title("Pulse Width Modulation");
subplot(4,1,3);
plot(t,ppm);
xlabel("Time");
ylabel("Magnitude");
title("Pulse position Modulation");
subplot(4,1,4);
x_recov=demod(ppm,fc,fs,'ppm');
plot(x_recov);
xlabel("Time");
ylabel("Magnitude");
