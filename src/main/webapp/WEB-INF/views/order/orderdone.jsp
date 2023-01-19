ㅓㅐ<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>
<!-- container -->
<main id="container" class="container"> 
<script type="text/javascript">
	
</script>

<div class="container">
	<section>
		<div class="join_wrap ">
			
				<h2 class="h2_type">주문완료</h2>
				<div class="join_end">
					<p class="welcome">주문번호:${oid }</p>
					<p class="join_etxt">항상 행복과 감동을 주는 현대백화점인터넷면세점이 되겠습니다.</p>
				</div>

				<!-- 20201208 추가: 전시 일정 : ~ 12/15(화) -->
				<div id="banner" class="ban_col mgtm" style="display: none;">
					<img
						src="https://cdn.hddfs.com/front/images/KO/member/join_complete_ban03.jpg"
						alt="지금 로그인 하시면 신규가입 및 회원등급별 푸짐한 혜택을 받으실 수 있습니다."
						title="지금 로그인 하시면 신규가입 및 회원등급별 푸짐한 혜택을 받으실 수 있습니다.">
					<!-- 2019-03-29 배너 추가 -->
				</div>
				<!-- 20201208 추가: 전시 일정 : 12/16(수) ~ 1/5 -->
				<div id="evnt_banner" class="ban_col mgtm type2"
					style="display: none;">
					<a
						href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0002864"><img
						src="https://cdn.hddfs.com/front/images/KO/member/log_evt1_pc03.jpg"
						alt="신규가입 전시회 티켓증정"></a> <a
						href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0002824"><img
						src="https://cdn.hddfs.com/front/images/KO/member/log_evt1_pc04.jpg"
						alt="온오프통합가입"></a>
				</div>

				<div class="basic_btn_box mgtml">
					<button type="button" class="btn_basic2 big" id="btnLogin" onclick="location.href='./login'">
						로그인</button>
				</div>
		</div>
	</section>
</div>
</main>
<!-- // container -->
<script type="text/javascript">
	function sellerInfo() {
		$("#seller_information").dialog("open");
	}
	$(document).ready(function() {
		// 다이얼로그 초기화
		$("#seller_information").dialog({
			autoOpen : false,
			resizable : false,
			width : 400,
			maxHeight : 340,
			modal : true
		});
	});
	function moveToMain() {
		location.href = ctx_shop + '/dm/main.do';
	}
</script>
<%@ include file="../common/Footer.jsp"%>