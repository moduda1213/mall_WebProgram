package dao;
import java.util.*;
import java.sql.*;
import vo.*;
import commons.*;

public class NoticeDao {
	public ArrayList<Notice> selectNoticeList() throws Exception{ //�������� �ҷ�����
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id,notice_title from notice order by notice_date limit 0,2";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Notice n = new Notice();
			n.noticeId = rs.getInt("notice_id");
			n.noticeTitle = rs.getNString("notice_title");
			list.add(n);
		}
		
		conn.close();
		return list;
	}
	
	public Notice selectNoticeOne(int noticeId) throws Exception{ // �������� �󼼺���
		Notice n = new Notice();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id,notice_title,notice_content,notice_date from notice where notice_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,noticeId);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			n.noticeId = rs.getInt("notice_id");
			n.noticeTitle = rs.getString("notice_title");
			n.noticeContent = rs.getString("notice_content");
			n.noticeDate = rs.getString("notice_date");
		}
		
		conn.close();
		
		return n;
	}
}
