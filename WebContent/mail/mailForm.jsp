<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>

<%

request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
%>

<div class="borad container">
	<div id="contents" class="dv_wrap"> 
    	<div class="contit">
        	<div class="loc">
            	<img src="../images/ico_home.gif" alt="홈"> &gt; <span class="current">문의하기</span>
            </div>
			<h2 class="h2">문의메일보내기</h2>
		</div>
		<fieldset>
	        <legend>문의하기(메일) 입력</legend>
	        <p class="board_point"><span class="c_red">*</span> 표시가 있는 항목은 필수 입력항목입니다.</p>
	        <form action="mailPro.jsp" method="post" name="sm" >
	        	<input type="hidden" name="sender" value="<%=id%>">
		        <table class="board_write">
		            <caption>메일 입력</caption>
		            <colgroup>
		                <col style="width:15%">
		                <col style="width:85%">
		            </colgroup>
		            <tbody>
		            	<tr>
		                    <th scope="row"><label for="receiver"><span class="c_red">*</span>받는사람</label></th>
		                    <td class="readron">
		                        <input type="text" name="receiver" id="receiver" class="input_v2"value="sjy9061@naver.com" readonly="readonly">
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row">
		                        <label for="subject">
		                            <span class="c_red">*</span>제 목
		                        </label>
		                    </th>
		                    <td>
		                        <input type="text" name="subject" id="subject" class="input_v1" required="required">
		                    </td>
		                </tr>
<!-- 		                <tr> -->
<!-- 		                    <th scope="row">첨부파일</th> -->
<!-- 		                    <td> -->
<!-- 								<p class="upload_txt">※ 첨부파일 용량은 최대 50mb까지 등록 가능합니다.</p> -->
<!-- 		                        <div id="uploadfield"> -->
<!-- 		                            <input type="file" name="upload" title="첨부파일1"> -->
<!-- 		                            <br> -->
<!-- 		                            <input type="file" name="upload" title="첨부파일2"> -->
<!-- 		                        </div> -->
<!-- 		                    </td> -->
<!-- 		                </tr> -->
		                <tr>
		                    <td colspan="2">
		                        <textarea name="content" id="content" title="내용" class="textarea_v1"required="required"></textarea>
		                    </td>
		                </tr>
		                
		            </tbody>
		        </table>
		
				<!--버튼 시작-->
			    <div class="center boardBtns">
			        <input type="submit" class="btn medium color1" value="메일작성">
			    </div>
		    </form>
	    <!--버튼 끝-->
	
	    </fieldset>
    </div>
</div>


<jsp:include page="../inc/bottom.jsp"></jsp:include>
