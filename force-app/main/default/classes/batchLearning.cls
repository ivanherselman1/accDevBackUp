public class batchLearning implements Database.Batchable<SObject>, Database.Stateful{
    
    public list<string> accIds = new list<string>();
    public list<contact> contList = new List<contact>();
    public map<id,string> accMap = new map<id,string>();
    
    public Database.QueryLocator start(database.BatchableContext BC){
        
        string query = 'SELECT Id FROM Account' ; 
       
        system.debug('the query is '+query);
        return Database.getQueryLocator('SELECT Id,Name FROM Account');
       
    }
    
  public void execute(Database.BatchableContext BC, List<Account> scope){
      
      system.debug('WE HAVE ENTERED THE EXECUTE METHOD');
      list<contact> contsToUpdate = new List<contact>();
    
      for(account a : scope){
          
          accIds.add(a.id); 
          accMap.put(a.id,a.name);
          
      }
      
      contList = [SELECT Id,FirstName,LastName,Account.id FROM Contact WHERE account.id IN:accIds] ; 
      
      
      
      for(contact c : contList) {
          
          contact ac = new contact();
          c.FirstName = accMap.get(c.AccountId);
          contsToUpdate.add(c);
          
      }
      system.debug('thelist of contacts to upsert are '+contlist);
      try{ 
        
      	database.upsert(contsToUpdate);
      }
      
      catch(exception e){
          
		system.debug(e.getCause()) ;         
      }
     
           
      } //end of execute   
    
	      
      public void finish(Database.BatchableContext BC){
  }
}