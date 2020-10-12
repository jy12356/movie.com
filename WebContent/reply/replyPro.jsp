<%@page import="reply.ReplyBean"%>
<%@page import="reply.ReplyDAO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
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
int boardNum = Integer.parseInt(request.getParameter("boardNum"));
int depthCmt  = Integer.parseInt(request.getParameter("depthCmt"));
int cmtSubNum = Integer.parseInt(request.getParameter("cmtSubNum"));
int contNum =  Integer.parseInt(request.getParameter("contNum"));
String cmtCnt  = request.getParameter("content");
String id = (String)session.getAttribute("id");
Timestamp date = new Timestamp(System.currentTimeMillis());
ReplyDAO rdao = new ReplyDAO();
ReplyBean rb = new ReplyBean();
if(cmtSubNum == 0 ){
	rb.setBoardNum(boardNum);
	rb.setDepthCmt(depthCmt);
	rb.setCmtCnt(cmtCnt);
	rb.setContNum(contNum);
	rb.setId(id);
	rb.setDate(date);
}else{
	rb.setBoardNum(boardNum);
	rb.setDepthCmt(depthCmt);
	rb.setCmtCnt(cmtCnt);
	rb.setContNum(contNum);
	rb.setId(id);
	rb.setDate(date);
	rb.setCmtSubNum(cmtSubNum);
}
rdao.insertreply(rb);

if(contNum == 0){
	response.sendRedirect("../gallery/gView.jsp?num="+boardNum);
}else if(contNum == 1 ){
	response.sendRedirect("../board/boardView.jsp?num="+boardNum);
}
%>

</body>
</html>