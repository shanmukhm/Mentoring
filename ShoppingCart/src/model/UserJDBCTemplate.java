package model;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
public class UserJDBCTemplate {
	@Autowired
	private DataSource dataSource;
	@Autowired
	private JdbcTemplate userTemplate;
	@Autowired
	private UserMapper userMapper;
	
//	public void setUserTemplate(JdbcTemplate userTemplate) {
//		this.userTemplate = userTemplate;
//	}
//	
//	public void setUserMapper(UserMapper userMapper){
//		this.userMapper = userMapper;
//	}
//	
//	public void setDataSource(DataSource dataSource) {
//		this.dataSource = dataSource;
//		this.userTemplate = new JdbcTemplate(dataSource);
//	}
	
	public User getUser(String name) {
		String sql = "select * from users where username = ?";
		User user = userTemplate.queryForObject(sql, new Object[]{name}, userMapper);
		return user;
	}
	
	public List<User> listUsers() {
	      String SQL = "select * from users";
	      List <User> users = userTemplate.query(SQL,userMapper);
	      return users;
	   }
}
