package mail;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class SendMail{
	public boolean sendEmail(String sender, String receiver, String subject, String content){
		
		boolean result = false;
		 String charSet = "utf-8" ;
		//Properties설정
		//임시로 값을 저장해 줌 
		//gmailSMTP 사용
		Properties props = System.getProperties(); //시스템의 속성을 객체로 생성하는 클래스
		//Hashtable을 상속받은 클래스로 key과 value 1:1로
		props.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
		props.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
		props.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
		props.put("mail.smtp.port", "587");                 // gmail 포트
		
		System.out.println(sender+","+receiver+","+subject+","+content);
				
		Authenticator auth = new SMTPAuthenticator();//*MailAuth.java 에서 Authenticator를 상속받아 생성한 MailAuth 클래스를 받아 세션을 생성.
		Session mailSession = Session.getDefaultInstance(props, auth);// 앞서 설정한 메일 처리 환경
		// create a message
		MimeMessage msg = new MimeMessage(mailSession); //(추상)클래스를 상속받은 인터넷 메일을 위한 클래스(세션을 담아 msg 객체를 생성)
		
		try {
			// set the from and to address
			msg.setFrom(new InternetAddress("jiyeon9061@gami.com",sender)); //발송자 지정(발송자의 메일 발송자명)
			//InternetAddress 클래스는 이메일 주소
			InternetAddress to = new InternetAddress(receiver);  //수신자메일생성
			msg.addRecipient(Message.RecipientType.TO, to);//받는 사람설정
			//setRecipient() 메소드로 수신자, 참조, 숨은 참조 설정도 가능
			//Message.RecipientType.TO : 받는 사람
			//Message.RecipientType.CC : 참조
			//Message.RecipientType.BCC : 숨은 참조
		
			 // Setting the Subject and Content Type
			msg.setSubject(MimeUtility.encodeText(subject,charSet,"B")); // 제목 설정, 한글깨짐 US-ASCII가 아닌 문자를 검사, US-ASCII가 맞으면 그냥 보내고 아니면 인코딩(제목) B또는 Q로 인코딩하여 전송
			msg.setContent(content,"text/html; charset=UTF-8");  // 내용 설정, 한글깨짐 인코딩(내용)
			msg.setSentDate(new Date());// 보내는 날짜 설정
			Transport.send(msg);  // 최종메일 보내기
			result = true; //성공시 값 리턴값
		} catch(AddressException ae) { 
            System.out.println("AddressException : " + ae.getMessage());           
        } catch(MessagingException me) { //메일계정인증관련 예외처리             
            System.out.println("MessagingException : " + me.getMessage());
        } catch(UnsupportedEncodingException e) { //지원되지않는 인코딩을 사용할 경우 예외처리
            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
        }
		return result;
		
	}
}
