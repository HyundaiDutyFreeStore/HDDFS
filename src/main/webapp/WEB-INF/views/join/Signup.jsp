<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main id="container" class="container"> <script
	type="text/javascript">
	$(function() {

		$('#btnUmbJoin').click(function() {
			var ptnrChlCd = "";
			var ptcoAlliPaonInf2 = "";
			fnUmbJoinPop('', ptnrChlCd, ptcoAlliPaonInf2);
		});
	});

	function moveTermsAgree(foreignerYn, lang, offMbshYn) {
		var url = ctx_shop + "/mm/mbshJoin/termsAgree.do";
		$('#foreignerYn').val(foreignerYn);
		$('#lang').val(lang);
		$('#offMbshYn').val(offMbshYn);
		$('#frmJoin').attr('action', url);
		$('#frmJoin').submit();
	}
</script>
<div class="container">
	<section>
		<div class="join_wrap offline">
			<form id="frmJoin" name="frmJoin" method="post" action="">
				<input type="hidden" id="foreignerYn" name="foreignerYn"><input
					type="hidden" id="lang" name="lang"><input type="hidden"
					id="offMbshYn" name="offMbshYn">
			</form>
			<div class="type_group">
				<h2 class="h2_type">회원가입</h2>
				<h3 class="h3_type mgtmm">온·오프라인 통합 가입고객 전용</h3>
				<ul class="choice_box">
					<li><a href="javascript:void(0);" class="ico_mema check"
						id="btnUmbJoin">
							<p class="ico_memb join_type_to">H.Point통합회원</p>
							<p class="type_st">
								*0.2% H.Point 적립(KOR 국적 한정)<br>하나의 ID로 현대백화점 그룹<br>모든
								서비스 이용
							</p>
					</a></li>
					<li><a href="javascript:void(0);"
						onclick="moveTermsAgree('N','KR','N')" class="ico_mema check">
							<p class="ico_memb join_type_lo">면세점간편회원 내국인</p>
							<p class="type_st">
								현대백화점면세점 전용
								<!-- 현대백화점인터넷면세점<br>서비스만 이용 -->
							</p>
					</a></li>
					<li>
						<div class="type_fo_chk">
							<p class="ico_memb join_type_fo">Foreigners</p>
							<span class="type_fo_link"> <a href="javascript:void(0);"
								onclick="moveTermsAgree('Y','KR','N')" class="ico_mema check">한국어</a>
								<a href="javascript:void(0);"
								onclick="moveTermsAgree('Y','EN','N')" class="ico_mema check">English</a>
								<a href="javascript:void(0);"
								onclick="moveTermsAgree('Y','CN','N')" class="ico_mema check">中文</a>
							</span>
						</div>
					</li>
				</ul>
			</div>

			<div class="type_group">
				<h3 class="h3_type mgtmm">오프라인 매장 가입고객 전용</h3>
				<p class="p_dot_list mgtxs">
					오프라인 매장에서 사전 가입을 진행한 고객님께서는,<br>[오프라인 매장 가입고객 전용] 을 통해 인터넷면세점
					가입을 완료해주세요.
				</p>
				<p class="p_dot_list">H.Point 통합회원 가입은 인터넷면세점 가입 후 마이현대에서
					[H.Point 통합회원전환]을 진행해주세요.</p>
				<ul class="choice_box mgts" style="width: 418px; margin: 0 auto;">
					<li><a href="javascript:void(0);"
						onclick="moveTermsAgree('N','KR','Y')" class="ico_mema check">
							<p class="ico_memb join_type_lo">면세점간편회원 내국인</p>
							<p class="type_st">
								현대백화점면세점 전용
								<!-- 현대백화점인터넷면세점<br>서비스만 이용 -->
							</p>
					</a></li>
					<li>
						<div class="type_fo_chk">
							<p class="ico_memb join_type_fo">Foreigners</p>
							<span class="type_fo_link"> <a href="javascript:void(0);"
								class="ico_mema check" onclick="moveTermsAgree('Y','KR','Y')">한국어</a>
								<a href="javascript:void(0);" class="ico_mema check"
								onclick="moveTermsAgree('Y','EN','Y')">English</a> <a
								href="javascript:void(0);" class="ico_mema check"
								onclick="moveTermsAgree('Y','CN','Y')">中文</a>
							</span>
						</div>
					</li>
				</ul>
			</div>

			<style>
.join_wrap .benefit_group .benefit_info li {
	width: 132px;
}
</style>
			<div class="benefit_group">
				<h3 class="h4_type">현대백화점인터넷면세점 회원 혜택 안내</h3>
				<ul class="benefit_info">
					<li class="ico_memb join_bene_01">신규가입<br>적립금
					</li>
					<li class="ico_memb join_bene_02">다양한 이벤트<br>적립금
					</li>
					<li class="ico_memb join_bene_03">회원전용<br>할인혜택
					</li>
					<!--                     <li class="ico_memb join_bene_04">회원 쿠폰북<br>발급</li> -->
					<li class="ico_memb join_bene_05">회원 등급별<br>구매 할인
					</li>
				</ul>
			</div>
		</div>
	</section>
