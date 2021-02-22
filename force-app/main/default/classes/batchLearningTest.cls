@isTest
private class batchLearningTest {
    @testSetup

    

    static void setup() {

        List<Account> accounts = new List<Account>();
        List<Contact> contacts = new List<Contact>();
        
        // insert 10 accounts
        for (Integer i=0;i<10;i++) {
            accounts.add(new Account(name='Account '+i,
                billingcity='New York', billingcountry='USA'));
        }
        insert accounts;
        // find the account just inserted. add contact for each
        for (Account account : [select id from account]) {
            contacts.add(new Contact(firstname='first',
                lastname='last', accountId=account.id));
        }
        insert contacts;
    }
    @isTest static void test() {
        Test.startTest();
        batchLearning uca = new batchLearning();
        Id batchId = Database.executeBatch(uca);
        list<account> accList =  new list<account>([select name from account]);
        list<string> accListName = new List<String>();

        for(account a : accList){

            accListName.add(a.Name); 
        }
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        
        System.assertEquals(accListName.size(), [select count() from contact where FirstName IN:accListName]);
    }
}