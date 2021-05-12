package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.Notice;
import myUtil.HanConv;

public class NoticeDB {
	private static NoticeDB instance=new NoticeDB();
	public static NoticeDB getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertBoard(Notice notice) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int number;
		
		try {
			con = getConnection();
			sql="select max(notice_number) from Notice_Board";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				number=rs.getInt(1)+1;
			}else {
				number=1;
			}
			
			sql="insert into Notice_Board(notice_number, notice_title, notice_content, notice_date, notice_hit)"
					+ "values(?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.toKor(notice.getNotice_title()));
			pstmt.setString(3, HanConv.toKor(notice.getNotice_content()));
			pstmt.setTimestamp(4, notice.getNotice_date());
			pstmt.setInt(5, notice.getNotice_hit());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 1;
	}

	public ArrayList<Notice> listBoard(){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		ArrayList<Notice> boardList = new ArrayList<Notice>();
		
		try {
			con = getConnection();
			stmt = con.createStatement();
			String sql="select * from Notice_Board order by notice_number desc";
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				Notice notice = new Notice();
				notice.setNotice_number(rs.getInt(1));
				notice.setNotice_title(rs.getString(2));
				notice.setNotice_content(rs.getString(3));
				notice.setNotice_date(rs.getTimestamp(4));
				notice.setNotice_hit(rs.getInt(5));
				
				boardList.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return boardList;
	}
	
	public Notice getBoard(int bid, boolean hitadd) {
		Connection con=null;
		PreparedStatement pstmtUp=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		Notice notice=null;
		
		try {
			con = getConnection();
			
			if (hitadd == true) {
				sql="update Notice_Board set notice_hit = notice_hit + 1 where notice_number = ?";
				pstmtUp = con.prepareStatement(sql);
				pstmtUp.setInt(1, bid);
				pstmtUp.executeUpdate();
				pstmtUp.close();
			}
			
			sql="select * from Notice_Board where notice_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				notice=new Notice();
				notice.setNotice_number(rs.getInt(1));
				notice.setNotice_title(rs.getString(2));
				notice.setNotice_content(rs.getString(3));
				notice.setNotice_date(rs.getTimestamp(4));
				notice.setNotice_hit(rs.getInt(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return notice;
	}
	
	public int editBoard(Notice notice) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		
		try {
			con = getConnection();
			sql="select * from Notice_Board where notice_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice.getNotice_number());
			rs = pstmt.executeQuery();
			
	
			sql="update Notice_Board set notice_title=?,notice_content=? where notice_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, HanConv.toKor(notice.getNotice_title()));
			pstmt.setString(2, HanConv.toKor(notice.getNotice_content()));
			pstmt.setInt(3, notice.getNotice_number());
			pstmt.executeUpdate();
			re=1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	public int deleteBoard(int notice_number) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		
		try {
			con = getConnection();
			sql="select * from Notice_Board where notice_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_number);
			rs = pstmt.executeQuery();
			
			
			sql="delete Notice_Board where notice_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_number);
			pstmt.executeUpdate();
			re=1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
}
