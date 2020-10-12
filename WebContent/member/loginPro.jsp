<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	MemberDAO mdao = new MemberDAO();
	int check = mdao.userChk(id, pass);
	if(check == 0){
		session.setAttribute("id", id);
		session.setAttribute("pass", pass);
		response.sendRedirect("../main/index.jsp");
	}else if(check == 1){%>
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			history.back(); 
		</script>
<%}else if(check == -1){%>
		<script type="text/javascript">
			alert("아이디가 존재하지 않습니다.");
			history.back(); 
		</script>
<%} %>

</body>
</html>