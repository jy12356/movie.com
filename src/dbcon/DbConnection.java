package dbcon;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


//JSP 443페이지 참고
//커넥션 풀(conntection pool)
//데이터베이스와 연결된 Connection객체를 미리 생성하여 Pool(풀, 기억장소) 저장
//필요할때마다 풀에 접근하여 Connection객체 사용
//1. context.xml 만들어 미리 자원 준비
//2. DAO 자원이름을 불러서 사용
// 장점 : 속도증가, 수정시 하나의 파일 context.xml 수정
public class DbConnection {
	
	public Connection getConnection() throws Exception{
		Connection con = null;
//		Class.forName("com.mysql.jdbc.Driver");
//		String dbUrl = "jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
////		String dbUser = "jspid";
////		String dbpass = "jsppass";
//		String dbUser = "root";
//		String dbpass = "1234";
//		con = DriverManager.getConnection(dbUrl, dbUser, dbpass);
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();
		return con;
	}
	
}
