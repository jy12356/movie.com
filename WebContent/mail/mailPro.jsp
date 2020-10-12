<%@page import="mail.SendMail"%>
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
	String sender = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	SendMail sm = new SendMail();
	boolean result = sm.sendEmail(sender, receiver, subject, content);
	
	if(result == true){%>
		<script type="text/javascript">
			alert("문의접수가 완료되었습니다.");
			location.href="../main/index.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert(<%=sender%>+","+<%=receiver%>+","+<%=subject%>+","+<%=content%>);
			alert("문의접수를 실패했습니다. 다시 이용해주시길바랍니다.");
			history.back();
		</script>
	<%} %>
</body>
</html>