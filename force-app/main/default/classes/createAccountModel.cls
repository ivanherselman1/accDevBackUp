public class createAccountModel {


	public List<Accounts> Accounts;
    
    public class Accounts {
        
		public String Name;
		public List<aContact> aContacts;
        
	}

	public class aContact {
        
		public String FirstName;
		public String LastName;
        public String AccountName;
        
 }
}