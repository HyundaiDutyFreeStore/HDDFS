<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main id="container" class="container"> <script
	type="text/javascript">
	$(function() {
		// 다음버튼
		$('#btnNext').click(
				function() {
					var vFlag = false;
					var lang = $("input[name='lang']").val();
					$('[name=agrYns]:not(:checked)').each(
							function() {
								vFlag = true;
								if (lang == 'CN') {
									alert("必选"
											+ $(
													'label[for='
															+ $(this)
																	.attr('id')
															+ ']')
													.attr('value'));
								} else if (lang == 'EN') {
									alert($(
											'label[for=' + $(this).attr('id')
													+ ']').attr('value')
											+ " is required field");
								} else {
									alert($(
											'label[for=' + $(this).attr('id')
													+ ']').attr('value')
											+ "는 필수 항목입니다.");
								}

								$(this).focus();
								return false;
							});

					if (vFlag) {
						return;
					}
					$('#frmTermsAgree').submit();
				});

		fnCheckboxClick('agrYns');
	});

	// 체크박스 체크 처리
	function fnCheckboxClick(name) {
		$('[name^=' + name + ']').on(
				'click',
				function() {
					// 전체 여부에 따른 처리
					if ($(this).attr('name').indexOf('All') != -1) {
						$('[name=' + name + ']').prop('checked',
								$(this).is(':checked')); // 전체 클릭여부와 같도록 설정
					} else {
						var vTotalCnt = $('[name=' + name + ']').length; // 전체 제외한 체크박스 수
						var vChkCnt = $('[name=' + name + ']:checked').length; // 전체 제외한 체크된 체크박스 수

						if ($(this).is(':checked')) {
							if (vTotalCnt == vChkCnt) {
								$('[name=' + name + 'All]').prop('checked',
										$(this).is(':checked')); // 전체 체크
							}
						} else {
							if (vTotalCnt != vChkCnt) {
								$('[name=' + name + 'All]').prop('checked',
										$(this).is(':checked')); // 전체 해제
							}
						}
					}
				});
	}
