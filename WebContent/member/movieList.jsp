<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<%
request.setCharacterEncoding("utf-8");

MemberDAO mdao = new MemberDAO();
int count = mdao.getMemberCount();
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
List memberList = mdao.getMemberList(startPage, endPage);
SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
%>

<script type="text/javascript">
$(document).ready(function(){
	
	 var key = "W65049K473DG5LP6XNE8";
	 $.ajax({
		url: 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml2.jsp?ServiceKey='+key,
		type: 'get',
        dataType: 'json',
		success: function(data) {
			$(data).find('dailyBoxOffice').each(function(){
				var rnum = $(this).find('rnum').text();
				var rank = $(this).find('rank').text();
				var movieNm = $(this).find('movieNm').text();
				var openDt = $(this).find('openDt').text();
				var audiAcc = $(this).find('audiAcc').text();
				$('#mvChart .mvChoiceBox ul').append(
						"<li>"+rnum+"</li>"+
						"<li>"+rank+"</li>"+
						"<li>"+movieNm+"</li>"+
						"<li>"+openDt+"</li>"+
						"<li>"+audiAcc+"</li>"
					
				);
			});
       }
	 });
})
</script>

<div class="clearfix container">
	<div id="contents" class="dv_wrap"> 
    	<div class="contit">
        	<div class="loc">
            	<img src="../images/ico_home.gif" alt="홈"> &gt; <span class="current">글쓰기</span>
            </div>
			<h2 class="h2">공지사항</h2>
		</div>
			<!-- 컨텐츠영역 -->
		<div class="board">
		    <h3 class="blind">게시판 목록</h3>
<!-- 	    <div class="search"> 
		        <form name="rfc_bbs_searchForm" class="rfc_bbs_searchForm">
		            <fieldset>
		                <legend>전체검색</legend> 
		                <label for="searchType" class="blind">검색항목</label> 
		                <select id="searchType" name="searchType" class="text" title="검색항목을 선택하세요">
		                    <option value="DATA_TITLE">제목</option>
		                    <option value="DATA_CONTENT">내용</option> 
		                    <option value="USER_NICK">작성자</option> 
		                </select> 
		                <label for="keyword" class="hidden">검색어 입력</label> 
	 	                <input id="keyword" type="text" name="keyword" title="검색어를 입력하세요" value="" class="text_form"> 
	 	                <button onclick="javascript:return searchingCheck();">검색</button> 
	 	            </fieldset>
	 	        </form>
		    </div> -->
		    <p class="total"><strong>총 <span><%=count %></span> 건</strong></p>
		    <table class="tb_board center notice">
			        <caption>열린마당 &gt; 공지사항의 글번호, 제목, 작성자, 작성일, 조회수 목록표입니다.</caption>
			        <colgroup>
			            <col style="width:12%">
			            <col style="width:12%">
			            <col style="width:12%">
			            <col style="width:12%">
			            <col style="width:12%">
			            <col style="width:12%">
			            <col style="width:16%">
			            <col style="width:12%">
			        </colgroup>
			        <thead>
			            <tr>
			                <th scope="col">아이디</th>
			                <th scope="col">패스워드</th>
			                <th scope="col">이름</th>
			                <th scope="col">이메일</th>
			                <th scope="col">전화번호</th>
			                <th scope="col">폰번호</th>
			                <th scope="col">주소</th>
			                <th scope="col" class="rfc_bbs_list_last">가입날짜</th>
			            </tr>
			        </thead>
			        <tbody>
					<%if(memberList == null){%>
						<tr>
							<td colspan ="8">회원없음</td>
						</tr>
					<%}else{%>
						<%for(int i =0; i < memberList.size(); i++){
							MemberBean mb = (MemberBean)memberList.get(i);
						%>
		            <tr>
		                <td><%=mb.getId() %></td>
		                <td><%=mb.getPass() %></td>
		                <td><%=mb.getName()%></td>
		                <td><%=mb.getEmail()%></td>
		                <td><%=mb.getPhone()%></td>
		                <td><%=mb.getMobile()%></td>
		                <td><%=mb.getAddress()%></td>
		                <td><%=sdf.format(mb.getDate())%></td>
		            </tr>
            		<%} %>
	        	<%} %>
		        </tbody>
		    </table>
		    <!-- 페이징시작 -->
		    <div class="pageing">
				<a href="memberList.jsp?pageNum=1" class="bt">&lt;&lt;</a>&nbsp;
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
						<a href="memberList.jsp?pageNum=<%=startRowPage-pageBlock%>" class="bt">&lt;</a>&nbsp;
					<%}
			    
		    		for(int j = startRowPage;  j<= endRowPage; j++ ){
		    			if(current == j){	%>
		        			<a href="memberList.jsp?pageNum=<%=j%>"><strong><%=j %></strong></a>&nbsp;
		        		<%}else{ %>
		        			<a href="memberList.jsp?pageNum=<%=j%>"><%=j %></a>&nbsp;
		        		<%} %>
			    	<%}
					if(endRowPage < pageCount){%>
			        		<a href="memberList.jsp?pageNum=<%=startRowPage+pageBlock%>"  class="bt">&gt;</a>&nbsp;
			    	<%}%>
					<a href="memberList.jsp?pageNum=<%=endRowPage%>" class="bt">&gt;&gt;</a>
		    </div>
		    <!-- 페이징끝 -->
		
		</div>
	</div>
</div>


<jsp:include page="../inc/bottom.jsp"></jsp:include>