</div>



<script>
	var ctx_shop = "https://www.hddfs.com/shop";
	var snsKey = "6bc7aa6a91d5422eac8ba5aaf1aafa60";

	//facebook sdk init
	window.fbAsyncInit = function() {
		FB.init({
			appId : '338912136590462',
			autoLogAppEvents : true,
			xfbml : true,
			version : 'v2.10'
		});
		FB.AppEvents.logPageView();
	};

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.10&appId=338912136590462";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script> <script src="https://cdn.hddfs.com/front/js/KO/crew/snsLogin.js"></script>
<script>
	//페이스북 로그인 콜백 처리
	function snsFBLogin(response) {
		var data = {
			snsKey : snsKey,
			snsSimpJoinClsCd : "003",
			snsId : response.id,
			mailAddr : response.email,
			mbshNm : response.name,
			mbshBirtDt : ""
		}
		requestSnsLogin(data);
	}

	// 네이버 로그인 콜백 처리
	function snsNVLogin(response) {
		var data = {
			snsKey : snsKey,
			snsSimpJoinClsCd : "001",
			snsId : response.id,
			mailAddr : response.email,
			mbshNm : response.name,
			mbshBirtDt : ""
		}
		requestSnsLogin(data);
	}

	// 카카오 로그인 콜백 처리
	function snsKOLogin(response) {
		var data = {
			snsKey : snsKey,
			snsSimpJoinClsCd : "002",
			snsId : response.id,
			mailAddr : response.kaccount_email,
			mbshNm : response.properties.nickname,
			mbshBirtDt : ""
		}
		requestSnsLogin(data);
	}

	// SNS 로그인 요청
	function requestSnsLogin(data) {
		var vSnsSimpJoinClsCd = data.snsSimpJoinClsCd; // 간편가입구분코드(네이버, 카카오톡, 페이스북)

		// 전송
		$
				.ajax({
					async : false,
					url : ctx_shop + "/mm/mbshAuca/snsLogin.json",
					dataType : "json",
					type : "POST",
					data : data,
					success : function(data, textStatus, jqXHR) {
						//console.log(data);
						// 자동로그인이 아닌경우 -> 메일주소가 존재하는 경우와 존재하지 않는 경우의 이동 경로가 다름.
						if (data.info && data.info.checkYn) {
							if (data.info.checkYn == "Y") {
								location.href = ctx_shop
										+ "/mm/mbshJoin/snsJoin.do";
							} else {
								location.href = ctx_shop
										+ "/mm/mbshJoin/snsJoinFail.do?snsSimpJoinClsCd="
										+ vSnsSimpJoinClsCd;
							}
						} else {
							var redirectUrl = '';
							var vResultCode = data.resultCode;
							var vMessage = data.message;
							var vInfo = data.info;

							// 정상처리된 경우
							if (vResultCode == 1) {
								// 코마스 script

								location.href = ctx_shop + "/dm/main.do";
								return;
							}

							// 100번 미만의 결과 코드는 일반 메세지임.
							if (vResultCode < 100) {
								alert(vMessage);
								return;
							}

							// 100번 이상의 결과 코드를 기준으로 분기 처리
							if (vResultCode == 100) { // 계정잠금
								$("#pw_error").dialog("open");
								return;
							} else if (vResultCode == 110) { // 휴면회원 해제
								fnMbshSleepRelease(vInfo.mbshNo,
										vInfo.authType, redirectUrl);
							} else if (vResultCode == 120) { // 임시 비밀번호 변경 안내
								// 코마스 script

								location.href = ctx_shop + "/dm/main.do";
							} else if (vResultCode == 130) { // 비밀번호 장기 미변경
								// 코마스 script

								location.href = ctx_shop + "/dm/main.do";
							} else if (vResultCode == 140) { // 불량회원 로그인
								alert('고객님의 계정은 사용이 일지중지되었습니다. 자세한 문의는 고객센터를 이용해주세요.\n문의전화 : 1811-6688');
							} else if (vResultCode == 150) { // 승급안내
								// 코마스 script

								popOpen(
										ctx_shop
												+ '/mm/mbshAuca/membershipLevelUpPop.do',
										'membershipLevelUpPop', 460, 490);
								location.href = ctx_shop + "/dm/main.do";
							} else if (vResultCode == 160 || vResultCode == 190) { // 비밀번호 불일치 & 기타
								alert(vMessage);
								return;
							} else if (vResultCode == 170) { // 통합멤버쉽 참여사 미가입
								alert(vMessage);
								return;
							} else if (vResultCode == 180) { // SNS 로그인 실패
								alert(vMessage);
								return;
							} else {
								alert('처리중 오류가 발생하였습니다.');
								return;
							}
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						//console.log(jqXHR.status);
					}
				});
	}

	//코마스 script

	$(document).ready(function(evt) {
		// 비밀번호 잠금 레이어 설정
		$("#pw_error").dialog({
			autoOpen : false,
			resizable : false,
			width : 400,
			maxHeight : 720,
			modal : true
		});
	});
</script></main>

<%@ include file="../common/Footer.jsp"%>