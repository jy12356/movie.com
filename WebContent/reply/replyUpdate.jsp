<%@page import="reply.ReplyDAO"%>
<%@page import="reply.ReplyBean"%>
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
int cmtNum = Integer.parseInt(request.getParameter("cmtNum"));
int boardNum = Integer.parseInt(request.getParameter("boardNum"));
int contNum = Integer.parseInt(request.getParameter("contNum"));
String cmtCnt = request.getParameter("content");

ReplyBean rb = new ReplyBean();
ReplyDAO rd = new ReplyDAO();

rb.setCmtNum(cmtNum);
rb.setCmtCnt(cmtCnt);
rb.setContNum(contNum);
rd.updateReply(rb);

if(contNum == 0 ){
	response.sendRedirect("../gallery/gView.jsp?num="+boardNum);	
}else if(contNum == 1){
	response.sendRedirect("../board/boardView.jsp?num="+boardNum);
}
%>

</body>
</html>