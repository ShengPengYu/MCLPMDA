package cn.rocket.glnp;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

import org.nd4j.linalg.api.ndarray.INDArray;
import org.nd4j.linalg.ops.transforms.Transforms;

import cn.rocket.glnp.Parameters.Type;
import cn.rocket.glnp.utils.GUIutils;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

/**
 * function: The main job    
 * @author Yu ShengPeng
 *
 */

public class Job {
	
	public static INDArray method(INDArray dSimMatrix, INDArray mSimMatrix,INDArray interMatrix){
		return ite(dSimMatrix,interMatrix,Type.D).mul(1-Parameters.BETA).add(ite(mSimMatrix,interMatrix,Type.M).mul(Parameters.BETA));
	}
	
	
	public static INDArray ite(INDArray simMatrix,INDArray interMatrix,Type type) {
			INDArray last = interMatrix.dup();                                                                                        //Initialize the fist result as
			INDArray next =  null ;
			double error = 1;
			while(error > Parameters.EPSILON) {                                                                                        //Iterating until convergence
				next =  type==Type.D?simMatrix.mul(Parameters.ALPHA).mmul(last).add(interMatrix.mul(1-Parameters.ALPHA))
						:simMatrix.mul(Parameters.ALPHA).mmul(last.transpose()).transpose().add(interMatrix.mul(1-Parameters.ALPHA));  //label propagation                                                               // normalize the result
				error =Transforms.pow(last.sub(next),2.0).sumNumber().doubleValue();                                                   //Calculate the error between the last result and the next result
				last = next ;
				//System.out.println(error);
			}
			return last ;
	}
	
	public static void saveResult2Txt(INDArray matrix,String filename, Boolean setZero) throws Exception {
		//All known interactions dont't make  contribution to the predicting result (set the known related score as a very small number )
		if(setZero)
			for(int i = 0 ; i < Datas.INT.rows() ;i++)
				for(int j = 0 ; j < Datas.INT.columns() ;j++)
					if(Datas.INT.getDouble(i, j) == 1.0)
						matrix.putScalar(i, j, -1000);
		
		File file = new File(filename);
		BufferedWriter writer = new BufferedWriter(new FileWriter(file)) ;
		for(int i = 0 ; i < matrix.rows() ;i++) {
			ArrayList<Map.Entry<String, Double>> list = new ArrayList<Map.Entry<String, Double>>();
			LinkedHashMap<String, Double> temp = new LinkedHashMap<String, Double>() ;
			INDArray row = matrix.getRow(i);
			for(int j = 0 ; j < row.columns() ;j++) {
				//System.out.println(row.getDouble(0, j));
				temp.put(Datas.MFS_NAME.get(j), row.getDouble(0, j));
			}
			for(Map.Entry<String, Double> entry : temp.entrySet())
				list.add(entry);
		
			//sort the result use 
			Collections.sort(list, (o1,o2)-> o2.getValue().compareTo(o1.getValue())) ;
			
			StringBuffer str = new StringBuffer(Datas.DSS_NAME.get(i));
			str.append("\t");
			for(int k = 1 ; k <= 100 ;k++) {
				//str.append(list.get(k-1).getKey()+"("+list.get(k-1).getValue()+")");
				str.append(list.get(k-1).getKey());
				str.append("\t");
			}
			str.append("\n");
			writer.write(new String(str));
		}
		writer.close();
		
		System.out.println("File save finished");
	}
	
	
	
	/*
	public static void saveSecondCaseStudyResult(String diseaseName, String filename) throws Exception {
		int pos = 0 ;
		INDArray temp_int = Datas.INT.dup();
		for(int i = 0 ; i < Datas.DSS_NAME.size() ;i++) {
			if(Datas.DSS_NAME.get(i).equals(diseaseName)) pos = i ;
		}
		for(int j = 0 ; j < Datas.INT.columns() ;j++) {
			temp_int.putScalar(pos, j, 0) ;
		}
		INDArray result = Job.method(RSM.S_D,RSM.S_M, temp_int);	
		saveResult2Txt(result,filename, false);
	}
	
	public static void main(String[] args) throws Exception {
		INDArray result = Job.method(RSM.S_D,RSM.S_M, Datas.INT);	
		//GUIutils.showMatrixGUI(result, "");
		saveResult2Txt(result.dup(),"resources/predictresult/NewPrediction.txt",true);
		saveResult2Txt(result.dup(),"resources/predictresult/AddPrediction.txt", false);
		saveSecondCaseStudyResult("Colorectal Neoplasms", "resources/predictresult/SecondCaseStudy.txt");
	}*/
}
