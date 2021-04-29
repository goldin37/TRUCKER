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
		// ���� �Է¹޴� �޼ҵ�
		return instance; // BoardDBBean�� ��ü�� �Է¹���.

	}

	public static Connection getConnection() throws Exception {
		// �����۾� ����� Connection��ü �����ϴ� �޼ҵ�
		// ���θ��� ���� -> ������ ����ϱ� ���ؼ�

		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertTrucker(TruckerBean trucker) throws Exception{
		//������ �����ϱ� ���� �޼ҵ�
		
		Connection con =null; 
		PreparedStatement pstmt =null;
		String sql ="insert into trucker(driver_id, driver_password, driver_jumin, driver_license,"
				+ " driver_password_check, driver_name, driver_phone_number, driver_address, driver_email, driver_position, "
				+ "truck_type, truck_number,driver_picture, driver_evaluation)"
				+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		int re = -1; //insert�� ����� �̷������ Ȯ��
		
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
			re = 1; // ����� ����Ǹ� 1, �ƴϸ� -1�� �����
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	public int confirmID(String id) throws Exception{
		//�ߺ�Ȯ���� ���� �޼ҵ�
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		int re = -1; // Ȯ���� ���� re
		
		sql = "select driver_id from trucker where driver_id = ?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				re =1; // �ߺ��� ������ 1
			}
			else {
				re = -1; //�ߺ� ������ -1
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
		//���̵�, ��й�ȣ�� �´��� �ƴ��� Ȯ���ϱ� ���� �޼ҵ�
		
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select driver_password from trucker where driver_id=?";
		String dri_password_check; // ������ pw�� �Է��� pw�� ���� ��ü
		int re = -1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
		
		if(rs.next()) {
			dri_password_check = rs.getString("driver_password");
			if(dri_password_check.equals(pwd)) { // ������ ��й�ȣ�� �Է¹��� pw�� ����
				re = 1;
			}else {
				re = 0; // ���̵�� ������ ��й�ȣ�� �ٸ��� -> re= 0
			}
		}else {
			re = -1; // ���̵� Ʋ��
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
		//���̵� ��ġ�ϴ� ����� ������ �������� �޼ҵ�
		
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
				trucker = new TruckerBean(); //�α����Ҷ� �Է��ϴ� ���̵� Bean�� ����
				
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
		//ID�� ã�� �޼ҵ�
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
			
			while(rs.next()) { // ��������(���̵� ����)
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
		//pwd�� ã�� �޼ҵ�
		
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
			
			while(rs.next()) { // ���� ����(��й�ȣ�� ����)
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

