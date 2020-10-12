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
	String id = request.getParameter("id");
	String pass =request.getParameter("pass");
	MemberDAO mdao = new MemberDAO();
	int chk = mdao.userChk(id, pass);
	if(chk == 0){
		mdao.delMember(id,pass);
		session.invalidate();
		%>
		<script type="text/javascript">
			alert("회원탈퇴 되었습니다.");
			location.href="../main/index.jsp";
		</script>
	<%		
	}else if(chk == 1){%>
		<script type="text/javascript">
			alert("비밀번호가 다릅니다.");
			history.back();
		</script>
<%}%>

</body>
</html>