package jspTest.mail;

import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class CrawlTest {
	public static void main(String[] args) {
		// Jsoup를 이용해서 네이버 스포츠 크롤링
//        String url = "https://sports.news.naver.com/wfootball/index.nhn";
		String url = "https://www.visitjeju.net/kr/detail/view?contentsid=CONT_000000000500477&menuId=DOM_000001718001000000#p1";
        Document doc = null;
         
        try {
            doc = Jsoup.connect(url).get();
//            System.out.println(doc.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
         
        // 주요 뉴스로 나오는 태그를 찾아서 가져오도록 한다.
        Elements element = doc.select("div._grid-system-grid_");
         
        // 1. 헤더 부분의 제목을 가져온다.
        //String title = element.select("p").text().substring(0, 4);
        Iterator<Element> ie1 = element.select("p").iterator();
        while( ie1.hasNext() ) {
        	System.out.println(ie1.next().html());
        }
        
        Iterator<Element> ie2 = element.select("img").iterator();
        while( ie2.hasNext() ) {
        	System.out.println(ie2.next().html());
        }
	}
}
