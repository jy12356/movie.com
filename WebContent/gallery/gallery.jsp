<%@page import="Gallery.GalleryBean"%>
<%@page import="java.util.List"%>
<%@page import="Gallery.GalleryDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<div class="clearfix container">
	<div id="contents"> 
    	<div class="contit">
        	<div class="loc">
            	<img src="../images/ico_home.gif" alt="홈"> &gt; <span class="current">영화소개</span>
            </div>
			<h2 class="h2">영화소개</h2>
		</div>
		<!-- 컨텐츠영역 -->
		<div class="board">
		    <h3 class="blind">게시판 목록</h3>
		  	<div class="search"> 
		  		<form action="gallery.jsp" method="post">
					<fieldset>
						  <legend>전체검색</legend> 
						  <input type="text" placeholder="검색어 입력" name="search" >
						  <input type="submit" class="serachBtn">
					  </fieldset>
				</form>
			</div>
 
		    <ul class="cntGaly clearfix" >
			    <%
			    for(int i =0; i < galleryList.size(); i++){
			    	GalleryBean gb = (GalleryBean)galleryList.get(i);
			    	String openDate = gb.getOpenDate().substring(0,4);
			    %>
			    <li class="mvChoiceBox pl0">
					<a href="gView.jsp?num=<%=gb.getNum()%>" title="상세보기"class="special">
						<span class="numl"><%=i+1 %></span>
						<img alt="" src="../images/<%=gb.getThumImg()%>">
					</a>
					<div class="mcnt">
						<a href="gView.jsp?num=<%=gb.getNum()%>" title="상세보기"><span class="mnTit"><%=gb.getTitle()%></span></a>
						<p class="yn"><%=openDate%> · <%=gb.getGenre() %></p>
						<p class="like"><img src="../images/ico_heart.gif" alt="추천"><a href="" title="추천">추천수</a> <%=gb.getRecommend()%></p>
					</div>
				</li>
			    <%}%>
			</ul>
		    <!-- 페이징시작 -->
		    <div class="pageing">

	    		<a href="gallery.jsp?pageNum=1" class="bt">&lt;&lt;</a>&nbsp;
			    <%
			    	int pageBlock = 10;
			    	int startRowPage = (current-1)/pageBlock*pageBlock+1;
			    	int endRowPage = startRowPage+pageBlock-1;
			    	if(count == 0){
			    		count = 1;
			    	}
		    		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
		    		if(endRowPage > pageCount){
			    		endRowPage = pageCount;
			    	}
		    		if(startRowPage > pageBlock){%>
						<a href="gallery.jsp?pageNum=<%=startRowPage-pageBlock%>" class="bt">&lt;</a>&nbsp;
					<%}
		    		for(int j = startRowPage;  j<= endRowPage; j++ ){
		    			if(current == j){	%>
		        			<a href="gallery.jsp?pageNum=<%=j%>"><strong><%=j %></strong></a>&nbsp;
		        		<%}else{ %>
		        			<a href="gallery.jsp?pageNum=<%=j%>"><%=j %></a>&nbsp;
		        		<%} %>
			    	<%}
					if(endRowPage < pageCount){%>
			        		<a href="gallery.jsp?pageNum=<%=startRowPage+pageBlock%>"  class="bt">&gt;</a>&nbsp;
			    	<%}%>
					<a href="gallery.jsp?pageNum=<%=endRowPage%>" class="bt">&gt;&gt;</a>
		    </div>
	    	<!-- 페이징끝 -->
	
			<!--버튼 시작-->
			<%if(id != null && id.equals("admin")){%>
		    <div class="rfc_bbs_btn right">
		        <a href="galleryWriteForm.jsp" class="btn medium color1">글쓰기</a>
		    </div>
		    <%}%>
			    <!--버튼 끝-->
		</div>
	</div>		
</div>
	
<jsp:include page="../inc/bottom.jsp"></jsp:include>
