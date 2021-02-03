package dao;
import java.util.*;
import java.sql.*;
import vo.*;
import commons.*;

public class NoticeDao {
	//페이징)전체 공지리스트
	public ArrayList<Notice> selectAllNoticeList(int beginPage, int rowPerPage) throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id,notice_title from notice order by notice_date DESC limit ?,5";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Notice n = new Notice();
			//n.noticeId = rs.getInt("notice_id");
			n.setNoticeId(rs.getInt("notice_id"));
			//n.noticeTitle = rs.getNString("notice_title");
			n.setNoticeTitle(rs.getString("notice_title"));
			list.add(n);
		}
		
		conn.close();
		return list;
	}
	
	public ArrayList<Notice> selectNoticeList() throws Exception{ //�������� �ҷ�����
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select notice_id,notice_title from notice order by notice_date DESC limit 0,5";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Notice n = new Notice();
			//n.noticeId = rs.getInt("notice_id");
			n.setNoticeId(rs.getInt("notice_id"));
			//n.noticeTitle = rs.getNString("notice_title");
			n.setNoticeTitle(rs.getString("notice_title"));
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
			n.setNoticeId(rs.getInt("notice_id"));
			n.setNoticeTitle(rs.getString("notice_title"));
			n.setNoticeContent(rs.getString("notice_content"));
			n.setNoticeDate(rs.getString("notice_date"));
		}
		
		conn.close();
		
		return n;
	}
}
