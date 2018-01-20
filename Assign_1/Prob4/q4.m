close all;clear all;
% -------------Q4 (A) Part------------- % 
%{   
NumChannels: 1                          SampleRate: 8000 Hz
Duration: 4.9902 seconds                BitsPerSample: 16 
%}
% 1. Reading a wav file in MATLAB %
audio = audioread('speech_dft_8kHz.wav');
sound(audio);
%pause(6);

% 2. Recording a Sound %
% Record your voice for 5 seconds.
recObj = audiorecorder(44100,24,1); % audiorecorder(Fs,nBits,nChannels) 
disp('Start speaking.');
recordblocking(recObj, 5);
disp('End of Recording.');
Fs = 441000;

% For saving sounf uncomment both the lines%
%filename='kunal.wav';
%audiowrite(filename,y,Fs);

% Store data in double-precision array.
y = getaudiodata(recObj);
disp('Original Sound sampled at 44.1KHz');
sound(y,44100);
pause(6);

% -------------Q4 (B) Part------------- % 
sampled_24 = y(1:round(44100/24000):size(y)); % Sampled at 24KHz %
disp('At 24');
Fs = 24 * 1000;
sound(sampled_24,Fs);
pause(5);

sampled_16 = y(1:round(44100/16000):size(y)); % Sampled at 16KHz %
disp('At 16');
Fs = 16 * 1000;
sound(sampled_16,Fs);
pause(5);

sampled_8 = y(1:round(44100/8000):size(y)); % Sampled at 8KHz %
disp('At 8');
Fs = 8 * 1000;
sound(sampled_8,Fs);
pause(5);

sampled_4 = y(1:round(44100/4000):size(y)); % Sampled at 4KHz %
disp('At 4');
Fs = 4 * 1000;
sound(sampled_4,Fs);
pause(3);

% -------------Q4 (C) Part------------- % 
x = audioread('speech_dft_8kHz.wav');
[y,Fs]=(audioread('mine.wav'));
z=conv(x,y); % convulation in mine
sound(z);
clear y Fs
pause(7);

[y,Fs]=(audioread('recordingstudio.wav'));
z=conv(x,y); % convulation in recording studio
sound(z);
clear y Fs
pause(9);

[y,Fs]=(audioread('smallroom.wav')); 
z=conv(x,y); % convulation in small room
sound(z);
clear y Fs
clear all;
close all;

