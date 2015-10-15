package model;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class ProductJdbcTemplate {
	private DataSource dataSource;
	private JdbcTemplate productTemplate;
	private ProductMapper productMapper;
	public DataSource getDataSource() {
		return dataSource;
	}
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.productTemplate = new JdbcTemplate(dataSource);
	}
	public ProductMapper getProductMapper() {
		return productMapper;
	}
	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}
	
	public Product getProduct(String category,String productId){
		String sql = "select * from " + category + " where productId = ?";
		Product product = productTemplate.queryForObject(sql, new Object[] {productId}, productMapper);
		return product;
	}
	
	public List<Product> listProducts(String category) {
		String sql = "select * from " + category;
		System.out.println(sql);
		List <Product> products = productTemplate.query(sql, productMapper);
		return products;
	}
}
