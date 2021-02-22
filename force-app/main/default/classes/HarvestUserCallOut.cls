public class HarvestUserCallOut {

    Public static void HarvestUserCallOut(){
        
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.harvestapp.com/v2/users');
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Accept', 'application/json');
        request.setHeader('User-Agent', 'MyApp (ivan@exah.co.za)');
        request.setHeader('Authorization', 'Bearer 1848717.pt.QDXsfn5UNvNEkjFmgAiSJ6yxfUN2iF39Q47eAeEM9MByz47jwqvrH725wcDQzqcYiM-_Uh4g6BQ_fzv58EIUvw');
        request.setHeader('Harvest-Account-Id','1055284');
        
        HttpResponse res = new HttpResponse();
        
            res = http.send(request);
            system.debug('the response is '+res.getBody());
        
     Map<String, Object> Results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody()); 
     List<Object> users =  (List<Object>)Results.get('users');
        system.debug('###da resuls are  '+users);
        
       for(Object o : users){
             
            Map<String, Object> objMap = (Map<String,Object>) o; 
            system.debug('### map passed is ' +objMap);
            HarvestUserCallOutValues.users h =  new HarvestUserCallOutValues.users(objMap);
	  }
     }

    }