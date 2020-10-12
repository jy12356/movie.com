<%@page import="reply.ReplyDAO"%>
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
	String id =	request.getParameter("id");
	int cmtNum =Integer.parseInt(request.getParameter("cmtNum"));
	int depthNum =Integer.parseInt(request.getParameter("depthNum"));
	int pageNum =Integer.parseInt(request.getParameter("num"));
	int contNum =Integer.parseInt(request.getParameter("contNum"));
	boolean result = false;
	ReplyDAO rdao = new ReplyDAO();
	result = rdao.delCommentAdmin(cmtNum,contNum,depthNum);
	System.out.println(result);
	
	if(result == false){
%>
		<script type="text/javascript">
			alert("삭제권한이 없습니다.");
			location.href="../board/boardView.jsp?num=<%=pageNum%>";
		</script>
	<%}else{ %>
		<script type="text/javascript">
			alert("삭제완료하였습니다.");
			if(<%=contNum%> == 0){
				location.href="../gallery/gView.jsp?num=<%=pageNum%>";
			}else if(<%=contNum%>== 1){
				location.href="../board/boardView.jsp?num=<%=pageNum%>";
			}
		</script>
	<%} %>
</body>
</html>