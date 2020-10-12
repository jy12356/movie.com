<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<script type="text/javascript">
function validate(){
	var gw = document.gw;
	if(gw.title.value == ""){
		alert("제목을 입력해주세요.");
		gw.title.focus();
		return false;
	}
	if(gw.pass.value == ""){
		alert("비밀번호를 입력해주세요.");
		gw.pass.focus();
		return false;
	}
	if(gw.thumImg.value == ""){
		alert("썸네일이미지를 입력해주세요.");
		gw.thumImg.focus();
		return false;
	}
	if(gw.genre.value == ""){
		alert("장르를 입력해주세요.");
		gw.genre.focus();
		return false;
	}
	if(gw.runtime.value == ""){
		alert("상영시간을 입력해주세요.");
		gw.runtime.focus();
		return false;
	}
	if(gw.spectator.value == ""){
		alert("관람가를 선택해주세요.");
		gw.spectator.focus();
		return false;
	}
	if(gw.runtime.value == ""){
		alert("상영시간을 입력해주세요.");
		gw.runtime.focus();
		return false;
	}
	if(gw.openDate.value == ""){
		alert("개봉일자를 입력해주세요.");
		gw.openDate.focus();
		return false;
	}
	if(gw.director.value == ""){
		alert("감독을 입력해주세요.");
		gw.director.focus();
		return false;
	}
	if(gw.cast.value == ""){
		alert("출연배우를입력해주세요.");
		gw.cast.focus();
		return false;
	}
	if(gw.openDate.value == ""){
		alert("평점 입력해주세요.");
		gw.openDate.focus();
		return false;
	}
	if(gw.depTitle.value == ""){
		alert("설명제목 입력해주세요.");
		gw.depTitle.focus();
		return false;
	}
	if(gw.content.value == ""){
		alert("영화설명을 입력해주세요.");
		gw.content.focus();
		return false;
	}
}
</script>
		<%
		request.setCharacterEncoding("utf-8");
		
		
		
		%>
		<div id="contents" class="dv_wrap"> 
			<div class="clearfix container">
		    	<div class="contit">
		        	<div class="loc">
		            	<img src="../images/ico_home.gif" alt="홈"> &gt; <span class="current">영화정보</span>
		            </div>
					<h2 class="h2">영화정보 글쓰기</h2>
				</div>
				<div class="borad">
				        <p class="board_point c_red"><span>*</span> 표시가 있는 항목은 필수 입력항목입니다.</p>
				        <form action="galleryWritePro.jsp" method="post" enctype="multipart/form-data" onsubmit="return validate();" name="gw">
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
					                        <input type="text" name="title" id="title">
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
					                            <input type="file" name="thumImg"  id ="thumImg"title="썸네일이미지">
					                        </div>
					                    </td>
					                </tr>
					                <tr>
					                    <th scope="row"><label for="genre"><span class="c_red">*</span>장르</label></th>
					                    <td>
					                    	<input type="radio" checked="checked" value="cm"  name="genre" > 코미디
					                    	<input type="radio"  name="genre" value="ac">액션
					                    	<input type="radio"  name="genre"   value="hr">공포
					                    	<input type="radio"  name="genre"  value="rm">로맨스
					                    	<input type="radio"  name="genre"  value="sf">SF
					                    	<input type="radio"  name="genre"  value="an">애니메이션
					                    	<input type="radio"  name="genre"  value="dr">드라마
					                    </td>
					                    <th scope="row"><label for="spectator"><span class="c_red">*</span>관람가</label></th>
					                    <td>
					                    	<select name="spectator">
					                    		<option value="0" >전체관람가</option>
					                    		<option  value="1" >12세관람가</option>
					                    		<option  value="2" >15세관람가</option>
					                    		<option  value="3" >19세관람가</option>
					                    	</select>
					                    </td>
					                </tr>
					                 <tr>
					                    <th scope="row"><label for="runtime"><span class="c_red">*</span>상영시간</label></th>
					                    <td>
					                        <input type="text" name="runtime" id="runtime">
					                    </td>
					                    <th scope="row"><label for="openDate"><span class="c_red">*</span>개봉일</label></th>
					                    <td>
					                        <input type="text" name="openDate" id="openDate" class="movieDatepicker">  
					                    </td>
					                </tr>
					                 <tr>
					                    <th scope="row"><label for="director">감독</label></th>
					                    <td>
					                        <input type="text" name="director">
					                    </td>
					                    <th scope="row"><label for="grade">평점</label></th>
					                    <td colspan="3">
					                        <input type="text" name="grade" id="grade">
					                    </td>
					                </tr>
					                <tr>
					                    <th scope="row"><label for="cast">출연진</label></th>
					                    <td colspan="3">
					                        <input type="text" name="cast" id="cast">
					                    </td>
					                </tr>
					                <tr>
					                    <th scope="row"><label for="depTitle">설명제목</label></th>
					                    <td colspan="3">
					                        <input type="text" name="depTitle" id="depTitle">
					                    </td>
					                </tr>
					                <tr>
					                    <th scope="row"><label for="content">내 용</label></th>
					                    <td colspan="3">
					                        <textarea name="content" id="content" title="내용" class="textarea_v1"></textarea>
					                    </td>
					                </tr>
					            </tbody>
					        </table>
				
							<!--버튼 시작-->
						    <div class="bbs_btn center mt30">
						        <input type="submit" class="btn medium color1" value="등록">
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