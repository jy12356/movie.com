<%@page import="reply.ReplyBean"%>
<%@page import="java.util.List"%>
<%@page import="reply.ReplyDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Gallery.GalleryBean"%>
<%@page import="Gallery.GalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
GalleryDAO gdao = new GalleryDAO();
int num = Integer.parseInt(request.getParameter("num"));
// System.out.println(num);
GalleryBean gb =  gdao.getGallery(num);
String spectator =null;
if(gb.getSpectator() ==0){
	spectator="전체관람가";
}else if(gb.getSpectator() ==1){
	spectator="12세 관람가";
}else if(gb.getSpectator() ==2){
	spectator="15세 관람가";
}else if(gb.getSpectator() ==3){
	spectator="19세 관람가";
}

%>
<!-- container -->
		<div class="clearfix container sub">
			<div id="contents"> 
				<div class="contit">
		        	<div class="loc">
		            	<img src="../images/ico_home.gif" alt="홈"> &gt; <span class="current">글쓰기</span>
		            </div>
					<h2 class="h2">영화소개</h2>
				</div>
				<div class="movie_list list_vw clearfix">
				    <div class="unit_wrap">
				        <ul>
				            <li class="unit">
				                <div class="book_img img_vw">
				                    <img src="../images/<%=gb.getThumImg()%>" alt="<%=gb.getTitle() %>">
				                </div>
				                <div class="movieinfo movieinfo_vw">
				                    <div class="public_vw">
				                        <p class="tit"><%=gb.getTitle() %></p>
				                        <p>2018 한국 
											<%if(gb.getSpectator() ==0){%>
				                        		<span class="age">전체관람가</span>
											<%}else if(gb.getSpectator() ==1){%>
												<span class="age age12">12세관람가</span>
											<%}else if(gb.getSpectator() ==2){%>
												<span class="age age15">15세관람가</span>
											<%}else if(gb.getSpectator() ==3){%>
												<span class="age age19">청소년관람불가</span>
											<%} %>
										</p>
				                        <p>코미디 상영시간 : <%=gb.getRuntime() %>분</p>
				                        <p>개봉일 : <%=gb.getOpenDate()%></p>
				                        <p>감독 : <%=gb.getDirector() %></p>
				                        <p>출연 : <span class="cast"><%=gb.getCast() %></span><a  class="moreP"href="#" onclick="return false" title="더보기">(more)</a> </p>
										<p>평점 : ★<%=gb.getGrade() %></p>
										<p>추천 수 : <%=gb.getRecommend() %></p>
				                    </div>
				                    <div class="moviebtn moviebtn_vw">
				                        <p class="loan">
				                        	<a href="recommend.jsp?num=<%=gb.getNum()%>">
					                        	<span class="choiceBtn">
					                        		<img src="../images/choice.png" alt="추천하기">
				                        		</span>
				                        		추천해요
		                        			</a>
	                        			</p>
				                    </div>
				                </div>
				            </li>
				        </ul>
				    </div>
				</div>
								
				<div class="movie_intro">
				    <ul class="tabs clearfix">
				        <li class="tab-link on" data-tab="tab-1">영화소개</li>
				        <li class="tab-link" data-tab="tab-2" id="tabT-2">출연진</li>
				        <li class="tab-link" data-tab="tab-3">관람객/네티즌</li>
				    </ul>
				    <div id="tab-1" class="tab-content on">
				        <span class="sumtit"><%=gb.getDepTitle() %></span>
				         <p>
				         	<%=gb.getContent() %>
				         </p>
				    </div>
				    <div id="tab-2" class="tab-content">
				       감독 <%=gb.getDirector()%><br> 출연 <%=gb.getCast() %>
			        </div>
			        <div id="tab-3" class="tab-content">
		        		<ul class="replyCnts">
			    			<%
								/*댓글*/
								ReplyDAO rd = new ReplyDAO();
								List replyList = rd.getreplyListint(num,0);
					    		int replySize =  replyList.size();
					    		for(int i = 0; i < replySize; i++){ 
					    		ReplyBean rb = (ReplyBean)replyList.get(i);
					    		%>
				    			<li class="reply ">
				    				<div class="replyInner">
				    					<div class="clearfix replyRep">
					    					<span class="writer"><%=rb.getId()%></span>
						    				<p class="replyCnt">
						    					<% if(rb.getIsDel().equals("n")){%>
							    					<%=rb.getCmtCnt()%>
						    					<%}else{ %>
						    					   삭제된 댓글입니다.
					    					   <%} %>
					    					</p>
					    					<%
					    					if(id != null){
						    					if(!rb.getIsDel().equals("y") && id.equals(rb.getId())){ %>
							    					<div class="replyBtns">
							    						<input type="button" class="btn medium updateRepyBtn" value="수정">
							    						<a href="../reply/replyDel.jsp?num=<%=gb.getNum()%>&cmtNum=<%=rb.getCmtNum()%>&id=<%=rb.getId() %>&depthNum=<%=rb.getDepthCmt() %>&contNum=0" class="btn medium">삭제</a>
							    					</div>
							    					<div class="replyBox" id="replyBoxUpdate">
										    		<form action="../reply/replyUpdate.jsp" method="post">
									                    <label for="commentContent" class="blind">댓글수정</label>
									                    <input type="hidden" name="depthCmt" value="1">
									                    <input type="hidden" name="contNum" value="0">
					                    				<input type="hidden" name="cmtSubNum" value="0">
									                    <input type="hidden" name="boardNum" value="<%=gb.getNum()%>">
									                    <input type="hidden" name="cmtNum" value="<%=rb.getCmtNum() %>">
									                    <input type="hidden" name="boardNum" value="<%=gb.getNum()%>">
									                    <textarea name="content" id="commentContent" cols="30" rows="3" onkeyup="legnthLimit('commentContent');" required="required" placeholder="로그인 후 이용해주세요." onclick="replyBoxClick()" title="의견입력"><%=rb.getCmtCnt() %></textarea>
									                    <label for=" register" class="blind">등록</label>
									                    <input type="submit" id="register" name="register" value="등록" >
									                </form>
										    	</div>
					    						<%}
						    					if(id.equals("admin")){%>
							    						<div class="replyBtns">
								    						<a href="../reply/replyDelAdmin.jsp?num=<%=gb.getNum()%>&cmtNum=<%=rb.getCmtNum()%>&id=<%=rb.getId() %>&depthNum=<%=rb.getDepthCmt() %>&contNum=0" class="btn medium">관리자삭제</a>
								    					</div>
						    					<%}
					    						}%>
						    					
									    	</div>
								    	</div>
				    			</li>
			    			<%} %>
			    		</ul>
	    			    <div class="replyBox">
					    		<form action="../reply/replyPro.jsp" method="post">
				                    <label for="commentContent" class="blind">댓글</label>
				                    <input type="hidden" name="depthCmt" value="1">
				                    <input type="hidden" name="cmtSubNum" value="0">
				                    <input type="hidden" name="contNum" value="0">
				                    <input type="hidden" name="boardNum" value="<%=gb.getNum()%>">
				                    <textarea name="content" id="commentContent" cols="30" rows="3" onkeyup="legnthLimit('commentContent');" required="required" placeholder="로그인 후 이용해주세요." onclick="replyBoxClick()" title="의견입력"></textarea>
				                    <label for=" register" class="blind">등록</label>
				                    <input type="submit" id="register" name="register" value="등록" >
				                </form>
					    	</div>
				    	</div>
			        </div>
				</div>

				
    			<div class="bbs_btn center mt30">
    				<a href="gallery.jsp" class="btn medium color1">목록</a>
    					<%if(id !=null && id.equals("admin")){ %>
					<a href="galleryUpdateForm.jsp?num=<%=gb.getNum()%>" class="btn medium">수정</a>
					<a href="galleryDelForm.jsp?num=<%=gb.getNum()%>" class="btn medium">삭제</a>
					<%} %>
				</div>
			</div>
			
			
<script>
    $(document).ready(function() {

        $('ul.tabs li').click(function() {
            var tab_id = $(this).attr('data-tab');

            $('ul.tabs li').removeClass('on');
            $('.tab-content').removeClass('on');

            $(this).addClass('on');
            $("#" + tab_id).addClass('on');
        });
        
        $(".moreP").click(function(){
        	$('ul.tabs li').removeClass('on');
            $('.tab-content').removeClass('on');
            $("#tabT-2").addClass('on');
            $("#tab-2").addClass('on');

        });
        
        $('.updateRepyBtn').on('click',function(){
			var rpUpdateParent = $(this).closest('div');
			if(!rpUpdateParent.next('#replyBoxUpdate').hasClass('on')){
				$('#replyBoxUpdate').removeClass("on");
				rpUpdateParent.next('#replyBoxUpdate').addClass("on");
			}else{
				rpUpdateParent.next('#replyBoxUpdate').removeClass("on");
			}
        });

    });
    
	function replyBoxClick(){
		var id = <%=session.getAttribute("id")%>;
		if(id == null){
			alert('로그인 후 이용해주세요.');
			location.href="../member/login.jsp";
		}
	}

</script>			


<jsp:include page="../inc/bottom.jsp"></jsp:include>