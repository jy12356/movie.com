<%@page import="Gallery.GalleryBean"%>
<%@page import="Gallery.GalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>

<%
request.setCharacterEncoding("utf-8");
GalleryDAO gdao = new GalleryDAO();
int num = Integer.parseInt(request.getParameter("num"));
GalleryBean gb =  gdao.getGallery(num);
%>
	<div id="contents" class="dv_wrap"> 
		<div class="clearfix container">
	    	<div class="contit">
	        	<div class="loc">
	            	<img src="../images/ico_home.gif" alt="홈"> &gt; <span class="current">영화정보</span>
	            </div>
				<h2 class="h2">영화정보 수정하기</h2>
			</div>
			<div class="borad">
			        <p class="board_point c_red"><span>*</span> 표시가 있는 항목은 필수 입력항목입니다.</p>
			        <form action="galleryUpdatePro.jsp" method="post" enctype="multipart/form-data">
			        	<input type="hidden"  name="num" value="<%=gb.getNum() %>">
				        <table class="board_write">
				            <caption>영화정보쓰기</caption>
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
				                        <input type="text" name="title" id="title" value="<%=gb.getTitle() %>">
				                    </td>
				                </tr>
				                <tr>
			                      	<th scope="row"><label for="pass"><span class="c_red">*</span>비밀번호</label></th>
				                    <td >
				                        <input type="password" name="pass" id="pass" >
				                    </td>
				                    <th scope="row"><label for="thumImg"><span class="c_red">*</span>썸네일 이미지</label></th>
				                    <td  colspan="3">
				                        <div id="uploadfield">
				                            <input type="file" name="thumImg"  id ="thumImg"title="썸네일이미지" >
			                            	<input type="hidden" name="oldThumImg" title="첨부파일1" value="<%=gb.getThumImg() %>">
				                        </div>
				                    </td>
				                </tr>
				                <tr>
				                    <th scope="row"><label for="genre"><span class="c_red">*</span>장르</label></th>
				                    <td>
				                    	<input type="radio" value="cm"  name="genre" <%="cm".equals(gb.getGenre()) ? "checked": "" %>> 코미디
				                    	<input type="radio"  name="genre" value="ac" <%="ac".equals(gb.getGenre()) ? "checked": "" %>>액션
				                    	<input type="radio"  name="genre"   value="hr" <%="hr".equals( gb.getGenre()) ? "checked": "" %>>공포
				                    	<input type="radio"  name="genre"  value="rm" <%="rm".equals(gb.getGenre()) ? "checked": "" %>>로맨스
				                    	<input type="radio"  name="genre"  value="sf" <%="sf".equals( gb.getGenre()) ? "checked": "" %>>SF
				                    	<input type="radio"  name="genre"  value="an" <%="an".equals(gb.getGenre()) ? "checked": "" %>>애니메이션
				                    	<input type="radio"  name="genre"  value="dr" <%="dr".equals(gb.getGenre()) ? "checked": "" %>>드라마
				                    </td>
				                    <th scope="row"><label for="spectator"><span class="c_red">*</span>관람가</label></th>
				                    <td>
				                    	<select name="spectator">
				                    		<option value="0"  <%=0 == gb.getSpectator() ? "selected": "" %>>전체관람가</option>
				                    		<option  value="1" <%=1 ==gb.getSpectator() ? "selected": "" %>>12세관람가</option>
				                    		<option  value="2" <%=2 == gb.getSpectator() ? "selected": "" %>>15세관람가</option>
				                    		<option  value="3" <%=3 == gb.getSpectator() ? "selected": "" %>>19세관람가</option>
				                    	</select>
				                    </td>
				                </tr>
				                 <tr>
				                    <th scope="row"><label for="runtime"><span class="c_red">*</span>상영시간</label></th>
				                    <td>
				                        <input type="text" name="runtime" id="runtime" value="<%=gb.getRuntime() %>">
				                    </td>
				                    <th scope="row"><label for="openDate"><span class="c_red">*</span>개봉일</label></th>
				                    <td>
				                        <input type="text" name="openDate" id="openDate" class="movieDatepicker" value="<%=gb.getOpenDate() %>">
				                    </td>
				                </tr>
				                 <tr>
				                    <th scope="row"><label for="director">감독</label></th>
				                    <td>
				                        <input type="text" name="director" value="<%=gb.getDirector() %>">
				                    </td>
				                    <th scope="row"><label for="grade">평점</label></th>
				                    <td colspan="3">
				                        <input type="text" name="grade" id="grade" value="<%=gb.getGrade() %>">
				                    </td>
				                </tr>
				                <tr>
				                    <th scope="row"><label for="cast">출연진</label></th>
				                    <td colspan="3">
				                        <input type="text" name="cast" id="cast" value="<%=gb.getCast() %>">
				                    </td>
				                </tr>
				                <tr>
				                    <th scope="row"><label for="depTitle">설명제목</label></th>
				                    <td colspan="3">
				                        <input type="text" name="depTitle" id="depTitle" value="<%=gb.getDepTitle() %>">
				                    </td>
				                </tr>
				                <tr>
				                    <th scope="row"><label for="content">내 용</label></th>
				                    <td colspan="3">
				                        <textarea name="content" id="content" title="내용" class="textarea_v1"><%=gb.getContent() %></textarea>
				                    </td>
				                </tr>
				            </tbody>
				        </table>
			
						<!--버튼 시작-->
					    <div class="bbs_btn center mt30">
					        <input type="submit" class="btn medium color1" value="수정하기">
					        <input type="reset" class="btn medium" value="재작성">
					    </div>
			    </form>
			</div>
		</div>
	</div>
	<!-- 		 jQuery UI CSS파일  -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<!-- 		/jQuery 기본 js파일 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<!-- 		jQuery UI 라이브러리 js파일 -->
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
	<script type="text/javascript">
			$(function() {
			    $( "#openDate" ).datepicker({
			    	 dateFormat: 'yy-mm-dd',	//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
			         prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
			         nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
			         closeText: '닫기', // 닫기 버튼 텍스트 변경
			         currentText: '오늘', // 오늘 텍스트 변경
			         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
			         monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
			         dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
			         dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
			         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
			         showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
			         yearSuffix: '년',	//
			         showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
	//		         buttonImageOnly: true,	// input 옆에 조그만한 아이콘으로 캘린더 선택가능하게 하기
	//		         buttonImage: "images/calendar.gif",	// 조그만한 아이콘 이미지
	//		         buttonText: "Select date"	// 조그만한 아이콘 툴팁
			    });
			});
			</script>
	
	
	<jsp:include page="../inc/bottom.jsp"></jsp:include>