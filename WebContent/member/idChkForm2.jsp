<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/contents.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/skel.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String  wid  = request.getParameter("id");
int  idChkn  = Integer.parseInt(request.getParameter("idChkn"));
MemberDAO mdao = new MemberDAO();
int chk = mdao.idChk(wid);
	if(chk == 1 ){
		out.println(wid + " 는(은) 이미 사용하고있는 ID 입니다.");
		idChkn = 1;
		
	}else{
		out.println(wid + " 는(은) 사용가능 한 ID 입니다.");
		
	} 
%>
</body>
</html>