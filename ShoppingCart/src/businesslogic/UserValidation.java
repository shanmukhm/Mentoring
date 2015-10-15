package businesslogic;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.User;
import model.UserJDBCTemplate;


public class UserValidation {
	public static ApplicationContext context = 
            new ClassPathXmlApplicationContext("Beans.xml");
	public static Boolean validate(User user) {
		
		Boolean isPresent = false;
	      UserJDBCTemplate userTemplate = 
	      (UserJDBCTemplate)context.getBean("userJDBCTemplate");
	      List<User> users = userTemplate.listUsers();
	      for(User u: users){
	    	  if(u.getUsername().equals(user.getUsername()) && u.getPassword().equals(user.getPassword()))
	    		  isPresent = true;
	      }
	      return isPresent;
	}
}
