package dao;
import vo.*;
import commons.*;
import java.sql.*;

public class UsersDao {
	public String usersLogin(Users users) throws Exception{
		String userId = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select user_id from user where user_id=? and user_pw=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, users.getUsersId());
		stmt.setString(2, users.getUsersPw());
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			userId = rs.getString("user_id");
		}
		
		conn.close();
		return userId;
	}
	
	public void signUpUser(Users users) throws Exception{
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "insert into user(user_id,user_pw,user_check,user_name) VALUES(?,?,?,?)"; // sqlπÆ¿Ã ∆≤∑»¥Ÿ
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,users.getUsersId());
		stmt.setString(2,users.getUsersPw());
		stmt.setString(3,users.getUsersCheck());
		stmt.setString(4,users.getUsersName());
		stmt.executeUpdate();
		
		conn.close();
	}
	
}
