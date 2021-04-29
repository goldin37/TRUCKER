package board;

import java.sql.Timestamp;

public class Notice {
	private int notice_number;
	private String notice_title;
	private String notice_content;
	private Timestamp notice_date;
	private int notice_hit;
	
	public int getNotice_number() {
		return notice_number;
	}
	public void setNotice_number(int notice_number) {
		this.notice_number = notice_number;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Timestamp getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Timestamp notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
}


