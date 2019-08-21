package jspTest.mail;

import java.io.UnsupportedEncodingException;

public class CrawlTest {
	public static void main(String[] args) {
		
		//INSERT INTO NOTICE_JEJU VALUES(SEQ_NOTICE_JEJU.NEXTVAL, SEQ_NOTICE_JEJU.CURRVAL , ?, ?, ?, ?, ?, ?, 0, 0, SYSDATE) ";
//		for(int i = 20; i < 100 ; i++) {
//			System.out.print(" INSERT INTO NOTICE_JEJU VALUES(SEQ_NOTICE_JEJU.NEXTVAL, SEQ_NOTICE_JEJU.CURRVAL, ");
//			System.out.print(" '공지test" + i + "', " + " '공지test" + i + "', '', '', '', 'admin', 0, 0, SYSDATE) ;");
//			System.out.println();
//		}

		
		String str;
		try {
			str = new String("%EC%B9%B4%ED%8E%98".getBytes("8859_1"),"KSC5601");
			System.out.println("unicode : " + str);
			
			str = toKOR(str);
			System.out.println("unicode : " + str);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	public static String toKOR(String s) { // to KSC5601

		if (s == null) {
			return null;
		}
		try {
			return new String(s.getBytes("8859_1"), "KSC5601");
		} catch (Exception e) {
			return s;
		}
	}
}
