	<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	
		<script type="text/javascript">	
			function validate(){

				var id = document.getElementById("id");
				var pass1 = document.getElementById("pass1");
				var pass2 = document.getElementById("pass2");
				var name = document.getElementById("name");
				var email = document.getElementById("email");
				var phone = document.getElementById("phone");
				var mobile = document.getElementById("mobile");
				var zip = document.getElementById("zip");
				var address1 = document.getElementById("address1");
				var address2 = document.getElementById("address2");
			
				var pattern_num = /[0-9]/;	// 숫자 
		    	var pattern_eng = /[a-zA-Z]/;	// 영어 
		    	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		    	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
		    	
				if(id.value == ""){
					alert("id를 입력해주세요.");
					id.focus();
					return false;
				}
								
				if(id.value.length >= 20 || id.value.length <= 5 ){
					alert("id는 5이상 20이하로 입력해주세요.");
					id.focus();
					return false;
				}
				if(document.jf.idChkn.value != 1){
					alert("id 중복확인을 해주세요.");
					document.jf.idChkn.focus();
					return false;
				}
				
				if(id.value.indexOf(" ") >= 0) {
		            alert("아이디는 공백을 사용할 수 없습니다.")
		            id.focus();
		            return false;
		        }

		    	if(!(pattern_num.test(id.value)) || !(pattern_eng.test(id.value))){
		    		alert("아이디는 숫자,영어 포함 하셔야합니다. (한글포함은 안됩니다.)")
		            id.focus();
		            return false;
		    	}				
		    	
				if(pass1.value == ""){
					alert("패스워드를 입력해주세요.");
					pass1.focus();
					return false;
				}
				if(pass1.value.length >= 25 || pass1.value.length <= 8 ){
					alert("패스워드는 8자 이상 25자이하로 입력해주세요.");
					pass1.focus();
					return false;
				}
				if(pass1.value.indexOf(" ") >= 0) {
		            alert("패스워드는 공백을 사용할 수 없습니다.")
		            pass1.focus();
		            return false;
		        }

				if(!(pattern_num.test(pass1.value))	|| 
						!(pattern_eng.test(pass1.value)) || 
						!(pattern_spc.test(pass1.value))){
					alert("패스워드는 숫자, 특수기호, 소문자를 포함해야합니다.");
					pass1.focus();
					return false;
				}
				
				if(pass2.value != pass1.value){
					alert("패스워드와 패스워드 확인이 다릅니다.");
					pass2.focus();
					return false;
				}
				
				if(name.value == ""){
					alert("이름을 입력해주세요.");
					name.focus();
					return false;
				}
				
				
				if(name.value.indexOf(" ") >= 0 || pattern_num.test(name.value) || pattern_spc.test(name.value) ){
					alert("이름에 공백, 숫자, 특수문자를 사용할 수 없습니다.");
					name.focus();
					return false;
				}
				
				if(email.value == ""){
					alert("메일을 입력해주세요.");
					email.focus();
					return false;
				}
				if(email2.value == ""){
					alert("메일주소를 입력해주세요.");
					email.focus();
					return false;
				}
				if(mobile.value == ""){
					alert("모바일번호를 입력해주세요.");
					mobile.focus();
					return false;
				}
				if(zip.value == ""){
					alert("우편번호를 조회해주세요.");
					zip.focus();
					return false;
				}
				if(address1.value == ""){
					alert("주소를 입력해주세요.");
					address1.focus();
					return false;
				}
				if(address2.value == ""){
					alert("상세주소를 입력해주세요.");
					address2.focus();
					return false;
				}
				
			}
			
			//id중복체크
			function openIdChk(){
				if(jf.id.value == "") {
					alert("id를 입력하시오.");
					jf.id.focus();
					return;
				}
				var wid=document.jf.id.value;
				window.open("idChkForm.jsp?wid="+wid,"","width=1000,height=400");
			}
			
		</script>
	    <div class="login_area">
	        <form name ="jf" class="login_form" action="joinPro.jsp" method="post" onsubmit="return validate();" >
	        	<fieldset>
	               <div class="box_area login_top">
	                   <p class="logo">
	                       <a href="index.jsp" title="메인화면">
	                           <img alt="movie.com" src="../images/logo1.png">
	                       </a>
	                   </p>
	                   <h2 class="blind">MOVIE.COM 로그인</h2>
	                   <div class="input_form">
	                       <label for="id" class="blind">아이디</label>
	                       <p class="idForm">
	                       		<input type="text" id="id" name="id" title="아이디" placeholder="아이디" >
	                       		<input type="hidden" name="idChkn" value="0">                
	                       		<input type="button" title="중복확인" onclick="openIdChk();" value="중복확인">        
	                       </p> 
	                       <label for="pass1" class="blind">비밀번호</label>
	                       <p><input type="password" id="pass1" name="pass" title="비밀번호" placeholder="비밀번호"></p>
	                       <label for="pass2" class="blind">비밀번호확인</label>
	                       <p><input type="password" id="pass2" name="pass2" title="비밀번호확인" placeholder="비밀번호확인"></p>
							<label for="name" class="blind">이름</label>
	                       <p><input type="text" id="name" name="name" title="이름" placeholder="이름"></p>
							<label for="email" class="blind">이메일</label>
	                       <p>
	                       		<input type="text" id="email" name="email" title="이메일" placeholder="이메일">@
	                       		<input type="text" id="email2" name="email2"placeholder="이메일주소"/>
	                       		<select id="emailSelbox" name="emailSelbox" onchange="emailSel()">
									<option value="0">직접입력</option>
									<option value="1">naver.com</option>
									<option value="2">daum.net</option>
									<option value="3">gmail.com</option>
									<option value="4">nate.com</option>
								</select>
	                       </p>
							<label for="phone" class="blind">전화번호</label>
	                       <p><input type="text"  id="phone" name="phone" title="전화번호" placeholder="전화번호"></p>
							<label for="mobile" class="blind">핸드폰번호</label>
	                       <p><input type="text"  id="mobile" name="mobile" title="핸드폰번호" placeholder="핸드폰번호"></p>
							<label for="address1" class="blind">주소</label>
							<p>
								<input type="text"  id="zip" name="zip" title="우편번호" placeholder="우편번호" readonly>
								<input type="button" onclick="adrNumChk();"  class="adrNumBtn" value="우편번호검색" >
							</p>
	                        <p><input type="text"  id="address1" name="address1" title="주소1" placeholder="주소" readonly></p>
							<label for="address2" class="blind">상세주소</label>
	                       <p><input type="text"  id="address2" name="address2" title="상세주소" placeholder="상세주소"></p>
	                   </div>
	                   <div class="btn_big mb_10 joinBtn clearfix">
	                       <input type="submit" value="회원가입" class="agree wps_100">
	                       <input type="reset" value="취소" class="agree wps_100">
	                   </div>
	               </div>
			       <p class="joinA center">이미 가입하셨나요? <a href="login.jsp">로그인</a></p>
		       </fieldset>
       		</form>
   		</div>
    <!-- //login -->
    
