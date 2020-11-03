<%@page import="Gallery.GalleryBean"%>
<%@page import="Gallery.GalleryDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <%
    request.setCharacterEncoding("utf-8");
    String id = (String)session.getAttribute("id");
    GalleryDAO gdao = new GalleryDAO();
    String search = request.getParameter("search");
    int count = gdao.getGalleryCount("search");
    int pageSize = 10; // 한페이지에 보일 게시물 수
    //현재페이지 번호
    String pageNum = request.getParameter("pageNum"); //기본 페이지값 
    if(pageNum == null) { //받아온 pageNum값이 없을때  
    	pageNum = "1";// pageNum값을 저장
    }
    int current = Integer.parseInt(pageNum);
    int startPage = (current-1)*pageSize+1;  //0*10+1 =1 //1*10+1 =11 //2*10+1 =21
    int endPage = current*pageSize;
    int total = 0;
    if(count != 0 ){
    	total = (count/endPage);
    }else{
    	total = (count/endPage)+1;
    }
    List galleryList = gdao.getGalleryList(startPage, pageSize,search);
    
    %>
 <script type="text/javascript">
 $(document).ready(function(){
	 
	 var key = "W65049K473DG5LP6XNE8";
	 $.ajax({
		url: 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml2.jsp?ServiceKey='+key,
		type: 'get',
        dataType: 'xml',
		success: function(data) {
			$(data).find('dailyBoxOffice').each(function(){
				var rnum = $(this).find('rnum').text();
				var rank = $(this).find('rank').text();
				var movieNm = $(this).find('movieNm').text();
				var openDt = $(this).find('openDt').text();
				var audiAcc = $(this).find('audiAcc').text();
				$('#mvChart').append(
						'<div class="4u mvChoiceBox bx-clone" style="float: left; list-style: none; position: relative; width: 250px; margin-right: 10px;">'+
						'<a href="../gallery/gView.jsp?num='+rnum+' title="상세보기" class="special">'+
						'<span class="numl">'+rank+'</span>'+
						'<img alt="" src="../images/'+rank+'">'+
						'</a>'+
						'<div class="mcnt">'+
							'<a href="../gallery/gView.jsp?num='+rnum+ 'title="상세보기"><span class="mnTit">'+title+'</span></a>'+
							'<p class="yn">'+releaseDate+'</p>'+
							'<p class="like"><img src="http://file.koreafilm.or.kr/thm/02/00/01/46/'+posterUrl+'" alt="추천"><a href="" title="추천">추천수</a></p>'+
						'</div></div>'
				);
			});
        }
	 });
 })
	
</script>
			<section class="mainVisul">
				<ul class="mvisulslider">
					<li>
						<img alt="" src="../images/GeniusDog_1920774.jpg">
					</li>
					<li>
						<img alt="" src="../images/mVisul.jpg">
						<p class="txt">
							에드워드 양 감독의 ‘타이베이 3부작’ 중<br> 
							두 번째 영화 1986년작 <공포분자> 한국 개봉
						</p>
					</li>
					<li>
						<img alt="" src="../images/Mulan_1920774.jpg">
					</li>
				</ul>
			</section>
			
			<section id="one" class="wrapper style1">
				<div class="container main">
					<h2  class="h2">영화추천순위</h2>
					<div class="row container mvslider" >
						 <%
						    for(int i =0; i < galleryList.size(); i++){
						    	GalleryBean gb = (GalleryBean)galleryList.get(i);
						    	String openDate = gb.getOpenDate().substring(0,4);
						    %>
						   <div class="4u mvChoiceBox">
								<a href="../gallery/gView.jsp?num=<%=gb.getNum()%>" title="상세보기"class="special">
									<span class="numl"><%=i+1 %></span>
									<img alt="" src="../images/<%=gb.getThumImg()%>">
								</a>
								<div class="mcnt">
									<a href="../gallery/gView.jsp?num=<%=gb.getNum()%>" title="상세보기"><span class="mnTit"><%=gb.getTitle()%></span></a>
									<p class="yn"><%=openDate%> · <%=gb.getGenre() %></p>
									<p class="like"><img src="../images/ico_heart.gif" alt="추천"><a href="" title="추천">추천수</a> <%=gb.getRecommend()%></p>
								</div>
							</div>
						    <%}%>
					</div>		
				</div>		
			</section>
			
			<section id="two" class="wrapper style1">
				<div class="container main">
					<h2  class="h2">영화순위</h2>
					<div class="row container mvslider" id="mvChart" >
						 
					</div>		
				</div>		
			</section>

		
			<!-- Footer -->
			<footer id="footer">
				<div class="container footerInner">
					<ul class="copyright">
						<li>All contents Copyright 2011 Movie.com 2020 Movie.com Inc. all rights reserved</li>
						<li> Contact mail:<a href="../mail/mailForm.jsp">movie.com@movie.com</a></li>
						<li> Tel  051-803-0909  Fax 051-803-0909</li>
						<li> <a href="../main/location.jsp">찾아오시는길</a></li>
					</ul>
				</div>
			</footer>

	<script type="text/javascript">
			$(document).ready(function(){
					 $('.mvslider').bxSlider({
					        speed: 500,        // 이동 속도를 설정
					        pager: false,      // 현재 위치 페이징 표시 여부 설정
					        moveSlides: 1,     // 슬라이드 이동시 개수
					       slideWidth: 1200,   // 슬라이드 너비
					        minSlides: 5,      // 최소 노출 개수
					        maxSlides: 5,      // 최대 노출 개수
					        slideMargin:10,
					        auto: false,        // 자동 실행 여부
					        autoHover: true,   // 마우스 호버시 정지 여부
					        controls: true,    // 이전 다음 버튼 노출 여부
					        nextText: '',
					        prevText: ''
					    });
					 
					 $('.mvisulslider').bxSlider({
					        speed: 500,        // 이동 속도를 설정
					        pager: false,      // 현재 위치 페이징 표시 여부 설정
					        moveSlides: 1,     // 슬라이드 이동시 개수
					        minSlides: 1,      // 최소 노출 개수
					        maxSlides: 1,      // 최대 노출 개수
					        auto: false,        // 자동 실행 여부
					        autoHover: true,   // 마우스 호버시 정지 여부
					        controls: false,    // 이전 다음 버튼 노출 여부
					        pager:true
					    });
				 });
		</script>
		
</body>
</html>
