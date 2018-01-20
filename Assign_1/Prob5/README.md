##Problem 5

Filter to obtain sample_out.png from sample_inp.png

| sample_inp.png                | sample_out.png                |
| ----------------------------- | ----------------------------- |
| ![img](images/sample_inp.png) | ![img](images/sample_out.png) |

We will use edge detection filter, i.e Sobel filter as in the output figure we can see that a white line appeared when the colour changed from black to white.

Let's do operation on few images,  first applying filter, then apply filter transpose and at the end all three.

### Blur.jpg

**Original Image**

![](images/blur.jpg)

| Convolve blur.jpg with Matrix | Convolve blur.jpg with Matrix Transpose |
| ----------------------------- | --------------------------------------- |
| ![](images/blur_filter.jpg)   | ![](images/blur_filter_transpose.jpg)   |

**Final Image** (formed after adding all the 3)

We will use edge detection filter, i.e Sobel filter as in the output figure we can see that a white line appeared when the colour changed from black to white.![](images/blur_final.jpg)`

### Onion.png

![](images/onion.png)

| Convolve onion.png with Matrix | Convolve onion.png with Matrix Transpose |
| ------------------------------ | ---------------------------------------- |
| ![](images/onion_filter.jpg)   | ![](images/onion_filter_transpose.jpg)   |

**Final Image** (formed after adding all the 3)

![](images/onion_final.jpg)