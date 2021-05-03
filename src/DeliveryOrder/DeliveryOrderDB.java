package myUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class DeliveryOrderDB {
	private static DeliveryOrderDB instance = new DeliveryOrderDB();

	//객체 ?��?��
	public static DeliveryOrderDB getInstance() {
		return instance;
	}
	
	//DB ?���?
	public Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int createOrder(String truck_type, String cargo_type, String cargo_weight, String cargo_help, String cargo_spec, String from_where, String from_spec, String depart_time, String to_where, String to_spec, String distance, String time, String ETA, String recommend_cost, String fix_cost, String customer_name, String customer_telephone) throws Exception{
		int re = 0; //order_id�?

		Connection con = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		

		int max_order_id = 1;
		int create_order_id = 1;
		try {
			con = getConnection();
			sql = "SELECT MAX(ORDER_ID) FROM DELIVERY_ORDER";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				max_order_id = rs.getInt(1);
				create_order_id = max_order_id + 1;
			} else {
				create_order_id = 1;
			}
			
			//?��?�� ?��?��
			rs.close();
			stmt.close();
			con.close();
			
			//?��?�� ?���? 메시�?
			System.out.println("마�?�? order_id : " + max_order_id);
			System.out.println("?��?�� order_id : " + create_order_id);
			System.out.println("DB 조회 ?���?");
		} catch(Exception e) {
			System.out.println("DB 조회 ?��?��");
			e.printStackTrace();
		}
		//주문 insert
		try {
			con = getConnection();
			sql = "INSERT INTO DELIVERY_ORDER"
				+ "(order_id, truck_type, cargo_type, cargo_weight, cargo_help, cargo_spec, from_where, from_spec, depart_time, to_where, to_spec, distance, time, ETA, recommend_cost, fix_cost, customer_name, customer_telephone, order_state, order_date_time)"
				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'order',?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, create_order_id);
			pstmt.setString(2, truck_type);
			pstmt.setString(3, cargo_type);
			pstmt.setInt(4, Integer.parseInt(cargo_weight));
			pstmt.setString(5, cargo_help);
			pstmt.setString(6, cargo_spec);
			pstmt.setString(7, from_where);
			pstmt.setString(8, from_spec);
			pstmt.setTimestamp(9, Timestamp.valueOf(LocalDateTime.parse(depart_time)));
			pstmt.setString(10, to_where);
			pstmt.setString(11, to_spec);
			pstmt.setInt(12, Integer.parseInt(distance));
			pstmt.setString(13, time);
			pstmt.setString(14, ETA);
			pstmt.setInt(15, Integer.parseInt(recommend_cost));
			pstmt.setInt(16, Integer.parseInt(fix_cost));
			pstmt.setString(17, customer_name);
			pstmt.setString(18, customer_telephone);
			pstmt.setTimestamp(19, Timestamp.valueOf(LocalDateTime.now()));
			pstmt.executeUpdate();
			
			//?��?�� 종료
			rs.close();
			pstmt.close();
			con.close();

			//?���? 메시�?
			System.out.println("주문 ?��?�� ?���?");
			re = create_order_id;
		} catch(Exception e){
			System.out.println("주문 ?��?�� ?��?��");
			e.printStackTrace();
		}
		
		//?��?��?�� order_id 리턴
		return re;
	}
	
	
	public ArrayList<DeliveryOrder> listOrder(String pageNumber){
		//오더리스트에 추가하는 메소드
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet pageSet = null; // 페이지를 받기 위해
		int dbCount = 0; // 페이지 번호의 개수를 받기 위한 변수
		int absolutePage = 1; // 출력할 페이지
		ArrayList<DeliveryOrder> orderList = new ArrayList<DeliveryOrder>();
		
		try {
			con = getConnection();
			stmt = con.createStatement();
			String sql = "select count(order_id) from delivery_order";
			pageSet  = stmt.executeQuery(sql);
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if(dbCount % DeliveryOrder.pageSize ==0 ) { //페이지 개수를 알려주기 위해
				DeliveryOrder.pageCount  = dbCount / DeliveryOrder.pageSize;
			}else {
				DeliveryOrder.pageCount = dbCount / DeliveryOrder.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			sql = "select * from delivery_order";
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				while(count<DeliveryOrder.pageSize) {
					DeliveryOrder deliveryorder = new DeliveryOrder();
					
					deliveryorder.setTruck_type(rs.getString(1));
					deliveryorder.setCargo_type(rs.getString(2));
					deliveryorder.setCargo_weight(rs.getInt(3));
					deliveryorder.setCargo_help(rs.getString(4));
					deliveryorder.setFrom(rs.getString(5));
					deliveryorder.setTo(rs.getString(6));
					deliveryorder.setDistance(rs.getInt(7));
					deliveryorder.setTime(rs.getString(8));
					deliveryorder.setETA(rs.getString(9));
					deliveryorder.setDepart_time(rs.getTimestamp(10));
					deliveryorder.setRecommend_cost(rs.getInt(11));
					
					orderList.add(deliveryorder);
					if(rs.isLast()) {
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
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(con !=null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return orderList;
	}
	public DeliveryOrder getOrder(int order_id) throws Exception{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = "";
		DeliveryOrder deliveryorder =null;
		
		try {
			con = getConnection();
			sql = "select * from delivery_order where order_id =?";
			pstmt =con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				deliveryorder = new DeliveryOrder();
				
				deliveryorder.setTruck_type(rs.getString(1));
				deliveryorder.setCargo_type(rs.getString(2));
				deliveryorder.setCargo_weight(rs.getInt(3));
				deliveryorder.setCargo_help(rs.getString(4));
				deliveryorder.setCargo_spec(rs.getString(5));
				deliveryorder.setFrom(rs.getString(6));
				deliveryorder.setTo(rs.getString(7));
				deliveryorder.setDistance(rs.getInt(8));
				deliveryorder.setTime(rs.getString(9));
				deliveryorder.setETA(rs.getString(10));
				deliveryorder.setDepart_time(rs.getTimestamp(11));
				deliveryorder.setRecommend_cost(rs.getInt(12));
				deliveryorder.setCustomer_name(rs.getString(13));
				deliveryorder.setCustomer_telephone(rs.getString(14));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con!=null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return deliveryorder;
	}
}
