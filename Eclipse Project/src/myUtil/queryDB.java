package myUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class queryDB {
	private static queryDB instance = new queryDB();

	public static queryDB getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public DeliveryOrder getOrder(int bid) {
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		DeliveryOrder order = null;
		
		try {
			con = getConnection(); 
			
			// ��۹�ȣ, ��ۻ���, �ֹ��Ͻ�, �����Ͻ�, ����Ͻ�, �����Ͻ�, �Ϸ��Ͻ�
			
			sql = "select order_id,order_state,order_date_time,accept_date_time,depart_date_time,arrive_date_time,complete_date_time,cancel_date_time from DELIVERY_ORDER where ORDER_ID = ?";  	    
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				order = new DeliveryOrder();
				order.setOrder_id(rs.getInt(1));
				order.setOrder_state(rs.getString(2));
				order.setOrder_date_time(rs.getTimestamp(3));
				order.setAccept_date_time(rs.getTimestamp(4));
				order.setDepart_date_time(rs.getTimestamp(5));
				order.setArrive_date_time(rs.getTimestamp(6));
				order.setComplete_date_time(rs.getTimestamp(7));
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
		return order;
	}
		public DeliveryOrder getOrder2(String name, String tel) {
			Connection con=null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql="";
			DeliveryOrder order = null;
			
			try {
				con = getConnection(); 
				
				// ��۹�ȣ, ��ۻ���, �ֹ��Ͻ�, �����Ͻ�, ����Ͻ�, �����Ͻ�, �Ϸ��Ͻ�
				
				sql = "select order_id,order_state,order_date_time,accept_date_time,depart_date_time,arrive_date_time,complete_date_time,cancel_date_time from DELIVERY_ORDER where customer_name = ? and customer_telephone = ?";  	    
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, tel);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					order = new DeliveryOrder();
					order.setOrder_id(rs.getInt(1));
					order.setOrder_state(rs.getString(2));
					order.setOrder_date_time(rs.getTimestamp(3));
					order.setAccept_date_time(rs.getTimestamp(4));
					order.setDepart_date_time(rs.getTimestamp(5));
					order.setArrive_date_time(rs.getTimestamp(6));
					order.setComplete_date_time(rs.getTimestamp(7));
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
			return order;
	}
}
