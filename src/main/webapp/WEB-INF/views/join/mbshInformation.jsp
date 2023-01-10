<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main id="container" class="container"> <script
	src="https://cdn.hddfs.com/front/js/KO/serializeObjects.js"></script> <script
	src="https://cdn.hddfs.com/front/js/KO/joinInformation.js?ver=18"></script>
<script type="text/javascript">
	document.msCapsLockWarningOff = true; // ie caps lock 체크 툴팁해제
	var gMbshId = '';
	var gAucaType = 'sms';
	var lang = 'KR';
	var foreignerYn = 'N';
	var SERVER_IMAGE = 'https://cdn.hddfs.com/front';
	var dblFlag = false;

	$(function() {
		// 다음버튼
		$('#btnNext')
				.click(
						function() {

							if (dblFlag) {
								return;
							}

							// 내외국인별 validation
							var validationGb = (foreignerYn == 'N' ? 'LOCAL'
									: 'FOREIGNER');
							if (!validationDataCommon(validationGb)) {
								return;
							}

							// 마케팅 정보 수신 동의 여부 저장
							$('#mrktYn').val(
									$('#agrYn').prop('checked') ? 'Y' : '');

							// 필드활성화 처리
							if (gAucaType == 'email') { // 이메일
								$('#mailAddr1, #mailAddr2').prop('disabled',
										false);
							} else { // SMS
								$(
										'#telNatiCd, #mophNo, #mophNo1, #mophNo2, #mophNo3')
										.prop('disabled', false);
							}

							// 재가입case : 아이디 활성화
							if (gMbshId != '') {
								$('#mbshId').prop('disabled', false);
							}

							// 메일세팅

							var mbshAgrChk = '';
							if (mbshAgrChk == null || mbshAgrChk == '') {
								//alert("jsp_메일세팅");
								//alert($('#mailAddr1').val());

								if ($('#mailAddr1').val() == '') {
									$('.t_error', '#divMailAddr').show().text(
											'이메일주소를 입력해주세요.'); // 이메일주소를 입력해주세요.
									$('#mailAddr1').focus();
									return;
								}

								//$('#mailAddr').val($('#mailAddr1').val() + '@'+ $('#mailAddr2').val());	
							}

							// 82 휴대폰번호세팅
							if (foreignerYn == 'N'
									|| $("#telNatiCd").val() == '82') {
								//$('#telNatiCdKor').val('82');
								//$('#mophNo').val($('#mophNo1').val() + $('#mophNo2').val() + $('#mophNo3').val());
								$('#mophNo').val($('#mophNo').val());
							} else {
								$('#mophNo').val($('#mophNo').val());
							}

							if ($('#psptNo').val() != ''
									&& $('#psptNo').val() != undefined) {
								var natiCd = $('#natiCd').val();
								if (lang == 'KR' && foreignerYn == 'N') {
									natiCd = 'KOR';
								}

								if (!validationDataForPassport(natiCd)) {
									if (!confirm($('#psptNo').val() + " "
											+ $.lang[lang][51]))
										return; // 입력하신 여권번호 $('#psptNo').val()를 저장하시겠습니까?
								}
							}

							//$('#mbshBymdDt').val($('#mbshBymdDt').val());

							//  회원가입직전 검증용 세션 처리e
							dblFlag = true;
							$
									.ajax({
										async : false,
										url : ctx_curr
												+ "/mm/mbshJoin/mbshJoinValidation.json",
										method : "POST",
										//type          : "POST",
										data : JSON.stringify($(
												'#frmMbshInformation')
												.serializeObjects()),
										//data: {mophNo : $('#mophNo').val(), mbshHnglNm : $('#mbshHnglNm').val() , mbshBymdDt : $('#mbshBymdDt').val(), sexCd : $('#sexCd').val(), mailAddr : $('#mailAddr').val() },
										//data: JSON.stringify($('#frmMbshInformation').serializeObjects(),{mophNo : $('#mophNo').val(), mbshHnglNm : $('#mbshHnglNm').val() , mbshBymdDt : $('#mbshBymdDt').val(), sexCd : $('#sexCd').val(), mailAddr : $('#mailAddr').val() }),
										contentType : 'application/json',
										dataType : "json",
										success : function(data, textStatus,
												jqXHR) {

											if (!crew.ajaxValidate(data)) {
												return;
											}
											$
													.ajax({
														async : false,
														url : ctx_curr
																+ '/mm/mbshJoin/addMbshInformation.json',
														method : "post",
														//type  : "POST",
														data : JSON
																.stringify($(
																		'#frmMbshInformation')
																		.serializeObjects()),
														//data: {mophNo : $('#mophNo').val(), mbshHnglNm : $('#mbshHnglNm').val() , mbshBymdDt : $('#mbshBymdDt').val(), sexCd : $('#sexCd').val(), mailAddr : $('#mailAddr').val() },
														//data: JSON.stringify($('#frmMbshInformation').serializeObjects(),{mophNo : $('#mophNo').val(), mbshHnglNm : $('#mbshHnglNm').val() , mbshBymdDt : $('#mbshBymdDt').val(), sexCd : $('#sexCd').val(), mailAddr : $('#mailAddr').val() }),
														contentType : 'application/json',
														dataType : 'json',
														success : function(
																data,
																textStatus,
																jqXHR) {
															var vResultCode = data.resultCode;
															var vMessage = data.message;
															var vInfo = data.info;

															if (crew
																	.ajaxValidate(
																			data,
																			false)) {
																// 마케팅 정보 수신 동의 여부 변경 알림
																var vMktMsg = '';
																vMktMsg = fnMktRcvMsg(vMktMsg);
																if (vMktMsg != '') {
																	alert(vMktMsg);
																}

																// 회원가입완료페이지 이동
																goCompletePage(vInfo);
															} else {
																if (vResultCode == 10) {
																	alert(vMessage);
																} else if (vResultCode == 20) {
																	alert($.lang[lang][42]); // 입력하신 이메일정보와 오프라인 가입정보(이름, 생년월일, 휴대폰번호)가 일치하지 않습니다.
																} else if (vResultCode == 30) {
																	alert($.lang[lang][50]); // 이미 가입된 휴대폰번호입니다.
																} else {
																	alert($.lang[lang][99]); // 처리중 오류가 발생하였습니다.
																}
															}
														},
														error : function(jqXHR,
																textStatus,
																errorThrown) {
															alert($.lang[lang][99]); // 처리중 오류가 발생하였습니다.
														}
													});
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											alert($.lang[lang][99]); // 처리중 오류가 발생하였습니다.
										},
										complete : function() {
											setTimeout(function() {
												dblFlag = false;
											}, 2000);
										}
									});

							// 인증별 필드 비활성화 처리
							if (gAucaType == 'email') { // 이메일
								$('#mailAddr1, #mailAddr2').prop('disabled',
										true);
							} else { // SMS
								$(
										'#telNatiCd, #mophNo, #mophNo1, #mophNo2, #mophNo3')
										.prop('disabled', true);
							}

							// 재가입케이스 : 비활성화처리
							if (gMbshId != '') {
								$('#mbshId').prop('disabled', true);
							}
						});

		fnInit();

		$(".expiration_day input[type=radio]").click(
				function() {
					var pre = $(this).data("previous");
					var chk = $(this).is(":checked");
					var id = $(this).attr('id');

					if (chk == true && pre == $(this).val()) {
						$(this).prop('checked', false);
						$("input[id='" + id + "']").data("previous", '');
					} else {
						if (chk == true) {
							$(".expiration_day input[type=radio]").data(
									"previous", '');
							$("input[id='" + id + "']").data("previous",
									$(this).val());
						}
					}
				});
	});

	// 가입완료페이지 이동
	function goCompletePage(data) {
		var $form = $('<form></form>');
		$form.attr('action', ctx_curr + '/mm/mbshJoin/joinComplete.do');
		$form.attr('method', 'post');
		$form.append('<input type="hidden" value="KR" name="lang">');
		$form.append('<input type="hidden" value="' + data.id + '" name="id">');
		$form
				.append('<input type="hidden" value="' + data.name + '" name="name">');
		$form.append('<input type="hidden" value="' + $("#ohvalue").val()
				+ '" name="ohvalue">');
		$form
				.append('<input type="hidden" value="' + data.newMbshNo + '" name="newMbshNo">');
		$form.append('<input type="hidden" value="N" name="offMbshYn">');
		$form
				.append('<input type="hidden" value="' + data.natiCd + '" name="natiCd">');
		$form.appendTo('body');
		$form.submit();
	}

	// 초기화
	function fnInit() {
		if (gMbshId != '') {
			$('#btnMulChk').hide(); // 중복검색 숨김
			$('#chkExistId').val('Y'); // 중복체크 완료
			$('#mbshId').prop('disabled', true); // ID 입력방지
		}
	}