</script>
<div class="container">
	<section>
		<div class="join_wrap ">
			<form id="frmTermsAgree" name="frmTermsAgree" method="post"
				action="https://www.hddfs.com/shop/mm/mbshJoin/authentication.do">
				<input type="hidden" name="foreignerYn" value="N"> <input
					type="hidden" name="lang" value="KR"><input type="hidden"
					name="offMbshYn" value="N">
				<h2 class="h2_type">회원가입(내국인)</h2>

				<div class="join_step">
					<ol>
						<li class="ico_memb step01 active">STEP 01<em>약관동의</em></li>
						<li class="ico_memb step02">STEP 02<em>본인인증</em></li>
						<li class="ico_memb step03">STEP 03<em>정보입력</em></li>
						<li class="ico_memb step04">STEP 04<em>가입완료</em></li>
					</ol>
				</div>

				<p class="all_agree">
					<span class="checkbox round"> <input type="checkbox"
						name="agrYnsAll" id="agrYnsAll"> <label for="agrYnsAll">
							모두동의</label>
					</span>
				</p>

				<input type="hidden" name="mbshJoinTcndCds" value="001"> <input
					type="hidden" name="mbshJoinTcndVerNos" value="2.1"> <input
					type="hidden" name="joinNtnlCds" value="KR">
				<p class="step_agree">
					<span class="checkbox round"> <input type="checkbox"
						name="agrYns" id="agree1" value="Y"> <label for="agree1"
						value="이용약관동의"> 이용약관동의<span> (필수)</span>
					</label>
					</span>
				</p>
				<div class="step_agree_box">
					<div class="terms_area">
						<ul class="terms_list">
							<li><a href="#terms01">제 1 조 (목적)</a></li>
							<li><a href="#terms02">제 2 조 (정의)</a></li>
							<li><a href="#terms03">제 3 조 (약관의 명시와 개정)</a></li>
							<li><a href="#terms04">제 4 조 (서비스의 제공 및 변경)</a></li>
							<li><a href="#terms05">제 5 조 (서비스의 중단)</a></li>
							<li><a href="#terms06">제 6 조 (회원가입)</a></li>
							<li><a href="#terms07">제 7 조 (회원 탈퇴 및 자격의 상실)</a></li>
							<li><a href="#terms08">제 8 조 (제공서비스 및 통합회원의 탈퇴) </a></li>
							<li><a href="#terms09">제 9 조 (회원에 대한 통지)</a></li>
							<li><a href="#terms10">제 10 조 (구매신청 및 개인정보 제공 동의 등) </a></li>
							<li><a href="#terms11">제 11 조 (계약의 성립)</a></li>
							<li><a href="#terms12">제 12 조 (수신확인통지, 구매신청 변경 및 취소)</a></li>
							<li><a href="#terms13">제 13 조 (대금결제)</a></li>
							<li><a href="#terms14">제 14 조 (재화 등의 공급)</a></li>
							<li><a href="#terms15">제 15 조 (환급)</a></li>
							<li><a href="#terms16">제 16 조 (청약철회 등)</a></li>
							<li><a href="#terms17">제 17 조 (청약철회 등의 효과)</a></li>
							<li><a href="#terms18">제 18 조 (개인정보보호) </a></li>
							<li><a href="#terms19">제 19 조 (현대백화점 인터넷면세점의 의무) </a></li>
							<li><a href="#terms20">제 20 조 (이용자의 책임과 의무)</a></li>
							<li><a href="#terms21">제 21 조 (현대백화점 인터넷면세점 면책) </a></li>
							<li><a href="#terms22">제 22 조 (연결 “현대백화점 인터넷면세점”과 피연결
									“현대백화점 인터넷면세점” 간의 관계) </a></li>
							<li><a href="#terms23">제 23조 (저작권의 귀속 및 이용제한)</a></li>
							<li><a href="#terms24">제 24 조 (분쟁해결)</a></li>
							<li><a href="#terms25">제 25 조 (재판권 및 준거법)</a></li>
						</ul>
					</div>
					<ul class="terms_style">
						<li><span id="terms01">제 1 조 (목적) </span>
							<p class="terms_txt">본 약관은 ㈜현대백화점면세점이 운영하는 현대백화점 면세점 온라인 쇼핑몰
								(이하 “현대백화점 인터넷면세점”이라 한다)에서 제공하는 서비스(이하 “서비스”라 한다)를 이용함에 있어 현대백화점
								인터넷면세점 이용자의 권리, 의무 및 책임사항을 규정하여 고객 권익을 보호함을 목적으로 합니다.</p></li>
						<li><span id="terms02">제 2 조 (정의)</span>
							<p class="terms_txt">본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
							<ul class="int">
								<li>① "현대백화점 인터넷면세점"이란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등
									정보통신설비를 이용하여, 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며 아울러 현대백화점
									인터넷면세점을 운영하는 회사의 의미로도 사용합니다.</li>
								<li>② "현대백화점 시내면세점"이란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 운영하는
									오프라인 영업장을 말합니다.</li>
								<li>③ "이용자"란 "현대백화점 인터넷면세점"에 접속하여 이 약관에 따라 " 현대백화점 인터넷면세점
									"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li>
								<li>④ "회원"이라 함은 "현대백화점 인터넷면세점"에 개인정보를 제공하여 회원등록을 한 자로서, "이
									약관에 따라 제공되는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</li>
								<li>⑤ "비회원"이라 함은 회원에 가입하지 않고 "현대백화점 인터넷면세점"이 제공하는 서비스를 이용하는
									자를 말합니다.</li>
							</ul></li>
						<li><span id="terms03">제 3 조 (약관의 명시와 개정)</span>
							<ul class="int">
								<li>① “현대백화점 인터넷면세점”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지
									주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자등록번호,
									통신판매업 신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 “현대백화점 인터넷면세점” 의 초기
									서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</li>
								<li>② “현대백화점 인터넷면세점”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에
									관한 법률」, 「전자문서 및 전자거래 기본법」, 「전자서명법」, 「전자금융거래법」, 「정보통신망 이용촉진 및
									정보보호 등에 관한 법률」, 「소비자 보호법」등 관련법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.</li>
								<li>③ “현대백화점 인터넷면세점”이 본 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여
									현행약관과 함께 그 적용일자 7일 이전부터 적용일자 전일까지 제1항과 같은 방법으로 공지 합니다. 다만,
									이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우
									"현대백화점 인터넷면세점”은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.</li>
								<li>④ "현대백화점 인터넷면세점”이 약관을 개정할 경우, 개정약관은 그 적용일자 이후에 체결되는
									계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만, 이미
									계약을 체결한 자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 "현대백화점
									인터넷면세점”에 송신하여 "현대백화점 인터넷면세점”의 동의를 얻은 경우 개정약관 조항을 적용할 수 있습니다.</li>
								<li>⑤ 회원은 개정된 약관에 동의하지 않을 경우 회원 탈퇴를 요청할 수 있으며, "현대백화점
									인터넷면세점” 서비스화면에 게시된 개정된 약관에 대해 "동의하지 않음"의 의사 표현이 없을 경우 개정된 약관에
									동의하는 것으로 간주됩니다.</li>
								<li>⑥ 본 약관에서 정하지 아니한 사항 및 본 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에
									관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계법령
									또는 상관례에 따릅니다.</li>
							</ul></li>
						<li><span id="terms04">제 4 조 (서비스의 제공 및 변경)</span>
							<ul class="int">
								<li>① "현대백화점 인터넷면세점”은 다음과 같은 업무를 수행합니다.
									<ul class="int3">
										<li>1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결</li>
										<li>2. 구매계약이 체결된 재화 또는 용역의 배송</li>
										<li>3. 기타 "현대백화점 인터넷면세점”이 정하는 업무</li>
									</ul>
								</li>
								<li>② "현대백화점 인터넷면세점”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차
									체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의
									내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.</li>
								<li>③ "현대백화점 인터넷면세점”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절
									또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 수단(전자우편, SMS
									등)으로 즉시 통지합니다.</li>
								<li>④ 전항의 경우 "현대백화점 인터넷면세점”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만,
									"현대백화점 인터넷면세점”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
							</ul></li>
						<li><span id="terms05">제 5 조 (서비스의 중단)</span>
							<ul class="int">
								<li>① "현대백화점 인터넷면세점”은 컴퓨터 등 정보통신설비나 전산망의 보수, 점검, 교체 및 고장,
									통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</li>
								<li>② "현대백화점 인터넷면세점”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자
									또는 제3자가 입은 손해에 대하여 배상합니다. 단, "현대백화점 인터넷면세점”이 고의 또는 과실이 없음을 입증하는
									경우에는 그러하지 아니합니다.</li>
								<li>③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는
									경우에는 "현대백화점 인터넷면세점”은 제9조에 정한 방법으로 이용자에게 통지하고 "현대백화점 인터넷면세점”에서
									사전에 제시한 조건에 따라 소비자에게 보상합니다. 다만 "현대백화점 인터넷면세점”이 보상기준 등을 고지하지 아니한
									경우에는 이용자들의 마일리지 또는 적립금 등을 "현대백화점 인터넷면세점”에서 통용되는 통화가치에 상응하는 현물
									또는 현금으로 이용자에게 지급합니다.</li>
							</ul></li>
						<li><span id="terms06">제 6 조 (회원가입)</span>
							<ul class="int">
								<li>① 이용자는 다음 각 중 하나의 회원유형을 선택하여 지정된 가입 양식에 따라 회원정보를 기입한 후
									이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.
									<ul class="int3">
										<li>1. H.Point통합회원: 현대백화점 그룹이 운영하는 H.Point 멤버십과 “현대백화점
											인터넷면세점”(국문몰에 한함)에 동시에 가입한 고객으로서 H.Point 멤버십, “현대백화점 인터넷면세점”,
											“현대백화점 시내면세점” 서비스 이용이 가능한 회원</li>
										<li>2. <font color="#000000"><span lang="EN-US"
												style="font-size: 9pt; font-family: &amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; quot;; line-height: 107%; mso-bidi-font-family: &amp;amp; amp; quot; Times New Roman&amp;amp; amp; quot;; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: KO; mso-bidi-language: AR-SA; mso-ascii-theme-font: major-latin; mso-fareast-theme-font: major-latin; mso-hansi-theme-font: major-latin">H.Point
											</span><span
												style="font-size: 9pt; font-family: &amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; quot;; line-height: 107%; mso-bidi-font-family: &amp;amp; amp; quot; Times New Roman&amp;amp; amp; quot;; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: KO; mso-bidi-language: AR-SA; mso-ascii-theme-font: major-latin; mso-fareast-theme-font: major-latin; mso-hansi-theme-font: major-latin">전환회원<span
													lang="EN-US">: </span>기존 현대백화점 그룹이 운영하는<span lang="EN-US">
														H.Point </span>멤버십에 가입된 고객으로 “현대백화점 인터넷면세점”<span lang="EN-US">
														(</span>국문몰에 한함<span lang="EN-US">)</span>에 신규가입 후 통합회원으로 전환한
													고객으로서<span lang="EN-US"> H.Point </span>멤버십<span
													lang="EN-US">, </span>“현대백화점 인터넷면세점”<span lang="EN-US">,
												</span>“현대백화점 시내면세점” 서비스 이용이 가능한 회원
											</span></font></li>
										<li>3. 면세점간편회원: “현대백화점 인터넷면세점”의 회원으로서, “현대백화점 인터넷면세점” 및
											“현대백화점 시내면세점” 서비스 이용이 가능한 회원</li>
									</ul>
								</li>
								<li>② "현대백화점 인터넷면세점”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 이하 각호에
									해당하지 않는 한 회원으로 등록합니다.
									<ul class="int3">
										<li>1. 가입신청자가 본 약관 제 7 조 제3항에 의거하여 이전에 회원 자격을 상실한 적이 있는
											경우 (다만 회원자격 상실 후 3년이 경과한 자로서 "현대백화점 인터넷면세점"의 승낙이 있는 경우 재등록 할
											수 있습니다)</li>
										<li>2. 등록을 위하여 이용자가 입력 내지 제공한 내용에 허위, 기재누락, 오기가 있는 경우</li>
										<li>3. 기타 회원으로 등록하는 것이 "현대백화점 인터넷면세점”의 기술상 또는 업무 수행상 현저히
											지장이 있다고 판단하는 경우</li>
										<li>4. 만 14세 미만인 자</li>
									</ul>
								</li>
								<li>③ 회원 가입계약의 성립시기는 "현대백화점 인터넷면세점”의 승낙이 회원에게 도달한 시점으로 합니다.</li>
								<li>④ 회원은 등록사항에 변경이 있는 경우 즉시 전자우편, 홈페이지 내 회원정보수정 메뉴 입력 및 기타
									방법으로 "현대백화점 인터넷면세점”에 대하여 그 변경사항을 알려야 합니다.</li>
								<li>⑤ 회원 가입신청 양식에 기재되는 모든 이용자 정보는 진실한 사실로서 실제 데이터인 것으로
									간주됩니다. 만일, 실명이나 실제 정보를 입력하지 않은 경우 이용자는 법적인 보호를 받을 수 없으며, 서비스
									사용에 제한을 받을 수 있습니다.</li>
							</ul></li>
						<li><span id="terms07">제 7 조 (회원 탈퇴 및 자격의 상실)</span>
							<ul class="int">
								<li>① 회원은 "현대백화점 인터넷면세점”에 언제든지 탈퇴를 요청할 수 있으며 "현대백화점
									인터넷면세점”은 즉시 회원탈퇴를 처리합니다. 단, 탈퇴요청 시점에 구매하였으나 인도가 완료되지 않은 상품이 있는
									경우에는 상품인도가 완료된 이후, 예치금 및 상품권 전환금을 보유한 경우에는 모두 소진된 이후, 진행중인
									상담내역이 있는 경우에는 처리가 완료된 이후 회원탈퇴에 필요한 조치를 취합니다.</li>
								<li>② “현대백화점 시내면세점”에 가입한 이후 “현대백화점 인터넷면세점”에 가입한 회원이 “현대백화점
									인터넷면세점” 회원에서 탈퇴할 경우 “현대백화점 시내면세점” 회원에서도 탈퇴가 됩니다.</li>
								<li>③ 회원이 다음 각 호의 사유에 해당하는 경우, "현대백화점 인터넷면세점”은 회원자격을 제한하거나
									정지시킬 수 있습니다.
									<ul class="int3">
										<li>1. 가입 신청 시에 허위 내용을 등록한 경우</li>
										<li>2. "현대백화점 인터넷면세점"에 제공되는 정보를 허위로 변경하는 등 "현대백화점
											인터넷면세점"의 운영을 방해한 경우</li>
										<li>3. 매크로 프로그램의 사용, 명의도용, 정보통신망 침해 등 부정한 방법으로 회원가입을 하거나
											서비스를 이용한 경우</li>
										<li>4. "현대백화점 인터넷면세점"을 이용하여 구입한 재화 등의 대금, 기타 "현대백화점
											인터넷면세점"에 대하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우</li>
										<li>5. 다른 사람의 “현대백화점 인터넷면세점” 이용을 방해하거나 정보를 도용하는 등
											전자상거래질서를 위협하는 경우</li>
										<li>6. “현대백화점 인터넷면세점” 멤버십 서비스를 부정한 방법 또는 목적으로 이용한 경우</li>
										<li>7. 구매한 상품 또는 서비스에 하자가 없음에도 상습적으로 사용 후 취소, 반품 등을 하거나
											보상을 요구하는 경우</li>
										<li>8. "현대백화점 인터넷면세점"의 온라인화면에서 공연히 타인의 명예를 훼손한 경우</li>
										<li>9. "현대백화점 인터넷면세점" 운영과 관련하여 공연히 허위의 사실을 적시하거나 유포하는 경우</li>
										<li>10. “현대백화점면세점” 이용과정에서 “현대백화점면세점”의 직원에게 모욕, 협박, 폭언, 폭행
											및 음란한 언행 등을 하는 경우</li>
										<li>11. "현대백화점 인터넷면세점"을 이용하여 법령 또는 본 약관 제20조 및 기타 본 약관이
											금지하는 행위를 하거나 공서양속에 반하는 행위를 하는 경우</li>
										<li>12. 기타 서비스 운영을 고의로 방해하는 행위를 하는 경우 등 회원자격을 제한 또는 정지시킬
											합리적인 사유가 있는 경우</li>
									</ul>
								</li>
								<li>④ "현대백화점 인터넷면세점”이 회원 자격을 제한 또는 정지시켰음에도 불구하고 회원이 동일한 행위를
									하거나 30일 이내에 그 위반사유가 시정이 되지 않는 경우 회원자격을 상실시킬 수 있습니다.</li>
								<li>⑤ "현대백화점 인터넷면세점"이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우
									회원에게 이를 통지하고, 회원 등록 말소 전에 일정 기간동안 소명할 기회를 부여합니다.</li>
								<li>⑥ 본조 제4항에 따라 회원등록이 말소된 회원은 재가입이 제한됩니다.</li>
							</ul></li>
						<li><span id="terms08">제 8 조 (제공서비스 및 통합회원의 탈퇴)</span>
							<ul class="int">
								<li>① H.Point통합회원 및 면세점 간편회원에게 제공하는 서비스는 다음과 같습니다.
									<ul class="int3">
										<li>1. 할인 혜택: “현대백화점 인터넷면세점“ 및 “현대백화점 시내면세점”, 그리고 그 제휴사가
											제공하는 할인 및 무료 사은품 제공 등의 혜택을 받을 수 있습니다.</li>
										<li>2. 우대 혜택: 회원은 “현대백화점 인터넷면세점“ 및 “현대백화점 시내면세점”의 상품구매시
											구매금액을 누적할 수 있으며, “현대백화점 인터넷면세점”이 정한 멤버십 회원 정책에 의거, 누적된 구매금액에
											따라 차등화된 멤버십 등급을 부여 받고 우대 혜택이나 서비스를 적용받을 수 있습니다.</li>
										<li>3. 기타 서비스: “현대백화점 인터넷면세점“은 회원의 이익을 위하여 추가적인 서비스 및 혜택을
											개발하여 회원에게 제공할 수 있습니다.</li>
									</ul>
								</li>
								<li>② 비회원은 “현대백화점 인터넷면세점” 멤버십 혜택을 받을 수 없고, 회원 중 여권번호 정보가
									수집되지 않은 회원 또한 “현대백화점 인터넷면세점” 멤버십 서비스 제공이 제한됩니다.</li>
								<li>③ H.Point통합회원을 탈퇴하거나 자격 상실이 될 경우 그 효력은 “현대백화점 인터넷면세점”
									에도 동일하게 적용되며, 그 상세한 절차는 본 약관 제 7 조(회원 탈퇴 및 자격의 상실)에 따릅니다.<br>
									단, 면세점 간편회원 가입 후 H.Point통합회원으로 전환한 고객이 H.Point 서비스를 탈퇴하거나 자격
									상실이 될 경우 면세점 간편회원의 자격은 그대로 유지됩니다.
								</li>
							</ul></li>
						<li><span id="terms09">제 9 조 (회원에 대한 통지)</span>
							<ul class="int">
								<li>① "현대백화점 인터넷면세점”이 회원에 대한 통지를 하는 경우, 회원이 "현대백화점 인터넷면세점”과
									미리 약정하여 지정한 전자우편 주소 또는 모바일단말기로 할 수 있습니다.</li>
								<li>② "현대백화점 인터넷면세점”은 불특정다수 회원에 대한 통지의 경우 이를 7일 이상 "현대백화점
									인터넷면세점” 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한
									영향을 미치는 사항에 대하여는 개별통지를 합니다.</li>
							</ul></li>
						<li><span id="terms10">제 10 조 (구매신청 및 개인정보 제공 동의 등)</span>
							<ul class="int">
								<li>① "현대백화점 인터넷면세점” 이용자는 출국예정자에 한해 다음 또는 이와 유사한 방법을 통해 구매를
									신청하며, "현대백화점 인터넷면세점”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야
									합니다.
									<ul class="int3">
										<li>1. 재화 등의 검색 및 선택</li>
										<li>2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력</li>
										<li>3. 여권번호, 출국예정일자, 항공기 편명 또는 선박 편명, 출국공항 또는 선박항</li>
										<li>4. 약관내용, 청약 철회권이 제한되는 서비스, 배송료, 설치비 등의 비용부담과 관련한 내용에
											대한 확인</li>
										<li>5. 이 약관에 동의하고 위 4호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)</li>
										<li>6. 재화 등의 구매신청 및 이에 관한 확인 또는 "현대백화점 인터넷면세점"의 확인에 대한 동의</li>
										<li>7. 결제방법의 선택</li>
									</ul>
								</li>
								<li>② "현대백화점 인터넷면세점” 이용자는 상품 주문 시 반드시 성명, 전화번호, 여권번호, 배송지
									(인도장 배송을 위하여 출국일시, 항공 편명 등 출국 정보)를 입력하여야 하며, 이 약관 및 결제 관련 약관 등에
									각 동의하는 의사표시를 하여야 합니다.</li>
								<li>③ “현대백화점 인터넷면세점”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 1)
									개인정보를 제공받는 자, 2)개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4)
									개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은
									사항이 변경되는 경우에도 같습니다.)</li>
								<li>④ “현대백화점 인터넷면세점”이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는
									경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보 취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를
									받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) 다만, 서비스제공에 관한 계약이행을 위해
									필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는
									방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.</li>
							</ul></li>
						<li><span id="terms11">제 11 조 (계약의 성립)</span>
							<ul class="int">
								<li>① "현대백화점 인터넷면세점”은 제10조의 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을
									수 있습니다. 한편, 미성년자와 계약을 체결하는 경우에는 법정대리인이 그 계약에 동의하지 아니하면 미성년자 본인
									또는 법정대리인이 그 계약을 취소할 수 있습니다.
									<ul class="int3">
										<li>1. 신청 내용에 허위, 기재누락, 오기가 있는 경우</li>
										<li>2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</li>
										<li>3. 제7조 제3항 각 호에 해당하여 회원자격이 제한되거나 정지된 “회원” 및 제4항에 따라
											회원자격이 상실된 “비회원”이 구매신청한 경우</li>
										<li>4. 제20조를 위반한 “이용자”가 구매신청한 경우</li>
										<li>5. 기타 구매신청을 승낙하는 것이 “현대백화점 인터넷면세점” 기술상 현저히 지장이 있다고
											판단하는 경우</li>
									</ul>
								</li>
								<li>② “이용자”의 주문은 대금을 결제하는 시점부터 구매의 청약으로서 효력이 발생하며, 위 청약에
									대하여 “현대백화점 인터넷면세점”의 승낙의 의사표시가 제12조 제1항의 수신확인통지 형태로 이용자에게 도달한
									시점에 구매계약이 성립한 것으로 봅니다.</li>
								<li>③ 수신확인통지가 이용자에게 도달한 이후에도 이용자에게 다음 각 호의 위반행위가 있음이 발견되는
									경우에는, "현대백화점 인터넷면세점"은 수신확인통지가 이용자에게 도달한 이후 10일 이내에 재화의 인도 등 계약의
									이행을 즉시 보류하고 이용자에게 보류일부터 15일 이내에 이를 시정할 것을 요구할 수 있으며, 이 기간 내에
									합당한 소명 없이 시정되지 않을 경우 이행이 보류된 계약을 해제 또는 해지할 수 있습니다. 다만, 이용자의
									위반행위가 본 약관 제7조 제3항 제3호, 제6호 또는 제20조 제2항 제9호 중 어느 하나에 해당하는 경우에는
									최고 없이 계약을 해제 또는 해지할 수 있습니다.
									<ul class="int3">
										<li>1. 제7조 제3항 각 호</li>
										<li>2. 제20조 제1항 및 제2항 각 호</li>
									</ul>
								</li>
							</ul></li>
						<li><span id="terms12">제 12 조 (수신확인통지, 구매신청 변경 및 취소)</span>
							<ul class="int3">
								<li>1. “현대백화점 인터넷면세점”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.</li>
								<li>2. 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시
									구매신청 변경 및 취소를 요청할 수 있고 “현대백화점 인터넷면세점”은 배송 전에 이용자의 요청이 있는 경우에는
									지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제16조의 청약철회 등에 관한
									규정에 따릅니다.</li>
							</ul></li>
						<li><span id="terms13">제 13 조 (대금결제)</span>
							<p class="terms_txt">"현대백화점 인터넷면세점"에서 구매한 재화 또는 용역에 대한
								대금지급방법은 다음 각 호의 하나로 할 수 있습니다. 단, 이의 운영방식은 회사가 정한 바에 의하며, "현대백화점
								인터넷면세점"은 이용자의 지급 방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.</p>
							<ul class="int3">
								<li>1. 무통장입금 등 현금결제</li>
								<li>2. 신용카드 결제</li>
								<li>3. "현대백화점 인터넷면세점"과 제휴되어 있는 상품권 및 포인트</li>
								<li>4. 휴대폰 소액결제</li>
								<li>5. 적립금 및 포인트</li>
								<li>6. 기타 전자적 지급방식</li>
							</ul></li>
						<li><span id="terms14">제 14 조 (재화 등의 공급)</span>
							<ul class="int">
								<li>① "현대백화점 인터넷면세점"은 이용자가 구매한 재화에 대해 배송수단, 배송기간, 배송방법 등을
									명시합니다.</li>
								<li>② “현대백화점 인터넷면세점”은 면세점 상품 판매에 관한 관세법 기타 관련 국내 법령 및 규정에
									따라, 이용자가 구매한 재화를 이용자가 출국 시 이용하는 공항, 항 등에 소재한 출국장 인도장으로 운송하며,
									이용자는 출국일 당일, 출국 수속을 마친 후 위 출국장 내 소재한 현대백화점 면세점 인도장에서 본인의 여권과,
									탑승권을 제시하여 본인 확인을 마친 후 구매한 상품을 수령할 수 있습니다. 인도장 위치는 주문정보 및 각 출국장
									내부에 표시됩니다.</li>
								<li>③ 이용자가 구매한 재화를 출국예정일에 인도장에서 수령하지 아니한 경우, “현대백화점
									인터넷면세점”은 해당 재화를 10일간 보관합니다. 이 보관 기간이 지나도 이용자가 해당 재화를 수령하지 않는
									경우, “현대백화점 인터넷면세점”은 관련 법령에 따라 해당 재화를 세관에 신고하고 취소처리 할 수 있습니다.</li>
							</ul></li>
						<li><span id="terms15">제 15 조 (환급)</span>
							<ul class="int">
								<li>① “현대백화점 인터넷면세점"은 이용자가 구매 신청한 상품 품절 등의 사유로 인도할 수 없을 때에는
									지체 없이 그 사유를 이용자에게 통지하고, 사전에 상품의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에
									환급하거나 환급에 필요한 절차를 취합니다.</li>
								<li>② 교환•환불하고자 하는 상품의 총액이 관세법령상 면세한도*를 초과하는 경우 해외에서 직접 국제
									우편을 통해 교환•환불을 요청하거나, 입국 시 반드시 세관에 해당 상품을 신고 및 유치한 경우에만 교환•환불이
									가능합니다.
									<p>*면세한도는 홈페이지 내 쇼핑가이드를 참고하여 주시기 바랍니다.</p>
								</li>
							</ul></li>
						<li><span id="terms16">제 16 조 (청약철회 등)</span>
							<ul class="int">
								<li>① “현대백화점 인터넷면세점”과 재화 등의 구매에 관한 계약을 체결한 이용자는 상품수령일로부터
									15일 이내에 청약의 철회를 할 수 있습니다.</li>
								<li>② 이용자는 상품을 인도 받은 후, 다음 각호에 해당하는 경우에는 반품 또는 교환을 할 수
									없습니다.
									<ul class="int3">
										<li>1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우 (다만, 재화 등의 내용을
											확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)</li>
										<li>2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</li>
										<li>3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우</li>
										<li>4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우</li>
										<li>5. 기타 아래 제5 항의 반품 요건 및 절차를 위반한 경우</li>
									</ul>
								</li>
								<li>③ 제2항 제2호 내지 제4호의 경우에 “현대백화점 인터넷면세점”이 사전에 청약철회 등이 제한되는
									사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회
									등이 제한되지 않습니다.</li>
								<li>④ 교환•환불하고자 하는 상품의 총액이 면세한도를 초과하는 경우에는, 해외에서 직접 국제 우편
									발송으로 세관유치 후 (발송 시 송장에 면세점 교환/환불 표시) 교환•환불을 요청하거나 휴대하여 입국 시 반드시
									세관에 해당 상품을 신고 및 유치한 경우에만 교환•환불이 가능하며, 교환된 면세상품은 출국 시 출국장 내
									인도장에서 인도받을 수 있습니다.</li>
								<li>⑤ 제1항과 2항에도 불구하고, 다음 각호의 경우에는 상품수령일로부터 3개월, 그 사실을 안 날
									또는 알 수 있었던 날로부터 30일 이내에 구매를 취소할 수 있습니다.
									<ul>
										<li>1. 인도/배송된 상품이 주문내용과 상이하거나, “현대백화점 인터넷면세점”이 표시•광고한 내용
											또는 제공한 정보와 상이할 경우</li>
										<li>2. 인도/배송된 상품이 불량(파손, 손상, 오염 등) 인 경우</li>
										<li>3. 상품이 출국일에 구매자에게 인도되지 못했을 경우(이 경우에는 취소기간 제한이 없음)</li>
										<li>4. 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조에 의하여 광고에 표시하여야 할
											사항을 표시하지 아니한 상태에서 이용자의 청약이 이루어진 경우</li>
									</ul>
								</li>
							</ul></li>
						<li><span id="terms17">제 17 조 (청약철회 등의 효과)</span>
							<ul class="int">
								<li>① “현대백화점 인터넷면세점”은 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미
									지급받은 재화 등의 대금을 환급합니다.</li>
								<li>② “현대백화점 인터넷면세점”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의
									결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 해당 대금의 청구를
									정지 또는 취소하도록 요청합니다.</li>
								<li>③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. 다만 재화
									등의 내용이 표시•광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에
									필요한 비용은 “현대백화점 인터넷면세점”이 부담합니다. 그 외에 “현대백화점 인터넷면세점”은 이용자에게 청약철회
									등의 이유로 위약금 또는 손해배상을 청구하지 않습니다.</li>
								<li>④ 이용자가 재화 등을 제공 받을 때 발송비를 부담한 경우에 “현대백화점 인터넷면세점”은 청약철회
									시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.</li>
							</ul></li>
						<li><span id="terms18">제 18 조 (개인정보보호) </span>
							<ul class="int">
								<li>① “현대백화점 인터넷면세점”은 이용자의 정보수집 시 구매계약 이행에 필요한 최소한의 정보를
									수집합니다.</li>
								<li>② “현대백화점 인터넷면세점”이 이용자의 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를
									받습니다.</li>
								<li>③ “현대백화점 인터넷면세점”은 수집된 개인정보를 목적 외의 용도로 이용할 수 없으며, 새로운
									이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용, 제공 단계에서 당해 이용자에게 그 목적을 고지하고
									동의를 받습니다. 다만 관련 법령에 별도로 정한 바가 있는 경우에는 그에 따르며, 다음 각호의 하나에 해당하는
									경우에는 예외로 합니다.
									<ul class="int3">
										<li>1. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를
											알려주는 경우</li>
										<li>2. 통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정 개인을 식별할 수 없는
											형태로 제공하는 경우</li>
										<li>3. 재화 등의 거래에 따른 대금정산을 위하여 필요한 경우</li>
										<li>4. 도용방지를 위하여 본인확인에 필요한 경우</li>
										<li>5. 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우</li>
									</ul>
								</li>
								<li>④ "현대백화점 인터넷면세점" 이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는
									개인정보의 수집 및 이용목적, 수집하는 개인정보 항목, 개인정보의 보유∙이용 기간, 제3자에 대한 정보제공
									관련사항(제공 받는 자, 제공목적 및 제공할 정보의 내용)등 「정보통신망 이용촉진 및 정보보호 등에 관한
									법률」에서 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.</li>
								<li>⑤ 이용자는 언제든지 "현대백화점 인터넷면세점"이 가지고 있는 자신의 개인정보에 대해 열람 및
									오류정정을 요구할 수 있으며 "현대백화점 인터넷면세점"은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다.
									이용자가 오류의 정정을 요구한 경우에는 "현대백화점 인터넷면세점"은 그 오류를 정정할 때까지 당해 개인정보를
									이용하지 않습니다.</li>
								<li>⑥ "현대백화점 인터넷면세점"은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 한정하여
									그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한
									이용자의 손해에 대하여 모든 책임을 집니다.</li>
								<li>⑦ "현대백화점 인터넷면세점" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는
									제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.</li>
								<li>⑧ "현대백화점 인터넷면세점"은 회원가입 시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다.
									다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는
									경우에는 그러하지 아니합니다.</li>
								<li>⑨ "현대백화점 인터넷면세점"은 개인정보의 수집, 이용 제공에 관한 동의란을 미리 선택한 것으로
									설정해 두지 않습니다. 또한 개인정보의 수집 이용 제공에 관한 이용자의 동의거절 시 제한되는 서비스를 구체적으로
									명시하고, 필수수집항목이 아닌 개인정보의 수집 이용 제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스
									제공을 제한하거나 거절하지 않습니다.</li>
								<li>⑩ “현대백화점 인터넷면세점”은「정보통신망 이용촉진 및 정보보호 등에 관한 법률」제29조 및 동법
									시행령 제16조에 따라 일정 기간 로그인 이력이 없는 경우 해당 회원의 계정을 휴면회원으로 분류하여 다른 이용자의
									개인정보와 분리∙보관하며, 휴면회원으로 분류되는 기간(로그인 이력이 없는 기간)은 이용자의 선택에 따라 최근
									1년/3년/5년 또는 회원탈퇴시로 구분됩니다. 휴면회원의 개인정보 및 서비스 이용정보는 다른 법률에 특별한 규정이
									있는 경우를 제외하고는 이용하거나 제3자에게 제공하지 아니하고, 휴면회원 계정은 해당 회원의 요청에 의거 정상
									이용 계정으로 활성화 조치 가능합니다.</li>
								<li>⑪ 기타 개인정보의 수집, 이용, 제공, 보호와 관련된 보다 자세한 사항은 “현대백화점 인터넷면세점
									개인정보 취급방침”에 정한 바에 따릅니다.</li>
							</ul></li>
						<li><span id="terms19">제 19 조 (현대백화점 인터넷면세점의 의무) </span>
							<ul class="int">
								<li>① "현대백화점 인터넷면세점"은 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며
									본 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화•용역을 제공하는 데 최선을 다하여야 합니다.</li>
								<li>② "현대백화점 인터넷면세점"은 회원 기타 이용자가 안전하게 서비스를 이용할 수 있도록 항상
									이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 적절히 유지•관리합니다.</li>
								<li>③ "현대백화점 인터넷면세점"은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지
									않습니다.</li>
								<li>④ 서비스 이용시간 및 중단
									<ul class="int3">
										<li>1. 서비스의 이용은 회사가 업무상 또는 기술상 특별한 경우를 제외하고는 연중무휴 1일
											24시간동안 제공하는 것을 말합니다.</li>
										<li>2. 회사는 다음 각 호에 해당하는 경우 서비스 제공을 전부 또는 일부 중지할 수 있습니다.
											서비스의 제공이 중지되는 경우 회사는 사전 또는 사후에 공지해야 합니다.
											<ul class="int">
												<li>가) 서비스용 설비의 정기점검, 교체 보수 등 공사로 인한 부득이한 경우</li>
												<li>나) 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우</li>
												<li>다) 설비 장애 또는 이용 폭주 등으로 서비스 이용에 지장이 있는 경우</li>
												<li>라) 기타 불가항력적 사유가 있는 경우</li>
											</ul>
										</li>
									</ul>
								</li>
							</ul></li>
						<li><span id="terms20">제 20 조 (이용자의 책임과 의무)</span>
							<ul class="int">
								<li>① 회원은 ID와 비밀번호 등에 관하여 다음과 같은 책임을 집니다.
									<ul class="int3">
										<li>1. 회원은 자신의 ID와 비밀번호에 관한 관리책임을 지며, 이를 제3자에게 이용하게 해서는
											안됩니다.</li>
										<li>2. 회원이 자신의 ID 또는 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는
											바로 “현대백화점 인터넷면세점”에 통보하고 “현대백화점 인터넷면세점”의 안내가 있는 경우에는 그에 따라야
											합니다.</li>
										<li>3. 비회원으로 구매하는 이용자의 경우에도 이름, 여권번호, 전화번호 등 개인정보의 관리 책임에
											관하여 제1, 2항에 준합니다.</li>
										<li>4. 회원의 ID 또는 비밀번호 유출 시 “현대백화점 인터넷면세점”에게 귀책사유가 없는 경우
											해당 거래에 대한 책임을 지지 않습니다.</li>
									</ul>
								</li>
								<li>② 이용자는 다음의 행위를 하여서는 안됩니다.
									<ul class="int3">
										<li>1. 신청 또는 변경 시 허위내용의 등록</li>
										<li>2. 타인의 정보 도용</li>
										<li>3. "현대백화점 인터넷면세점"에 게시된 정보의 변경</li>
										<li>4. "현대백화점 인터넷면세점"에 게시된 정보의 변경</li>
										<li>5. "현대백화점 인터넷면세점" 또는 제3자의 저작권 등 지적재산권에 대한 침해</li>
										<li>6. "현대백화점 인터넷면세점"의 허락 없이 광고 또는 영업을 하는 행위</li>
										<li>7. "현대백화점 인터넷면세점" 또는 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
										<li>8. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "현대백화점
											인터넷면세점"에 공개 또는 게시하는 행위</li>
										<li>9. 이용자가 미성년자인 경우, 담배 또는 주류 등 청소년보호법에서 금지하는 상품을 구매하는
											행위</li>
										<li>10. 기타 객관적으로 위법, 부당, 또는 부적절하다고 판단되는 행위</li>
									</ul>
								</li>
							</ul></li>
						<li><span id="terms21">제 21 조 (현대백화점 인터넷면세점 면책)</span>
							<ul class="int3">
								<li>① "현대백화점 인터넷면세점"은 상품 또는 서비스를 구매하고자 하는 이용자를 대리할 권한을 갖고
									있지 않으며, "현대백화점 인터넷면세점"의 어떠한 행위도 이용자의 대리행위로 간주되지 않습니다.</li>
								<li>② "현대백화점 인터넷면세점"은 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수
									없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.</li>
							</ul></li>
						<li><span id="terms22">제 22 조 (연결 “현대백화점 인터넷면세점”과 피연결
								“현대백화점 인터넷면세점” 간의 관계)</span>
							<ul class="int3">
								<li>① 상위 “현대백화점 인터넷면세점”과 하위 “현대백화점 인터넷면세점”이 하이퍼링크 방식 등으로
									연결된 경우, 전자를 연결 “현대백화점 인터넷면세점” 이라고 하고, 후자를 피연결 “현대백화점 인터넷면세점”
									이라고 합니다.</li>
								<li>② 연결 “현대백화점 인터넷면세점”은 피연결 “현대백화점 인터넷면세점”이 독자적으로 제공하는 재화
									등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결 “현대백화점 인터넷면세점”의 초기
									화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.</li>
							</ul></li>
						<li><span id="terms23">제 23조 (저작권의 귀속 및 이용제한)</span>
							<ul class="int3">
								<li>① "현대백화점 인터넷면세점"이 작성한 일체의 저작물(광고, 사진, 이미지, 텍스트를 포함하되 이에
									한정되지 않음)에 대한 저작권 기타 지적재산권은 "현대백화점 인터넷면세점"에 귀속합니다.</li>
								<li>② 이용자는 "현대백화점 인터넷면세점"을 이용함으로써 얻은 정보 중 "현대백화점 인터넷면세점"에게
									지적재산권이 귀속된 정보를 "현대백화점 인터넷면세점"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타
									방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</li>
								<li>③ "현대백화점 인터넷면세점" 은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해
									이용자에게 통보하여야 합니다.</li>
							</ul></li>
						<li><span id="terms24">제 24 조 (분쟁해결) </span>
							<ul class="int3">
								<li>① “현대백화점 인터넷면세점”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를
									보상처리하기 위하여 피해보상처리기구(고객센터)를 설치․운영합니다.</li>
								<li>② “현대백화점 인터넷면세점”은 이용자로부터 제출되는 불만사항 및 의견을 신속하게 처리합니다.
									다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보합니다.</li>
								<li>③ “현대백화점 인터넷면세점”과 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이
									있는 경우에는 공정거래위원회 또는 시•도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</li>
							</ul></li>
						<li><span id="terms25">제 25 조 (재판권 및 준거법)</span>
							<ul class="int3">
								<li>① “현대백화점 인터넷면세점”과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의
									이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시
									이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.</li>
								<li>② "현대백화점 인터넷면세점"과 이용자간에 제기된 전자거래 관련 소송 등 분쟁해결에는 대한민국 법을
									적용합니다.</li>
							</ul></li>
						<li><span>부칙<br> 제1조 (2022.3.25)<br> 이 약관은
								2022년 3월 25일부터 시행합니다.
						</span></li>
					</ul>
					<p>&nbsp;</p>
				</div>
				<input type="hidden" name="mbshJoinTcndCds" value="002"> <input
					type="hidden" name="mbshJoinTcndVerNos" value="1.7"> <input
					type="hidden" name="joinNtnlCds" value="KR">
				<p class="step_agree">
					<span class="checkbox round"> <input type="checkbox"
						name="agrYns" id="agree2" value="Y"> <label for="agree2"
						value="개인정보동의"> 개인정보동의<span> (필수)</span>
					</label>
					</span>
				</p>
				<div class="step_agree_box">
					<div class="terms_area">
						<p class="top_txt">㈜현대백화점면세점(이하 “회사”)은 최초 회원 가입 또는 서비스 이용 시
							이용자로부터 아래와 같은 개인정보를 수집하고 있습니다.</p>
						<table class="tb_list02 type7">
							<caption>수집항목, 수집/이용목적, 보유 및 이용기간 표입니다.</caption>
							<colgroup>
								<col style="width: 25%">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">수집항목</th>
									<td>
										<ul class="sub_dot int">
											<li>1) 일반회원<br> ① 회원가입을 위해 필요한 정보<br>
												<p class="p_dot_list">ID, 성명(국문/영문), 이메일, 비밀번호, 휴대전화번호,
													생년월일, 국적, 성별</p> ② 서비스 이용을 위해 필요한 정보쿠키 정보, 로그 데이터, 출국정보(출국일,
												출발지 및 도착지, 편명, 직항/경유여부 등), 결제정보(결제카드번호, 매입카드사명, 유효기간년월,
												할부개월수, 승인일자), 여권유효기간<br> ③ 환불 신청을 위해 필요한 정보<br>
												<p class="p_dot_list">환불계좌정보(환불신청시)</p> ④ Point 통합을 위해 필요한
												정보<br>
												<p class="p_dot_list">H. point 통합회원의 경우 본인확인값(CI)</p>
											</li>
											<li>2) 외국인회원<br> ① 회원가입을 위해 필요한 정보<br>
												<p class="p_dot_list">ID, 성명(영문 포함), 이메일, 비밀번호, 휴대전화번호,
													생년월일, 국적, 성별</p> ② 서비스 이용을 위해 필요한 정보<br>
												<p class="p_dot_list">쿠키 정보, 로그 데이터, 출국정보(출국일, 출발지 및
													도착지, 편명, 직항/경유여부 등), 결제정보(결제카드번호, 매입카드사명, 유효기간년월, 할부개월수,
													승인일자), 여권유효기간</p> ③ 환불 신청을 위해 필요한 정보<br>
												<p class="p_dot_list">환불계좌정보(환불신청시)</p>
											</li>
											<li>3) 비회원<br> ① 본인 확인을 위해 필요한 정보<br>
												<p class="p_dot_list">성명(영문 포함), 이메일, 비밀번호, 휴대전화번호,
													생년월일, 국적, 성별, 여권유효기간</p> ② 서비스 이용을 위해 필요한 정보<br>
												<p class="p_dot_list">쿠키 정보, 로그 데이터, 출국정보(출국일, 출발지 및
													도착지, 편명, 직항/경유여부 등), 결제정보(결제카드번호, 매입카드사명, 유효기간년월, 할부개월수,
													승인일자), 여권유효기간</p> ③ 환불 신청을 위해 필요한 정보<br>
												<p class="p_dot_list">환불계좌정보(환불신청시)</p>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row">수집/이용목적</th>
									<td>
										<ul class="sub_dot">
											<li>① 회원관리 및 회원제 서비스 이용에 따른 본인 확인<br>
												<p class="p_dot_list">회원제 서비스 이용에 따른 본인 확인</p>
												<p class="p_dot_list">부정이용 방지와 비인가 사용 방지</p>
												<p class="p_dot_list">고객상담, 고객불만 접수 및 처리, 분쟁조정을 위한 기록보존</p>
												<p class="p_dot_list">고지사항 전달</p>
												<p class="p_dot_list">연령확인</p>
											</li>
											<li class="mgtxs">② 서비스 제공에 관한 계약이행<br>
												<p class="p_dot_list">서비스 및 부가 서비스 이용에 대한 요금 결제</p>
												<p class="p_dot_list">콘텐츠 제공, 이벤트/경품당첨 결과안내 및 상품배송</p>
												<p class="p_dot_list">본인인증 및 금융서비스</p>
												<p class="p_dot_list">구매, 요금결제, 환불, 상품인도</p>
												<p class="p_dot_list">적립금 및 할인혜택 제공</p>
												<p class="p_dot_list">정보관리 의무 준수</p>
											</li>
											<li class="mgtxs">③ 서비스 제공
												<p class="p_dot_list">회원 참여공간 운영</p>
												<p class="p_dot_list">이벤트 참여, 경품당첨 결과안내 및 상품배송</p>
												<p class="p_dot_list">통계처리 및 분석을 위한 기초자료 활용</p>
											</li>
											<li class="mgtxs">④ H. point 통합회원 관리<br>
												<p class="p_dot_list">CI를 통한 H. point 통합회원의 본인 확인</p>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row">보유 및 이용기간</th>
									<td>
										<ul class="sub_dot">
											<li>1) 일반회원, 외국인회원<br>
												<p class="p_dot_list">
													<strong class="f_size01_xs">회원탈퇴시 또는 개인정보 수집 및
														이용목적 달성시까지</strong>
												</p>
												<p class="p_dot_list">
													<strong class="f_size01_xs">단, 법령에 따라 일정기간 보유하여야
														하는 경우 해당 기간까지</strong>
												</p>
											</li>
											<li class="mgtxs">2) 비회원<br>
												<p class="p_dot_list">
													<strong class="f_size01_xs">상품인도 후 3년</strong>
												</p>
												<p class="p_dot_list">
													<strong class="f_size01_xs">단, 법령에 따라 일정기간 보유하여야
														하는 경우 해당 기간까지</strong>
												</p>
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
						<p class="t_int">※ 고객은 개인정보 수집 ∙ 이용 동의를 거부할 권리가 있습니다. 단, 동의 거부
							시 회원가입이 불가능하며 현대백화점 인터넷면세점에서 제공하는 회원 서비스를 이용할 수 없습니다.</p>
					</div>
				</div>
				<div class="basic_btn_box mgtml">
					<button type="button" class="btn_basic1"
						onclick="javascript:history.back(-1);">이전</button>
					<button type="button" class="btn_basic2" id="btnNext">다음</button>
				</div>
			</form>
		</div>
	</section>
</div>
</main>


<%@ include file="../common/Footer.jsp"%>