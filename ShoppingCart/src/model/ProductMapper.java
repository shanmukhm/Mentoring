package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class ProductMapper implements RowMapper<Product>{
	@Override
	public Product mapRow(ResultSet rs,int rowNum) throws SQLException{
		Product product = new Product();
		product.setName(rs.getString("name"));
		product.setImgsrc(rs.getString("imgsrc"));
		product.setMrp(rs.getDouble("mrp"));
		product.setSellingPrice(rs.getDouble("selling_price"));
		product.setDelivery(rs.getDouble("delivery"));
		product.setCategory(rs.getString("category"));
		product.setProductId(rs.getString("productId"));
		product.setGender(rs.getString("gender"));
		product.setBrand(rs.getString("brand"));
		product.setPricerange(rs.getString("pricerange"));
		return product;
	}
}
