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
	String name = request.getParameter("name");
	String mobile = request.getParameter("mobile");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email")+"@"+request.getParameter("email2");
	String address = request.getParameter("zip")+"/"+request.getParameter("address1")+"/"+request.getParameter("address2");
			
	MemberDAO mdao = new MemberDAO();
	int chk = mdao.userChk(id, pass);
	if(chk == 0){
		MemberBean mb =new MemberBean();
		mb.setId(id);
		mb.setName(name);
		mb.setMobile(mobile);
		mb.setPhone(phone);
		mb.setEmail(email);
		mb.setAddress(address);
		mdao.updateMember(mb);
		response.sendRedirect("myPage.jsp");
		
	}else if(chk == 1){%>
		<script type="text/javascript">
			alert("비밀번호가 다릅니다.");
			history.back();
		</script>
<%}%>

</body>
</html>