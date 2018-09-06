
## MCLPMDA<br> 

&#160; &#160; &#160; &#160;A novel method for miRNA-disease association prediction based on matrix completion and label propagation.<br>

**1.Method Description:** 

&#160; &#160; &#160; &#160;We propose a novel method for miRNA-disease association prediction based on matrix completion and label propagation. Specifically, our method first reconstructs a new miRNA/disease similarity matrix by matrix completion algorithm based on known experimentally verified miRNA-disease associations and then utilizes the label propagation algorithm to reliably predict disease-related miRNAs.  

**2. Usage:**

2.1.  You should completely download the whole project to your personal computer.
  
2.2. You should ensure your personal computer has installed MATLAB environment.
  
2.3. You should import MCLPMDA project to MATLAB workspace.
  
2.4. If you want to use MCLPMDA to get the predicting results, you just need to run 'E_PREDICT.m' ;
  
Then, The program will output files as follows (./Experiments/predict/predict_result.txt):
  
|                                    | hsa-mir-125a | hsa-mir-196a | hsa-mir-499a | ...... |
| ---------------------------------- | ------------ | ------------ | ------------ | ------ |
| Abortion, Habitual                 | 9.522239e-01 | 9.528295e-01 | 9.520322e-01 | ...... |
| Acquired Immunodeficiency Syndrome | 1.469990e-03 | 1.519555e-03 | 8.732708e-04 | ...... |
| ACTH-Secreting Pituitary Adenoma   | 2.600308e-03 | 2.556880e-03 | 1.580478e-03 | ...... |
| Acute Coronary Syndrome            | 1.787939e-03 | 2.401789e-03 | 1.984312e-03 | ...... |
| ......                             | ......       | ......       | ......       | ...... |


2.5 If you want to use global cross validation to verify the performance of MCLPMDA, you just need to run 'E_GCV.m' ;
    
2.6 If you want to use fivefold cross validation to verify the performance of MCLPMDA, you just need to run 'E_FCV.m'; 
  

**3. Contact:**

For any questions regarding our work, please feel free to contact us: sdnuysp@163.com 
