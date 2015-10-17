package model;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.jdbc.core.RowMapper; 

@Component
public class ProductJdbcTemplate {
	@Autowired
	private DataSource dataSource;
	@Autowired
	private JdbcTemplate userTemplate;
	@Autowired
	private ProductMapper productMapper;
	
	public DataSource getDataSource() {
		return dataSource;
	}
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.userTemplate = new JdbcTemplate(dataSource);
	}
	public ProductMapper getProductMapper() {
		return productMapper;
	}
	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}
	
	public Product getProduct(String category,String productId){
		String sql = "select * from footware where productId = ?";
		System.out.println(category);
		Product product = userTemplate.queryForObject(sql, new Object[]{productId}, productMapper);
		return product;
	}
	
	public List<Product> listProducts(String category) {
		String sql = "select * from " + category;
		System.out.println(productMapper);
		List <Product> products = userTemplate.query(sql, productMapper);
		return products;
	}
}
