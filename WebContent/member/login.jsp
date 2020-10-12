<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:include page="../inc/top.jsp"></jsp:include>
    <div class="login_area">
        <form id="login_form" name="login_form" class="login_form" action="loginPro.jsp" method="post" >
            <fieldset>
                <legend class="blind">로그인</legend>
                <div class="box_area login_top">
                    <p class="logo">
                        <a href="index.jsp" title="메인화면">
                            <img alt="movie.com" src="../images/logo1.png">
                        </a>
                    </p>
                    <h2 class="blind">MOVIE.COM 로그인</h2>
                    <div class="input_form">
                        <label for="id" class="blind">아이디</label>
                        <p><input type="text" id="id" name="id" title="아이디" placeholder="아이디"></p>
                        <label for="pass" class="blind">비밀번호</label>
                        <p><input type="password" id="pass" name="pass" title="비밀번호" placeholder="비밀번호"></p>
                    </div>
                    <div class="btn_big mb_10 loginBtn">
                        <input type="submit" value="로그인" class="agree wps_100">
                    </div>
                    
                    <p class="joinA center">
                    	계정이 없으신가요? <a href="joinForm.jsp" title="회원가입">회원가입</a>
                    </p>
                    
                </div>
                
            </fieldset>
        </form>
    </div>
    <!-- //login -->
    
<jsp:include page="../inc/bottom.jsp"></jsp:include>
