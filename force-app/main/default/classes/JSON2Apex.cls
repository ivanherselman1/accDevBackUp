public class JSON2Apex {

	public GeelPiet gp;

	public class GeelPiet {
		public String JSonString;
	}

	
	public static JSON2Apex parse(String json) {
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
        
	}
}