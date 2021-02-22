trigger TestBigObTrigger on Account (before insert) {
    
        CreateOrderHeaderObject Oh = new CreateOrderHeaderObject();
    	database.executeBatch(Oh);
        
    }