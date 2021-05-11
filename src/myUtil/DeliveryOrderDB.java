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

	//객체 생성
	public static DeliveryOrderDB getInstance() {
		return instance;
	}
	
	//DB 접속
	public Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int createOrder(String truck_type, String cargo_type, String cargo_weight, String cargo_help, String cargo_spec, String from_where, String from_spec, String depart_time, String to_where, String to_spec, String distance, String time, String ETA, String recommend_cost, String fix_cost, String customer_name, String customer_telephone) throws Exception{
		int re = 0; //order_id

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
			
			//접속 종료
			rs.close();
			stmt.close();
			con.close();
			
			//조회 성공 메시지
			System.out.println("최대 order_id : " + max_order_id);
			System.out.println("삽입 order_id : " + create_order_id);
			System.out.println("DB 조회 성공");
		} catch(Exception e) {
			System.out.println("DB 조회 실패");
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
			pstmt.setTimestamp(14, Timestamp.valueOf(LocalDateTime.parse(ETA)));
			pstmt.setInt(15, Integer.parseInt(fix_cost));
			pstmt.setInt(16, Integer.parseInt(fix_cost));
			pstmt.setString(17, customer_name);
			pstmt.setString(18, customer_telephone);
			pstmt.setTimestamp(19, Timestamp.valueOf(LocalDateTime.now()));
			pstmt.executeUpdate();
			
			//접속 종료
			rs.close();
			pstmt.close();
			con.close();

			//성공 메시지
			System.out.println("주문 성공");
			re = create_order_id;
		} catch(Exception e){
			System.out.println("주문 실패");
			e.printStackTrace();
		}
		
		//성공하면 order_id 리턴
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
			if(pageNumber != null) {
				DeliveryOrder.pageNum = Integer.parseInt(pageNumber);
				absolutePage = (DeliveryOrder.pageNum -1) * DeliveryOrder.pageSize +1;
			}
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			sql = "select * from delivery_order";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				while(count<DeliveryOrder.pageSize) {
					DeliveryOrder deliveryorder = new DeliveryOrder();
					
					deliveryorder.setOrder_id(rs.getInt("order_id"));
					deliveryorder.setTruck_type(rs.getString("truck_type"));
					deliveryorder.setCargo_type(rs.getString("cargo_type"));
					deliveryorder.setCargo_weight(rs.getInt("cargo_weight"));
					deliveryorder.setCargo_help(rs.getString("cargo_help"));
					deliveryorder.setFrom_where(rs.getString("from_where"));
					deliveryorder.setFrom_spec(rs.getString("from_spec"));
					deliveryorder.setTo_where(rs.getString("to_where"));
					deliveryorder.setTo_spec(rs.getString("to_spec"));
					deliveryorder.setDistance(rs.getInt("distance"));
					deliveryorder.setTime(rs.getString("time"));
					deliveryorder.setETA(rs.getString("ETA"));
					deliveryorder.setDepart_time(rs.getTimestamp("depart_time"));
					deliveryorder.setFix_cost(rs.getInt("fix_cost"));
					deliveryorder.setOrder_state(rs.getString("order_state"));
					deliveryorder.setCargo_spec(rs.getString("cargo_spec"));
					
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
			pstmt.setInt(1, order_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				deliveryorder = new DeliveryOrder();
				
				deliveryorder.setOrder_id(rs.getInt("order_id"));
				deliveryorder.setTruck_type(rs.getString("truck_type"));
				deliveryorder.setCargo_type(rs.getString("cargo_type"));
				deliveryorder.setCargo_weight(rs.getInt("cargo_weight"));
				deliveryorder.setCargo_help(rs.getString("cargo_help"));
				deliveryorder.setFrom_where(rs.getString("from_where"));
				deliveryorder.setFrom_spec(rs.getString("from_spec"));
				deliveryorder.setTo_where(rs.getString("to_where"));
				deliveryorder.setTo_spec(rs.getString("to_spec"));
				deliveryorder.setDistance(rs.getInt("distance"));
				deliveryorder.setTime(rs.getString("time"));
				deliveryorder.setETA(rs.getString("ETA"));
				deliveryorder.setDepart_time(rs.getTimestamp("depart_time"));
				deliveryorder.setFix_cost(rs.getInt("fix_cost"));
				deliveryorder.setOrder_state(rs.getString("order_state"));
				deliveryorder.setCustomer_name(rs.getString("customer_name"));
				deliveryorder.setCustomer_telephone(rs.getString("customer_telephone"));
				deliveryorder.setCargo_spec(rs.getString("cargo_spec"));
				
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
