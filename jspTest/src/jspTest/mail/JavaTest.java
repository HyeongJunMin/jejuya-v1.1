package jspTest.mail;

public class JavaTest {
	public static void main(String[] args) {
		for(int i = 1 ; i < 4 ; i++) {
			for(int j = 5; j < 24; j++) {
				System.out.println("날짜 : " + i + "  , 시간:" + j + ", th의 ID : 0" + i + ":" + ((j<10)?"0"+j:j) + ":00" );
			}
		}
	}
}