</script>
<div class="container">
	<section>
		<div class="join_wrap ">
			<form id="frmMbshInformation" name="frmMbshInformation" method="post"
				action="//www.hddfs.com/shop/mm/mbshJoin/joinComplete.do">
				<input type="hidden" id="chkExistId" name="chkExistId" value="" />
				<input type="hidden" id="chkExistEmail" name="chkExistEmail"
					value="" /> <input type="hidden" id="ohvalue" name="ohvalue"
					value="" /> <input type="hidden" name="lang" value="KR" /> <input
					type="hidden" name="foreignerYn" value="N" /> <input type="hidden"
					name="sexCd" value="" /> <input type="hidden" name="mbshHnglNm"
					value=""><input type="hidden" name="mbshHnglNm1" value=""><input
					type="hidden" name="mbshHnglNm2" value=""><input
					type="hidden" name="mbshBymdDt" value=""><input
					type="hidden" name="mophNo" value="01049003839"><input
					type="hidden" name="mbshJoinTcndCds[]" value="001" /> <input
					type="hidden" name="mbshJoinTcndCds[]" value="002" /> <input
					type="hidden" name="mbshJoinTcndVerNos[]" value="2.1" /> <input
					type="hidden" name="mbshJoinTcndVerNos[]" value="1.7" /> <input
					type="hidden" name="joinNtnlCds[]" value="KR" /> <input
					type="hidden" name="joinNtnlCds[]" value="KR" /> <input
					type="hidden" name="agrYns[]" value="Y" /> <input type="hidden"
					name="agrYns[]" value="Y" />
				<h2 class="h2_type">회원가입(내국인)</h2>

				<div class="join_step">
					<ol>
						<li class="ico_memb step01 pass">STEP 01<em>약관동의</em></li>
						<li class="ico_memb step02 pass">STEP 02<em>본인인증</em></li>
						<li class="ico_memb step03 active">STEP 03<em>정보입력</em></li>
						<li class="ico_memb step04">STEP 04<em>가입완료</em></li>
					</ol>
				</div>

				<h3 class="h4_type mgtl">
					회원정보 입력<span class="small_txt">(필수)</span>
				</h3>
				<p class="f_size01">회원가입을 위한 필수입력 정보입니다.</p>
				<div class="join_form">

					<div class="join_row with_btn placeholder_wrap" id="divId">
						<input type="text" id="mbshId" name="mbshMst[mbshId]" value=""
							maxlength="20" class="engNumber" onfocusout="checkDupId();"><label
							for="mbshId">아이디<span>(4~20자의 영문 대소문자, 숫자만 사용)</span></label>
						<p class="t_error" style="display: none;"></p>
					</div>

					<div class="join_row placeholder_wrap" id="divPwd">
						<input type="password" id="mbshPwd" name="mbshMst[mbshPwd]"
							maxlength="20" onkeypress="javascript:noSpaceEvnt(event);"><label
							for="mbshPwd">비밀번호<span>(8~20자 이내 영문자, 숫자, 특수문자
								3가지 조합)</span></label>
						<p class="t_error" style="display: none;"></p>
					</div>

					<div class="join_row placeholder_wrap" id="divRePwd">
						<input type="password" id="reMbshPwd" name="reMbshPwd"
							maxlength="20" onkeypress="javascript:noSpaceEvnt(event);">
						<label for="reMbshPwd"> 비밀번호 확인<span>(비밀번호와 동일하게
								입력)</span></label>
						<p class="t_error" style="display: none;"></p>
					</div>

					<div class="join_row" id="divMbshHnglNm">
						<input type="text" id="mbshHnglNm" name="mbshBase[mbshHnglNm]"
							value="" placeholder="성명" maxlength="50"
							style="text-transform: uppercase;"
							onkeypress="javascript:noSpaceEvnt(event);" disabled> <input
							type="hidden" name="mbshBase[mbshHnglNm]" value="">
						<p class="t_error" style="display: none;"></p>
					</div>
					<div class="join_row blocks_tb select">
						<div class="join_row" id="divSexCd">
							<select name="mbshBase[sexCd]" class="sel_type" id="sexCd">
								<option value="">성별</option>
								<option value="1">남</option>
								<option value="2">여</option>
							</select>
							<p class="t_error" style="display: none;"></p>
						</div>
					</div>
					<input type="hidden" name="mbshBase[natiCd]" value="KOR" />
					<div class="join_row">
						<input type="text" id="mbshBymdDt1" class="noHasDatepicker"
							name="mbshBase[mbshBymdDt]" value=""
							placeholder="생년월일(YYYY-MM-DD)" class="datepicker" maxlength="10"
							disabled="disabled"> <input type="hidden" id="mbshBymdDt"
							name="mbshBase[mbshBymdDt]" value="">
						<p class="t_error" style="display: none;"></p>
					</div>

					<!--2020.10.30.삭제함 <input type="hidden" id="telNatiCdKor" name="mbshBase[telNatiCd]" value=""> -->
					<!-- 2020.10.28 기가입자정보가져오려고 잠시삭제 <input type="hidden" id="mailAddr" name="mbshBase[mailAddr]" value=""> -->
					<div class="join_row blocks2 type2" id="divMophNo">
						<div class="join_col w08 select">
							<select name="mbshBase[telNatiCd]" class="sel_type"
								id="telNatiCd1" disabled="enabled">
								<option value="82" selected="selected">한국 (+82)</option>
								<option value="86">중국 (+86)</option>
								<option value="886">대만 (+886)</option>
								<option value="65">싱가포르 (+65)</option>
								<option value="84">베트남 (+84)</option>
								<option value="852">홍콩 (+852)</option>
								<option value="81">일본 (+81)</option>
								<option value="61">호주 (+61)</option>
								<option value="66">태국 (+66)</option>
								<option value="64">뉴질랜드 (+64)</option>
								<option value="1">미국/캐나다 (+1)</option>
								<option value="63">필리핀 (+63)</option>
								<option value="233">가나 (+233)</option>
								<option value="241">가봉 (+241)</option>
								<option value="592">가이아나 (+592)</option>
								<option value="220">감비아 (+220)</option>
								<option value="590">과델로프 (+590)</option>
								<option value="502">과테말라 (+502)</option>
								<option value="1671">괌 (+1671)</option>
								<option value="379">교황청 (+379)</option>
								<option value="1473">그레나다 (+1473)</option>
								<option value="995">그루지아 (+995)</option>
								<option value="30">그리스 (+30)</option>
								<option value="299">그린랜드 (+299)</option>
								<option value="245">기네비소 (+245)</option>
								<option value="224">기니 (+224)</option>
								<option value="264">나미비아 (+264)</option>
								<option value="234">나이지리아 (+234)</option>
								<option value="27">남아프리카 (+27)</option>
								<option value="31">네덜란드 (+31)</option>
								<option value="599">네덜란드 열도 (+599)</option>
								<option value="977">네팔 (+977)</option>
								<option value="47">노르웨이 (+47)</option>
								<option value="687">뉴 칼레도니아 (+687)</option>
								<option value="227">니제르 (+227)</option>
								<option value="505">니카라과 (+505)</option>
								<option value="45">덴마크 (+45)</option>
								<option value="1767">도미니카 (+1767)</option>
								<option value="1809">도미니카 공화국 (+1809)</option>
								<option value="49">독일 (+49)</option>
								<option value="856">라오스 (+856)</option>
								<option value="231">라이베리아 (+231)</option>
								<option value="371">라트비아 (+371)</option>
								<option value="7">러시아/카자흐 (+7)</option>
								<option value="961">레바논 (+961)</option>
								<option value="266">레소토 (+266)</option>
								<option value="40">루마니아 (+40)</option>
								<option value="250">루안다 (+250)</option>
								<option value="352">룩셈부르그 (+352)</option>
								<option value="218">리비아 (+218)</option>
								<option value="370">리투아니아 (+370)</option>
								<option value="423">리히텐슈타인 (+423)</option>
								<option value="261">마다카스카르 (+261)</option>
								<option value="692">마샬군도 (+692)</option>
								<option value="389">마세도니아 (+389)</option>
								<option value="691">마이크로네시아 (+691)</option>
								<option value="853">마카오 (+853)</option>
								<option value="596">마티니크 (+596)</option>
								<option value="265">말라위 (+265)</option>
								<option value="60">말레이지아 (+60)</option>
								<option value="223">말리 (+223)</option>
								<option value="269">코모로스/메요트 (+269)</option>
								<option value="52">멕시코 (+52)</option>
								<option value="377">모나코 (+377)</option>
								<option value="212">모로코/서사하라 (+212)</option>
								<option value="230">모리셔스 (+230)</option>
								<option value="258">모잠비크 (+258)</option>
								<option value="1664">몬트세라트 (+1664)</option>
								<option value="373">몰도바 (+373)</option>
								<option value="960">몰디브 (+960)</option>
								<option value="356">몰타 (+356)</option>
								<option value="976">몽골 (+976)</option>
								<option value="1284">미령 버진군도 (+1284)</option>
								<option value="95">미얀마 (+95)</option>
								<option value="678">바누아투 (+678)</option>
								<option value="973">바레인 (+973)</option>
								<option value="1246">바베이도스 (+1246)</option>
								<option value="880">방글라데시 (+880)</option>
								<option value="1441">버뮤다 (+1441)</option>
								<option value="58">베네주엘라 (+58)</option>
								<option value="229">베닝 (+229)</option>
								<option value="375">베라루스 (+375)</option>
								<option value="32">벨기에 (+32)</option>
								<option value="501">벨리제 (+501)</option>
								<option value="387">보스니아-헤르체고비나 (+387)</option>
								<option value="267">보츠와나 (+267)</option>
								<option value="591">볼리비아 (+591)</option>
								<option value="257">부룬디 (+257)</option>
								<option value="226">부르키나 파소 (+226)</option>
								<option value="975">부탄 (+975)</option>
								<option value="850">북한 (+850)</option>
								<option value="359">불가리아 (+359)</option>
								<option value="594">불령 가이아나 (+594)</option>
								<option value="262">불령 리유니온,코모도 제도 (+262)</option>
								<option value="689">불령 폴리네시아 (+689)</option>
								<option value="55">브라질 (+55)</option>
								<option value="673">브루나이 (+673)</option>
								<option value="685">사모아 (+685)</option>
								<option value="966">사우디아라비아 (+966)</option>
								<option value="357">사이프러스 (+357)</option>
								<option value="378">산마리노 (+378)</option>
								<option value="239">상토메 프린스페 (+239)</option>
								<option value="221">세네갈 (+221)</option>
								<option value="248">세이쉘 (+248)</option>
								<option value="1758">세인트 루시아 (+1758)</option>
								<option value="1784">세인트 빈센트 그레나딘 (+1784)</option>
								<option value="1869">세인트 키츠 네비스 (+1869)</option>
								<option value="290">세인트 헬레나 (+290)</option>
								<option value="252">소말리아 (+252)</option>
								<option value="677">솔로몬 군도 (+677)</option>
								<option value="249">수단 (+249)</option>
								<option value="597">수리남 (+597)</option>
								<option value="94">스리랑카 (+94)</option>
								<option value="268">스와질랜드 (+268)</option>
								<option value="46">스웨덴 (+46)</option>
								<option value="41">스위스 (+41)</option>
								<option value="34">스페인 (+34)</option>
								<option value="421">슬로바키아 (+421)</option>
								<option value="386">슬로베니아 (+386)</option>
								<option value="963">시리아 (+963)</option>
								<option value="232">시에라 리온 (+232)</option>
								<option value="971">아랍에미리트 연합 (+971)</option>
								<option value="297">아루바 (+297)</option>
								<option value="374">아르메니아 (+374)</option>
								<option value="54">아르헨티나 (+54)</option>
								<option value="1684">아메리칸 사모아 (+1684)</option>
								<option value="354">아이슬란드 (+354)</option>
								<option value="509">아이티 (+509)</option>
								<option value="353">아일랜드 (+353)</option>
								<option value="994">아제르바이잔 (+994)</option>
								<option value="93">아프카니스탄 (+93)</option>
								<option value="376">안도라 (+376)</option>
								<option value="1268">안티가 바부다 (+1268)</option>
								<option value="355">알바니아 (+355)</option>
								<option value="213">알제리 (+213)</option>
								<option value="244">앙골라 (+244)</option>
								<option value="1264">앙귈라 (+1264)</option>
								<option value="372">에스토니아 (+372)</option>
								<option value="593">에쿠아도르 (+593)</option>
								<option value="503">엘살바도르 (+503)</option>
								<option value="44">영국 (+44)</option>
								<option value="1340">영령 버진군도 (+1340)</option>
								<option value="1345">영령 캐이맨 군도 (+1345)</option>
								<option value="967">예맨 (+967)</option>
								<option value="968">오만 (+968)</option>
								<option value="43">오스트리아 (+43)</option>
								<option value="504">온두라스 (+504)</option>
								<option value="962">요르단 (+962)</option>
								<option value="256">우간다 (+256)</option>
								<option value="598">우루과이 (+598)</option>
								<option value="998">우즈베크 (+998)</option>
								<option value="380">우크라이나 (+380)</option>
								<option value="251">이디오피아 (+251)</option>
								<option value="964">이라크 (+964)</option>
								<option value="98">이란 (+98)</option>
								<option value="972">이스라엘 (+972)</option>
								<option value="20">이집트 (+20)</option>
								<option value="39">이탈리아 (+39)</option>
								<option value="62">인도네시아 (+62)</option>
								<option value="91">인디아 (+91)</option>
								<option value="1876">자마이카 (+1876)</option>
								<option value="260">잠비아 (+260)</option>
								<option value="240">적도 기니 (+240)</option>
								<option value="236">중앙아프리카 (+236)</option>
								<option value="253">지부티 (+253)</option>
								<option value="350">지브랄타 (+350)</option>
								<option value="263">짐바브웨 (+263)</option>
								<option value="235">챠드 (+235)</option>
								<option value="420">체코공화국 (+420)</option>
								<option value="56">칠레 (+56)</option>
								<option value="237">카메룬 (+237)</option>
								<option value="238">카보 베르데 (+238)</option>
								<option value="974">카타르 (+974)</option>
								<option value="855">캄보디아 (+855)</option>
								<option value="254">케냐 (+254)</option>
								<option value="506">코스타리카 (+506)</option>
								<option value="57">콜롬비아 (+57)</option>
								<option value="243">콩고 (+243)</option>
								<option value="53">쿠바 (+53)</option>
								<option value="965">쿠웨이트 (+965)</option>
								<option value="682">쿡 아일랜드 (+682)</option>
								<option value="385">크로아티아 (+385)</option>
								<option value="996">키르기스 (+996)</option>
								<option value="686">키리바티 (+686)</option>
								<option value="992">타지크 (+992)</option>
								<option value="255">탄자니아 (+255)</option>
								<option value="90">터키 (+90)</option>
								<option value="228">토고 (+228)</option>
								<option value="676">통가 (+676)</option>
								<option value="1649">투르크 & 카이코스 군도 (+1649)</option>
								<option value="993">투르크멘 (+993)</option>
								<option value="688">투발루 (+688)</option>
								<option value="216">튀니지 (+216)</option>
								<option value="1868">트리니다드 토바고 (+1868)</option>
								<option value="670">티모르 (+670)</option>
								<option value="507">파나마 (+507)</option>
								<option value="595">파라과이 (+595)</option>
								<option value="298">파로에 군도 (+298)</option>
								<option value="92">파키스탄 (+92)</option>
								<option value="675">파푸아 뉴기니 (+675)</option>
								<option value="680">팔라우 (+680)</option>
								<option value="970">팔레스타인 (+970)</option>
								<option value="51">페루 (+51)</option>
								<option value="351">포루투갈 (+351)</option>
								<option value="500">포클랜드 군도 (+500)</option>
								<option value="48">폴란드 (+48)</option>
								<option value="1787">푸에르토리코 (+1787)</option>
								<option value="33">프랑스 (+33)</option>
								<option value="679">피지 (+679)</option>
								<option value="358">핀란드 (+358)</option>
								<option value="36">헝가리 (+36)</option>
							</select>
							<!-- 2020.10.30.추가함-->
							<input type="hidden" name="mbshBase[telNatiCd]" value="82">
						</div>

						<div class="join_col w09">
							<input type="text" id="mophNo" name="mbshBase[mophNo]"
								value="01049003839" disabled>
							<!-- 2020.10.30.추가함-->
							<input type="hidden" name="mbshBase[mophNo]" value="01049003839">
							<p class="t_error" style="display: none;"></p>
						</div>

					</div>
					<div class="join_row">
						<div class="join_cols" id="divMailAddr">
							<input type="text" id="mailAddr1" name="mbshBase[mailAddr]"
								value="" placeholder="이메일" onfocusout="checkDupEmail();">
							<p class="t_error" style="display: none"></p>
						</div>
					</div>
				</div>

				<h3 class="h4_type mgtm">
					부가정보 입력<span class="small_txt">(선택)</span>
				</h3>
				<p class="f_size01">선택입력 사항입니다.</p>

				<div class="join_form type2">
					<div class="join_row blocks ">
						<div class="join_marketing">
							<span class="checkbox round"> <input type="hidden"
								id="mrktCd" name="mbshJoinTcndCds[]" value="004" /> <input
								type="hidden" id="mrktNo" name="mbshJoinTcndVerNos[]"
								value="1.5" /> <input type="hidden" id="mrktNtnlCd"
								name="joinNtnlCds[]" value="KR" /> <input type="hidden"
								id="mrktYn" name="agrYns[]" value="" /> <input type="checkbox"
								id="agrYn" name="agrYn" value="Y"> <label for="agrYn">마케팅
									정보 수신 동의</label>
							</span>
							<p class="consign">
								(주) 현대백화점면세점은 마케팅 활동을<a
									href="javascript:showPrivacyTermsLayerPop('open');">수탁업체</a> 를
								통해 진행할 수 있습니다.마케팅 정보를 받는데 동의하면, 회사가 수탁업체를 통해 마케팅 정보를 전송하는 것에
								동의하는 것으로 간주합니다.
							</p>
							<div class="of_hidden">
								<button type="button" class="btn_basic4 small "
									onclick="showMktLayerPop('open');">
									<span id="termsText">내용보기</span>
								</button>
								<span class="checkbox round fr"> <input type="checkbox"
									id="smsRcvYn" name="mbshBase[smsRcvYn]" value="Y" disabled>
									<label for="smsRcvYn">SMS</label>
								</span> <span class="checkbox round fr"> <input type="checkbox"
									id="mailRcvYn" name="mbshBase[mailRcvYn]" value="Y" disabled>
									<label for="mailRcvYn">이메일</label>
								</span>
							</div>
						</div>
					</div>

					<div class="join_row expiration_day">
						<span class="label_type">개인정보 유효기간</span>
						<!-- <span class="radio" style="display: none;">
                <input type="radio" id="expiration_day01" name="mbshMst[mbshSleepPridNofd]" value="1" checked>
                <label for="expiration_day01">1년</label>
            </span> -->
						<span class="radio"> <input type="radio"
							id="expiration_day02" name="mbshMst[mbshSleepPridNofd]" value="3">
							<label for="expiration_day02">3년</label>
						</span>
						<!-- 2021-04-01 개인정보 유효기간 변경 삭제 <span class="radio">
                <input type="radio" id="expiration_day03" name="mbshMst[mbshSleepPridNofd]" value="5">
                <label for="expiration_day03">5년</label>
            </span> -->
						<span class="radio level_up"> <input type="radio"
							id="expiration_day04" name="mbshMst[mbshSleepPridNofd]" value="0">
							<label for="expiration_day04">탈퇴 시 파기</label> <!-- S: 등급업 dialog -->
							<button type="button" class="btn_basic2 small"
								id="layerLevelupBtn">등급UP</button>
							<div class="layer_levelup" id="layerLevelup">
								<p>평생회원 특별혜택!</p>
								<p>
									'탈퇴 시 파기' 선택하고 가입 완료하면, 온라인 <strong>H.VVIP 등급+오프라인
										BLACK 멤버십</strong> 바로 지급!
								</p>
								<!-- <p>행사시간:21.12.31까지</p> -->
								<!-- 2021-12-27 삭제-->
								<a
									href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0002682"
									class="btn_basic1 small" target="_blank">이벤트 상세보기</a>
								<!-- 2021-12-27 새창뜨기-->
								<!-- S: 등급업 dialog -->
								<!-- S: 등급업 dialog -->
								<span class="layer_close"><span>닫기</span></span>
							</div> <script type="text/javascript">
								$("#layerLevelupBtn").on("click mouseover",
										function() {
											$("#layerLevelup").show();
										});
								$("#layerLevelup").on("mouseleave", function() {
									$(this).hide();
								});
								$(".layer_close").on("click", function() {
									$("#layerLevelup").hide();
								});
							</script> <!-- //E: 등급업 dialog -->
						</span>
						<!-- 2021-04-01 개인정보 유효기간 변경 추가 -->
						<p class="expiration_info">※ 별도 선택이 없을 경우 개인정보 보관기간은 1년으로 합니다.</p>
					</div>
				</div>

				<!-- S : 여권정보 -->
				<div class="tit_with_bth">
					<h3 class="h4_type mgtm">여권정보 입력</h3>
					<p class="f_size05">여권정보를 미리 입력하시면 주문 시 별도 입력 없이 바로 주문 가능합니다.</p>
					<div class="btn_wrap2">
						<button type="button" class="btn_basic4 small"
							onclick="showPassportNoticePop('KR');">여권정보 입력안내</button>
					</div>
				</div>
				<div class="uniq_sub_option">
					<span class="checkbox round"> <input type="checkbox" name=""
						id="unique01" class="uniqeChk" onclick="uniqAgree()"> <label
						for="unique01">고유식별정보 수집 이용 동의(선택)<!-- 고유식별정보 수집 이용 동의(선택) --></label>
					</span>
					<button type="button" class="btn_basic4 small"
						onclick="showUnqIdtInfoTermsPop('open')">
						내용보기
						<!-- 내용보기 -->
					</button>
				</div>

				<div class="join_form input_passport">
					<div class="join_row" id="divPsptNo">
						<input type="text" id="psptNo" name="mbshBase[psptNo]" value=""
							class="engNumber" placeholder="여권번호" maxlength="12"
							style="text-transform: uppercase;" disabled="disabled">
						<p class="t_error" style="display: none;"></p>
					</div>

					<div class="join_row blocks_tb">
						<div class="join_col w03" id="divPsptLast">
							<input type="text" id="mbshEngLstnm"
								name="mbshBase[mbshEngLstnm]" value="" class="eng"
								placeholder="Last Name (성)" maxlength="50"
								style="text-transform: uppercase;" disabled="disabled">
							<p class="t_error" style="display: none;"></p>
						</div>
						<div class="join_col w03" id="divPsptFirst">
							<input type="text" id="mbshEngFstnm"
								name="mbshBase[mbshEngFstnm]" value="" class="eng"
								placeholder="First Name (이름)" maxlength="50"
								style="text-transform: uppercase;" disabled="disabled">
							<p class="t_error" style="display: none;"></p>
						</div>
					</div>
					<div class="join_row" id="divPsptDate">
						<input type="text" id="psptExpiDt" name="mbshBase[psptExpiDt]"
							value="" placeholder="여권만료일" class="datepicker" maxlength="10"
							disabled="disabled">
						<p class="t_error" style="display: none;"></p>
					</div>
				</div>
				<input type="hidden" id="psptRcvCd" name="mbshJoinTcndCds[]"
					value="003" /> <input type="hidden" id="psptRcvNo"
					name="mbshJoinTcndVerNos[]" value="1.8" /> <input type="hidden"
					id="psptRcvNtnlCd" name="joinNtnlCds[]" value="KR" /> <input
					type="hidden" id="psptRcvYn" name="agrYns[]" value="N" />
				<!-- E : 여권정보 -->

				<div class="basic_btn_box mgtml">
					<button type="button" class="btn_basic2" id="btnNext">확인</button>
				</div>
			</form>
		</div>
	</section>
