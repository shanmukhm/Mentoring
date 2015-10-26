package dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import model.User;
import model.UserMapper;

@Component
public class UserJdbcTemplate {
	@Autowired
	private JdbcTemplate userTemplate;
	@Autowired
	private UserMapper userMapper;
	
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
	public void addUser(User user) {
		String sql = "INSERT INTO users(username,password,mobile,gender) values(?,?,?,?)";
		userTemplate.update(sql,new Object[]{user.getUsername(),user.getPassword(),user.getMobile(),user.getGender()});
	}
}
