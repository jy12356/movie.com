<%@page import="member.MemberBean"%>
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
	MemberDAO mdao = new MemberDAO();
	String id  = (String)session.getAttribute("id");
	int chk= mdao.idChk(id);
	if(id != ""){
		response.sendRedirect("myPage.jsp");
	}else{%>
	<script>
		alert("로그인페이지로 이동합니다.");
		location.href("loginForm.jsp");
	</script>
<%} %>
			
</body>
</html>