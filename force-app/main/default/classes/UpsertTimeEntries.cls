public class UpsertTimeEntries {

    public static void UpsertTimeEntries(List<TimeEntry__c> teListToUpsert){
        
        database.upsert(teListToUpsert);
        system.debug('The List to Upsert hy is'+teListToUpsert);
    }
}