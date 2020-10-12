package mail;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator  extends Authenticator{
	PasswordAuthentication passAuth;
    public SMTPAuthenticator(){
        passAuth = new PasswordAuthentication("jiyeon9061","poajzighmuzormru");
    }
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		 return passAuth;
	}
   
	/*
	 * javax.mail 패키지의 주요 클래스는 Session, Message, Address, Authenticator, Tranport
	 * Authenticator 클래스 SMTP 서버에 연결해 사용자 인증을 위해 필요
	 * PasswordAuthenticator 클래스로부터 인스턴스를 생성하고 getPasswordAuthentication 메소드로 리턴받아야 한다.
	 * PasswordAuthentication 클래스는 사용자의 아이디와 패스워드를 입력받아 반환하도록 재정의한다.
	 * */
}
