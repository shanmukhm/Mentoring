package model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import businesslogic.Category;

import org.springframework.jdbc.core.RowMapper; 

@Component
public class ProductJdbcTemplate {
	@Autowired
	private DataSource dataSource;
	@Autowired
	private JdbcTemplate userTemplate;
	@Autowired
	private ProductMapper productMapper;
	@Autowired 
	private CartMapper cartMapper;
	
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
	public void addProduct(String productId,String category,Integer userid){
		String sql = "insert into cart (productId, category, userid) values(?,?,?)";
		userTemplate.update(sql,new Object[]{productId,category,userid});
	}
	public Product getProduct(String category,String productId){
		String sql = "select * from "+ category +" where productId = ?";
		System.out.println(category);
		Product product = userTemplate.queryForObject(sql, new Object[]{productId}, productMapper);
		return product;
	}
	public void removeItem(Integer userid, String productId) {
		String sql = "delete from cart where userid = ? and productId = ?";
		userTemplate.update(sql,new Object[]{userid, productId});
	}
	public List<Product> getCart(Integer userid) {
		String sql = "select productId, category from cart where userid = " + userid;
		List<CartDetails> cartList = userTemplate.query(sql, cartMapper);
		List<Product> productsInCart = new ArrayList<>();
		Product cartItem = null;
		for(CartDetails cart: cartList){
			cartItem = this.getProduct(cart.getProductId(), cart.getCategory());
			cartItem.setQuantity(cart.getQuantity());
			productsInCart.add(cartItem);
		}
		return productsInCart;
	}
	public Product getProduct(String productId, Integer category) {
		
		String sql = "select * from "+ Category.getCategory(category) +" where productId = ?" ;
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
