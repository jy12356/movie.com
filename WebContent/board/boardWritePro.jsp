<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="java.util.Timer"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
	String title = request.getParameter("title");
	String writer = "";
	if(request.getParameter("writer").equals("무비닷컴")){
		writer = "admin";
	}else{
		writer = request.getParameter("writer");
	};
	String pw = request.getParameter("pw");
	String content = request.getParameter("content");
	Timestamp date = new Timestamp(System.currentTimeMillis());
	Timestamp modifyDate = new Timestamp(System.currentTimeMillis());
	
	BoardBean bb =new BoardBean();
	bb.setTitle(title);
	bb.setWriter(writer);
	bb.setPw(pw);
	bb.setContent(content);
	bb.setDate(date);
	bb.setModifyDate(modifyDate);
	
	BoardDAO bdao = new BoardDAO();
	bdao.insertBoard(bb);
	response.sendRedirect("board.jsp");
%>


</body>
</html>