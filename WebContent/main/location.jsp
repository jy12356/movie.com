<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/top.jsp"></jsp:include>

<div class="container">

	<div id="contents" class="dv_wrap"> 
		<div class="contit">
	      	<div class="loc">
	          	<img src="../images/ico_home.gif" alt="홈"> &gt; <span class="current">찾아오시는길</span>
	          </div>
			<h2 class="h2">찾아오시는길</h2>
		</div>
		<div class="map_wrap">
			<div class="map_box_zone">
				<div id="daumRoughmapContainer1602032665128" class="root_daum_roughmap root_daum_roughmap_landing" style="width: 100% !important"></div>
				<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
				<script charset="UTF-8">
	 					new daum.roughmap.Lander({ 
	 						"timestamp" : "1602032665128", 
							"key" : "22by6", 
							"mapWidth" : "1290", 
	 						"mapHeight" : "460" 
						}).render(); 
				</script> 
<!-- 					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3261.9278271202843!2d129.05988271554082!3d35.15842066607288!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568eb7a9ffb035f%3A0x8e030b4b8ef4a2dd!2z7JWE7J207Yuw7JyMIOu2gOyCsOq1kOycoeyEvO2EsA!5e0!3m2!1sko!2skr!4v1602033472313!5m2!1sko!2skr" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe> -->
			</div>
			<div class="map_txt clearfix" id="map_txt" tabindex="0">
				<ul class="ul-v1">
					<li>주소 : 부산 부산진구 동천로 109 삼한골든게이트 7층</li>
					<li>전화번호 : 051-803-0909</li>
				</ul>
				
			</div>
		</div>
	</div>
</div>


<jsp:include page="../inc/bottom.jsp"></jsp:include>