<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="notice.NoticeBean"%>
<%@page import="notice.NoticeDAO"%>
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
String uploadPath = request.getRealPath("/upload"); // upload는 폴더명 / 폴더물리적경로
int maxSize = 10*1024*1024;
MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"UTF-8",new DefaultFileRenamePolicy());

NoticeDAO ndao = new NoticeDAO();
int num = Integer.parseInt(multi.getParameter("num"));
String  pass =multi.getParameter("pass");
String title = multi.getParameter("title");
String content = multi.getParameter("content");
//새로수정 file
String file1 =multi.getFilesystemName("file1");
String file2 =multi.getFilesystemName("file2");
//새로추가할 파일이 없으면 file 기존파일이름
if(file1 ==null){
	file1 = multi.getParameter("oldFile1");
}
if(file2 == null){
	file2 = multi.getParameter("oldFile2");
}
Timestamp modifyDate =  new Timestamp(System.currentTimeMillis());
int chk =  ndao.numChk(num,pass);

if(chk == 1){
	NoticeBean nb = new NoticeBean();
	nb.setNum(num);
	nb.setTitle(title);
	nb.setContent(content);
	nb.setModifyDate(modifyDate);
	nb.setFile1(file1);
	nb.setFile2(file2);
	ndao.updateNotice(nb);
	response.sendRedirect("notice.jsp");
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