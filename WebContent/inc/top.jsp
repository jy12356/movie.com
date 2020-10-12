<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>MovieCom</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="무비닷컴" />
		<meta name="keywords" content="무비닷컴" />
		<link rel=" shortcut icon" href="../images/logoFavicon.ico">
		<link rel="icon" href="../images/logoFavicon.ico">
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<script src="../js/jquery.min.js"></script>
		<script src="../js/jquery.bxslider.js"></script>
	
		<link rel="stylesheet" href="../css/contents.css" />
		<link rel="stylesheet" href="../css/skel.css" />
		<link rel="stylesheet" href="../css/style.css" />
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
		<script type="text/javascript">
			function mailClick(){
				var id = "<%=session.getAttribute("id")%>";
				if(id == "null"){
					alert('로그인 후 이용해주세요.');
					location.href="../member/login.jsp";
				}else{
					location.href="../mail/mailForm.jsp";
				}
			}
		</script>
	</head>
	<body id="top">

		<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<div class="container">
					<h1 class="logo"><a href="../main/index.jsp"><img alt="movie.com" src="../images/logo2.png"></a></h1>
					<nav id="nav">
						<ul>
							<li><a href="../main/index.jsp">Home</a></li>
							<li><a href="../gallery/gallery.jsp">영화소개</a></li>
							<li><a href="../board/board.jsp">영화리뷰</a></li>
							<li><a href="../notice/notice.jsp">공지사항</a></li>
							<li><a href="#" onclick="mailClick()">문의하기</a></li>
							
	<!-- 							<li><a href="left-sidebar.html">Left Sidebar</a></li> -->
	<!-- 							<li><a href="right-sidebar.html">Right Sidebar</a></li> -->
	<!-- 							<li><a href="no-sidebar.html">No Sidebar</a></li> -->	
								<%
									String id = (String)session.getAttribute("id");
									if(id ==null){%>
									<li class="sign">
										<a href="../member/login.jsp" class="button special">Login</a>
									</li>
								<%}else if(id !=null){%>
									<li class="mypBtn">
										<a href="../member/myPageIntro.jsp" class="button special">MyPage</a>
									</li>
									<li class="sign"><a href="../member/logoutPro.jsp" class="button special">Logout</a></li>
							<%} %>
							
							
						</ul>
					</nav>
				</div>
			</header>