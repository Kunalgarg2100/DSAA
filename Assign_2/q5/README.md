## Problem 5

In this problem, we need to figure of the phone number dialed, ifwe know the sounds of the individual dial tones.

### Approach

- First convert the all the individual dial tones into frequency domain by taking fft.
- Then figure out the total number of dial tones present in input signal and also the start and end time of each dial tone in the number.
- Use STFT, i.e rather than taking the fft of the whole signal, take the fft of each sample in the signal separately. 
- For each sample, take the dot product of the fft of that sample with each of the dial tone. The dial tone with which we get the maximum value of dot product will be the dial tone in that particular sample. 

### Code

1. Finding the fft of individual dial tones and making a matrix.

    ```matlab
    % Calculating fft of each individual dialtone
    num_0 = fft(audioread('audio/0.ogg'));
    num_1 = fft(audioread('audio/1.ogg'));
    num_2 = fft(audioread('audio/2.ogg'));
    num_3 = fft(audioread('audio/3.ogg'));
    num_4 = fft(audioread('audio/4.ogg'));
    num_5 = fft(audioread('audio/5.ogg'));
    num_6 = fft(audioread('audio/6.ogg'));
    num_7 = fft(audioread('audio/7.ogg'));
    num_8 = fft(audioread('audio/8.ogg'));
    num_9 = fft(audioread('audio/9.ogg'));

    % Making a matrix of containing fft of all the numbers
    input_nums = [num_0, num_1, num_2, num_3, num_4, num_5, num_6, num_7, num_8, num_9];
    ```

2. Getting the total number of samples present and time-interval of each sample.

   ```matlab
   [X ,Fs] = audioread(inputFile);
   totalSamples = length(X)/Fs;
   ```

3. Iterating over the totalSamples (from last to first) and getting individual sample.

   ```matlab
   for i = totalSamples:-1:1
       % Getting the samples in order
       curr_sample = audioread(inputFile,[(i-1)*Fs + 1,i*Fs],'double')
   ```

4. Taking the dot product of the current sample with the each of the individual dial tone (loop of 10) and find the max product. This we can get the numbers present in the input signal.

   ```matlab
   for j = 1:10
       temp = dot(fft(curr_sample),input_nums(:,j));
       if temp > max
       	max = temp;
           pos = j-1;
   	end
   end;
   ```

### **Usage**

​	**->Eavesdrop('audio/phonenum.ogg')**

​	9515733002

​	**->Eavesdrop('audio/Police.ogg')** 

​	100