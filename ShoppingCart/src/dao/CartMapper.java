package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import model.CartDetails;
@Component
public class CartMapper implements RowMapper<CartDetails>{
	@Override
	public CartDetails mapRow(ResultSet rs,int rowNum) throws SQLException{
		CartDetails cart = new CartDetails();
		cart.setCategory(rs.getInt("category"));
		cart.setProductId(rs.getString("productId"));
		cart.setQuantity(rs.getInt("quantity"));
		return cart;
	}
}
