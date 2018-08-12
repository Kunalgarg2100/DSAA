
function [ number ] = Eavesdrop(inputFile)

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

number = uint64(0);
[X ,Fs] = audioread(inputFile);
totalSamples = length(X)/Fs;
% Iterating over the totalSamples present in the audio
for i = 0:totalSamples-1
    max = 0;
    pos = -1;
    % Getting the samples in order
    curr_sample = audioread(inputFile,[(i)*Fs + 1,(i+1)*Fs]);
    
    % Taking dot product of each sample, with every number
    % and finding the maximum product
    for j = 1:10
        temp = dot(fft(curr_sample),input_nums(:,j));
        if temp > max
            max = temp;
            pos = j-1;
        end
    end
    
    % Making the number number
    number = number*10 + pos;
end
end