<!--     우편번호 검색 API (카카오 우편번호 검색 api) -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	//우편번호
	function adrNumChk(){
		 new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				//각 주소의 노출규칙에 따라 주소를 조합
				//내려오는 변수의 값이 없을땐 공백('')값을 가지므로, 이를 참고하여 분기
				var addr = ''; //주소변수
				//사용자가 선택한 주소타입에따라 해당주소값을 가져온다.
				if(data.userSelectedType == "R"){ //사용자가 도로명주소를 선택했을경우(R))
					addr = data.roadAddress; //도로명주소(roadAddress)
				}else{//사용자가 지번주소를 선택했을경우(J)
					addr = data.jibunAddress; //지번주소(jibunAddress)
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address1').value = addr;
				document.getElementById('address2').focus();
			}
		}).open();
	}
	
	//이메일옵션
	function emailSel(){
		var jf = document.jf;
		if(jf.emailSelbox[jf.emailSelbox.selectedIndex].value != 0){
			jf.email2.value = jf.emailSelbox[jf.emailSelbox.selectedIndex].text;
			jf.email2.readOnly  = true;
		}else{
			jf.email2.value = "";
			jf.email2.focus();
			jf.email2.readOnly  = false;
		}
	}
</script>   
<jsp:include page="../inc/bottom.jsp"></jsp:include>