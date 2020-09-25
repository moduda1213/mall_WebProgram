package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import vo.*;
import commons.*;

public class ProductDao {
	public ArrayList<Product> selectProductList() throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		DBUtil dbUtil =new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, product_pic, product_name, product_price from product limit 0,6";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setProductPic(rs.getString("product_pic"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	
	public Product selectProductOne(int productId) throws Exception{
		Product p = new Product();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql ="select * from product where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			p.setProductId(rs.getInt("product_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductContent(rs.getString("product_content"));
			p.setProductSoldout(rs.getString("product_soldout"));
			p.setProductPic(rs.getString("product_pic"));
		}
		
		return p;
	}
}
