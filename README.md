## MCLPMDA
A novel method for miRNA-disease association prediction based on matrix completion and label propagation

**1.Method Description:**<br> 
We propose a novel method for miRNA-disease association prediction based on matrix completion and label propagation. Specifically, our\<br>  method first reconstructs a new miRNA/disease similarity matrix by matrix completion algorithm based on known experimentally\<br>  verified miRNA-disease associations and then utilizes the label propagation algorithm to reliably predict disease-related miRNAs. \<br> 
\<br> 
**2.Method Requirements:**\<br> 
(1). The project was developed based on a matrix library named ND4j(https://nd4j.org/). \<br> 
(2). In order to introduce the project documents more clearly, I put all the source code on the front page.\<br> 
(3). As GitHub has upload capacity limit, I did not upload the third party jar package, only uploaded the core code of the project. It \<br>        can be downloaded directly  from the official web(https://nd4j.org/)\<br> 

**3. File list:**\<br> 
3.1. Datas.java----------------It is a class for storing data sets needed for experiments.\<br> 
3.2. Job.java------------------The prediction work is done in this class.\<br> 
3.3. RSM.java------------------Using Global Linear neighborhoods to reconstruct the similarity network.\<br> 
3.4. Parameters.java-----------recorded the super parameters used in this project\<br> 

**4. Folder list:**\<br> 
4.1. dataset-------------------The data set used in the project is placed in this folder.
  4.1.1. dss.mat---------------Disease similarity network,It is a Matlab format data 
  4.1.2. dssname.txt-----------Recorded the all diseases name.
  4.1.3. interaction.mat-------Recordeed the all disease-miRNA associations.
  4.1.4. mfs.mat---------------miRNA similarity network,It is a Matlab format data 
  4.1.5. mfsname.mat-----------Recorded the all miRNAs name.
4.2. output--------------------The prediction results produced by our method.
  4.2.1. add_prediction.txt----The prediction results based on known disease-miRNA associations.
  4.2.2. new_-rediction.txt----The results based on removing all known disease-miRNA associations.
4.3. utils---------------------A tool set 
  4.3.1. GUIutils.java---------Showing the matrix by GUI.
  4.3.2. LoadDataUtils.java----Loading data to memory.
4.4 clusterONE-----------------A library for clustering.
  4.4.1 cluster_one-1.0.jar----A jar package for clustering.
  
**5. Usage:**
To run our method, simply open the "job.java" script in java programming environment or other java IDE tools (e.g. Eclipse) and press 
"Run" button. Another option is to run our script using the command line format by two steps: (1)javac Job.java (2) java Job 


6. Contact:
For any questions regarding our work, please feel free to contact us: sdnuysp@163.com
