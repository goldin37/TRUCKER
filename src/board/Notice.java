package board;

import java.sql.Timestamp;

public class Notice {
	private int notice_number;
	private String notice_title;
	private String notice_content;
	private Timestamp notice_date;
	private int notice_hit;
	public static int pageSize = 10;
	public static int pageCount = 1;
	public static int pageNum = 1;
	
	public static String pageNumberM(int limit) { // 관리자 페이지
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp; //pageNum - (pageNum - 1) % limit
		
		if((startPage - limit) > 0) {
			str="<a href='M-Notice_main.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for(int i=startPage; i<(startPage+limit); i++) {
			if (i == pageNum) {
				str+= i+"&nbsp;&nbsp;";
			}else {
				str+="<a href='M-Notice_main.jsp?pageNum="+i+"'>"+i+"</a>&nbsp;&nbsp;";
			}
			
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='M-Notice_main.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
		
		return str;
	}
	
	public static String pageNumber(int limit) { // 관리자 페이지
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp; //pageNum - (pageNum - 1) % limit
		
		if((startPage - limit) > 0) {
			str="<a href='Notice_main.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for(int i=startPage; i<(startPage+limit); i++) {
			if (i == pageNum) {
				str+=""+i+"&nbsp;&nbsp;";
			}else {
				str+="<a href='Notice_main.jsp?pageNum="+i+"'>"+i+"</a>&nbsp;&nbsp;";
			}
			
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='Notice_main.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
		
		return str;
	}
	
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


