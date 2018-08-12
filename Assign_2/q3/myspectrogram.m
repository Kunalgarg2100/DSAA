function S = myspectrogram(x, win_size, len_stride)
step = win_size - len_stride;

% offset array containing the start points of each step
offset = [ 1 : step : length(x)-win_size ];

% Initailing the short fourier trnsform with zeros for each step
S = zeros (length(offset),win_size);

% Calculating the STFT for each small step
for i=1:length(offset)
    S(i,1:win_size) = abs(fft(x(offset(i):offset(i)+win_size-1).*gausswin(win_size)));
end

figure, imshow(log(S(:,1:win_size)).');