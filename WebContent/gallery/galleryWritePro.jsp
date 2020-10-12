<%@page import="Gallery.GalleryDAO"%>
<%@page import="Gallery.GalleryBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8") ;
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String uploadPath = request.getRealPath("/images");
int maxSize = 10*1024*1024;
MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"UTF-8",new DefaultFileRenamePolicy());

String title = multi.getParameter("title");
String thumImg = multi.getFilesystemName("thumImg");
String genre = multi.getParameter("genre");
int spectator = Integer.parseInt(multi.getParameter("spectator"));
String runtime = multi.getParameter("runtime");
String openDate = multi.getParameter("openDate");
System.out.println(openDate);
String director = multi.getParameter("director");
String cast = multi.getParameter("cast");
double grade =0;
if(Double.parseDouble(multi.getParameter("grade")) != 0){
	grade =  Double.parseDouble(multi.getParameter("grade"));
}
String depTitle = multi.getParameter("depTitle");
String content = multi.getParameter("content");
String pass = multi.getParameter("pass");

GalleryBean gb = new GalleryBean();
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
gb.setPass(pass);
GalleryDAO gdao = new GalleryDAO();
gdao.insertNotice(gb);
response.sendRedirect("gallery.jsp");
%>

</body>
</html>