</div>

<div id="localMarketingTermsPop" title="마케팅 정보 수신 동의"
	style="display: none;">
	<div class="layer_popup">
		<div class="mCustomScrollbar inner_term">
			<div class="layer_style2_box">
				<!--S : BO에서 등록되는 내용영역 - 마케팅정보 수신 -->
				<div class="terms_area">
					<p class="top_txt">&nbsp;</p>
					<table class="tb_list02 type7">
						<caption>마케팅정보 수신 표입니다.</caption>
						<colgroup>
							<col style="width: 35%" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">수집항목</th>
								<td class="tl">성명, 국적, 휴대전화번호, 주소, 이메일/SMS/MMS/ 푸시 수신동의 여부</td>
							</tr>
							<tr>
								<th scope="row">수집/이용목적</th>
								<td class="tl">
									<p>&nbsp;</p>
									<ul class="dot_list">
										<li><strong class="f_size01_xs">신규 서비스, 상품 및 이벤트
												정보 안내 또는 고객설문조사</strong></li>
										<li><strong class="f_size01_xs">정기 간행물 발송</strong></li>
										<li><strong class="f_size01_xs">서비스의 개발&bull;연구,
												신규 서비스 개발&bull;연구</strong></li>
										<li><strong class="f_size01_xs">통계학적 특성에 따른 서비스
												제공 및 광고 게재, 접속 빈도 파악 또는 회원의 상품 구매 및 서비스 이용에 대한 분석 및 통계,
												서비스&bull;제품&bull;정보의 추천, 시장 트렌드 유추, 시장조사</strong></li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">보유 및 이용기간</th>
								<td class="tl">
									<ul class="dot_list">
										<li><strong class="f_size01_xs">회원탈퇴시 또는 개인정보 수집
												및 이용목적 달성시까지</strong></li>
										<li><strong class="f_size01_xs"><strong
												class="f_size01_xs">단, 법령에 따라 일정기간 보유하여야 하는 경우 해당
													기간까지</strong></strong></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<p class="t_int">※ ㈜현대백화점면세점은 마케팅 활동을 수탁업체를 통해 진행할 수 있습니다.</p>
					<p class="t_int">※ 고객은 마케팅정보 수신 동의에 거부할 수 있으나, 경품행사 및 상품 안내
						서비스, 이벤트 정보 등의 혜택 제공이 제한될 수 있습니다.</p>
				</div>
				<!--E: BO에서 등록되는 내용영역 - 마케팅정보 수신 -->
			</div>
		</div>
		<div class="basic_btn_box mgtsm">
			<button type="button" class="btn_basic2 layer_close"
				onclick="showMktLayerPop('close');">
				확인
				<!-- 확인 -->
			</button>
		</div>
	</div>
