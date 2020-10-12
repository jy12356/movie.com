
<%@page import="notice.NoticeBean"%>
<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>

<%
request.setCharacterEncoding("utf-8");
NoticeDAO ndao = new NoticeDAO();
int num = Integer.parseInt(request.getParameter("num"));
// 조회수 update
ndao.updateNoticeReadcount(num);
NoticeBean nb =  ndao.getNotice(num);
%>
<div class="borad container"> 
	<div id="contents" class="dv_wrap"> 
    	<div class="contit">
        	<div class="loc">
            	<img src="../images/ico_home.gif" alt="홈"> &gt; <span class="current">글쓰기</span>
            </div>
			<h2 class="h2">공지사항</h2>
		</div>
		<form action="noticeUpdate.jsp" method="post" name="ntw">
			<input type="hidden" name="num" value="<%=nb.getNum()%>">
		    <table class="board_view table_type">
		        <caption> 공지사항 글보기</caption>
		        <colgroup>
		            <col style="width : 16%">
		            <col  style="width : 16%">
		            <col  style="width : 16%">
		            <col  style="width : 16%">
		            <col  style="width : 16%">
		            <col  style="width : 16%">
		        </colgroup>
		        <thead>
		            <tr>
		                <th scope="col" colspan="6" class="topline center"><%=nb.getTitle() %></th>
		            </tr>
		        </thead>
		        <tbody>
		            <tr>
		                <th scope="row" class="center">작 성 자</th>
		                <td class="left"> <%=nb.getWriter() %></td>
		                <th scope="row" class="center">등록일</th>
		                <td class="left"><%=nb.getDate() %></td>
		                <th scope="row" class="center">조&nbsp;&nbsp;&nbsp;회</th>
		                <td class="left"><%=nb.getReadcount() %></td>
		            </tr>
		            <tr>
		                <th class=" center" scope="row">첨부파일</th>
		                <td colspan="5" class="left">
		                    <div id="uploadfield">
		                        <p class="file">
		                        	<%if(nb.getFile1() != null){%>
		                            	<span><a href="file_down.jsp?file_name=<%=nb.getFile1()%>" target="_blank"><%=nb.getFile1()%></a></span>
		                            <%} %>
		                            <br>
		                            <%if(nb.getFile2() != null){%>
			                            <span><a href="file_down.jsp?file_name=<%=nb.getFile2()%>" target="_blank"><%=nb.getFile2()%></a></span>
		                            <%} %>
		                        </p>
		                    </div>
		                </td>
		            </tr>
		            <tr>
		                <td colspan="6" class="rfc_bbs_see_txt_left_con con">
		                    <%=nb.getContent() %>
		                </td>
		            </tr>
		        </tbody>
		    </table>
	
		    <!--버튼 시작-->
		    <div class="boardBtns center">
		    <%
		    if(session.getAttribute("id") != null){
				if(session.getAttribute("id").equals("admin")){ %>
			    <a href="noticeUpdateForm.jsp?num=<%=num %>" class="btn medium color1">수정</a>
			    <a href="notice.jsp" class="btn medium">목록</a>
		        <input type="button" class="btn medium" onclick="openDel()" value="삭제">
			<%}else{%>
				<a href="notice.jsp" class="btn medium">목록</a>
			<%}
			}else{%>
		        <a href="notice.jsp" class="btn medium">목록</a>
	        <%} %>
		    </div>
    	</form>
	    </div>
</div>
<script type="text/javascript">
	function openDel(){
		location.href="noticeDelForm.jsp?num=" + ntw.num.value;
	}
	
</script>

<jsp:include page="../inc/bottom.jsp"></jsp:include>
