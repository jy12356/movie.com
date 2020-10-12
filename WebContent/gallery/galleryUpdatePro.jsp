<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.lang.Double"%>
<%@page import="Gallery.GalleryBean"%>
<%@page import="Gallery.GalleryDAO"%>
<%@page import="java.util.Currency"%>
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

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String uploadPath = request.getRealPath("/images");
int maxSize = 10*1024*1024;
MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"UTF-8",new DefaultFileRenamePolicy());

GalleryDAO gdao = new GalleryDAO();
int num = Integer.parseInt(multi.getParameter("num"));
String  pass =multi.getParameter("pass");
String title = multi.getParameter("title");
String content = multi.getParameter("content");
String thumImg = multi.getFilesystemName("thumImg");
String genre = multi.getParameter("genre");
int spectator =Integer.parseInt(multi.getParameter("spectator"));
String runtime = multi.getParameter("runtime");
String openDate = multi.getParameter("openDate");
String director = multi.getParameter("director");
String cast = multi.getParameter("cast");
Double grade = Double.parseDouble(multi.getParameter("grade"));
String depTitle = multi.getParameter("depTitle");
int chk =  gdao.numChk(num,pass);

if(thumImg == null){
	thumImg = multi.getParameter("oldThumImg");
}

if(chk == 1){
	GalleryBean gb =  new GalleryBean();
	gb.setNum(num);
	gb.setPass(pass);
	gb.setTitle(title);
	gb.setThumImg(thumImg);
	gb.setGenre(genre);
	gb.setSpectator(spectator);
	gb.setRuntime(runtime);
	gb.setOpenDate(openDate);
	gb.setDirector(director);
	gb.setCast(cast);
	gb.setGrade(grade);
	gb.setDepTitle(depTitle);
	gb.setContent(content);
	gdao.updateGallery(gb);
	response.sendRedirect("gallery.jsp");
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