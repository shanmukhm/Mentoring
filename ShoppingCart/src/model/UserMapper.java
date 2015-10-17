package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class UserMapper implements RowMapper<User>{
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User user = new User();
		user.setUserid(rs.getInt("userid"));
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setMobile(rs.getString("mobile"));
		user.setGender(rs.getString("gender"));
		return user;
	}
}
