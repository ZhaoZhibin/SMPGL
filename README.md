# SMPGL


This repository contains the implementation details of our paper: [IEEE Transactions on Instrumentation and Measurement]
"[**Sparse Multiperiod Group Lasso for Bearing Multifault Diagnosis**](https://ieeexplore.ieee.org/abstract/document/8675767)" 
by [Zhibin Zhao](https://zhaozhibin.github.io/). 


## About
Bearing fault diagnosis is becoming more and more important for current rotating machinery. How to extract bearing fault signals submerged by heavy background noise is still a challenging problem, especially in the case of multiple faults coupled with each other. In this paper, a novel multifault model called sparse multiperiod group lasso (SMPGL) is proposed to extract the fault feature of every single fault from multifault signals based on the sparsity within and across groups (SWAG) property and the separably periodic prior. Moreover, a fast algorithm is deduced based on the majorization-minimization (MM) algorithm for solving the proposed multifault model and its convergence condition is also analyzed. We investigate the parameter selection thoroughly and provide a deterministic rule for the parameter selection of SMPGL. The main advantages of the proposed method are that users can set the number of compound faults freely, the algorithm is very fast, and parameters are set adaptively. The effectiveness and robustness of SMPGL are verified by simulation studies and two experiment cases. Furthermore, the comparison study shows that the proposed SMPGL method gives more satisfying results than other state-of-the-art methods, including the L1-based method and spectral kurtosis (SK).


## Dependencies
- Matlab R2016b


## Pakages

This repository is organized as:
- [funs](https://github.com/ZhaoZhibin/SMPGL/tree/master/funs) contains the main functions of the algorithm.
- [util](https://github.com/ZhaoZhibin/SMPGL/tree/master/util) contains the extra functions of the test.
- [Results](https://github.com/ZhaoZhibin/SMPGL/tree/master/Results) contains the results of the algorithm.
In our implementation, **Matlab R2016b** is used to perform all the experiments.

## Implementation:
Flow the steps presented below:
-  Clone this repository.
```
git clone https://github.com/ZhaoZhibin/SMPGL.git
open it with matlab
```
-  Test Simulation: Check the parameters setting of simulation in `Test_simulaton.m` and run `Test_simulaton.m`. 



## Citation
If you feel our SMPGL is useful for your research, please consider citing our paper: 

```
@article{zhao2019sparse,
  title={Sparse Multiperiod Group Lasso for Bearing Multifault Diagnosis},
  author={Zhao, Zhibin and Wang, Shibin and Sun, Chuang and Yan, Ruqiang and Chen, Xuefeng},
  journal={IEEE Transactions on Instrumentation and Measurement},
  year={2019},
  publisher={IEEE}
}
```
## Contact
- zhibinzhao1993@gmail.com