</div>

<div id="privacyTermsPop" title="수탁업체" style="display: none;">
	<div class="layer_popup">
		<div class="mCustomScrollbar inner_term">
			<div class="layer_style2_box">
				<!--S : BO에서 등록되는 내용영역 - 개인정보처리방침 수탁업체 -->
				<div class="terms_area">
					<p class="top_txt">※ 현대백화점면세점은 계약이행 및 서비스 향상을 위해서 일부 업무를 외부에
						위탁하여 처리하고 있으며, 위탁업무의 내용과 수탁자는 아래와 같습니다.</p>
					<table class="tb_list02 type7">
						<caption>개인정보처리방침 위탁업체와 위탁업무내용 표입니다.</caption>
						<colgroup>
							<col style="width: 40%" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="col"><strong>위탁업체</strong></th>
								<th scope="col"><strong>위탁업무내용</strong></th>
							</tr>
							<tr>
								<td>효성ITX</td>
								<td>고객상담, 콜센터 운영업무</td>
							</tr>
							<tr>
								<td>휴머스온</td>
								<td>이메일, SMS, MMS, 앱푸시 알림서비스, 본인확인</td>
							</tr>
							<!-- 2018-12-07 pub09
    <tr>
        <td>
            조은시스템, 인터비즈시스템</td>
        <td>
            판매직</td>
    </tr>
    <tr>
        <td>
            오랜지원, 앤티씨, 에프터제이인터내셔널</td>
        <td>
            판매직</td>
    </tr> -->
							<tr>
								<td>KICC</td>
								<td>신용카드 결제처리</td>
							</tr>
							<tr>
								<td>KRP</td>
								<td>결제대행 (PG사)</td>
							</tr>
							<tr>
								<td>KSNET</td>
								<td>신용카드 결제처리</td>
							</tr>
							<tr>
								<td>KG모빌리언스</td>
								<td>휴대폰 소액결제</td>
							</tr>
							<tr>
								<td>LG CNS</td>
								<td>간편결제서비스</td>
							</tr>
							<tr>
								<td>현대IT&amp;E</td>
								<td>전산시스템 유지보수 및 개발(재위탁 : SK C&amp;C)</td>
							</tr>
							<tr>
								<td>KT알파</td>
								<td>이벤트 경품 모바일쿠폰 발송</td>
							</tr>
							<tr>
								<td>에스텍시스템</td>
								<td>영업점 운영 및 CCTV보안운영관리</td>
							</tr>
							<tr>
								<td>유니에스, 이브릿지, 인트로맨</td>
								<td>영업점, 통합물류센터 창고 운영</td>
							</tr>
							<tr>
								<td>이노션</td>
								<td>광고대행/매체운영 및 이벤트 경품발송</td>
							</tr>
							<tr>
								<td>한국면세점협회,유니에스,용진티앤에스,한국면세서비스시스템</td>
								<td>인도장운영</td>
							</tr>
							<tr>
								<td>인터비즈, 조은시스템, 삼경무역, 이브릿지</td>
								<td>영업점 판매</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--E: BO에서 등록되는 내용영역 - 개인정보처리방침 수탁업체 -->
			</div>
		</div>
		<div class="basic_btn_box mgtsm">
			<button type="button" class="btn_basic2 layer_close"
				onclick="showPrivacyTermsLayerPop('close');">
				확인
				<!-- 확인 -->
			</button>
		</div>
	</div>
