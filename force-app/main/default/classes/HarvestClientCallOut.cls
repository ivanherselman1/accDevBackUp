public class HarvestClientCallOut {

public static void HarvestClientCallOut(){
    
String TimeEntryEndPoint = 'https://api.harvestapp.com/v2/clients';
        
        
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
        

      // HarvestClientMultipleCallOut.callOutToHarvest(TimeEntryEndpoint, total_pages);
  }
}