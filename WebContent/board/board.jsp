<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<%
request.setCharacterEncoding("utf-8");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
BoardDAO bdao = new BoardDAO();
int count = bdao.getBoardCount();
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
String search = request.getParameter("search");
List boardList = bdao.getBoardList(startPage, endPage,search);

%>

<div class="clearfix container">
	<div id="contents"> 
    	<div class="contit">
        	<div class="loc">
            	<img src="../images/ico_home.gif" alt="홈"> &gt; <span class="current">영화리뷰</span>
            </div>
			<h2 class="h2">영화리뷰</h2>
		</div>
			<!-- 컨텐츠영역 -->
		<div class="board">
		    <h3 class="blind">게시판 목록</h3>
		  	<div class="search"> 
		  		<form action="board.jsp" method="post">
					<fieldset>
						  <legend>전체검색</legend> 
						  <input type="text" placeholder="검색어 입력" name="search" >
						  <input type="submit" class="serachBtn">
					  </fieldset>
				</form>
			</div>
	 
		    <p class="total"><strong>총 <span><%=count %></span> 건</strong></p>
		    <table class="tb_board center">
			        <caption>열린마당 &gt; 공지사항의 글번호, 제목, 작성자, 작성일, 조회수 목록표입니다.</caption>
			        <colgroup>
			            <col style="width:10%">
			            <col style="width:50%">
			            <col style="width:16%">
			            <col style="width:9%">
			            <col style="width:9%">
			            <col style="width:6%">
			        </colgroup>
			        <thead>
			            <tr>
			                <th scope="col">번호</th>
			                <th scope="col">제목</th>
			                <th scope="col">작성자</th>
			                <th scope="col">작성일</th>
			                <th scope="col">최종수정일</th>
			                <th scope="col" class="rfc_bbs_list_last">조회</th>
			            </tr>
			        </thead>
			        <tbody>
					<%if(boardList == null){%>
						<tr>
							<td colspan ="6">글없음</td>
						</tr>
					<%}else{%>
						<%for(int i =0; i < boardList.size(); i++){
							BoardBean bb = (BoardBean)boardList.get(i);
						%>
		            <tr>
		                <td><%=bb.getNum() %></td>
		                <td class="left td_tit">
		                    <a href="boardView.jsp?num=<%=bb.getNum()%>" title="제목"><%=bb.getTitle()%></a>
		                </td>
		                <td><%if(bb.getWriter().equals("admin")){%>
		                		관리자
		                	<%}else{%>
		                		<%=bb.getWriter()%>
		                	<%} %>
	                	</td>
		                <td><%=sdf.format(bb.getDate())%></td>
		                <td><%if(bb.getModifyDate()!=null){ %>
		                		<%=sdf.format(bb.getModifyDate())%>
	                		<%}%></td>
		                <td><%=bb.getReadcount()%></td>
		            </tr>
            		<%} %>
	        	<%} %>
		        </tbody>
		    </table>
		    <!-- 페이징시작 -->
		    <div class="pageing">

	    		<a href="board.jsp?pageNum=1" class="bt">&lt;&lt;</a>&nbsp;
			    <%
			    	int pageBlock = 10;
			    	int startRowPage = (current-1)/pageBlock*pageBlock+1;
			    	int endRowPage = startPage+pageBlock-1;
		    		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
		    		if(startRowPage > pageBlock){%>
						<a href="board.jsp?pageNum=<%=startRowPage-pageBlock%>" class="bt">&lt;</a>&nbsp;
					<%}
			    	if(endRowPage > pageCount){
			    		endRowPage = pageCount;
			    		for(int j = startRowPage;  j<= endRowPage; j++ ){
			    			if(current == j){	%>
			        			<a href="board.jsp?pageNum=<%=j%>"><strong><%=j %></strong></a>&nbsp;
			        		<%}else{ %>
			        			<a href="board.jsp?pageNum=<%=j%>"><%=j %></a>&nbsp;
			        		<%} %>
				    	<%}
					}else if(endRowPage < pageCount){%>
			        		<a href="board.jsp?pageNum=<%=startRowPage+pageBlock%>"  class="bt">&gt;</a>&nbsp;
			    	<%}%>
					<a href="board.jsp?pageNum=<%=endRowPage%>" class="bt">&gt;&gt;</a>
		    </div>
		    	
		    <!-- 페이징끝 -->
		
			<!--버튼 시작-->
			
			<%
			String id = (String)session.getAttribute("id");
			if(id != null){ %>
			<div class="rfc_bbs_btn right">
		        <a href="boardWrite.jsp" class="btn medium color1">글쓰기</a>
	    	</div>
	    	<%} %>
    		<!--버튼 끝-->
		</div>
	</div>
</div>


<jsp:include page="../inc/bottom.jsp"></jsp:include>
