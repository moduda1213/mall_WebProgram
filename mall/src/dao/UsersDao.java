package dao;
import vo.*;
import commons.*;
import java.sql.*;

public class UsersDao {
	public Users usersLogin(Users users) throws Exception{
		Users userIdPw = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select user_id, user_pw from user";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			userIdPw = new Users();
			userIdPw.usersId = rs.getString("user_id");
			userIdPw.usersPw = rs.getString("user_pw");
		}
		
		conn.close();
		return userIdPw;
	}
	
	public void signUpUser(Users users) throws Exception{
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "insert into user(user_id,user_pw,user_check,user_name) VALUES(?,?,?,?)"; // sqlπÆ¿Ã ∆≤∑»¥Ÿ
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,users.usersId);
		stmt.setString(2,users.usersPw);
		stmt.setString(3,users.usersCheck);
		stmt.setNString(4,users.usersName);
		stmt.executeUpdate();
		
		conn.close();
	}
	
}
