public class ExecuteBatchableclass {
    
    public ExecuteBatchableClass(){
        string a = 'howzit';
        List<Account> accList = new List<Account>();
        CreateOrderHeaderObject oh = new CreateOrderHeaderObject();
        
        database.executeBatch(oh, 1000);
    }
  }