</div>

<div id="unqIdtInfoTermsPop" title="고유식별정보 수집·이용 동의">
	<div class="layer_popup">
		<div class="mCustomScrollbar inner_term">
			<div class="layer_style2_box">
				<!--S : BO에서 등록되는 내용영역 - 고유식별정보 수집 -->
				<div class="terms_area">
					<p class="top_txt">
						<strong>고유식별정보 수집 ∙ 이용 동의(필수)</strong>
					</p>
					<table class="tb_list02 type7">
						<caption>고유식별정보 수집 ∙ 이용 목적 표입니다.</caption>
						<colgroup>
							<col style="width: 35%" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">수집항목</th>
								<td class="tl"><strong class="f_size01_xs">여권번호,
										여권만료일, 영문명</strong></td>
							</tr>
							<tr>
								<th scope="row">수집/이용목적</th>
								<td class="tl">
									<p>&nbsp;</p> 이용자 식별을 통한 본인여부 확인, 물품구매계약이행(주문, 상품인도, 주문내역 확인),
									관련 법령상 의무 준수, (회원의 경우)온/오프라인 통합 회원서비스 제공
								</td>
							</tr>
							<tr>
								<th scope="row">보유 및 이용기간</th>
								<td class="tl">
									<ul class="sub_dot">
										<li>1) 일반회원, 외국인회원<br />
											<p class="p_dot_list">
												<strong class="f_size01_xs">회원탈퇴시 또는 개인정보 수집 및 이용목적
													달성시까지</strong>
											</p>
											<p class="p_dot_list">
												<strong class="f_size01_xs">단, 법령에 따라 일정기간 보유하여야 하는
													경우 해당 기간까지</strong>
											</p>
										</li>
										<li class="mgtxs">2) 비회원<br />
											<p class="p_dot_list">
												<strong class="f_size01_xs">상품인도 후 3년</strong>
											</p>
											<p class="p_dot_list">
												<strong class="f_size01_xs">단, 법령에 따라 일정기간 보유하여야 하는
													경우 해당 기간까지</strong>
											</p>
										</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<p class="t_int">※ 고객은 고유식별정보 수집 ∙ 이용 동의를 거부할 권리가 있습니다. 단, 동의
						거부 시 현대백화점 인터넷면세점에서 면세품 구매가 불가능합니다.</p>
					<p class="t_int">※ 단, 여권번호는 ① 가입시에 입력할 수 있고 ② 가입 이후 MY페이지에서
						개인정보 수정메뉴를 통해 추가 입력할 수 있으며 ③ 상품 구매 시 주문 화면 내에서도 입력 가능합니다.</p>
				</div>
				<!--E: BO에서 등록되는 내용영역 - 고유식별정보 수집 -->
			</div>
		</div>
		<ul class="btn_group">
			<li><a href="javascript:void(0)" class="btnde_type1 mid"
				onclick="showUnqIdtInfoTermsPop('disagree')">동의안함<!-- 동의안함 --></a> <a
				href="javascript:void(0)" class="btnde_type1 mid bg_black"
				onclick="showUnqIdtInfoTermsPop('agree')">동의<!-- 동의 --></a></li>
		</ul>
	</div>
</div>
</main>

<%@ include file="../common/Footer.jsp"%>