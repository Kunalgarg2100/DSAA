% Input Vector %
Input = [12, 20, 3, 10, 22, 19, 23, 16, 0, 21, 23, 16, 18];

% Output Vector %
Output = [75, 52, 33, 97, 251, 211, 63, 65];

m = length(Input); % Length of input vector %
n = length(Output); % Length of output vector %

% Filter will be of size m-n+1 as we are using a linear filter
% Therefore we construct a Matrix with size n * (m-n+1)
M = ones(n,m-n+1);

for i = 1:n
   % Constructing rows of matrix M and each row has m-n+1 elements
   M(i,:) = Input(i:i+m-n); 
end

% Input(n * (m-n+1)) * answer((m-n+1) * 1) = Output'(n * 1)
answer = pinv(M) * Output';
disp('Filter coefficients are : ')
disp(round(answer))
