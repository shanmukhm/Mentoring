package businesslogic;



public class Category {
	public static String getCategory(Integer category){
		switch (category) {
		  case 1:
		       return "electronics";
		  case 2: 
			  return "books";
		  case 3:
			  return "clothing";
		  case 4:        
			  return "footware";
		  default:
			  return "electronics";
		}
	}
}
