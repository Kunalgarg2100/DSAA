### Problem 3

------

### Dimensions of Output Image

We have **N** square filters each of size **F**. Let the size of the image be **(Width, Height, Channels).** The
convolution is done with a step size of **S** units, and the input is also padded with a zero padding
of **Z.**

The size of image after zero padding will be **\[W + 2Z, H + 2Z, Channels\]**.

Now the filter with step length S units applied. Hence the output size will be
$$
output width = (W - F + 2*P)/S + 1\\
output height = (H- F + 2*P)/S + 1
$$
Total convulation in a channel = $outputwidth * outputheight$.
We will apply this recursively. Let the output of image after $(i-1)^{th}$ convulation be $W_{i-1},H_{i-1}$. Then
$$
W_i = (W_{i-1} - F + 2P)/S + 1\\H_i = (H_{i-1} - F + 2P)/S+1
$$
### Operations Performed

For one convulation:- The number of multiplications at each step is $F^2$ and the number of additions is $F^2-1$. The total number of additions and muplications for one input channel will be $(2F^2 -1) * outputwidth * outputheight$.

For N such convulations:

- Number of additions after N covulations will be $\sum_{i=0}^{n-1} (W_i * H_i) * (F^2-1) * channels$ 
- Number of mutiplications after N covulations will be $\sum_{i=0}^{ n-1}  (W_i * H_i) * F^2 * channels$
- Total operations will be $ \sum_{i=0}^{n-1} (W_i * H_i) * (2F^2-1) * channels $ 
