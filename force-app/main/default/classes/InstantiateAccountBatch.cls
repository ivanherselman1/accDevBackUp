global class InstantiateAccountBatch Implements Schedulable{
    
    Global List<Id> idsToPass = new List<Id>(); 
    
    global void execute(SchedulableContext SC){
        List<Account> accL = new List<Account>();
        accL = [SELECT Id, type FROM Account WHERE type = 'Prospect'];
        
        for(Account a : accL){
            idsTopass.add(a.id);  
        }
     batchAccountUpdateClass b = new batchAccountUpdateClass(IdsToPass);  
     database.executeBatch(b);
        
    }
  }