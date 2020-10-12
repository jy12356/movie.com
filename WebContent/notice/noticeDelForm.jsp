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
int num  = Integer.parseInt(request.getParameter("num"));

%>
<div class="center delForm">
	<form action="noticeDelete.jsp" method="post"> 
		<input type="hidden" value="<%=num%>" name="num">
		<table>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass"></td>
			</tr>
		</table>
		<div class="boardBtns center">
			<input type="submit" value="삭제" class="btn medium">
	    </div>
	</form>
</div>
</body>
</html>