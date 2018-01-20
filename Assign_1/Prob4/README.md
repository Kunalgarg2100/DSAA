## Problem 4

### Reading a wav file in MATLAB

The audio we read is `speech_dft_8KHz.wav` which has sample rate of 8000 Hz, Bits per sample are 16 and Number of Channels is 1.

```matlab
audio = audioread('speech_dft_8kHz.wav');
sound(audio);
```

### Recording a Sound

Audio is recorded at sample rate of 44.1 KHz, having 24 bits per sample and number of channels is 1.

```matlab
recObj = audiorecorder(44100,24,1); % audiorecorder(Fs,nBits,nChannels) 
disp('Start speaking.');
recordblocking(recObj, 5);
disp('End of Recording.');
y = getaudiodata(recObj);
disp('Original Sound sampled at 44.1KHz');
sound(y,44100);
```

### Sampling data at a particular frequency

Let's say we want to sample the audio at some random frequency, lets say it is f KHz. We select an element from y(recorded audio) after every $round(44100/f)$ elements.

```matlab
sampled_24 = y(1:round(44100/24000):size(y)); % Sampled at 24KHz %
disp('At 24');
Fs = 24 * 1000;
sound(sampled_24,Fs);
pause(4);
```

### Convulation with another sound

If we want to simulate in some different environment then we can convulate the sound with impulse response of that environment.

```matlab
x = audioread('speech_dft_8kHz.wav');
[y,Fs]=(audioread('mine.wav'));
z=conv(x,y); % convulation in mine
sound(z);
```
