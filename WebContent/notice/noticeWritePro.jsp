<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="notice.NoticeDAO"%>
<%@page import="notice.NoticeBean"%>
<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="java.util.Timer"%>
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


	
	String uploadPath = request.getRealPath("/upload"); // upload는 폴더명 / 폴더물리적경로


	int maxSize = 10*1024*1024;
	MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"UTF-8",new DefaultFileRenamePolicy());

	String title = multi.getParameter("title");
	String writer = multi.getParameter("writer");
	String pw =multi.getParameter("pw");
	String content = multi.getParameter("content");
	String file1 =multi.getFilesystemName("file1");
	String file2 =multi.getFilesystemName("file2");
	Timestamp date = new Timestamp(System.currentTimeMillis());
	Timestamp modifyDate =  new Timestamp(System.currentTimeMillis());
	
	
	NoticeBean nb =new NoticeBean();
	nb.setTitle(title);
	nb.setWriter(writer);
	nb.setPw(pw);
	nb.setContent(content);
	nb.setFile1(file1);
	nb.setFile2(file2);
	nb.setDate(date);
	nb.setModifyDate(modifyDate);
	
	NoticeDAO ndao = new NoticeDAO();
	ndao.insertNotice(nb);
	response.sendRedirect("notice.jsp");
%>


</body>
</html>