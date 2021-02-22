global class CreateOrderHeaderObject implements DataBase.Batchable<Sobject>, DataBase.Stateful{
    
    global Database.QueryLocator start(database.BatchableContext bc){
        string query = 'SELECT Name FROM ACCOUNT';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope){
        TestBig__b yoB = new TestBig__b();
        system.debug(scope);
        for(Account bb : scope){
            
            yoB.OrderHeaderId__c = bb.Name;
            
            
        }  
        
        database.insertImmediate(yoB);
        system.debug(yoB);
    }
    
  global void finish(Database.BatchableContext bc){
         
 }
}