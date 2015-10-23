package model;

import java.sql.ResultSet;
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
	public void addProduct(String productId,Integer category,Integer userid){
		String sql = "insert into cart (productId, category, userid) values(?,?,?)";
		userTemplate.update(sql,new Object[]{productId,category,userid});
	}
	public Product getProduct(String category,String productId){
		String sql = "select * from "+ category +" where productId = ?";
		Product product = userTemplate.queryForObject(sql, new Object[]{productId}, productMapper);
		return product;
	}
	public void removeItem(Integer userid, String productId) {
		String sql = "delete from cart where userid = ? and productId = ?";
		userTemplate.update(sql,new Object[]{userid, productId});
	}
	public List<Product> getCart(Integer userid) {
		String sql = "select productId, category, quantity from cart where userid = " + userid;
		List<CartDetails> cartList = userTemplate.query(sql, cartMapper);
		List<Product> productsInCart = new ArrayList<>();
		Product cartItem = null;
		for(CartDetails cart: cartList){
			cartItem = this.getProduct(Category.getCategory(cart.getCategory()),cart.getProductId());
			cartItem.setQuantity(cart.getQuantity());
			productsInCart.add(cartItem);
		}
		return productsInCart;
	}
	public List<Product> listProducts(String category) {
		String sql = "select * from " + category;
		List <Product> products = userTemplate.query(sql, productMapper);
		return products;
	}
	
	public Integer getQuantity(String productId,Integer userid) {
		String sql = "select quantity from cart where userid = ? and productId = ?";
		List<Integer> quantityList = userTemplate.queryForList(sql,new Object[]{userid,productId}, Integer.class);
		Integer quantity = null;
		if(quantityList.isEmpty())
			quantity = 0;
		else
			quantity = quantityList.get(0);
		return quantity;
	}
	
	public void updateQuantity(Integer quantity,String productId,Integer userid) {
		String sql = "update cart set quantity = ? where userid =? and productId =?";
		userTemplate.update(sql, new Object[]{quantity,userid,productId});
	}
}
