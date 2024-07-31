# Multi-Operational-Image-Resizing
A Content Aware Multi-Operational Image Resizing Using Seam Carving And Image Scaling

This repository contains the implementation of a multi-operational image resizing method using Dynamic Time Warping (BDW). The project is based on the paper ["Multi-operator media retargeting"](https://dl.acm.org/doi/abs/10.1145/1531326.1531329).

## Overview

In this project, we implement a method for image resizing that optimizes the order and number of operations (seam carving or scaling) to achieve the best quality resized image. The quality of the resized image is assessed using the Bi-Directional Warping (BDW) formula.

## Bi-Directional Warping (BDW) Formula

The BDW formula is a 2-D relaxed version of the Dynamic Time Wrap (DTW) algorithm used to calculate the quality of a resized image based on the original image. The formula is given by:

 
$$BDW(S, T) = \frac{1}{N_S} \sum_{i=1}^{h} \text{A-DTW}(S_i, T_i) + \frac{1}{N_T} \sum_{i=1}^{h} \text{A-DTW}(T_i, S_i)$$

Where:
- S and T are the original and resized images, respectively.
- N_S  and N_T are the number of segments in the original and resized images, respectively.
- A-DTW is the Asymmetric Dynamic Time Warping distance between image segments.

## Implementation Details

The project involves the following steps:

1. **Dynamic Programming Approach:** We use a dynamic programming approach to decide whether to seam carve or scale the image at each iteration.
2. **Score Calculation:** At each iteration, the score of the current operation is calculated using the BDW formula.
3. **Optimal Resizing Sequence:** Based on the scores, we determine the optimal number and order of operations (seam carving or scaling) to get the best quality resized image.

