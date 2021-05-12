package myUtil;

import java.sql.Timestamp;

public class DeliveryOrder {
	//DELIVERY_ORDER 컬럼 내용들을 전부 멤버변수로
	private int order_id;
	private String truck_type;
	private String from;
	private String from_spec;
	private Timestamp depart_time;
	private String to;
	private String to_spec;
	private String cargo_type;
	private int cargo_weight;
	private String cargo_help;
	private String cargo_spec;
	private int distance;
	private String time;
	private String ETA;
	private int recommend_cost;
	private int fix_cost;
	private String customer_name;
	private String customer_telephone;
	private String order_state;
	private String driver_id;
	private String driver_name;
	private String driver_phone_number;
	private String driver_truck_number;
	private Timestamp order_date_time;
	private Timestamp accept_date_time;
	private Timestamp depart_date_time;
	private Timestamp arrive_date_time;
	private Timestamp complete_date_time;
	private Timestamp cancel_date_time;
	private int customer_evaluation;
	private String customer_comment;
	
	// getter/setter
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getTruck_type() {
		return truck_type;
	}
	public void setTruck_type(String truck_type) {
		this.truck_type = truck_type;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getFrom_spec() {
		return from_spec;
	}
	public void setFrom_spec(String from_spec) {
		this.from_spec = from_spec;
	}
	public Timestamp getDepart_time() {
		return depart_time;
	}
	public void setDepart_time(Timestamp depart_time) {
		this.depart_time = depart_time;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getTo_spec() {
		return to_spec;
	}
	public void setTo_spec(String to_spec) {
		this.to_spec = to_spec;
	}
	public String getCargo_type() {
		return cargo_type;
	}
	public void setCargo_type(String cargo_type) {
		this.cargo_type = cargo_type;
	}
	public int getCargo_weight() {
		return cargo_weight;
	}
	public void setCargo_weight(int cargo_weight) {
		this.cargo_weight = cargo_weight;
	}
	public String getCargo_help() {
		return cargo_help;
	}
	public void setCargo_help(String cargo_help) {
		this.cargo_help = cargo_help;
	}
	public String getCargo_spec() {
		return cargo_spec;
	}
	public void setCargo_spec(String cargo_spec) {
		this.cargo_spec = cargo_spec;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getETA() {
		return ETA;
	}
	public void setETA(String eTA) {
		ETA = eTA;
	}
	public int getRecommend_cost() {
		return recommend_cost;
	}
	public void setRecommend_cost(int recommend_cost) {
		this.recommend_cost = recommend_cost;
	}
	public int getFix_cost() {
		return fix_cost;
	}
	public void setFix_cost(int fix_cost) {
		this.fix_cost = fix_cost;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_telephone() {
		return customer_telephone;
	}
	public void setCustomer_telephone(String customer_telephone) {
		this.customer_telephone = customer_telephone;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public String getDriver_id() {
		return driver_id;
	}
	public void setDriver_id(String driver_id) {
		this.driver_id = driver_id;
	}
	public String getDriver_name() {
		return driver_name;
	}
	public void setDriver_name(String driver_name) {
		this.driver_name = driver_name;
	}
	public String getDriver_phone_number() {
		return driver_phone_number;
	}
	public void setDriver_phone_number(String driver_phone_number) {
		this.driver_phone_number = driver_phone_number;
	}
	public String getDriver_truck_number() {
		return driver_truck_number;
	}
	public void setDriver_truck_number(String driver_truck_number) {
		this.driver_truck_number = driver_truck_number;
	}
	public Timestamp getOrder_date_time() {
		return order_date_time;
	}
	public void setOrder_date_time(Timestamp order_date_time) {
		this.order_date_time = order_date_time;
	}
	public Timestamp getAccept_date_time() {
		return accept_date_time;
	}
	public void setAccept_date_time(Timestamp accept_date_time) {
		this.accept_date_time = accept_date_time;
	}
	public Timestamp getDepart_date_time() {
		return depart_date_time;
	}
	public void setDepart_date_time(Timestamp depart_date_time) {
		this.depart_date_time = depart_date_time;
	}
	public Timestamp getArrive_date_time() {
		return arrive_date_time;
	}
	public void setArrive_date_time(Timestamp arrive_date_time) {
		this.arrive_date_time = arrive_date_time;
	}
	public Timestamp getComplete_date_time() {
		return complete_date_time;
	}
	public void setComplete_date_time(Timestamp complete_date_time) {
		this.complete_date_time = complete_date_time;
	}
	public Timestamp getCancel_date_time() {
		return cancel_date_time;
	}
	public void setCancel_date_time(Timestamp cancel_date_time) {
		this.cancel_date_time = cancel_date_time;
	}
	public int getCustomer_evaluation() {
		return customer_evaluation;
	}
	public void setCustomer_evaluation(int customer_evaluation) {
		this.customer_evaluation = customer_evaluation;
	}
	public String getCustomer_comment() {
		return customer_comment;
	}
	public void setCustomer_comment(String customer_comment) {
		this.customer_comment = customer_comment;
	}
	
	
}
