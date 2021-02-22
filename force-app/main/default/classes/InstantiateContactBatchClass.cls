Global class InstantiateContactBatchClass implements Schedulable {
    
    Global List<Contact> contQ = new List<Contact>();
    Global List<Id> contIdInst = new List<Id>();
    global void execute(SchedulableContext SC){
        
        
        contQ = [SELECT Id, AccountId FROM Contact];
        
        
        for(Contact c : contQ){
            contIdInst.add(c.Id);
        }
        ContactBatchClass CB = new ContactbatchClass(contIdInst);
        database.executeBatch(CB);
    }
}