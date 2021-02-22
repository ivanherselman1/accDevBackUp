Global class ContactBatchClass implements DataBase.Batchable<SObject>, Database.stateful {
    
    
	 Global final List<Id> contIds = new List<id>();
     Global List<Contact> contsToUpdate = new List<Contact>(); 
    
     Global ContactBatchClass(List<Id> idsFromInstClass){
      idsFromInstClass = contIds; 
    	
    }
    
    Global database.QueryLocator start (Database.BatchableContext BC){
    string query = 'SELECT Id  FROM Contact WHERE Id IN:contIds';
    return database.getQueryLocator(query);  
    }
    
    Global void execute(Database.BatchableContext BC, List<Contact> Scope){
        for(Contact c : Scope){
            c.AccountId = '0014K000005ahsTQAQ';
            contsToUpdate.add(c);
        }  
    }
    
    global void finish(Database.BatchableContext BC){
        update contsToUpdate;
    }
}