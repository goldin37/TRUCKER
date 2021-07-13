package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.Inquiry;
import board.InquiryDB;
import myUtil.HanConv;

public class InquiryDB {
	private static InquiryDB instance=new InquiryDB();
	public static InquiryDB getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertBoard(Inquiry inquiry) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int number;
		
		int id = inquiry.getInquiry_number();
		int ref = inquiry.getInquiry_ref();
		int step = inquiry.getInquiry_step();
		int level = inquiry.getInquiry_level();
		
		try {
			con = getConnection();
			sql="select max(inquiry_number) from Inquiry_Board";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				number=rs.getInt(1)+1;
			}else {
				number=1;
			}
			
			if (id != 0) {
				sql ="update Inquiry_Board set inquiry_step = inquiry_step + 1 where inquiry_ref = ? and inquiry_step > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				
				step = step + 1;
				level = level + 1;
			} else {
				ref = number;
				step = 0;
				level = 0;
			}
			
			sql="insert into Inquiry_Board(inquiry_number, inquiry_title, inquiry_name, inquiry_content, inquiry_pwd, inquiry_date, inquiry_hit"
					+ ", inquiry_ref, inquiry_step, inquiry_level) "
					+ "values(?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.toKor(inquiry.getInquiry_title()));
			pstmt.setString(3, HanConv.toKor(inquiry.getInquiry_name()));
			pstmt.setString(4, HanConv.toKor(inquiry.getInquiry_content()));
			pstmt.setString(5, inquiry.getInquiry_pwd());
			pstmt.setTimestamp(6, inquiry.getInquiry_date());
			pstmt.setInt(7, inquiry.getInquiry_hit());
			pstmt.setInt(8, ref);
			pstmt.setInt(9, step);
			pstmt.setInt(10, level);
			
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
	
	public ArrayList<Inquiry> listBoardInq(String pageNumber){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		int dbCount=0;
		int absoultePage=1;
		
		ArrayList<Inquiry> boardList = new ArrayList<Inquiry>();
		
		try {
			con = getConnection();
			stmt = con.createStatement();
			
			pageSet = stmt.executeQuery("select count(inquiry_number) from Inquiry_Board");
			
			if (pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if (dbCount % Inquiry.pageSize2 == 0) {
				Inquiry.pageCount2 = dbCount / Inquiry.pageSize2;
			}else {
				Inquiry.pageCount2 = dbCount / Inquiry.pageSize2 + 1;
			}
			
			if (pageNumber != null) {
				Inquiry.pageNum2 = Integer.parseInt(pageNumber);
				absoultePage = (Inquiry.pageNum2-1) * Inquiry.pageSize2 + 1;
			}
			
//			stmt = con.createStatement();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			String sql="select * from Inquiry_Board order by inquiry_ref desc, inquiry_step asc";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				rs.absolute(absoultePage);
				int count = 0;
				while (count < Inquiry.pageSize2) {
					Inquiry inquiry=new Inquiry();
					inquiry.setInquiry_number(rs.getInt(1));
					inquiry.setInquiry_name(rs.getString(2));
					inquiry.setInquiry_title(rs.getString(3));
					inquiry.setInquiry_content(rs.getString(4));
					inquiry.setInquiry_pwd(rs.getString(5));
					inquiry.setInquiry_date(rs.getTimestamp(6));
					inquiry.setInquiry_hit(rs.getInt(7));
					inquiry.setInquiry_ref(rs.getInt(8));
					inquiry.setInquiry_step(rs.getInt(9));
					inquiry.setInquiry_level(rs.getInt(10));
					
					boardList.add(inquiry);
					
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
		return boardList;
	}
	
	public Inquiry getBoard(int bid, boolean hitadd) {
		Connection con=null;
		PreparedStatement pstmtUp=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		Inquiry inquiry=null;
		
		try {
			con = getConnection();
			
			if (hitadd==true) {
				sql="update Inquiry_Board set inquiry_hit=inquiry_hit+1 where inquiry_number=?";
				pstmtUp = con.prepareStatement(sql);
				pstmtUp.setInt(1, bid);
				pstmtUp.executeUpdate();
				pstmtUp.close();
			}
			
			sql="select * from Inquiry_Board where inquiry_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				inquiry=new Inquiry();
				inquiry.setInquiry_number(rs.getInt(1));
				inquiry.setInquiry_name(rs.getString(2));
				inquiry.setInquiry_title(rs.getString(3));
				inquiry.setInquiry_content(rs.getString(4));
				inquiry.setInquiry_pwd(rs.getString(5));
				inquiry.setInquiry_date(rs.getTimestamp(6));
				inquiry.setInquiry_hit(rs.getInt(7));
				inquiry.setInquiry_ref(rs.getInt(8));
				inquiry.setInquiry_step(rs.getInt(9));
				inquiry.setInquiry_level(rs.getInt(10));
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
		return inquiry;
	}
	
	public int deleteBoard(int inquiry_number, String inquiry_pwd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		String pwd="";
		int re=-1;
		
		try {
			con = getConnection();
			sql="select inquiry_pwd from Inquiry_Board where inquiry_number = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, inquiry_number);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(inquiry_pwd)) {
					re = 0;
				}else {
					sql="delete Inquiry_Board where inquiry_number=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, inquiry_number);
					pstmt.executeUpdate();
					re = 1;
				}
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
		return re;
	}
	
	public int editBoard(Inquiry inquiry) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String pwd="";
		
		try {
			con = getConnection();
			sql="select inquiry_pwd from Inquiry_Board where inquiry_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, inquiry.getInquiry_number());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(inquiry.getInquiry_pwd())) {
					re=0;
				}else {
					sql="update Inquiry_Board set inquiry_title=?, inquiry_content=? where inquiry_number=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKor(inquiry.getInquiry_title()));
					pstmt.setString(2, HanConv.toKor(inquiry.getInquiry_content()));
					pstmt.setInt(3, inquiry.getInquiry_number());
					pstmt.executeUpdate();
					re=1;
				}
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
		return re;
	}
}



