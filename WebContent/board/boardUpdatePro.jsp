<%@page import="java.util.Currency"%>
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
BoardDAO bdao = new BoardDAO();
int num = Integer.parseInt(request.getParameter("num"));
String  pass =request.getParameter("pass");
String title = request.getParameter("title");
String content = request.getParameter("content");
Timestamp modifyDate =  new Timestamp(System.currentTimeMillis());
int chk =  bdao.numChk(num,pass);

if(chk == 1){
	BoardBean bb = new BoardBean();
	bb.setNum(num);
	bb.setTitle(title);
	bb.setContent(content);
	bb.setModifyDate(modifyDate);
	bdao.updateBoard(bb);
	response.sendRedirect("board.jsp");
}else if(chk == -1){%>
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다");
		history.back();
	</script>
<%}else if(chk == 0){%>
	<script type="text/javascript">
		alert("삭제된글입니다.");
		history.back();
	</script>
<%}%>%>

</body>
</html>