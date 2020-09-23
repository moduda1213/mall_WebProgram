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
			p.productId = rs.getInt("product_id");
			p.productPic = rs.getString("product_pic");
			p.productName = rs.getString("product_name");
			p.productPrice = rs.getInt("product_price");
			list.add(p);
		}
		conn.close();
		return list;
	}
}
