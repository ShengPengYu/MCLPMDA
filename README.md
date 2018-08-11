
## MCLPMDA 
<br>
A novel method for miRNA-disease association prediction based on matrix completion and label propagation
<br>
**1.Method Description:** 
We propose a novel method for miRNA-disease association prediction based on matrix completion and label propagation. Specifically, our
method first reconstructs a new miRNA/disease similarity matrix by matrix completion algorithm based on known experimentally verified
miRNA-disease associations and then utilizes the label propagation algorithm to reliably predict disease-related miRNAs.  

**2. Usage:**<br> 
  2.1 You should completely download the whole project to your personal computer.<br> 
  2.2 You should ensure your personal computer have installed MATLAB environment.<br> 
  2.3 You should import MCLPMDA project to MATLAB workspace.<br> 
  2.4 If you want to use MCLPMDA to get the predicting results, you just need to run 'E_PREDICT.m' ;<br>
  Then you can find a 'Experiments/predict/predict_result.txt' file. this file is the final predicting results.
  2.5 If you want to use global cross validation to verify the performance, you just need to run 'E_GCV.m' ;<br> 
  2.6 If you want to use local cross validation to verify the performance, you just need to run 'E_LCV.m';<br> 
  2.7 If you want to use fivefold cross validation to verify the performance, you just need to run 'E_FCV.m';<br> 

**3. Contact:**<br> 
For any questions regarding our work, please feel free to contact us: sdnuysp@163.com<br> 
