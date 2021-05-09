package Driver;

import java.sql.Timestamp;

public class DriverBean {
	private String driver_id;
	private String driver_pwd;
	private String driver_jumin; 
	private String driver_license;
	private String driver_pwd_check;
	private String driver_name; 
	private String driver_phone_number;
	private String driver_addr; 
	private String driver_email; 
	private String driver_position; 
	private String truck_type;
	private String truck_number; 
	private String driver_photo; 
	private String driver_evalue;
	private String cargo_type;
	private Timestamp period_start;
	private Timestamp period_end;
	private int order_number;
	private int ordered_number;
	
	public String getCargo_type() {
		return cargo_type;
	}
	public void setCargo_type(String cargo_type) {
		this.cargo_type = cargo_type;
	}
	public Timestamp getPeriod_start() {
		return period_start;
	}
	public void setPeriod_start(Timestamp period_start) {
		this.period_start = period_start;
	}
	public Timestamp getPeriod_end() {
		return period_end;
	}
	public void setPeriod_end(Timestamp period_end) {
		this.period_end = period_end;
	}
	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public int getOrdered_number() {
		return ordered_number;
	}
	public void setOrdered_number(int ordered_number) {
		this.ordered_number = ordered_number;
	}
	public String getDriver_id() {
		return driver_id;
	}
	public void setDriver_id(String driver_id) {
		this.driver_id = driver_id;
	}
	public String getDriver_pwd() {
		return driver_pwd;
	}
	public void setDriver_pwd(String driver_pwd) {
		this.driver_pwd = driver_pwd;
	}
	public String getDriver_jumin() {
		return driver_jumin;
	}
	public void setDriver_jumin(String driver_jumin) {
		this.driver_jumin = driver_jumin;
	}
	public String getDriver_license() {
		return driver_license;
	}
	public void setDriver_license(String driver_license) {
		this.driver_license = driver_license;
	}
	public String getDriver_pwd_check() {
		return driver_pwd_check;
	}
	public void setDriver_pwd_check(String driver_pwd_check) {
		this.driver_pwd_check = driver_pwd_check;
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
	public String getDriver_addr() {
		return driver_addr;
	}
	public void setDriver_addr(String driver_addr) {
		this.driver_addr = driver_addr;
	}
	public String getDriver_email() {
		return driver_email;
	}
	public void setDriver_email(String driver_email) {
		this.driver_email = driver_email;
	}
	public String getDriver_position() {
		return driver_position;
	}
	public void setDriver_position(String driver_position) {
		this.driver_position = driver_position;
	}
	public String getTruck_type() {
		return truck_type;
	}
	public void setTruck_type(String truck_type) {
		this.truck_type = truck_type;
	}
	public String getTruck_number() {
		return truck_number;
	}
	public void setTruck_number(String truck_number) {
		this.truck_number = truck_number;
	}
	public String getDriver_photo() {
		return driver_photo;
	}
	public void setDriver_photo(String driver_photo) {
		this.driver_photo = driver_photo;
	}
	public String getDriver_evalue() {
		return driver_evalue;
	}
	public void setDriver_evalue(String driver_evalue) {
		this.driver_evalue = driver_evalue;
	}
	

}
