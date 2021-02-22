public class HarvestUserCallOutValues {

    public class JSON2Apex {

	public List<Users> users;
	public Integer per_page;
	public Integer total_pages;
	public Integer total_entries;
	public Object next_page;
	public Object previous_page;
	public Integer page;
	public Links links;
    
}
	public class Links {
		public String first;
		public Object next;
		public Object previous;
		public String last;
	}

	public class Roles {
	}

	public class Users {
        
        List<Contact> cToInsert = new List<Contact>();
        
		public Integer id;
		public String first_name;
		public String last_name;
		public String email;
		public String telephone;
		public String timezone;
		public Integer weekly_capacity;
		public Boolean has_access_to_all_future_projects;
		public Boolean is_contractor;
		public Boolean is_admin;
		public Boolean is_project_manager;
		public Boolean can_see_rates;
		public Boolean can_create_projects;
		public Boolean can_create_invoices;
		public Boolean is_active;
		public Boolean calendar_integration_enabled;
		public Object calendar_integration_source;
		public String created_at;
		public String updated_at;
		public Double default_hourly_rate;
		public Double cost_rate;
		public List<String> roles;
		public String avatar_url;
        
     /*   public users(Map<String, Object> objMap){
            
            this.id = integer.valueOf(objmap.get('id'));
            this.first_name = string.valueOf(objmap.get('first_name'));
            this.last_name  = string.valueOf(objmap.get('last_name'));
            system.debug('###userIds are ' +this.id);
            
            contact c = new contact();
            c.firstName = this.first_name;
            c.LastName  = this.last_name;
            c.HarvId__c = this.id;
            
            cToInsert.add(c);
            
            upsert cToInsert;
            
    */        
            
  }	
}