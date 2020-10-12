<%@page import="Gallery.GalleryDAO"%>
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

GalleryDAO gdao = new GalleryDAO();
int num  = Integer.parseInt(request.getParameter("num"));
String id = (String)session.getAttribute("id");
int chk = 0;
if(id !=null){
	chk = gdao.recommendChk(id,num); 
	if(chk == 0){
		gdao.recommend(num); 
		gdao.recommendChkInsert(num,id); %>
		<script type="text/javascript">
		alert("추천되었습니다.");
		location.href="gView.jsp?num=<%=num%>";
		</script>	
<%}else{%>
	<script type="text/javascript">
		alert("이미 추천하셨습니다.");
		location.href="gView.jsp?num=<%=num%>";
	</script>	
	
<%	}
}else{%>
	<script type="text/javascript">
	alert("로그인을 하셔야 추천할수있습니다..");
	location.href="../member/login.jsp";
	</script>
<%}%>



</body>
</html>