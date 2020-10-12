<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MovieCom</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String email = request.getParameter("email")+"@"+request.getParameter("email2");
			String phone = request.getParameter("phone");
			String mobile = request.getParameter("mobile");
			String address = request.getParameter("zip") +"/"+ request.getParameter("address1") +"/"+ request.getParameter("address2");
			Timestamp date = new Timestamp(System.currentTimeMillis());
			
			MemberBean mb  = new MemberBean();
			mb.setId(id);
			mb.setPass(pass);
			mb.setName(name);
			mb.setEmail(email);
			mb.setPhone(phone);
			mb.setMobile(mobile);
			mb.setAddress(address);
			mb.setDate(date);
			MemberDAO mdao=new MemberDAO();
			mdao.insertMember(mb);
		%>
		
		<script type="text/javascript">
			alert("회원가입가입을 축하드립니다.");
			location.href="login.jsp";
		</script>
	
	</body>
</html>