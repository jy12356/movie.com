<%@page import="notice.NoticeBean"%>
<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<%
request.setCharacterEncoding("utf-8");
NoticeDAO ndao = new NoticeDAO();
int num = Integer.parseInt(request.getParameter("num"));
NoticeBean nb =  ndao.getNotice(num);
%>
<div class="borad container">
	<div id="contents" class="dv_wrap"> 
    	<div class="contit">
        	<div class="loc">
            	<img src="../images/ico_home.gif" alt="홈"> &gt; <span class="current">공지사항 글수정</span>
            </div>
			<h2 class="h2">공지사항 글수정</h2>
		</div>
		<fieldset>
	        <legend>게시글 입력</legend>
	        <p class="board_point"><span class="c_red">*</span> 표시가 있는 항목은 필수 입력항목입니다.</p>
	        <form action="noticeUpdatePro.jsp" method="post" name="ntw" enctype="multipart/form-data">
	        	<input type="hidden" name="num" value="<%=nb.getNum()%>">
		        <table class="board_write">
		            <caption>게시글 입력</caption>
		            <colgroup>
		                <col style="width:15%">
		                <col style="width:35%">
		                <col style="width:15%">
		                <col style="width:35%">
		            </colgroup>
		            <tbody>
		                <tr>
		                    <th scope="row" class="topline">
		                        <label for="title">
		                            <span class="c_red">*</span>제 목
		                        </label>
		                    </th>
		                    <td class="topline" colspan="3">
		                        <input type="text" name="title" id="title" class="input_v1" value="<%=nb.getTitle()%>">
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row"><label for="writer"><span class="c_red">*</span>작 성 자</label></th>
		                    <td>
		                        <input type="text" name="writer" id="writer" class="input_v2 readonly" value="<%=nb.getWriter()%>" readonly="readonly">
		                    </td>
		                    <th scope="row"><label for="pass"><span class="c_red">*</span>비밀번호</label></th>
		                    <td>
		                        <input type="text" name="pass" id="pass" class="input_v2" >
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row">
		                    	<label for="title">
		                            <span class="c_red">*</span>내 용
		                        </label>
	                        </th>
		                    <td colspan="3">
		                        <textarea name="content" id="content" title="내용" class="textarea_v1"  ><%=nb.getContent() %></textarea>
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row">첨부파일</th>
		                    <td colspan="3">
		                        <div id="uploadfield">
		                            <input type="file" name="file1" title="첨부파일1">
	                            	<input type="hidden" name="oldFile1" title="첨부파일1" value="<%=nb.getFile1() %>">
		                            <br>
		                            <input type="file" name="file2" title="첨부파일2">
	                            	<input type="hidden" name="oldFile2" title="첨부파일2" value="<%=nb.getFile2() %>">
		                        </div>
		                    </td>
		                </tr>
		            </tbody>
		        </table>
		
				<!--버튼 시작-->
			    <div class="center  boardBtns">
					<input type="submit" class="btn medium color1" value="글수정">
			        <a href="notice.jsp" class="btn medium ">목록</a>
					<input type="reset" class="btn medium" value="다시작성">
			    </div>
		    </form>
	    </fieldset>
    </div>
</div>
<script type="text/javascript">
	if($(".readonly").is(":readonly")){
		
	}


</script>

<jsp:include page="../inc/bottom.jsp"></jsp:include>
