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
int num = Integer.parseInt(request.getParameter("num"));
String  pass =request.getParameter("pass");
int chk =  gdao.numChk(num,pass);

if(chk == 1){
	gdao.delGallery(num);%>
	<script type="text/javascript">
	alert("삭제되었습니다.");
	location.href="gallery.jsp";
	</script>
<%}else if(chk == -1){%>
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다");
		history.back();
	</script>
<%}else if(chk == 0){%>
	<script type="text/javascript">
		alert("이미 삭제된글입니다.");
		location.href="gallery.jsp";
	</script>
<%}%>%>

</body>
</html>