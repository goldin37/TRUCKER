package trucker;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.*;

public class TruckerDBBean {
	
	private static TruckerDBBean instance = new TruckerDBBean();

	public static TruckerDBBean getInstance() {
		// 값을 입력받는 메소드
		return instance; // BoardDBBean의 객체를 입력받음.

	}

	public static Connection getConnection() throws Exception {
		// 쿼리작업 사용할 Connection객체 리턴하는 메소드
		// 따로만든 이유 -> 여러번 사용하기 위해서

		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertTrucker(TruckerBean trucker) throws Exception{
		//데이터 삽입하기 위한 메소드
		
		Connection con =null; 
		PreparedStatement pstmt =null;
		String sql ="insert into trucker(driver_id, driver_password, driver_jumin, driver_license,"
				+ " driver_password_check, driver_name, driver_phone_number, driver_address, driver_email, driver_position, "
				+ "truck_type, truck_number,driver_picture, driver_evaluation)"
				+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		int re = -1; //insert가 제대로 이루어졌나 확인
		
		try {
			con = getConnection();
			pstmt= con.prepareStatement(sql);
			
			pstmt.setString(1, trucker.getDriver_id());
			pstmt.setString(2, trucker.getDriver_password());
			pstmt.setString(3, trucker.getDriver_jumin());
			pstmt.setString(4, trucker.getDriver_license());
			pstmt.setString(5, trucker.getDriver_password_check());
			pstmt.setString(6, HanConv.toKor(trucker.getDriver_name()));
			pstmt.setString(7, trucker.getDriver_phone_number());
			pstmt.setString(8, HanConv.toKor(trucker.getDriver_address()));
			pstmt.setString(9, trucker.getDriver_email());
			pstmt.setString(10, HanConv.toKor(trucker.getDriver_position()));
			pstmt.setString(11, trucker.getTruck_type());
			pstmt.setString(12, HanConv.toKor(trucker.getTruck_number()));
			pstmt.setString(13, HanConv.toKor(trucker.getDriver_picture()));
			pstmt.setString(14, trucker.getDriver_evaluation());
			
			
			pstmt.executeUpdate();
			re = 1; // 제대로 실행되면 1, 아니면 -1로 진행됨
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	public int confirmID(String id) throws Exception{
		//중복확인을 위한 메소드
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int re = -1; // 확인을 위한 re
		
		sql = "select driver_id from trucker where driver_id = ?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				re =1; // 중복이 있으면 1
			}
			else {
				re = -1; //중복 없으면 -1
			}
			
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	public int userCheck(String id, String pwd) throws Exception{
		//아이디, 비밀번호가 맞는지 아닌지 확인하기 위한 메소드
		
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select driver_password from trucker where driver_id=?";
		String dri_password_check; // 가져온 pw와 입력한 pw를 비교할 객체
		int re = -1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
		
		if(rs.next()) {
			dri_password_check = rs.getString("driver_password");
			if(dri_password_check.equals(pwd)) { // 가져온 비밀번호와 입력받은 pw가 같다
				re = 1;
			}else {
				re = 0; // 아이디는 같지만 비밀번호가 다르다 -> re= 0
			}
		}else {
			re = -1; // 아이디가 틀림
		}
			rs.close();
			pstmt.close();
			con.close();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	public TruckerBean getTrucker(String id) throws Exception{
		//아이디가 일치하는 멤버의 정보를 가져오는 메소드
		
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TruckerBean trucker =null;
		String sql = "select * from trucker where driver_id=?";
		
		
		try {
			con= getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				trucker = new TruckerBean(); //로그인할때 입력하는 아이디를 Bean에 넣음
				
				trucker.setDriver_id(rs.getString(1));
				trucker.setDriver_password(rs.getString(2));
				trucker.setDriver_jumin(rs.getString(3));
				trucker.setDriver_license(rs.getString(4));
				trucker.setDriver_password_check(rs.getString(5));
				trucker.setDriver_name(rs.getString(6));
				trucker.setDriver_phone_number(rs.getString(7));
				trucker.setDriver_address(rs.getString(8));
				trucker.setDriver_email(rs.getString(9));
				trucker.setDriver_position(rs.getString(10));
				trucker.setTruck_type(rs.getString(11));
				trucker.setTruck_number(rs.getString(12));
				trucker.setDriver_picture(rs.getString(13));
				trucker.setDriver_evaluation(rs.getString(14));

			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return trucker;
	}
	public int updateTrucker(TruckerBean trucker) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update trucker set driver_phone_number=?, driver_address=?, driver_email=?, truck_type=? where driver_id=?";
		int re =-1;
		
		try {
			con = getConnection();
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, trucker.getDriver_phone_number());
			pstmt.setString(2, HanConv.toKor(trucker.getDriver_address()));
			pstmt.setString(3, trucker.getDriver_email());
			pstmt.setString(4, HanConv.toKor(trucker.getTruck_type()));
			pstmt.setString(5, trucker.getDriver_id());
			
			re = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	public String searchID(String name, String jumin)throws Exception{
		//ID를 찾는 메소드
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String id = null;
		String sql = "select driver_id from trucker where driver_name=? and driver_jumin=?";
		
		try {
			con =getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, HanConv.toKor(name));
			pstmt.setString(2, jumin);
			
			rs= pstmt.executeQuery();
			
			while(rs.next()) { // 값이존재(아이디가 있음)
				id = rs.getString("driver_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		return id;
	}
	public String searchPW(String id, String name,String jumin) throws Exception{
		//pwd를 찾는 메소드
		
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String password = null;
		String sql = "select driver_password from trucker where driver_id=? and driver_name=? and driver_jumin=?";
		
		try {
			con =getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, HanConv.toKor(name));
			pstmt.setString(3, jumin);
			
			rs= pstmt.executeQuery();
			
			while(rs.next()) { // 값이 존재(비밀번호가 있음)
				password = rs.getString("driver_password");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		return password;
	}
	
}

