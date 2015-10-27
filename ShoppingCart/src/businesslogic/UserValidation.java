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
	      List<User> users = userJDBCTemplate.validateUser(user.getUsername(), user.getPassword());
	      if(!users.isEmpty())
	    	  isPresent = true;
	      return isPresent;
	}
	public String checkRegistration(String username,String mobile){
		String result = "nothing";
		List<User> users = userJDBCTemplate.checkUsername(username);
	      if(!users.isEmpty())
	    	  result = "name";
	      List<User> users2 = userJDBCTemplate.checkMobile(mobile);
	      if(!users2.isEmpty())
	    	  result = "mobile";
	      if(!users.isEmpty()&&!users2.isEmpty())
	    	  result = "both";
	      return result;
	}
	
}
