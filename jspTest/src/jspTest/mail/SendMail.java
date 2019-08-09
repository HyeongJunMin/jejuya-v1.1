package jspTest.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	public static void main(String[] args) {
		String str = "<!DOCTYPE html>\r\n" + 
				"<html>\r\n" + 
				"<head>\r\n" + 
				"<meta charset=\"UTF-8\">\r\n" + 
				"<title>JEJUYA ID &#52286;&#44592;</title>\r\n" + 
				"<link rel=\"stylesheet\" href=\"./mailForm.css\">\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				" \r\n" + 
				"<div class=\"wrapFindId\">\r\n" + 
				" \r\n" + 
				"	<div class=\"tblFindIdHeader\">\r\n" + 
				"	<h1>JEJUYA &#50500;&#51060;&#46356;&#47484; &#50508;&#47140; &#46300;&#47549;&#45768;&#45796;</h1>\r\n" + 
				"	<hr>\r\n" + 
				"</div>\r\n" + 
				" \r\n" + 
				"	<div class=\"tblFindIdBody\">\r\n" + 
				"		<table id=\"tblFindId\">\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					<strong>&#44256;&#44061;&#45784;&#44760;&#49436; &#50836;&#52397;&#54616;&#49888; <a class=\"lblGreen\" style=\"color:green;\">&#50500;&#51060;&#46356;</a>&#47484; &#50508;&#47140; &#46300;&#47549;&#45768;&#45796;.</strong>\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					<p class=\"descAccountInfo\" style=\"padding: 10px;\r\n" + 
				"	width: 700px;\r\n" + 
				"	background-color: #f0ffff;\">\r\n" + 
				"						<b>&#50500;&#51060;&#46356; : </b>\r\n" + 
				"						<br>\r\n" + 
				"						*&#48708;&#48128;&#48264;&#54840;&#44032; &#44592;&#50613;&#45208;&#51648; &#50506;&#45716; &#44221;&#50864; <a class=\"lblGreen\" style=\"color:green;\">&#48708;&#48128;&#48264;&#54840; &#51116;&#48156;&#44553; &#54168;&#51060;&#51648;</a>&#50640;&#49436; &#52286;&#51012; &#49688; &#51080;&#49845;&#45768;&#45796;.\r\n" + 
				"					</p>\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"padding: 10px;\">\r\n" + 
				"					JEJUYA&#47484; &#51060;&#50857;&#54644; &#51452;&#49492;&#49436; &#44048;&#49324;&#54633;&#45768;&#45796;.<br>\r\n" + 
				"					&#45908;&#50865; &#54200;&#47532;&#54620; &#49436;&#48708;&#49828;&#47484; &#51228;&#44277;&#54616;&#44592; &#50948;&#54644; &#54637;&#49345; &#52572;&#49440;&#51012; &#45796;&#54616;&#44192;&#49845;&#45768;&#45796;.\r\n" + 
				"				</td>\r\n" + 
				"			</tr>\r\n" + 
				"</table>\r\n" + 
				"<hr>\r\n" + 
				"</div>	\r\n" + 
				"</div>\r\n" + 
				" \r\n" + 
				"</body>\r\n" + 
				"</html>";
		System.out.println(str);
		sendMail(str);
	}
	
	public static void sendMail(String html) {
		String host = "smtp.naver.com";
		final String user = "5739859";
		final String password = "wpwndi1!";

		//String to = "zionadd@naver.com";
		String to = "01068889859@hanmail.net";

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {
			
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			
			// Content html
			message.setContent(html, "text/html;charset=UTF-8");
			
			// Subject
			message.setSubject("Java Mail Test With Json 2");

			// Text
			//message.setText(html);			
			

			// send the message
			Transport.send(message);
			System.out.println("message sent successfully...");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
