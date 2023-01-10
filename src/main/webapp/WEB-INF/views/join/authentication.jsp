<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main id="container" class="container"> <script
	type="text/javascript">
	//window.opener.name = 'authentication';
	var lang = 'KR';
	var dblFlag = false;
	var gTimerId; // 인증시간타이머
	var gLimitSec; // 인증유효시간
	var isDblClick = false;
var isOverCnt = false;
$(function(){
// 달력 설정
$("#mbshBymdDt").datepicker({
					showOn : "button",
					buttonImage : SERVER_IMAGE
							+ "/images/KO/common/calendar.png",
					buttonImageOnly : true,
					dateFormat : "yy-mm-dd",
					buttonText : "Select date",
					changeYear : true,
					changeMonth : true,
					showOtherMonths : true,
					monthNamesShort : [ "1", "2", "3", "4", "5", "6", "7", "8",
							"9", "10", "11", "12" ],
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					yearRange : "1900:+0"
				});
		var gLang = 'KR'; // 언어
		var gLangTxt = {
			'KR' : [
					'아이디 확인',
					'비밀번호 찾기',
					'로그인',
					'아이디 확인',
					'90일 이내 재가입 고객입니다.',
					'아이디',
					'기존 아이디로 가입',
					'새아이디로 가입',
					'오프라인 가입정보가 존재합니다.\n이름, 생년월일, 휴대폰번호를 오프라인 가입정보와 동일하게 입력해주세요.',
					'탈퇴후 재가입은 탈퇴시부터 48시간 이후 가능합니다.', '인증시간이 만료되었습니다.',
					'이메일 인증이 완료되었습니다.', '인증을 이미 완료하셨습니다.' ],
			'EN' : [
					'Account already in use',
					"I've forgotten my password",
					'Sign in',
					'Account already in use',
					'You are a returning customer within 90 days.',
					'Account',
					'Register with existing account',
					'Register with new account',
					'Your offline membership information has been confirmed.\nPlease enter your name, date of birth, and cell phone number as they appear in your offline membership information.',
					'After withdrawal, you can sign up again after 48 hours.',
					'Effective time for verification is expired.',
					'Verification via email is completed.',
					'Verification already complete.' ],
			'CN' : [ '确认用户名', '找回密码', '登录', '确认用户名', '90日以内重新注册的会员。', '用户名',
					'使用原用户名', '注册新用户名',
					'您的邮箱地址已注册实体店会员。\n请输入与实体店会员信息相一致的姓名、出生年月日、手机号码。',
					'注销后要重新注册时,自从注销48以后可以重新注册。', '认证号码有效时间已经过了。', '验证成功',
					'已验证成功。' ]
		};

		//기가입
		$("#divDupJoin").dialog({
			autoOpen : false,
			resizable : false,
			width : 400,
			maxHeight : 720,
			modal : true
		});

		// 재가입
		$("#divReJoin").dialog({
			autoOpen : false,
			resizable : false,
			width : 500,
			maxHeight : 720,
			modal : true
		});

		// 발송 버튼
		$('#btnSendmail')
				.click(
						function() {
							if (isDblClick) {//중복호출 방지
								return;
							}
							$('#spanError1').hide();

							if ($('#mbshHnglNm', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError1', '#frmLocalAuthentication')
										.show().text('성명을 입력해주세요.');
								$('#mbshHnglNm', '#frmLocalAuthentication')
										.focus();
								return;
							}

							if ($('#mbshHnglNm1', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError1', '#frmLocalAuthentication')
										.show().text('성명을 입력해주세요.');
								$('#mbshHnglNm1', '#frmLocalAuthentication')
										.focus();
								return;
							}

							if ($('#mbshHnglNm2', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError1', '#frmLocalAuthentication')
										.show().text('성명을 입력해주세요.');
								$('#mbshHnglNm2', '#frmLocalAuthentication')
										.focus();
								return;
							}

							if ($('#mbshBymdDt', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError1', '#frmLocalAuthentication')
										.show().text('생년월일 입력형식을 확인해주세요.');
								$('#mbshBymdDt', '#frmLocalAuthentication')
										.focus();
								return;
							} else {
								if (!fnIsValidDate($('#mbshBymdDt',
										'#frmLocalAuthentication').val())) {
									$('#spanError1', '#frmLocalAuthentication')
											.show().text('생년월일 입력형식을 확인해주세요.');
									$('#mbshBymdDt', '#frmLocalAuthentication')
											.focus();
									return;
								} else {
									var vToday = new Date();
									var vBirth = new Date($('#mbshBymdDt')
											.val());
									vBirth.setFullYear(parseInt(vBirth
											.getFullYear()) + 14);

									if (vBirth > vToday) {
										$('#spanError1',
												'#frmLocalAuthentication')
												.show()
												.text(
														'14세 미만의 경우 현대백화점인터넷면세점 이용이 불가합니다.'); // 14세 미만인 경우 현대백화점인터넷면세점에 가입할 수 없습니다.
										$('#mbshBymdDt',
												'#frmLocalAuthentication')
												.focus();
										return;
									}
								}
							}

							if (!fnIsEmail($('#mailAddr').val())) {
								setTimeout(function() {
									$('#spanError1', '#frmLocalAuthentication')
											.show().text(
													'이메일 주소를 다시 확인하고 입력해주세요.'); // 이메일 주소를 다시 확인하고 입력해주세요.
								}, 50);
								$('#mailAddr').focus();
								return;
							}

							isDblClick = true; //ajax 중복호출 방지 활성화

							$
									.ajax({
										url : ctx_curr
												+ '/mm/mbshJoin/sendAuthEmail.json',
										method : 'post',
										data : $('#frmLocalAuthentication')
												.serialize(),
										async : false,
										dataType : 'json',
										success : function(data, textStatus,
												jqXHR) {
											var vResultCode = data.resultCode;
											var vMessage = data.message;
											var vInfo = data.info;

											if (crew.ajaxValidate(data, false)) {
												clearInterval(gTimerId); // 기존타이머 종료

												// 타이머설정
												gLimitSec = 600;
												gTimerId = setInterval(
														function() {
															gLimitSec -= 1;
															var vMinute = '0'
																	+ parseInt(gLimitSec / 60);
															var vSecond = '0'
																	+ parseInt(gLimitSec % 60);
															var vTxt = vMinute
																	.slice(-2)
																	+ ':'
																	+ vSecond
																			.slice(-2);
															$('#spanAuthTime')
																	.text(vTxt);
															if (gLimitSec == 0) {
																clearInterval(gTimerId); // 타이머종료
																$('#spanError2')
																		.show()
																		.text(
																				'인증번호 입력 시간이 초과했습니다. 인증번호 재발송 후 다시 입력해주세요.'); // 인증번호 입력 시간이 초과했습니다. 인증번호 재발송 후 다시 입력해주세요.
																$('#mailAuthNo')
																		.val("");
																$('#mailAuthNo')
																		.attr(
																				'disabled',
																				true);
															}
														}, 1000);

												alert('인증번호가 발송되었습니다.\n10분 이내에 인증번호를 입력해주세요.'); // 입력하신 이메일로 인증번호가 발송되었습니다. 10분 이내에 인증번호를 입력해주세요.
												$('#btnSendmail').attr("class",
														"btn_basic2 small");
												$('#btnSendmail').text('재발송'); // 재발송
												$('#spanError1').hide();
												$('#spanError2').hide();
												$('#mailAuthNo').attr(
														'disabled', false);
												isOverCnt = false;

											} else {
												$('#spanAuthTime')
														.text('10:00');
												clearInterval(gTimerId);
												$('#mailAuthNo').val("");
												$('#mailAuthNo').attr(
														'disabled', true);

												if (vResultCode == 10
														|| vResultCode == 20) { // 이미 가입된 이메일 && 탈퇴한지 48시간 안지난 이메일
													alert('이미 사용중인 이메일입니다.'); // 이미 사용중인 이메일입니다.
													$('#btnSendmail').attr(
															"class",
															"btn_basic2 small");
													$('#btnSendmail').text(
															'재발송'); // 재발송
													$('#spanError1')
															.show()
															.text(
																	'이미 사용중인 이메일입니다.');
												} else if (vResultCode == 30) { // 가입불가
													$('#spanError1')
															.show()
															.text(
																	'회원가입을 원하시면 고객센터(1811-6688)로 문의주십시오.'); // 회원가입을 원하시면 고객센터(1811-6688)로 문의주십시오.
												} else {
													alert('인증메일 발송이 실패하였습니다.'); // 인증메일 발송이 실패하였습니다.
												}
											}
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											alert('처리중 오류가 발생하였습니다.'); // 처리중 오류가 발생하였습니다.
										},
										complete : function() {
											setTimeout(function() {
												isDblClick = false;
											}, 2000); //2초 후 중복호출 방지 기능 해제
										}
									});
						});

		// 2022
		$('#btnSendmail2')
				.click(
						function() {
							if (isDblClick) {//중복호출 방지
								return;
							}
							$('#spanError3').hide();

							if ($('#mbshHnglNmMoph0', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError3', '#frmLocalAuthentication')
										.show().text('성명을 입력해주세요.');
								$('#mbshHnglNmMoph0', '#frmLocalAuthentication')
										.focus();
								return;
							}

							if ($('#mbshBymdDtMoph0', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError3', '#frmLocalAuthentication')
										.show().text('생년월일 입력형식을 확인해주세요.');
								$('#mbshBymdDtMoph0', '#frmLocalAuthentication')
										.focus();
								return;
							} else {
								if (!fnIsValidDate($('#mbshBymdDtMoph0',
										'#frmLocalAuthentication').val())) {
									$('#spanError3', '#frmLocalAuthentication')
											.show().text('생년월일 입력형식을 확인해주세요.');
									$('#mbshBymdDtMoph0',
											'#frmLocalAuthentication').focus();
									return;
								} else {
									var vToday = new Date();
									var vBirth = new Date($('#mbshBymdDtMoph0')
											.val());
									vBirth.setFullYear(parseInt(vBirth
											.getFullYear()) + 14);

									if (vBirth > vToday) {
										$('#spanError3',
												'#frmLocalAuthentication')
												.show()
												.text(
														'14세 미만의 경우 현대백화점인터넷면세점 이용이 불가합니다.'); // 14세 미만인 경우 현대백화점인터넷면세점에 가입할 수 없습니다.
										$('#mbshBymdDtMoph0',
												'#frmLocalAuthentication')
												.focus();
										return;
									}
								}
							}

							if (!fnIsEmail($('#mailAddr0').val())) {
								setTimeout(function() {
									$('#spanError3', '#frmLocalAuthentication')
											.show().text(
													'이메일 주소를 다시 확인하고 입력해주세요.'); // 이메일 주소를 다시 확인하고 입력해주세요.
								}, 50);
								$('#mailAddr0').focus();
								return;
							}

							isDblClick = true; //ajax 중복호출 방지 활성화

							$
									.ajax({
										url : ctx_curr
												+ '/mm/mbshJoin/sendAuthEmail.json',
										method : 'post',
										data : $('#frmLocalAuthentication')
												.serialize(),
										async : false,
										dataType : 'json',
										success : function(data, textStatus,
												jqXHR) {
											var vResultCode = data.resultCode;
											var vMessage = data.message;
											var vInfo = data.info;

											if (crew.ajaxValidate(data, false)) {
												clearInterval(gTimerId); // 기존타이머 종료

												// 타이머설정
												gLimitSec = 600;
												gTimerId = setInterval(
														function() {
															gLimitSec -= 1;
															var vMinute = '0'
																	+ parseInt(gLimitSec / 60);
															var vSecond = '0'
																	+ parseInt(gLimitSec % 60);
															var vTxt = vMinute
																	.slice(-2)
																	+ ':'
																	+ vSecond
																			.slice(-2);
															$('#spanAuthTime0')
																	.text(vTxt);
															if (gLimitSec == 0) {
																clearInterval(gTimerId); // 타이머종료
																$('#spanError4')
																		.show()
																		.text(
																				'인증번호 입력 시간이 초과했습니다. 인증번호 재발송 후 다시 입력해주세요.'); // 인증번호 입력 시간이 초과했습니다. 인증번호 재발송 후 다시 입력해주세요.
																$(
																		'#mailAuthNo0')
																		.val("");
																$(
																		'#mailAuthNo0')
																		.attr(
																				'disabled',
																				true);
															}
														}, 1000);

												alert('인증번호가 발송되었습니다.\n10분 이내에 인증번호를 입력해주세요.'); // 입력하신 이메일로 인증번호가 발송되었습니다. 10분 이내에 인증번호를 입력해주세요.
												$('#btnSendmail2').attr(
														"class",
														"btn_basic2 small");
												$('#btnSendmail2').text('재발송'); // 재발송
												$('#spanError3').hide();
												$('#spanError4').hide();
												$('#mailAuthNo0').attr(
														'disabled', false);
												isOverCnt = false;

											} else {
												$('#spanAuthTime0').text(
														'10:00');
												clearInterval(gTimerId);
												$('#mailAuthNo0').val("");
												$('#mailAuthNo0').attr(
														'disabled', true);

												if (vResultCode == 10
														|| vResultCode == 20) { // 이미 가입된 이메일 && 탈퇴한지 48시간 안지난 이메일
													alert('이미 사용중인 이메일입니다.'); // 이미 사용중인 이메일입니다.
													$('#btnSendmail2').attr(
															"class",
															"btn_basic2 small");
													$('#btnSendmail2').text(
															'재발송'); // 재발송
													$('#spanError3')
															.show()
															.text(
																	'이미 사용중인 이메일입니다.');
												} else if (vResultCode == 30) { // 가입불가
													$('#spanError3')
															.show()
															.text(
																	'회원가입을 원하시면 고객센터(1811-6688)로 문의주십시오.'); // 회원가입을 원하시면 고객센터(1811-6688)로 문의주십시오.
												} else {
													alert('인증메일 발송이 실패하였습니다.'); // 인증메일 발송이 실패하였습니다.
												}
											}
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											alert('처리중 오류가 발생하였습니다.'); // 처리중 오류가 발생하였습니다.
										},
										complete : function() {
											setTimeout(function() {
												isDblClick = false;
											}, 2000); // 2초 후 중복호출 방지 기능 해제
										}
									});
						});

		//2020.10.14.휴대폰인증 도입
		// 발송 버튼
		$('#btnSend')
				.click(
						function() {

							if ($('#mbshHnglNm', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError1', '#frmLocalAuthentication')
										.show().text('성명을 입력해주세요.');
								$('#mbshHnglNm', '#frmLocalAuthentication')
										.focus();
								return;
							}

							if ($('#mbshEngLstnm', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError1', '#frmLocalAuthentication')
										.show().text('성명을 입력해주세요.');
								$('#mbshEngLstnm', '#frmLocalAuthentication')
										.focus();
								return;
							}

							if ($('#mbshEngFstnm', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError1', '#frmLocalAuthentication')
										.show().text('성명을 입력해주세요.');
								$('#mbshEngFstnm', '#frmLocalAuthentication')
										.focus();
								return;
							}

							if ($('#mbshBymdDt', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError1', '#frmLocalAuthentication')
										.show().text('생년월일 입력형식을 확인해주세요.');
								$('#mbshBymdDt', '#frmLocalAuthentication')
										.focus();
								return;
							} else {
								if (!fnIsValidDate($('#mbshBymdDt',
										'#frmLocalAuthentication').val())) {
									$('#spanError1', '#frmLocalAuthentication')
											.show().text('생년월일 입력형식을 확인해주세요.');
									$('#mbshBymdDt', '#frmLocalAuthentication')
											.focus();
									return;
								} else {
									var vToday = new Date();
									var vBirth = new Date($('#mbshBymdDt')
											.val());
									vBirth.setFullYear(parseInt(vBirth
											.getFullYear()) + 14);

									if (vBirth > vToday) {
										$('#spanError1',
												'#frmLocalAuthentication')
												.show()
												.text(
														'14세 미만의 경우 현대백화점인터넷면세점 이용이 불가합니다.'); // 14세 미만인 경우 현대백화점인터넷면세점에 가입할 수 없습니다.
										$('#mbshBymdDt',
												'#frmLocalAuthentication')
												.focus();
										return;
									}
								}
							}

							var vTelNatiCd = $('#telNatiCd').val();

							if (vTelNatiCd == '') {
								$('#spanError1').show().text('국가번호를 선택해주세요.'); // 국가번호를 선택해주세요.
								$('#telNatiCd').focus();
								return;
							}

							// 2020.10.19.내국인 - 회원가입 : 국가전화번호에 따라 유효성 체크
							// 국가전화번호에 따라 유효성 체크
							var vPhone;
							if (vTelNatiCd == '82') { // 한국
								if ($('#mophNo').val() == '') {
									$('#spanError1').show().text(
											'휴대폰번호를 다시 확인하고 입력해주세요.'); // 휴대폰번호를 다시 확인하고 입력해주세요.
									$('#mophNo').focus();
									return;
								}
								vPhone = $('#mophNo').val();

								if (!fnIsPhoneNumber(vPhone)) {
									$('#spanError1').show().text(
											'휴대폰번호를 다시 확인하고 입력해주세요.'); // 휴대폰번호를 다시 확인하고 입력해주세요.
									$('#mophNo').focus();
									return;
								}

								// 010,016,017,011,018,019 외 불가
								if (!fnIsKorPhonePrefix($('#mophNo').val()
										.substring(0, 3))) {
									$('#spanError1').show()
											.text('국가번호를 확인하세요.'); // 국가번호를 확인하세요
									$('#mophNo').focus();
									return;
								}

								vPhone = $('#mophNo').val();

							} else {
								if ($('#mophNo').val() == '') {
									$('#spanError1').show().text(
											'휴대폰번호를 다시 확인하고 입력해주세요.'); // 휴대폰번호를 다시 확인하고 입력해주세요.
									$('#mophNo').focus();
									return;
								}

								if (!fnIsNumber($('#mophNo').val())) {
									$('#spanError1').show().text(
											'휴대폰번호를 다시 확인하고 입력해주세요.'); // 휴대폰번호를 다시 확인하고 입력해주세요.
									$('#mophNo').focus();
									return;
								}

								vPhone = $('#mophNo').val();

							}

							$('#spanError1').hide();

							$('#frmLocalAuthentication').add(
									$('#telNatiCd').val());
							//$('#frmLocalAuthentication').add($("#mophNo").val($("#mophNo1").val()+$("#mophNo2").val()+$("#mophNo3").val()));

							if ($('#telNatiCd').val() == '82') {
								$('#mophNo').val($('#mophNo').val());
							} else {
								$('#mophNo').val($('#mophNo').val());
							}

							// 인증 SMS 발송
							isDblClick = true; //ajax 중복호출 방지 활성화
							$
									.ajax({
										url : '//www.hddfs.com/shop/mm/mbshJoin/sendAuthSms.json',
										method : 'post',
										data : $('#frmLocalAuthentication')
												.serialize(),
										//data: {mophNo : vPhone, telNatiCd : vTelNatiCd},
										async : false,
										dataType : 'json',
										success : function(data, textStatus,
												jqXHR) {
											var vResultCode = data.resultCode;
											var vMessage = data.message;
											var vInfo = data.info;

											if (crew.ajaxValidate(data, false)) {
												clearInterval(gTimerId); // 기존타이머 종료

												// 타이머설정
												gLimitSec = 180;
												gTimerId = setInterval(
														function() {
															gLimitSec -= 1;
															var vMinute = '0'
																	+ parseInt(gLimitSec / 60);
															var vSecond = '0'
																	+ parseInt(gLimitSec % 60);
															var vTxt = vMinute
																	.slice(-2)
																	+ ':'
																	+ vSecond
																			.slice(-2);

															$('#spanAuthTime')
																	.text(vTxt);

															if (gLimitSec == 0) {
																clearInterval(gTimerId); // 타이머종료
																$('#spanError2')
																		.show()
																		.text(
																				'인증번호 입력 시간이 초과했습니다. 인증번호 재발송 후 다시 입력해주세요.'); // 인증번호 입력 시간이 초과했습니다. 인증번호 재발송 후 다시 입력해주세요.
																$('#authNo')
																		.val("");
																$('#authNo')
																		.attr(
																				'disabled',
																				true);
															}
														}, 1000);

												alert('SMS 인증번호가\n발송되었습니다.'); // SMS 인증번호가\n발송되었습니다.

												$('#sendYn').val('Y');
												$('#btnSend').text('재발송'); // 재발송
												$('#spanError1, #spanError2')
														.hide();
												$('#authNo').attr('disabled',
														false);
												isOverCnt = false;

												gPhone = vPhone;
												gTelNatiCd = vTelNatiCd;
											} else if (vResultCode == '77') { //SMS인증번호 발송횟수제한 2022.05 문하윤 작성
												alert('재발송 5회 이상 시도하였습니다.1분 뒤 다시 시도해주세요.'); // 재발송 5회 이상 시도하였습니다.1분 뒤 다시 시도해주세요.
											} else {
												alert(''); // 처리중 오류가 발생하였습니다.
											}
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											alert(''); // 처리중 오류가 발생하였습니다.
										},
										complete : function() {
											setTimeout(function() {
												isDblClick = false;
											}, 2000); //2초 후 중복호출 방지 기능 해제
										}
									});
						});

		//2022.02.21.휴대폰인증 추가
		// 발송 버튼
		$('#btnSend2')
				.click(
						function() {
							if ($('#mbshHnglNmMoph0', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError3', '#frmLocalAuthentication')
										.show().text('성명을 입력해주세요.');
								$('#mbshHnglNmMoph0', '#frmLocalAuthentication')
										.focus();
								return;
							}

							if ($('#mbshHnglNm10', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError3', '#frmLocalAuthentication')
										.show().text('성명을 입력해주세요.');
								$('#mbshHnglNm10', '#frmLocalAuthentication')
										.focus();
								return;
							}

							if ($('#mbshHnglNm20', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError3', '#frmLocalAuthentication')
										.show().text('성명을 입력해주세요.');
								$('#mbshHnglNm20', '#frmLocalAuthentication')
										.focus();
								return;
							}

							if ($('#mbshBymdDtMoph0', '#frmLocalAuthentication')
									.val() == '') {
								$('#spanError3', '#frmLocalAuthentication')
										.show().text('생년월일 입력형식을 확인해주세요.');
								$('#mbshBymdDtMoph0', '#frmLocalAuthentication')
										.focus();
								return;
							} else {
								if (!fnIsValidDate($('#mbshBymdDtMoph0',
										'#frmLocalAuthentication').val())) {
									$('#spanError3', '#frmLocalAuthentication')
											.show().text('생년월일 입력형식을 확인해주세요.');
									$('#mbshBymdDtMoph0',
											'#frmLocalAuthentication').focus();
									return;
								} else {
									var vToday = new Date();
									var vBirth = new Date($('#mbshBymdDtMoph0')
											.val());
									vBirth.setFullYear(parseInt(vBirth
											.getFullYear()) + 14);

									if (vBirth > vToday) {
										$('#spanError3',
												'#frmLocalAuthentication')
												.show()
												.text(
														'14세 미만의 경우 현대백화점인터넷면세점 이용이 불가합니다.'); // 14세 미만인 경우 현대백화점인터넷면세점에 가입할 수 없습니다.
										$('#mbshBymdDtMoph0',
												'#frmLocalAuthentication')
												.focus();
										return;
									}
								}
							}

							var vTelNatiCd = $('#telNatiCd0').val();

							if (vTelNatiCd == '') {
								$('#spanError3').show().text('국가번호를 선택해주세요.'); // 국가번호를 선택해주세요.
								$('#telNatiCd0').focus();
								return;
							}

							var vPhone;
							if (vTelNatiCd == '82') { // 한국
								if ($('#mophNo0').val() == '') {
									$('#spanError3').show().text(
											'휴대폰번호를 다시 확인하고 입력해주세요.'); // 휴대폰번호를 다시 확인하고 입력해주세요.
									$('#mophNo0').focus();
									return;
								}
								vPhone = $('#mophNo0').val();

								if (!fnIsPhoneNumber(vPhone)) {
									$('#spanError3').show().text(
											'휴대폰번호를 다시 확인하고 입력해주세요.'); // 휴대폰번호를 다시 확인하고 입력해주세요.
									$('#mophNo0').focus();
									return;
								}

								// 010,016,017,011,018,019 외 불가
								if (!fnIsKorPhonePrefix($('#mophNo0').val()
										.substring(0, 3))) {
									$('#spanError3').show()
											.text('국가번호를 확인하세요.'); // 국가번호를 확인하세요
									$('#mophNo0').focus();
									return;
								}

								vPhone = $('#mophNo0').val();

							} else {
								if ($('#mophNo0').val() == '') {
									$('#spanError3').show().text(
											'휴대폰번호를 다시 확인하고 입력해주세요.'); // 휴대폰번호를 다시 확인하고 입력해주세요.
									$('#mophNo0').focus();
									return;
								}

								if (!fnIsNumber($('#mophNo0').val())) {
									$('#spanError3').show().text(
											'휴대폰번호를 다시 확인하고 입력해주세요.'); // 휴대폰번호를 다시 확인하고 입력해주세요.
									$('#mophNo0').focus();
									return;
								}

								vPhone = $('#mophNo0').val();

							}

							$('#spanError3').hide();

							$('#frmLocalAuthentication').add(
									$('#telNatiCd0').val());

							if ($('#telNatiCd0').val() == '82') {
								$('#mophNo0').val($('#mophNo0').val());
							} else {
								$('#mophNo0').val($('#mophNo0').val());
							}

							// 인증 SMS 발송
							isDblClick = true; //ajax 중복호출 방지 활성화
							$
									.ajax({
										url : '//www.hddfs.com/shop/mm/mbshJoin/sendAuthSms.json',
										method : 'post',
										data : $('#frmLocalAuthentication')
												.serialize(),
										//data: {mophNo : vPhone, telNatiCd : vTelNatiCd},
										async : false,
										dataType : 'json',
										success : function(data, textStatus,
												jqXHR) {
											var vResultCode = data.resultCode;
											var vMessage = data.message;
											var vInfo = data.info;

											if (crew.ajaxValidate(data, false)) {
												clearInterval(gTimerId); // 기존타이머 종료

												// 타이머설정
												gLimitSec = 180;
												gTimerId = setInterval(
														function() {
															gLimitSec -= 1;
															var vMinute = '0'
																	+ parseInt(gLimitSec / 60);
															var vSecond = '0'
																	+ parseInt(gLimitSec % 60);
															var vTxt = vMinute
																	.slice(-2)
																	+ ':'
																	+ vSecond
																			.slice(-2);

															$('#spanAuthTime0')
																	.text(vTxt);

															if (gLimitSec == 0) {
																clearInterval(gTimerId); // 타이머종료
																$('#spanError4')
																		.show()
																		.text(
																				'인증번호 입력 시간이 초과했습니다. 인증번호 재발송 후 다시 입력해주세요.'); // 인증번호 입력 시간이 초과했습니다. 인증번호 재발송 후 다시 입력해주세요.
																$('#authNo0')
																		.val("");
																$('#authNo0')
																		.attr(
																				'disabled',
																				true);
															}
														}, 1000);

												alert('SMS 인증번호가\n발송되었습니다.'); // SMS 인증번호가\n발송되었습니다.

												$('#sendYn').val('Y');
												$('#btnSend2').text('재발송'); // 재발송
												$('#spanError3, #spanError4')
														.hide();
												$('#authNo0').attr('disabled',
														false);
												isOverCnt = false;

												gPhone = vPhone;
												gTelNatiCd = vTelNatiCd;
											} else {
												alert(''); // 처리중 오류가 발생하였습니다.
											}
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											alert(''); // 처리중 오류가 발생하였습니다.
										},
										complete : function() {
											setTimeout(function() {
												isDblClick = false;
											}, 2000); //2초 후 중복호출 방지 기능 해제
										}
									});
						});

		// 다음버튼
		$('#btnConfirm')
				.click(
						function() {

							$('#spanError2').hide();

							if ($('#sendYn').val() == '') {
								$('#spanError2').show().text('인증번호를 발송해주세요.'); // 인증번호를 발송해주세요.
								$('#authNo').focus();
								return;
							}

							if ($('#authNo').val() == '') {
								$('#spanError2').show().text('인증번호를 입력해주세요.'); // 인증번호를 입력해주세요.
								$('#authNo').focus();
								return;
							}

							if (gLimitSec <= 0) {
								$('#spanError2')
										.show()
										.text(
												'인증번호 입력 시간이 초과했습니다. 인증번호 재발송 후 다시 입력해주세요.'); // 인증번호 입력 시간이 초과했습니다. 인증번호를 재발송 해주세요.
								$('#btnSend').focus();
								return;
							}

							if (isOverCnt) {
								setTimeout(
										function() {
											$('#spanError2')
													.show()
													.text(
															'인증번호를 5회 이상 잘못 입력하셨습니다. 인증번호 재발송 후 다시 입력해주세요.');
										}, 50);
								$('#spanAuthTime').text('03:00');
								clearInterval(gTimerId); // 타이머종료
								$('#authNo').attr('disabled', true);
								return;
							}

							$('#frmLocalAuthentication')
									.add($('#authNo').val());

							// 인증번호 확인
							$
									.ajax({

										url : ctx_curr
												+ "/mm/mbshJoin/chkAuthSms.json",
										method : "POST",
										data : {
											type : 'join',
											telNatiCd : gTelNatiCd,
											mophNo : gPhone,
											authNo : $('#authNo').val(),
											mbshHnglNm : $('#mbshHnglNm').val(),
											mbshBymdDt : $('#mbshBymdDt').val(),
											sexCd : $('#sexCd').val(),
											mailAddr : $('#mailAddr').val()
										},
										async : false,
										dataType : "json",
										success : function(data, textStatus,
												jqXHR) {
											var vResultCode = data.resultCode;
											var vMessage = data.message;
											var vInfo = data.info;

											if (crew.ajaxValidate(data, false)) {
												// 페이지이동
												var vSmsData = {
													telNatiCd : $('#telNatiCd')
															.val(),
													mophNo : $('#mophNo').val(),
													mbshHnglNm : $(
															'#mbshHnglNm')
															.val(),
													mbshBymdDt : $(
															'#mbshBymdDt')
															.val()
												};

												alert('SMS 인증이 완료되었습니다.'); // SMS 인증이 완료되었습니다.
												smsAuthCallback(vSmsData);
											} else {
												if (vResultCode == 10) {
													setTimeout(
															function() {
																$('#spanError2')
																		.show()
																		.text(
																				'인증번호 확인 후 다시 시도해주세요.');
															}, 50);
												} else if (vResultCode == 20) {
													isOverCnt = true;
													setTimeout(
															function() {
																$('#spanError2')
																		.show()
																		.text(
																				'인증번호를 5회 이상 잘못 입력하셨습니다. 인증번호 재발송 후 다시 입력해주세요.');
															}, 50);
													$('#spanAuthTime').text(
															'03:00');
													clearInterval(gTimerId); // 타이머종료
													$('#authNo').val("");
													$('#authNo').attr(
															'disabled', true);
												} else if (vResultCode == 30) { //기가입

													if (lang == 'KR') {
														$('.small_txt',
																'#divDupJoin')
																.html(
																		'가입 된 현대백화점인터넷면세점 아이디가 있습니다.<br>해당 아이디(<span>'
																				+ vInfo.rejoinId
																				+ '</span>)로 로그인 후 서비스를 이용해보세요.');
													} else if (lang == 'EN') {
														$('.small_txt',
																'#divDupJoin')
																.html(
																		'There is an Hyundai Department store Internet Duty Free account already exists.<br>Please sign in with the account (<span>'
																				+ vInfo.rejoinId
																				+ '</span>) and enjoy our service.');
													} else {
														$('.small_txt',
																'#divDupJoin')
																.html(
																		'已存在注册现代百货网上免税店的用户名，<br><span>'
																				+ vInfo.rejoinId
																				+ '</span> 可通过此用户名进行登录使用服务。');
													}
													$("#divDupJoin").dialog(
															'option', 'title',
															gLangTxt[gLang][0]);
													$('#btnFindPwd',
															'#divDupJoin')
															.text(
																	gLangTxt[gLang][1]);
													$('#btnLogin',
															'#divDupJoin')
															.text(
																	gLangTxt[gLang][2]);
													$('#divDupJoin').dialog(
															'open');

												} else if (vResultCode == '40') { // 탈퇴 48시간 이내                	
													alert(gLangTxt[gLang][9]);
													$('#frmLocalAuthentication')
															.attr(
																	'action',
																	ctx_curr
																			+ '/mm/mbshJoin/join.do');
													$('#ohvalue').val(""); // 회원스크립용 데이터 초기화
													$('#frmLocalAuthentication')
															.submit();
												} else if (vResultCode == '50') { // 재가입
													$("#divReJoin").dialog(
															'option', 'title',
															gLangTxt[gLang][3]);
													$('.small_txt',
															'#divReJoin').html(
															gLangTxt[gLang][4]);
													$('#mbshId', '#divReJoin')
															.val(vInfo.rejoinId);
													$('#thId', '#divReJoin')
															.text(
																	gLangTxt[gLang][5]);
													$('#btnSameJoin',
															'#divReJoin').text(
															gLangTxt[gLang][6]);
													$('#btnNewJoin',
															'#divReJoin').text(
															gLangTxt[gLang][7]);
													$('#divReJoin').dialog(
															'open');

												} else if (vResultCode == '60') { // 내국인 오프라인 회원존재
													var vSexCd = data.sexCd;
													var vMailAddr = data.mailAddr;
													var vMbshHnglNm = data.mbshHnglNm;
													var vMbshBymdDt = data.mbshBymdDt;
													var vMophNo = data.mophNo;

													alert("오프라인 가입정보가 존재합니다.\n이름, 생년월일, 휴대폰번호를 오프라인 가입정보와 동일하게 입력해주세요.");
													//60번일때만 css disable되게 
													//fnMovePage(ctx_curr + '/mm/mbshJoin/mbshInformation.do'); 

													var vSmsDatad = {
														sexCd : vSexCd,
														mailAddr : vMailAddr,
														mbshHnglNm : vMbshHnglNm,
														mbshBymdDt : vMbshBymdDt,
														mophNo : vMophNo
													};

													smsAuthCallbackOff(vSmsDatad);
												} else if (vResultCode == '70') { // 가입불가
													alert(vMessage); //회원가입을 원하시면 고객센터(1811-6688)로 문의주십시오.
												} else {
													alert(''); // 처리중 오류가 발생하였습니다.
												}
											}
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											//console.log(jqXHR.status);
										}
									});
						});

		// 2022 휴대폰 인증 
		$('#btnConfirm2')
				.click(
						function() {

							$('#spanError4').hide();

							if ($('#sendYn').val() == '') {
								$('#spanError4').show().text('인증번호를 발송해주세요.'); // 인증번호를 발송해주세요.
								$('#authNo0').focus();
								return;
							}

							if ($('#authNo0').val() == '') {
								$('#spanError4').show().text('인증번호를 입력해주세요.'); // 인증번호를 입력해주세요.
								$('#authNo0').focus();
								return;
							}

							if (gLimitSec <= 0) {
								$('#spanError4')
										.show()
										.text(
												'인증번호 입력 시간이 초과했습니다. 인증번호 재발송 후 다시 입력해주세요.'); // 인증번호 입력 시간이 초과했습니다. 인증번호를 재발송 해주세요.
								$('#btnSend2').focus();
								return;
							}

							if (isOverCnt) {
								setTimeout(
										function() {
											$('#spanError4')
													.show()
													.text(
															'인증번호를 5회 이상 잘못 입력하셨습니다. 인증번호 재발송 후 다시 입력해주세요.');
										}, 50);
								$('#spanAuthTime0').text('03:00');
								clearInterval(gTimerId); // 타이머종료
								$('#authNo0').attr('disabled', true);
								return;
							}

							$('#frmLocalAuthentication').add(
									$('#authNo0').val());

							// 인증번호 확인
							$
									.ajax({

										url : ctx_curr
												+ "/mm/mbshJoin/chkAuthSms.json",
										method : "POST",
										data : {
											type : 'join',
											telNatiCd : gTelNatiCd,
											mophNo : gPhone,
											authNo : $('#authNo0').val(),
											mbshHnglNm : $('#mbshHnglNmMoph0')
													.val(),
											mbshHnglNm10 : $('#mbshHnglNm10')
													.val(),
											mbshHnglNm20 : $('#mbshHnglNm20')
													.val(),
											mbshBymdDt : $('#mbshBymdDtMoph0')
													.val(),
											sexCd : $('#sexCd').val(),
											mailAddr : $('#mailAddr0').val()
										},
										async : false,
										dataType : "json",
										success : function(data, textStatus,
												jqXHR) {
											var vResultCode = data.resultCode;
											var vMessage = data.message;
											var vInfo = data.info;

											if (crew.ajaxValidate(data, false)) {
												// 페이지이동
												var vSmsData = {
													telNatiCd : $('#telNatiCd0')
															.val(),
													mophNo : $('#mophNo0')
															.val(),
													mbshHnglNm : $(
															'#mbshHnglNmMoph0')
															.val(),
													mbshBymdDt : $(
															'#mbshBymdDtMoph0')
															.val()
												};

												alert('SMS 인증이 완료되었습니다.'); // SMS 인증이 완료되었습니다.
												findOffEml();
											} else {
												if (vResultCode == 10) {
													setTimeout(
															function() {
																$('#spanError4')
																		.show()
																		.text(
																				'인증번호 확인 후 다시 시도해주세요.');
															}, 50);
												} else if (vResultCode == 20) {
													isOverCnt = true;
													setTimeout(
															function() {
																$('#spanError4')
																		.show()
																		.text(
																				'인증번호를 5회 이상 잘못 입력하셨습니다. 인증번호 재발송 후 다시 입력해주세요.');
															}, 50);
													$('#spanAuthTime0').text(
															'03:00');
													clearInterval(gTimerId); // 타이머종료
													$('#authNo0').val("");
													$('#authNo0').attr(
															'disabled', true);
												} else if (vResultCode == 30) { //기가입

													if (lang == 'KR') {
														$('.small_txt',
																'#divDupJoin')
																.html(
																		'가입 된 현대백화점인터넷면세점 아이디가 있습니다.<br>해당 아이디(<span>'
																				+ vInfo.rejoinId
																				+ '</span>)로 로그인 후 서비스를 이용해보세요.');
													} else if (lang == 'EN') {
														$('.small_txt',
																'#divDupJoin')
																.html(
																		'There is an Hyundai Department store Internet Duty Free account already exists.<br>Please sign in with the account (<span>'
																				+ vInfo.rejoinId
																				+ '</span>) and enjoy our service.');
													} else {
														$('.small_txt',
																'#divDupJoin')
																.html(
																		'已存在注册现代百货网上免税店的用户名，<br><span>'
																				+ vInfo.rejoinId
																				+ '</span> 可通过此用户名进行登录使用服务。');
													}
													$("#divDupJoin").dialog(
															'option', 'title',
															gLangTxt[gLang][0]);
													$('#btnFindPwd',
															'#divDupJoin')
															.text(
																	gLangTxt[gLang][1]);
													$('#btnLogin',
															'#divDupJoin')
															.text(
																	gLangTxt[gLang][2]);
													$('#divDupJoin').dialog(
															'open');

												} else if (vResultCode == '40') { // 탈퇴 48시간 이내                	
													alert(gLangTxt[gLang][9]);
													$('#frmLocalAuthentication')
															.attr(
																	'action',
																	ctx_curr
																			+ '/mm/mbshJoin/join.do');
													$('#ohvalue').val(""); // 회원스크립용 데이터 초기화
													$('#frmLocalAuthentication')
															.submit();
												} else if (vResultCode == '50') { // 재가입
													$("#divReJoin").dialog(
															'option', 'title',
															gLangTxt[gLang][3]);
													$('.small_txt',
															'#divReJoin').html(
															gLangTxt[gLang][4]);
													$('#mbshId', '#divReJoin')
															.val(vInfo.rejoinId);
													$('#thId', '#divReJoin')
															.text(
																	gLangTxt[gLang][5]);
													$('#btnSameJoin',
															'#divReJoin').text(
															gLangTxt[gLang][6]);
													$('#btnNewJoin',
															'#divReJoin').text(
															gLangTxt[gLang][7]);
													$('#divReJoin').dialog(
															'open');
												} else if (vResultCode == '60') { // 내국인 오프라인 회원존재
													findOffEml();
												} else if (vResultCode == '70') { // 가입불가
													alert(vMessage); //회원가입을 원하시면 고객센터(1811-6688)로 문의주십시오.
												} else {
													alert(''); // 처리중 오류가 발생하였습니다.
												}
											}
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											//console.log(jqXHR.status);
										}
									});
						});

		$(
				'#mbshHnglNm, #mbshHnglNm1, #mbshHnglNm2, #mbshHnglNm10, #mbshHnglNm20, #mbshHnglNmMoph0')
				.blur(function() {
					$(this).val($(this).val().toUpperCase());
				});

		$('#mbshBymdDt').keyup(function() {
			$(this).val(fnAutoHypenBymd($(this).val())); // 자동하이픈 처리
		});

		$('[id^=mophNo]').keyup(function() {
			var vId = $(this).attr('id');
			var vLen = $(this).val().length;

			if (vId == 'mophNo1') {
				if (vLen >= 3) {
					$('#mophNo2').focus();
				}
			} else if (vId == 'mophNo2') {
				if (vLen >= 4) {
					$('#mophNo3').focus();
				}
			}
		});
	});

	function findOffMoph() {
		if (dblFlag)
			return;

		if (($("#mbshHnglNmMoph0").val() == null || $("#mbshHnglNmMoph0").val() == '')
				|| ($("#mbshBymdDtMoph0").val() == null || $("#mbshBymdDtMoph0")
						.val() == '')
				|| ($("#mailAddr0").val() == null || $("#mailAddr0").val() == '')) {
			$('#divFindMoph .t_error').show();
			$('#divFindMoph .t_error').text('이름, 생년월일, 이메일주소를 모두 기입해주세요.'); // 이름, 생년월일, 이메일을 모두 기입해주세요.
			$('#findMophRes').hide();
			return;
		}

		if (!fnIsEmail($('#mailAddr0').val())) {
			setTimeout(function() {
				$('#divFindMoph .t_error').show();
				$('#divFindMoph .t_error').text('이메일 주소를 다시 확인하고 입력해주세요.'); // 이메일을 모두 기입해주세요.
			}, 50);
			$('#mailAddr').focus();
			return;
		}

		//생년월일 체크
		if (!fnIsValidDate($('#mbshBymdDtMoph0').val())) {
			$('#divFindMoph .t_error').show();
			$('#divFindMoph .t_error').text('생년월일 입력형식을 확인해주세요.');
			$('#mbshBymdDtMoph0').focus();
			return;
		}

		var smbshHnglNm1 = $("#mbshHnglNm10").val();
		var smbshHnglNm2 = $("#mbshHnglNm20").val();
		//var smbshHnglNm = $("#mbshHnglNm0").val();

		var smailAddr = $("#mailAddr0").val();
		var smbshBymdDt = $("#mbshBymdDtMoph0").val();
		var smbshHnglNm = $("#mbshHnglNmMoph0").val();

		var sforeignerYn = 'N';
		var slang = 'KR';
		var soffMbshYn = 'N';

		dblFlag = true;

		$.ajax({
			url : ctx_curr + '/mm/mbshJoin/selectOflnMbshMoph.json',
			method : 'post',
			//data : $('#frmLocalAuthentication').serialize(),
			data : {
				mbshHnglNm : smbshHnglNm,
				mbshBymdDt : smbshBymdDt,
				mailAddr : smailAddr,
				foreignerYn : sforeignerYn,
				lang : slang,
				offMbshYn : soffMbshYn
			},
			dataType : 'json',
			success : function(data, textStatus, jqXHR) {
				var vResultCode = data.resultCode;
				var vMessage = data.message;
				var vInfo = data.info;
				if (crew.ajaxValidate(data, false)) {
					$('#findMophRes').show();
					$('#findMophRes').text(vMessage);
					$('#divFindMoph .t_error').hide();
				} else {
					$('#divFindMoph .t_error').show();
					$('#divFindMoph .t_error').text(vMessage);
					$('#findMophRes').hide();
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('처리중 오류가 발생하였습니다.');
			},
			complete : function() {
				setTimeout(function() {
					dblFlag = false;
				}, 2000);
			}
		});
	}

	function findOffEml() {

		if (dblFlag)
			return;

		/* if($("#telNatiCd0").val() == "82"){
		 $("#mophNo0").val($("#mophNo10").val()+$("#mophNo20").val()+$("#mophNo30").val());
		 } */

		if ('N' == 'N') {
			if (($("#mbshHnglNm0").val() == null || $("#mbshHnglNm0").val() == '')
					|| ($("#mbshBymdDtMoph0").val() == null || $(
							"#mbshBymdDtMoph0").val() == '')
					/* || ($("#telNatiCd").val() == null || $("#telNatiCd").val() == '')  */
					|| ($("#mophNo0").val() == null || $("#mophNo0").val() == '')) {
				$('#divFindEml .t_error').show();
				$('#divFindEml .t_error').text('이름, 생년월일, 휴대폰번호를 모두 기입해주세요.');
				$('#findEmlRes').hide();
				return;
			}
		} else {
			if (($("#mbshHnglNm10").val() == null || $("#mbshHnglNm10").val() == '')
					|| ($("#mbshHnglNm20").val() == null || $("#mbshHnglNm20")
							.val() == '')
					|| ($("#mbshBymdDtMoph0").val() == null || $(
							"#mbshBymdDtMoph0").val() == '')
					|| ($("#telNatiCd0").val() == null || $("#telNatiCd0")
							.val() == '')
					|| ($("#mophNo0").val() == null || $("#mophNo0").val() == '')) {
				$('#divFindEml .t_error').show();
				$('#divFindEml .t_error').text('이름, 생년월일, 휴대폰번호를 모두 기입해주세요.');
				$('#findEmlRes').hide();
				return;
			}
		}

		var smbshHnglNm1 = $("#mbshHnglNm10").val();
		var smbshHnglNm2 = $("#mbshHnglNm20").val();
		var smophNo = $("#mophNo0").val();
		var smbshHnglNm = $("#mbshHnglNm0").val();
		var smbshBymdDt = $("#mbshBymdDtMoph0").val();
		var stelNatiCd = $("#telNatiCd0").val();
		//var smbshHnglNm = $("#mbshHnglNmMoph0").val();
		var sforeignerYn = 'N';
		var slang = 'KR';
		var soffMbshYn = 'N';

		var vPhone;
		if (stelNatiCd == '82') { // 한국
			if ($('#mophNo0').val() == '') {
				$('#divFindEml .t_error').show().text('휴대폰번호를 다시 확인하고 입력해주세요.'); // 휴대폰번호를 다시 확인하고 입력해주세요.
				$('#mophNo0').focus();
				return;
			}
			if (!fnIsPhoneNumber($('#mophNo0').val())) {
				$('#divFindEml .t_error').show().text('휴대폰번호를 다시 확인하고 입력해주세요.'); // 휴대폰번호를 다시 확인하고 입력해주세요.
				$('#mophNo0').focus();
				return;
			}
			// 010,016,017,011,018,019 외 불가
			if (!fnIsKorPhonePrefix($('#mophNo0').val().substring(0, 3))) {
				$('#divFindEml .t_error').show().text('국가번호를 확인하세요.'); // 국가번호를 확인하세요
				$('#mophNo0').focus();
				return;
			}
		} else {
			if ($('#mophNo0').val() == '') {
				$('#divFindEml .t_error').show().text('휴대폰번호를 다시 확인하고 입력해주세요.'); // 휴대폰번호를 다시 확인하고 입력해주세요.
				$('#mophNo0').focus();
				return;
			}

			if (!fnIsNumber($('#mophNo0').val())) {
				$('#divFindEml .t_error').show().text('휴대폰번호를 다시 확인하고 입력해주세요.'); // 휴대폰번호를 다시 확인하고 입력해주세요.
				$('#mophNo0').focus();
				return;
			}
		}

		//생년월일 체크
		if (!fnIsValidDate($('#mbshBymdDtMoph0').val())) {
			$('#divFindEml .t_error').show();
			$('#divFindEml .t_error').text('생년월일 입력형식을 확인해주세요.');
			$('#mbshBymdDtMoph0').focus();
			return;
		}

		dblFlag = true;

		$.ajax({
			url : ctx_curr + '/mm/mbshJoin/selectOflnMbshEml.json',
			method : 'post',
			//data : $('#frmLocalAuthentication').serialize(),
			data : {
				mbshHnglNm : smbshHnglNm,
				mbshHnglNm1 : smbshHnglNm1,
				mbshHnglNm2 : smbshHnglNm2,
				mophNo : smophNo,
				mbshBymdDt : smbshBymdDt,
				telNatiCd : stelNatiCd,
				foreignerYn : sforeignerYn,
				lang : slang,
				offMbshYn : soffMbshYn
			},
			dataType : 'json',
			success : function(data, textStatus, jqXHR) {
				var vResultCode = data.resultCode;
				var vMessage = data.message;
				var vInfo = data.info;
				// ('ajax success');
				if (crew.ajaxValidate(data, false)) {
					$('#findEmlRes').show();
					$('#findEmlRes').text(vMessage);
					$('#divFindEml .t_error').hide();
				} else {
					$('#divFindEml .t_error').show();
					$('#divFindEml .t_error').text(vMessage);
					$('#findEmlRes').hide();
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('처리중 오류가 발생하였습니다.');
			},
			complete : function() {
				setTimeout(function() {
					dblFlag = false;
				}, 2000);
			}
		});
	}

	function smsAuthCallback(obj) {

		$('#frmLocalAuthentication').attr('action',
				ctx_curr + '/mm/mbshJoin/mbshInformation.do');
		$('#frmLocalAuthentication').attr('method', 'post');
		$('#frmLocalAuthentication').attr('target', '');
		$('#frmLocalAuthentication').submit();
	}

	function smsAuthCallbackOff(obj) {

		$('#sexCd').val(obj['sexCd']);
		$('#mailAddr').val(obj['mailAddr']);
		//$('#telNatiCd').val(obj['telNatiCd']);
		$('#mophNo').val(obj['mophNo']);
		$('#mbshBymdDt').val(obj['mbshBymdDt']);
		$('#mbshHnglNm').val(obj['mbshHnglNm']);

		$('#frmLocalAuthentication').attr('action',
				ctx_curr + '/mm/mbshJoin/mbshInformation.do');
		$('#frmLocalAuthentication').attr('method', 'post');
		$('#frmLocalAuthentication').attr('target', '');
		$('#frmLocalAuthentication').submit();
	}

	function smsAuthCallbackYn(obj) {

		var oldIdUseYn = obj;
		$('#oldIdUseYn').val(oldIdUseYn);

		$('#frmLocalAuthentication').attr('action',
				ctx_curr + '/mm/mbshJoin/mbshInformation.do');
		$('#frmLocalAuthentication').attr('method', 'post');
		$('#frmLocalAuthentication').attr('target', '');
		$('#frmLocalAuthentication').submit();
	}

	function foreignerAuthPop(authType) {
		window.name = "opener.window.name";
		if (authType == 'email') {
			var title = 'emailPop';
			var gsWin = window.open('about:blank', title,
					'width=600,height=430');
			var url = ctx_curr
					+ '/mm/mbshJoin/foreignerEmailAuthenticationPop.do';
		} else if (authType == 'sms') {
			var title = 'smsPop';
			var gsWin = window.open('about:blank', title,
					'width=560,height=420');
			var url = ctx_curr
					+ '/mm/mbshJoin/foreignerSmsAuthenticationPop.do';
		}

		$('#frmLocalAuthentication').attr('action', url);
		$('#frmLocalAuthentication').attr('method', 'post');
		$('#frmLocalAuthentication').attr('target', title);
		$('#frmLocalAuthentication').submit();
	}

	function chkMailAuth() {
		$('#spanError2').hide();

		vRegExpFormat = /[^0-9]{1}/g;

		if ($('#mailAuthNo').val() == "" || $('#mailAuthNo').val().length < 6
				|| vRegExpFormat.test($('#mailAuthNo').val())) {
			setTimeout(function() {
				$('#spanError2').show().text('인증번호 확인 후 다시 시도해주세요.');
			}, 50);
			return;
		}

		if (isOverCnt) {
			setTimeout(function() {
				$('#spanError2').show().text(
						'인증번호를 5회 이상 잘못 입력하셨습니다. 인증번호 재발송 후 다시 입력해주세요.');
			}, 50);
			$('#spanAuthTime').text('10:00');
			clearInterval(gTimerId); // 타이머종료
			$('#mailAuthNo').attr('disabled', true);
return ;
}

$('#frmLocalAuthentication').add($('#mailAuthNo').val());

$.ajax({
								async : false,
					url : ctx_curr + "/mm/mbshJoin/chkAuthMailNo.json",
					dataType : "json",
					type : "POST",
					data : $('#frmLocalAuthentication').serialize(),
					success : function(data, textStatus, jqXHR) {
						var vResultCode = data.resultCode;

						if (vResultCode == 10) {
							setTimeout(function() {
								$('#spanError2').show().text(
										'인증번호 확인 후 다시 시도해주세요.');
							}, 50);
						} else if (vResultCode == 20) {
							isOverCnt = true;
							setTimeout(
									function() {
										$('#spanError2')
												.show()
												.text(
														'인증번호를 5회 이상 잘못 입력하셨습니다. 인증번호 재발송 후 다시 입력해주세요.');
									}, 50);
							$('#spanAuthTime').text('10:00');
							clearInterval(gTimerId); // 타이머종료
							$('#mailAuthNo').val("");
							$('#mailAuthNo').attr('disabled', true);
						} else if (vResultCode == 0) {
							alert('처리중 오류가 발생하였습니다.');
						} else {
							fnMoveUrl(data.MailAukyVal);
						}

					},
					error : function(jqXHR, textStatus, errorThrown) {
						//console.log(jqXHR.status);
					}
				});

	}

	// 2022
	function chkMailAuth2() {
		$('#spanError4').hide();

		vRegExpFormat = /[^0-9]{1}/g;

		if ($('#mailAuthNo0').val() == "" || $('#mailAuthNo0').val().length < 6
				|| vRegExpFormat.test($('#mailAuthNo0').val())) {
			setTimeout(function() {
				$('#spanError4').show().text('인증번호 확인 후 다시 시도해주세요.');
			}, 50);
			return;
		}

		if (isOverCnt) {
			setTimeout(function() {
				$('#spanError4').show().text(
						'인증번호를 5회 이상 잘못 입력하셨습니다. 인증번호 재발송 후 다시 입력해주세요.');
			}, 50);
			$('#spanAuthTime0').text('10:00');
			clearInterval(gTimerId); // 타이머종료
			$('#mailAuthNo0').attr('disabled', true);
return ;
}

$('#frmLocalAuthentication').add($('#mailAuthNo0').val());

$.ajax({
								async : false,
					url : ctx_curr + "/mm/mbshJoin/chkAuthMailNo.json",
					dataType : "json",
					type : "POST",
					data : $('#frmLocalAuthentication').serialize(),
					success : function(data, textStatus, jqXHR) {
						var vResultCode = data.resultCode;

						if (vResultCode == 10) {
							setTimeout(function() {
								$('#spanError4').show().text(
										'인증번호 확인 후 다시 시도해주세요.');
							}, 50);
						} else if (vResultCode == 20) {
							isOverCnt = true;
							setTimeout(
									function() {
										$('#spanError4')
												.show()
												.text(
														'인증번호를 5회 이상 잘못 입력하셨습니다. 인증번호 재발송 후 다시 입력해주세요.');
									}, 50);
							$('#spanAuthTime0').text('10:00');
							clearInterval(gTimerId); // 타이머종료
							$('#mailAuthNo0').val("");
							$('#mailAuthNo0').attr('disabled', true);
						} else if (vResultCode == 0) {
							alert('처리중 오류가 발생하였습니다.');
						} else {
							findOffMoph();
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						//console.log(jqXHR.status);
					}
				});

	}

	function fnMoveUrl(mailAukyVal) {
		$('#frmLocalAuthentication').attr(
				'action',
				ctx_curr + '/mm/mbshJoin/chkAuthMail.do?mailAukyVal='
						+ mailAukyVal);
		$('#frmLocalAuthentication').submit();
	}

	//기가입레이어 비밀번호 찾기 버튼
	function btnFindPwd() {
		fnMovePage(ctx_curr + '/mm/mbshAuca/membershipFindPwd.do');
	}

	//기가입레이어 로그인 버튼
	function btnLogin() {
		$('#divDupJoin').dialog('close');
		fnMovePage(ctx_curr + '/dm/main.do');
	}

	//재가입레이어 새아이디로 가입 버튼
	function btnNewJoin() {
		//$('#frmLocalAuthentication').submit();
		fnMovePage(ctx_curr + '/mm/mbshJoin/mbshInformation.do');
	}

	function fnMovePage(vUrl) {
		$('#frmLocalAuthentication').attr('action', vUrl);
		$('#frmLocalAuthentication').submit();
	}
</script>





<div class="container">
	<section>
		<div class="join_wrap ">
			<form id="frmLocalAuthentication" name="frmLocalAuthentication"
				method="post" action="">
				<input type="hidden" name="foreignerYn" value="N"> <input
					type="hidden" name="lang" value="KR"> <input type="hidden"
					name="offMbshYn" value="N"> <input type="hidden"
					id="sendYn" name="sendYn" value=""> <input type="hidden"
					id="oldIdUseYn" name="oldIdUseYn" value=""> <input
					type="hidden" id="mailAddr" name="mailAddr" value="">
				<!-- 약관동의 내용 -->
				<input type="hidden" name="mbshJoinTcndCds" value="001"> <input
					type="hidden" name="mbshJoinTcndCds" value="002"> <input
					type="hidden" name="mbshJoinTcndVerNos" value="2.1"> <input
					type="hidden" name="mbshJoinTcndVerNos" value="1.7"> <input
					type="hidden" name="joinNtnlCds" value="KR"> <input
					type="hidden" name="joinNtnlCds" value="KR"> <input
					type="hidden" name="agrYns" value="Y"> <input type="hidden"
					name="agrYns" value="Y">
				<h2 class="h2_type">회원가입(내국인)</h2>
				<div class="join_step">
					<ol>
						<li class="ico_memb step01 active">STEP 01<em>약관동의</em></li>
						<li class="ico_memb step02 active">STEP 02<em>본인인증</em></li>
						<li class="ico_memb step03">STEP 03<em>정보입력</em></li>
						<li class="ico_memb step04">STEP 04<em>가입완료</em></li>
					</ol>
				</div>

				<h3 class="h4_type mgtm">휴대폰 인증</h3>
				<!-- 2020.10.19.휴대폰인증 : 성명,생년월일,휴대폰번호 3KEY 확인 -->
				<div class="join_form">

					<div class="join_row" id="divMbshHnglNm">
						<input type="text" id="mbshHnglNm" name="mbshHnglNm" value=""
							placeholder="성명" maxlength="50"
							style="text-transform: uppercase;"
							onkeypress="javascript:noSpaceEvnt(event);">
						<p class="t_error" style="display: none;"></p>
					</div>
					<div class="join_row">
						<input type="text" id="mbshBymdDt" name="mbshBymdDt" value=""
							placeholder="생년월일(YYYY-MM-DD)" class="datepicker hasDatepicker"><img
							class="ui-datepicker-trigger"
							src="https://cdn.hddfs.com/front/images/KO/common/calendar.png"
							alt="Select date" title="Select date">
						<p class="t_error" style="display: none"></p>
					</div>
				</div>

				<div class="join_row blocks type2">
					<div class="join_form clearfix">
						<div class="join_col w14 select">
							<select name="telNatiCd" class="sel_type" id="telNatiCd"
								style="display: none;">
								<option value="82">한국 (+82)</option>
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
								<option value="1649">투르크 &amp; 카이코스 군도 (+1649)</option>
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
							</select><span tabindex="0" id="telNatiCd-button" role="combobox"
								aria-expanded="false" aria-autocomplete="list"
								aria-owns="telNatiCd-menu" aria-haspopup="true"
								class="ui-selectmenu-button ui-selectmenu-button-closed ui-corner-all ui-button ui-widget"><span
								class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span><span
								class="ui-selectmenu-text">한국 (+82)</span></span>
						</div>
						<!-- S : 2017-08-11 modify -->
						<div class="join_col w06">
							<input type="text" id="mophNo" name="mophNo" value=""
								placeholder="휴대폰번호" maxlength="30" class="number"> <input
								type="text" id="sexCd" name="sexCd" value=""
								style="display: none;">
							<!-- <input type="email" id="mailAddr" name="mailAddr" value="" placeholder="이메일" style="display:none;" > -->
						</div>
						<!-- E : 2017-08-11 modify -->
						<div class="join_col join_btn">
							<button type="button" class="btn_basic2 small" id="btnSend">인증번호
								발송</button>
						</div>
					</div>
				</div>


				<!-- 성명, 생년월일, 휴대폰번호를 입력해주세요. 변경해야됨  -->
				<div class="rebtn_warp2">
					<div class="txt_wrap">
						<span class="p_dot_list txt" id="spanError1"
							style="display: none;"></span>
					</div>
				</div>

				<div class="join_row blocks type2 join_time">
					<div class="join_form clearfix">
						<div class="join_col w510">
							<input class="number" type="text" id="authNo" name="authNo"
								placeholder="인증번호" maxlength="10"> <span class="time"
								id="spanAuthTime">03:00</span>
						</div>
					</div>
				</div>

				<div class="rebtn_warp2">
					<div class="txt_wrap">
						<span class="p_dot_list txt" id="spanError2"
							style="display: none;"> <!-- 인증번호 확인 후 다시 시도해주세요. --> <!-- 인증번호 입력 시간이 초과했습니다. -->
							<!-- 인증번호 재발송 후 다시 입력해주세요. -->
						</span>
					</div>
				</div>
			</form>

			<div class="basic_btn_box mgtsm">
				<button type="button" class="btn_basic1"
					onclick="javascript:history.back(-1);">이전</button>
				<a href="#;" class="btn_basic2" id="btnConfirm">다음</a>
			</div>
		</div>
	</section>
</div>
</main>


<%@ include file="../common/Footer.jsp"%>