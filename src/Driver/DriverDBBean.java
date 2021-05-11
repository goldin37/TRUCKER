package Driver;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.*;

public class DriverDBBean {

	private static DriverDBBean instance = new DriverDBBean();

	public static DriverDBBean getInstance() {
		return instance;
	}

	public static Connection getConnection() throws Exception {

		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int insertDriver(DriverBean driver) throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into driver(driver_id, driver_pwd, driver_jumin, driver_license,"
				+ " driver_pwd_check, driver_name, driver_phone_number, driver_addr, driver_email, driver_position, "
				+ "truck_type, truck_number,driver_photo, driver_evalue)" + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int re = -1;

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, driver.getDriver_id());
			pstmt.setString(2, driver.getDriver_pwd());
			pstmt.setString(3, driver.getDriver_jumin());
			pstmt.setString(4, driver.getDriver_license());
			pstmt.setString(5, driver.getDriver_pwd_check());
			pstmt.setString(6, driver.getDriver_name());
			pstmt.setString(7, driver.getDriver_phone_number());
			pstmt.setString(8, driver.getDriver_addr());
			pstmt.setString(9, driver.getDriver_email());
			pstmt.setString(10, driver.getDriver_position());
			pstmt.setString(11, driver.getTruck_type());
			pstmt.setString(12, driver.getTruck_number());
			pstmt.setString(13, driver.getDriver_photo());
			pstmt.setString(14, driver.getDriver_evalue());

			pstmt.executeUpdate();
			re = 1;
			pstmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}

	public int confirmID(String id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		int re = -1;

		sql = "select driver_id from driver where driver_id = ?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				re = 1;
			} else {
				re = -1;
			}

			rs.close();
			pstmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}

	public int userCheck(String id, String pwd) throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select driver_pwd from driver where driver_id=?";
		String dri_password_check;
		int re = -1;

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dri_password_check = rs.getString("driver_pwd");
				if (dri_password_check.equals(pwd)) {
					re = 1;
				} else {
					re = 0;
				}
			} else {
				re = -1;
			}
			rs.close();
			pstmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}

	public DriverBean getDriver(String id) throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DriverBean driver = null;
		String sql = "select * from driver where driver_id=?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				driver = new DriverBean();

				driver.setDriver_id(rs.getString(1));
				driver.setDriver_pwd(rs.getString(2));
				driver.setDriver_jumin(rs.getString(3));
				driver.setDriver_license(rs.getString(4));
				driver.setDriver_pwd_check(rs.getString(5));
				driver.setDriver_name(rs.getString(6));
				driver.setDriver_phone_number(rs.getString(7));
				driver.setDriver_addr(rs.getString(8));
				driver.setDriver_email(rs.getString(9));
				driver.setDriver_position(rs.getString(10));
				driver.setTruck_type(rs.getString(11));
				driver.setTruck_number(rs.getString(12));
				driver.setDriver_photo(rs.getString(13));
				driver.setDriver_evalue(rs.getString(14));

			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return driver;
	}

	public int updateDriver(DriverBean driver) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update driver set driver_phone_number=?, driver_addr=?, driver_email=?, truck_type=?, truck_number=? where driver_id=?";
		int re = -1;

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, driver.getDriver_phone_number());
			pstmt.setString(2, HanConv.toKor(driver.getDriver_addr()));
			pstmt.setString(3, driver.getDriver_email());
			pstmt.setString(4, HanConv.toKor(driver.getTruck_type()));
			pstmt.setString(5, HanConv.toKor(driver.getTruck_number()));
			pstmt.setString(6, driver.getDriver_id());

			re = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}

	public String searchID(String name, String jumin) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = null;
		String sql = "select driver_id from driver where driver_name=? and driver_jumin=?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, HanConv.toKor(name));
			pstmt.setString(2, jumin);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				id = rs.getString("driver_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		return id;
	}

	public String searchPW(String id, String name, String jumin) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String password = null;
		String sql = "select driver_pwd from driver where driver_id=? and driver_name=? and driver_jumin=?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, HanConv.toKor(name));
			pstmt.setString(3, jumin);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				password = rs.getString("driver_pwd");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			con.close();
		}
		return password;
	}

}
