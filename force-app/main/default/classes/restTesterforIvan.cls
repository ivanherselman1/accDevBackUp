@restResource(urlmapping='/createAccount/*')
global class restTesterforIvan {
    
    @httpPost
    global static void createAccount(){
    
     //Returns the RestRequest object for our Apex REST method.  
     RestRequest request = RestContext.request;  
     //Returns the RestResponse for our Apex REST method.  
     RestResponse response = RestContext.response;  
     system.debug('the Response is '+response.responseBody);
     //Access the request body with input data coming in the JSON format  
     String jSONRequestBody=request.requestBody.toString().trim();  
     
    
      createAccountModel x = new createAccountModel();
      x = (createAccountModel)JSON.deserialize(jSONRequestBody, createAccountModel.class);
     
        
       List<Account> aList = new List<Account>(); 
       Map<String,List<createAccountModel.aContact>> accIdMap = new Map<String,List<createAccountModel.aContact>>();
        
        for(createAccountModel.Accounts a :x.Accounts){
            
            system.debug('the contact list for this account is '+a.aContacts);
            account newAcc = new Account(Name=a.Name);
            aList.add(newAcc);
            accIdMap.put(a.Name, a.aContacts);
            system.debug('whats in the map bro '+accIdMap);
            
          
                       
      }  
        
        dataBase.SaveResult[] srArray  =  database.insert(aList, false);
        List<Account> account4Map = new List<Account>();
        List<id> accIdsInserted   = new List<id>();
        
        for(database.SaveResult sr : srArray){
            
            accIdsInserted.add(sr.getId());
        }
        
        account4Map = [SELECT Id,Name FROM Account WHERE Id IN :accIdsInserted];
        
        List<contact> contToInsert = new List<contact>();
        for(account acc : account4Map){
            
           Map<String, Id> jissusMap = new Map<String,Id>();
           jissusMap.put(acc.Name,acc.Id);
           List<createAccountModel.aContact> listCon = new List<createAccountModel.aContact>();
           listCon = accIdMap.get(acc.Name); 
          
           
            for(createAccountModel.aContact ac : listCon){
                
                contact daCont = new Contact();
                daCont.FirstName = ac.FirstName;
                daCont.LastName  = ac.LastName;
                daCont.AccountId = jissusMap.get(ac.AccountName);
                
                
                contToInsert.add(daCont);
      }
            
    }
     database.SaveResult[] srCunt =   database.insert(contToInsert, false);
        
  }
}