<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/contents.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/skel.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String  wid  = request.getParameter("wid");
MemberDAO mdao = new MemberDAO();
int chk = mdao.idChk(wid);
%>

<div class="container idChkForm">  
	<span>아이디 중복확인</span>
	<%
	if(chk == 1 ){%>
		<p><span><%=wid%></span>는(은) 이미 사용하고있는 ID 입니다.</p>
		<script type="text/javascript">
			opener.document.jf.id.value = null;
		</script>
	<%}else{%>
		<p><span><%=wid%></span>는(은) 사용가능 한 ID 입니다.</p>
		<input type="button" class="useBtn" value="사용하기" onclick="idUseBtn();">
	<%} %>
	<div class="chk">
		<form action="idChkForm.jsp" method="post" name="wfr" onsubmit="return validate();">
				<span>아이디 :</span> <input type="text" class="id" name="wid" value="<%=wid%>">
				<input type="submit" class="useBtn" value="중복체크" >
		</form>
	</div>

</div>
<script type="text/javascript">

	var pattern_num = /[0-9]/;	// 숫자 
	var pattern_eng = /[a-zA-Z]/;	// 영어 
	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크

	function idUseBtn(){
		var wid2 = document.wfr.wid;
		if(wid2.value.length >= 20 || wid2.value.length <= 5 ){
			alert("id는 5이상 20이하로 입력해주세요.");
			wid2.focus();
		}else 	if(wid2.value.indexOf(" ") >= 0) {
	        alert("아이디는 공백을 사용할 수 없습니다.")
	        wid2.focus();
	    }else 	if(!(pattern_num.test(wid2.value)) && !(pattern_eng.test(wid2.value))){
			alert("아이디는 숫자,영어 포함 하셔야합니다. (한글포함은 안됩니다.)")
	        wid2.focus();
		}else{				
			opener.document.jf.id.value=document.wfr.wid.value;
			opener.document.jf.idChkn.value = 1;
			if(opener !=null){
				opener.chkForm = null;
				self.close();
			}
		}
	}
	
	function validate(){
		var wid2 = document.wfr.wid;
		if(wid2.value.length >= 20 || wid2.value.length <= 5 ){
			alert("id는 5이상 20이하로 입력해주세요.");
			wid2.focus();
			return false;
		}
		if(wid2.value.indexOf(" ") >= 0) {
	        alert("아이디는 공백을 사용할 수 없습니다.")
	        wid2.focus();
	        return false;
	    }
	
		if(!(pattern_num.test(wid2.value)) || !(pattern_eng.test(wid2.value))){
			alert("아이디는 숫자,영어 포함 하셔야합니다. (한글포함은 안됩니다.)")
	        wid2.focus();
	        return false;
		}		
	}
</script>
</body>
</html>