function FFT = recursive_FFT(x)
% Only works if N = 2^k
N = length(x); 
even_part = zeros(1,floor(N/2));
odd_part = zeros(1,floor((N+1)/2));
for i=1:2:N
    odd_part(1,floor((i+1)/2))=x(1,i);
end
for i=2:2:N
    even_part(1,floor(i/2))=x(1,i);
end
if N == 1
    FFT = x;
else
    ODD_FFT = recursive_FFT(odd_part);
    EVEN_FFT = recursive_FFT(even_part);
    FFT = zeros(N,1);
    Exp_vec = exp(-1i*2*pi*((0:N/2-1)')/N);
    tmp = Exp_vec .* EVEN_FFT;
    FFT = [(ODD_FFT + tmp);(ODD_FFT -tmp)];
end
