public class batchLearningExecute implements Schedulable {

 public void execute(schedulableContext sc){
     
     batchLearning be = new batchLearning();  
	 database.executeBatch(be);
     
  }    
}