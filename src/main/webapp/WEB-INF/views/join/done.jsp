<%@ include file="/WEB-INF/views/common/Header.jsp"%>
<!-- container -->
<main id="container" class="container"> <script
	type="text/javascript">
	$(function() {
		// 뒤로가기삭제
		history.pushState(null, null, location.href);
		window.onpopstate = function() {
			history.go(1);
		};

		// 로그인버튼
		$('#btnLogin').click(function() {
			login(ctx_curr + '/dm/main.do');
		});

		// 적립금, 회원등급 링크
		$('#aSvmt, #aCup, .bf_item').click(function() {
			login(ctx_curr + '/mm/myOrder/listOrder.do');
		});

		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		var hours = date.getHours();

		var today = date.getFullYear()
				+ ""
				+ ((date.getMonth() + 1) < 10 ? "0" + (date.getMonth() + 1)
						: (date.getMonth() + 1))
				+ ""
				+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate())
				+ ""
				+ (date.getHours() < 10 ? "0" + date.getHours() : date
						.getHours())
				+ ""
				+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date
						.getMinutes());

		if (today < '202012160000') {
			$("#banner").show();
			$("#evnt_banner").hide();
			$("#bnf_banner").hide();
		}

		if (today >= '202101260000' && today < '202102140000') {
			$("#banner").hide();
			$("#evnt_banner").show();
			$("#bnf_banner").hide();
		}

		if (today >= '202102140000') {
			$("#banner").hide();
			$("#evnt_banner").hide();
			$("#bnf_banner").show();
		}

	});
</script>

<div class="container">
	<section>
		<div class="join_wrap ">
			<h2 class="h2_type">회원가입완료</h2>
			<div class="join_end">
				<p class="welcome">박승준님, 회원가입을 환영합니다.</p>
				<p class="join_etxt">
					고객님의 아이디는 <span>jamespark6897</span> 입니다.<br>항상 행복과 감동을 주는
					현대백화점인터넷면세점이 되겠습니다.
				</p>
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

			<!-- 20201208 추가: 1/6 ~ 상시 노출 -->
			<div id="bnf_banner" class="ban_col mgtm">
				<a href="https://www.hddfs.com/event/op/bnf/listBnf.do"><img
					src="https://cdn.hddfs.com/front/images/KO/member/log_evt2_pc.jpg"
					alt="신규회원 전용 혜택"></a>
			</div>
			<div class="basic_btn_box mgtml">
				<button type="button" class="btn_basic2 big" id="btnLogin">
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