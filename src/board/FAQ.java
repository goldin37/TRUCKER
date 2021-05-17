package board;

public class FAQ {
	private int faq_number;
	private String faq_title;
	private String faq_content;
	public static int pageSize = 10;
	public static int pageCount = 1;
	public static int pageNum = 1;
	
	public static String pageNumberM(int limit) { // 관리자 페이지
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp; //pageNum - (pageNum - 1) % limit
		
		if((startPage - limit) > 0) {
			str="<a href='M-FAQ_main.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for(int i=startPage; i<(startPage+limit); i++) {
			if (i == pageNum) {
				str+= i+"&nbsp;&nbsp;";
			}else {
				str+="<a href='M-FAQ_main.jsp?pageNum="+i+"'>"+i+"</a>&nbsp;&nbsp;";
			}
			
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='M-FAQ_main.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
		
		return str;
	}
	
	public static String pageNumber(int limit) {
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp; //pageNum - (pageNum - 1) % limit
		
		if((startPage - limit) > 0) {
			str="<a href='M-FAQ_main.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		for(int i=startPage; i<(startPage+limit); i++) {
			if (i == pageNum) {
				str+=""+i+"&nbsp;&nbsp;";
			}else {
				str+="<a href='M-FAQ_main.jsp?pageNum="+i+"'>"+i+"</a>&nbsp;&nbsp;";
			}
			
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='M-FAQ_main.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
		
		return str;
	}
	
	public int getFaq_number() {
		return faq_number;
	}
	public void setFaq_number(int faq_number) {
		this.faq_number = faq_number;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
}
