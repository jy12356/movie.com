<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
if(id.equals("admin")){
	id = "무비닷컴";
}

%>

<script type="text/javascript">
function vNotice(){
	if(document.btw.title.value == ""){
		alert("제목을 입력해주세요");
		document.btw.title.focus();
		return false;
	}
	if(document.btw.pw.value == ""){
		alert("비밀번호를 입력해주세요");
		document.btw.pw.focus();
		return false;
	}
	
	if(document.btw.content.value == ""){
		alert("내용을 입력해주세요");
		document.btw.content.focus();
		return false;
	}
	
		
	
}
</script>
<div class="borad container">
	<div id="contents" class="dv_wrap"> 
    	<div class="contit">
        	<div class="loc">
            	<img src="../images/ico_home.gif" alt="홈"> &gt; <span class="current">공지사항 글쓰기</span>
            </div>
			<h2 class="h2">공지사항 글쓰기</h2>
		</div>
		<fieldset>
	        <legend>게시글 입력</legend>
	        <p class="board_point"><span class="c_red">*</span> 표시가 있는 항목은 필수 입력항목입니다.</p>
	        <form action="boardWritePro.jsp" method="post" name="btw" onsubmit="return vNotice();" >
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
		                        <input type="text" name="title" id="title" class="input_v1">
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row"><label for="writer"><span class="c_red">*</span>작 성 자</label></th>
		                    <td class="readron">
		                        <input type="text" name="writer" id="writer" class="input_v2" value="<%=id %>" readonly="readonly" >
		                    </td>
		                    <th scope="row"><label for="pw"><span class="c_red">*</span>비밀번호</label></th>
		                    <td>
		                        <input type="password" name="pw" id="pw" class="input_v2">
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row">
		                    	<label for="title">
		                            <span class="c_red">*</span>내 용
		                        </label>
	                        </th>
		                    <td colspan="3">
		                        <textarea name="content" id="content" title="내용" class="textarea_v1"  ></textarea>
		                    </td>
		                </tr>
		            </tbody>
		        </table>
		
				<!--버튼 시작-->
			    <div class="center  boardBtns">
					<input type="submit" class="btn medium color1" value="글쓰기">
			        <a href="board.jsp" class="btn medium ">목록</a>
					<input type="reset" class="btn medium" value="다시작성">
			    </div>
		    </form>
	    </fieldset>
    </div>
</div>


<jsp:include page="../inc/bottom.jsp"></jsp:include>
