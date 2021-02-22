public class HarvestClientCallOutValues {
  
    	public List<Client> clients;
        public Integer per_page;
        public Integer total_pages;
        public Integer total_entries;
        //public Object next_page;
        //public Object previous_page;
        public Integer page;
        public Links links;
    
 public class client {
                
		public Integer id;
		public String name;
		public Boolean is_active;
		//public Object address;
		public String statement_key;
		public String created_at;
		public String updated_at;
		public String billcurrency;
        
 
      }
    

	public class Links {
        
		public String first;
		//public Object next;
		//public Object previous;
		public String last;
	 }     
   }