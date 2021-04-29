package board;

import java.sql.Timestamp;

public class Inquiry {
	private int inquiry_number;
	private String inquiry_name;
	private String inquiry_title;
	private String inquiry_content;
	private String inquiry_pwd;
	private Timestamp inquiry_date;
	private int inquiry_hit;
	private int inquiry_ref;
	private int inquiry_step;
	private int inquiry_level;
	
	public int getInquiry_number() {
		return inquiry_number;
	}
	public void setInquiry_number(int inquiry_number) {
		this.inquiry_number = inquiry_number;
	}
	public String getInquiry_name() {
		return inquiry_name;
	}
	public void setInquiry_name(String inquiry_name) {
		this.inquiry_name = inquiry_name;
	}
	public String getInquiry_title() {
		return inquiry_title;
	}
	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}
	public String getInquiry_content() {
		return inquiry_content;
	}
	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}
	public String getInquiry_pwd() {
		return inquiry_pwd;
	}
	public void setInquiry_pwd(String inquiry_pwd) {
		this.inquiry_pwd = inquiry_pwd;
	}
	public Timestamp getInquiry_date() {
		return inquiry_date;
	}
	public void setInquiry_date(Timestamp inquiry_date) {
		this.inquiry_date = inquiry_date;
	}
	public int getInquiry_hit() {
		return inquiry_hit;
	}
	public void setInquiry_hit(int inquiry_hit) {
		this.inquiry_hit = inquiry_hit;
	}
	public int getInquiry_ref() {
		return inquiry_ref;
	}
	public void setInquiry_ref(int inquiry_ref) {
		this.inquiry_ref = inquiry_ref;
	}
	public int getInquiry_step() {
		return inquiry_step;
	}
	public void setInquiry_step(int inquiry_step) {
		this.inquiry_step = inquiry_step;
	}
	public int getInquiry_level() {
		return inquiry_level;
	}
	public void setInquiry_level(int inquiry_level) {
		this.inquiry_level = inquiry_level;
	}
	
}


