<%@page import="reply.ReplyDAO"%>
<%@page import="reply.ReplyBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>

<%
request.setCharacterEncoding("utf-8");
BoardDAO bdao = new BoardDAO();
String id  = (String)session.getAttribute("id");
int num = Integer.parseInt(request.getParameter("num"));
// int boardPage = Integer.parseInt(request.getParameter("boardPage"));
// 조회수 update
bdao.updateBoardReadcount(num);
BoardBean bb =  bdao.getBoard(num);
ReplyDAO rd = new ReplyDAO();
List replyList = rd.getreplyListint(num,1);  //contNum = 영화리뷰게시판 1번

%>
<div class="borad container"> 
	<div id="contents" class="dv_wrap"> 
    	<div class="contit">
        	<div class="loc">
            	<img src="../images/ico_home.gif" alt="홈"> &gt; <span class="current">영화리뷰</span>
            </div>
			<h2 class="h2"> 영화리뷰</h2>
		</div>
		<input type="hidden" name="num" value="<%=bb.getNum()%>">
	    <table class="board_view table_type">
	        <caption> 영화리뷰 글보기</caption>
	        <colgroup>
	            <col style="width : 16%">
	            <col  style="width : 16%">
	            <col  style="width : 16%">
	            <col  style="width : 16%">
	            <col  style="width : 16%">
	            <col  style="width : 16%">
	        </colgroup>
	        <thead>
	            <tr>
	                <th scope="col" colspan="6" class="topline center"><%=bb.getTitle() %></th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <th scope="row" class="center">작 성 자</th>
	                <td class="left"> 
	                	<%if(bb.getWriter().equals("admin")){%>
	                		관리자
	                	<%}else{%>
	                		<%=bb.getWriter()%>
	                	<%} %>
                	</td>
	                <th scope="row" class="center">등록일</th>
	                <td class="left"><%=bb.getDate() %></td>
	                <th scope="row" class="center">조&nbsp;&nbsp;&nbsp;회</th>
	                <td class="left"><%=bb.getReadcount() %></td>
	            </tr>
	            <tr>
	                <td colspan="6" class="rfc_bbs_see_txt_left_con con">
	                    <%=bb.getContent() %>
	                </td>
	            </tr>
	        </tbody>
	    </table>
	    <div class="mt30">
		    <ul class="replyCnts">
		    	<%
		    		int replySize =  replyList.size();
		    		for(int i = 0; i < replySize; i++){ 
		    		ReplyBean rb = (ReplyBean)replyList.get(i);
		    		%>
	    			<li class="reply ">
	    				<div class="replyInner">
	    					<div class="clearfix replyRep">
		    					<span class="writer">
		    						<%if(rb.getId().equals("admin")){%>
		    							관리자
		    							<%}else{ %>
		    						<%=rb.getId()%>
		    						<%} %>
	    						</span>
			    				<p class="replyCnt">
			    					<% if(rb.getIsDel().equals("n")){%>
				    					<%=rb.getCmtCnt()%>
			    					<%}else{ %>
			    					   삭제된 댓글입니다.
		    					   <%} %>
		    					</p>
		    					<div class="replyBtns">
		    					<%
		    					if(id != null){
			    					if(!rb.getIsDel().equals("y") && id.equals(rb.getId())){ %>
				    						<input type="button" class="btn medium updateRepyBtn" value="수정">
				    						<a href="../reply/replyDel.jsp?num=<%=bb.getNum()%>&cmtNum=<%=rb.getCmtNum()%>&id=<%=rb.getId()%>&depthNum=<%=rb.getDepthCmt() %>&contNum=1" class="btn medium">삭제</a>
				    					
		    						<%}
			    					if(id.equals("admin")){%>
			    						<a href="../reply/replyDelAdmin.jsp?num=<%=bb.getNum()%>&cmtNum=<%=rb.getCmtNum()%>&id=<%=rb.getId() %>&depthNum=<%=rb.getDepthCmt() %>&contNum=1" class="btn medium">관리자삭제</a>
			    					
		    						<%}
		    					}%>
		    					</div>
		    					<div class="replyBox" id="replyBoxUpdate">
						    		<form action="../reply/replyUpdate.jsp" method="post">
					                    <label for="commentContent" class="blind">댓글수정</label>
					                    <input type="hidden" name="depthCmt" value="<%=rb.getDepthCmt()%>">
					                    <input type="hidden" name="cmtNum" value="<%=rb.getCmtNum() %>">
					                    <input type="hidden" name="boardNum" value="<%=bb.getNum()%>">
					                    <input type="hidden" name="contNum" value="1">
					                    <textarea name="content" id="commentContent" cols="30" rows="3" onkeyup="legnthLimit('commentContent');" required="required" placeholder="로그인 후 이용해주세요." onclick="replyBoxClick()" title="의견입력"><%=rb.getCmtCnt() %></textarea>
					                    <label for=" register" class="blind">수정</label>
					                    <input type="submit" id="register" name="register" value="수정" >
					                </form>
						    	</div>
					    	</div>
		    				<span class="rereplyBtn"><i><img src="../images/cmt.png"></i><a href="#rereplyBtnC" onclick="return false;" class="rereplyBtnC" >답글달기</a></span>
		    				 <div class="replyBox" id="reRplyBox">
					    		<form action="../reply/replyPro.jsp" method="get">
				                    <label for="commentContent" class="blind">답글달기</label>
				                    <input type="hidden" name="depthCmt" value="2">
				                    <input type="hidden" name="contNum" value="1">
				                    <input type="hidden" name="cmtSubNum" value="<%=rb.getCmtNum() %>">
				                    <input type="hidden" name="boardNum" value="<%=bb.getNum()%>">
				                    <textarea name="content" id="commentContent" cols="30" rows="3" onkeyup="legnthLimit('commentContent');" required="required" placeholder="로그인 후 이용해주세요." onclick="replyBoxClick()" title="의견입력"></textarea>
				                    <label for=" register" class="blind">등록</label>
				                    <input type="submit" id="register" name="register" value="등록" >
				                </form>
					    	</div>
				    		<%
				    		List reReplyList = rd.getreReplyListint(bb.getNum(),rb.getCmtNum());
				    		if(reReplyList != null){
					    			for(int j=0; j< reReplyList.size(); j++){
					    				ReplyBean rb2 = (ReplyBean)reReplyList.get(j);
					    		%>
					    			<div class="clearfix">
					    					<span class="writer">└ <%=rb2.getId()%></span>
						    				<p class="replyCnt">
						    					<% if(rb2.getIsDel().equals("n")){%>
							    					<%=rb2.getCmtCnt()%>
						    					<%}else{ %>
						    					   삭제된 댓글입니다.
					    					   <%} %>
					    					</p>
					    					<%
					    					if(id != null){
						    					if(!rb2.getIsDel().equals("y") && id.equals(rb2.getId())){%>
							    					<div class="replyBtns">
							    						<input type="button" class="btn medium updateRepyBtn" value="수정">
							    						<a href="../reply/replyDel.jsp?num=<%=bb.getNum()%>&cmtNum=<%=rb2.getCmtNum()%>&id=<%=rb2.getId() %>&depthNum=<%=rb2.getDepthCmt() %>&contNum=1" class="btn medium">삭제</a>
							    					</div>
							    					<div class="replyBox" id="replyBoxUpdate">
											    		<form action="../reply/replyUpdate.jsp" method="get">
										                    <label for="commentContent" class="blind">댓글수정</label>
										                    <input type="hidden" name="depthCmt" value="<%=rb2.getDepthCmt()%>">						                    
		                    								<input type="hidden" name="contNum" value="1">
										                    <input type="hidden" name="cmtNum" value="<%=rb2.getCmtNum() %>">
										                    <input type="hidden" name="boardNum" value="<%=bb.getNum()%>">
										                    <textarea name="content" id="commentContent" cols="30" rows="3" onkeyup="legnthLimit('commentContent');" required="required" placeholder="로그인 후 이용해주세요." onclick="replyBoxClick()" title="의견입력"><%=rb2.getCmtCnt() %></textarea>
										                    <label for=" register" class="blind">수정</label>
										                    <input type="submit" id="register" name="register" value="수정" >
										                </form>
											    	</div>
					    						<%}
					    					if(id.equals("admin")){%>
					    						<div class="replyBtns">
					    						<a href="../reply/replyDelAdmin.jsp?num=<%=bb.getNum()%>&cmtNum=<%=rb2.getCmtNum()%>&id=<%=rb2.getId() %>&depthNum=<%=rb2.getDepthCmt() %>&contNum=1" class="btn medium">관리자삭제</a>
					    					</div>
					    					<%}
				    					}%>
			    					</div>
			    				<%} 
			    			}%>	
		    			</div>
	    			</li>
    			<%} %>
    		</ul>
		    <div class="replyBox">
	    		<form action="../reply/replyPro.jsp" method="post">
                    <label for="commentContent" class="blind">댓글</label>
                    <input type="hidden" name="depthCmt" value="1">
                    <input type="hidden" name="cmtSubNum" value="0">
                    <input type="hidden" name="contNum" value="1">
                    <input type="hidden" name="boardNum" value="<%=bb.getNum()%>">
                    <textarea name="content" id="commentContent" cols="30" rows="3" onkeyup="legnthLimit('commentContent');" required="required" placeholder="로그인 후 이용해주세요." onclick="replyBoxClick()" title="의견입력"></textarea>
                    <label for="register" class="blind">등록</label>
                    <input type="submit" id="register" name="register" value="등록" >
                </form>
	    	</div>
    	</div>

	    <!--버튼 시작-->
	    <div class="boardBtns center">
	    	<%if(id !=null && id.equals(bb.getWriter()) || id !=null && id.equals("admin") ){%>
		    <a href="boardUpdateForm.jsp?num=<%=num%>" class="btn medium color1">수정</a>
		    <a href="board.jsp?boardPage=<%=page%>" class="btn medium">목록</a>
	        <a href="boardDelForm.jsp?num=<%=num %>" class="btn medium">삭제</a>
	        <%}else{ %>
	        <a href="board.jsp?boardPage=<%=page%>" class="btn medium">목록</a>
	        <%} %>
	    </div>
	    </div>
</div>
<script type="text/javascript">
	function replyBoxClick(){
		var id = <%=session.getAttribute("id")%>;
		if(id == null){
			alert('로그인 후 이용해주세요.');
			location.href="../member/login.jsp";
		}
	}
	
	$(document).ready(function(){
		//댓글수정
		$('.updateRepyBtn').on('click',function(){
			var rpUpdateParent = $(this).closest('div');
			if(!rpUpdateParent.next().hasClass('on')){
				$('.replyBox').removeClass('on');
				rpUpdateParent.next().addClass('on');
			}else{
				rpUpdateParent.next().removeClass('on');
			}
		});
		//답글
		$('.rereplyBtnC').on('click',function(){
			var rpParent = $(this).closest('span');
			if(!rpParent.next().hasClass('on')){
				$('.replyBox').removeClass('on');
				rpParent.next().addClass('on');
			}else{
				rpParent.next().removeClass('on');
			}
		});
		
		
		
	});
			
</script>

<jsp:include page="../inc/bottom.jsp"></jsp:include>
