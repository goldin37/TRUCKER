package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class FAQDB {
	private static FAQDB instance=new FAQDB();
	public static FAQDB getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertBoard(FAQ faq) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int number;
		
		try {
			con = getConnection();
			sql="select max(faq_number) from FAQ_Board";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				number=rs.getInt(1)+1;
			}else {
				number=1;
			}
			
			sql="insert into FAQ_Board(faq_number, faq_title, faq_content)"
					+ "values(?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.toKor(faq.getFaq_title()));
			pstmt.setString(3, HanConv.toKor(faq.getFaq_content()));
			
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

	public ArrayList<FAQ> listBoard(String pageNumber){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		int dbCount=0;
		int absoultePage=1;
		
		ArrayList<FAQ> faqlist = new ArrayList<FAQ>();
		
		try {
			con = getConnection();
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(faq_number) from FAQ_Board");
			
			if (pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if (dbCount % FAQ.pageSize == 0) {
				FAQ.pageCount = dbCount / FAQ.pageSize;
			}else {
				FAQ.pageCount = dbCount / FAQ.pageSize + 1;
			}
			
			if (pageNumber != null) {
				FAQ.pageNum = Integer.parseInt(pageNumber);
				absoultePage = (FAQ.pageNum-1) * FAQ.pageSize + 1;
			}
			
//			stmt = con.createStatement();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			String sql="select * from FAQ_Board order by faq_number desc";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absoultePage);
				int count = 0;
				while (count < FAQ.pageSize) {
					FAQ faq= new FAQ();
					faq.setFaq_number(rs.getInt(1));
					faq.setFaq_title(rs.getString(2));
					faq.setFaq_content(rs.getString(3));
					
					faqlist.add(faq);
					
					if (rs.isLast()) {
						break;
					}else {
						rs.next();
					}
					count++;
				}
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
		return faqlist;
	}
		
	public int editBoard(FAQ faq) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		
		try {
			con = getConnection();
			sql="select * from FAQ_Board where faq_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, faq.getFaq_number());
			rs = pstmt.executeQuery();
			
	
			sql="update FAQ_Board set faq_title=?,faq_content=? where faq_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, HanConv.toKor(faq.getFaq_title()));
			pstmt.setString(2, HanConv.toKor(faq.getFaq_content()));
			pstmt.setInt(3, faq.getFaq_number());
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
	
	public FAQ getBoard(int bid) {
		Connection con=null;
		PreparedStatement pstmtUp=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		FAQ faq=null;
		
		try {
			con = getConnection();
			
			sql="select * from FAQ_Board where faq_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				faq=new FAQ();
				faq.setFaq_number(rs.getInt(1));
				faq.setFaq_title(rs.getString(2));
				faq.setFaq_content(rs.getString(3));
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
		return faq;
	}
	
	public int deleteBoard(int faq_number) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		
		try {
			con = getConnection();
			sql="select * from FAQ_Board where faq_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, faq_number);
			rs = pstmt.executeQuery();
			
			
			sql="delete FAQ_Board where faq_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, faq_number);
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
