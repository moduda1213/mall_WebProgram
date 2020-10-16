package dao;
import vo.*;
import commons.*;
import java.util.*;
import java.sql.*;

public class UsersDao {
	// 회원 리스트 출력
	public Users selectUserId(String userId) throws Exception{
		System.out.println(userId+"<--userId dao");
		
		Users users= null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select user_id, user_pw, user_check, user_name, user_withdrawal from user where user_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, userId);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			users=new Users();
			users.setUsersId(rs.getString("user_id"));
			System.out.println(users.getUsersId()+"<--user.getUsersId()dao");
			users.setUsersPw(rs.getString("user_pw"));
			System.out.println(users.getUsersPw()+"<--user.getUsersPw()dao");
			users.setUsersCheck(rs.getString("user_check"));
			users.setUsersName(rs.getString("user_name"));
			System.out.println(users.getUsersName()+"<--user.getUsersName()dao");
			users.setUsersWithdrawal(rs.getString("user_withdrawal"));
		}
	
		return users;
	}
	
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
		
		String sql = "insert into user(user_id,user_pw,user_check,user_name) VALUES(?,?,?,?)"; // sql문이 틀렸다
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,users.getUsersId());
		stmt.setString(2,users.getUsersPw());
		stmt.setString(3,users.getUsersCheck());
		stmt.setString(4,users.getUsersName());
		stmt.executeUpdate();
		
		conn.close();
	}
	
	// 유저 아이디 찾기
	public ArrayList<String> findUserId(String usersName) throws Exception{
		ArrayList<String> list = new ArrayList<String>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select user_id from user where user_name =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, usersName);
		ResultSet rs = stmt.executeQuery();
		
	
		while(rs.next()) {
			String name= rs.getString("user_id");
			list.add(name);
		}
		
		conn.close();
		return list;
	}
	
	//회원 pw -> 아이디 / 질문 일치 여부
	public boolean searchIdCheck(Users users) throws Exception{
		boolean ck = false; // 일치하면 true, 불일치시 false 
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select user_pw from user where user_id=? and user_check=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,users.getUsersId());
		stmt.setString(2, users.getUsersCheck());
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) { //  id / 질문 일치할 경우
			ck = true;
		}
		
		conn.close();
		return ck;
	}
	
	//pw 변경
	public void updateUsersPw(Users users) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update user set user_pw=? where user_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,users.getUsersPw());
		stmt.setString(2,users.getUsersId());
		stmt.executeUpdate();
		
		conn.close();
	}
	
	public void wdrUser(Users users) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql="update user set user_withdrawal=? where user_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,users.getUsersWithdrawal());
		stmt.setString(2,users.getUsersId());
		stmt.executeUpdate();
		
		conn.close();
	}
}
