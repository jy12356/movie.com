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
session.invalidate();
// response.sendRedirect("../main/index.jsp");
%>
<script type="text/javascript">
	alert("로그아웃되었습니다.");
	location.href="../main/index.jsp";
</script>
</body>
</html>