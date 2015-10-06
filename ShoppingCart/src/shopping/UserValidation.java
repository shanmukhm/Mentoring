package shopping;
import java.sql.*;
public class UserValidation {
	public static boolean validate(String name,String pass){
		Boolean result=false;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/userdb","root","11me10050");
			String query = "select * from users where username = '"+ name + "' and password = '" + pass + "'";
			Statement state = connection.createStatement();
			ResultSet rs = state.executeQuery(query);
			if(!rs.next())
				result = false;
			else
				result = true;
		}
		catch(Exception ex){System.out.println(ex);}
		return result;
	}
}
