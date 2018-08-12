clear all;
close all;

X = audioread('audio/message2.wav');
p  = audioinfo('audio/message2.wav');
Fs = p.SampleRate;
L = p.TotalSamples;

% Making the time axis
T = 1/Fs;
t = (0:L-1)*T;

% Plot of Original Signal in time domain
figure;
plot(t,X)
title('Original Signal in Time domain')
xlabel('t (seconds)')
ylabel('X(t)')

P1 = fft(X);

%%% Plot of Original Signal in frequency domain

% For ploting single conjugate of figure
% Y1 = abs(P1);
% Y1 = Y1(1:L/2+1);
% f1 = Fs*(0:(L/2))/L;
% figure;plot(f1,Y1);

% For plotting both the conjugates
Y1 = abs(P1);
f = Fs*(1:(L))/L;
figure;plot(f,Y1);

title('Original Signal in Frequency domain')
xlabel('f (Hz)')
ylabel('|P1(f)|')

l = length(P1);

% Defining the sub-frequency domains
domain = 1:l/8;
domain_1 = domain;
domain_2 = domain + 1*l/8;
domain_3 = domain + 2*l/8;
domain_4 = domain + 3*l/8;
domain_5 = domain + 4*l/8;
domain_6 = domain + 5*l/8;
domain_7 = domain + 6*l/8;
domain_8 = domain + 7*l/8;

% Copying the fft of original signal
P2 = P1;

% Reconstructing the signal by changing fft 
P2(domain_1) = P1(domain_4);
P2(domain_2) = P1(domain_3);
P2(domain_3) = P1(domain_2);
P2(domain_4) = P1(domain_1);
P2(domain_5) = P1(domain_8);
P2(domain_6) = P1(domain_7);
P2(domain_7) = P1(domain_6);
P2(domain_8) = P1(domain_5);

% Plotting the New fft

% For ploting single conjugate of figure
% Y2 = abs(P2);
% Y2 = Y2(1:L/2+1);
% f1 = Fs*(0:(L/2))/L;
% figure;plot(f1,Y2);

% For plotting both the conjugates
Y2 = abs(P2);
f = Fs*(1:(L))/L;
figure;plot(f,Y2);

title('Reconstructed Signal in Frequency domain')
xlabel('f(Hz)')
ylabel('|P2(f)|')

% Inverting the reconstructed signal back to time domain
m = ifft(P2);
sound(real(m),Fs);

% Plot of Reconstructed Signal in time domain
figure;
plot(t,m)
title('Reconstructed Signal in Time domain')
xlabel('t (seconds)')
ylabel('X(t)')

% To save the audio file
% filename = 'audio/decrypted_message2.wav';
% audiowrite(filename,abs(m),Fs);