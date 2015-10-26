package businesslogic;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Component;

import dao.UserJdbcTemplate;
import model.User;

@Component
public class UserValidation {
//	public static ApplicationContext context = 
//            new ClassPathXmlApplicationContext("Beans.xml");
	@Autowired
	private UserJdbcTemplate userJDBCTemplate;
	public Boolean validate(User user) {
		Boolean isPresent = false;
//	      UserJDBCTemplate userTemplate = 
//	      (UserJDBCTemplate)context.getBean("userJDBCTemplate");
	      List<User> users = userJDBCTemplate.listUsers();
	      for(User u: users){
	    	  if(u.getUsername().equals(user.getUsername()) && u.getPassword().equals(user.getPassword()))
	    		  isPresent = true;
	      }
	      return isPresent;
	}
	
}
