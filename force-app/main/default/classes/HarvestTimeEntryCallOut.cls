public class HarvestTimeEntryCallOut {
    
	
    Public static void HarvestTimeEntryCallOut(){
        
  //PERFORM ORIGINAL CALL OUT TO GET THE NUMBER OF PAGES. EACH PAGE HAS 100 TIME ENTRIES 
   
   String TimeEntryEndPoint = 'https://api.harvestapp.com/v2/time_entries';
        
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(TimeEntryEndPoint);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Accept', 'application/json');
        request.setHeader('User-Agent', 'MyApp (ivan@exah.co.za)');
        request.setHeader('Authorization', 'Bearer 1848717.pt.QDXsfn5UNvNEkjFmgAiSJ6yxfUN2iF39Q47eAeEM9MByz47jwqvrH725wcDQzqcYiM-_Uh4g6BQ_fzv58EIUvw');
        request.setHeader('Harvest-Account-Id','1055284');
        
        
        
        HttpResponse res = new HttpResponse();
        
            res = http.send(request);
            system.debug('the response is '+res.getBody());
        
        Map<String, Object> Results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody()); //DESERIALISE RESPONSE 1 INTO RESULT MAP VARIABLE
        
        Integer total_pages;
        
        total_Pages = (Integer)results.get('total_pages'); //GET TOTAL PAGES
      	system.debug('number of pages '+total_pages);
        

       HarvTimeEntryMultipleCallOut.callOutToHarvest(TimeEntryEndpoint, total_pages);
        
    /*    HarvestTimeEntryCallOutValues calloutResponse = (HarvestTimeEntryCallOutValues) JSON.deserialize(res.getBody(), HarvestTimeEntryCallOutValues.class);
            system.debug('Response map after conversion'+ calloutResponse);
            
            List<TimeEntry__c> timeEntries = new List<TimeEntry__c>();
            for (HarvestTimeEntryCallOutValues.TimeEntry timeEntry : calloutResponse.time_entries) {
                timeEntries.add(
                	new TimeEntry__c(
                    	HarvestId__c = timeEntry.id,
                      	rounded_hours__c = timeEntry.rounded_hours
                    )
                );
            }
            system.debug('Time entry salesforce List: '+ timeEntries);
        system.debug('List size: '+ timeEntries.Size());
     
      
        
  */         
  }    
}