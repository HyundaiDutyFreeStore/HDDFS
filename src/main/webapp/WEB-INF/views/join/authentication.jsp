<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>

<div class="wrapper">
	<form id="memberJoinForm" method="POST">

		<!-- bodyWrap -->
		<div id="bodyWrap">


			<h2 class="h2_type">회원가입(내국인)</h2>
			<div class="join_step">
				<ol>
					<li class="ico_memb step01 active">STEP 01<em>약관동의</em></li>
					<li class="ico_memb step02 active">STEP 02<em>본인인증</em></li>
					<li class="ico_memb step03">STEP 03<em>정보입력</em></li>
					<li class="ico_memb step04">STEP 04<em>가입완료</em></li>
				</ol>
			</div>

			<h3 class="h4_type mgtm">이메일 인증</h3>
			<div class="join_form">

				<div class="join_row" id="divMbshHnglNm">
					<input type="text" id="mbshHnglNm" name="mbshHnglNm" value=""
						placeholder="성명" maxlength="50" style="text-transform: uppercase;"
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

			<div class="join_form clearfix">
				<input type="text" style="width: 120px" title="이메일" id="email"
					name="email" value=""> <span class="andmail" id="middle">@</span>
				<select id="emailDomainSel" style="width: 120px" title="이메일">
					<option value="06">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="yahoo.co.kr">yahoo.co.kr</option>
					<option value="lycos.co.kr">lycos.co.kr</option>
					<option value="nate.com">nate.com</option>
					<option value="empas.com">empas.com</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="msn.com">msn.com</option>
					<option value="hanmir.com">hanmir.com</option>
					<option value="chol.net">chol.net</option>
					<option value="korea.com">korea.com</option>
					<option value="netsgo.com">netsgo.com</option>
					<option value="dreamwiz.com">dreamwiz.com</option>
					<option value="hanafos.com">hanafos.com</option>
					<option value="freechal.com">freechal.com</option>
					<option value="hitel.net">hitel.net</option>
				</select> <input type="text" id="emailDomain" style="width: 120px" value=""
					title="이메일 도메인" style="disply:none;"> <span
					class="guide_comment" id="emailMsg"></span> <input id="memail"
					name="memail" style="display: none;" value="${member.memail}">
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled"
							style="background: none;">
					</div>
					<div class="join_col join_btn">
						<input type="button" class="mail_check_button" value="인증번호전송">
					</div>
				</div>
			</div>
		</div>
		<div class="basic_btn_box mgtsm">
			<button type="button" class="btn_basic1"
				onclick="javascript:history.back(-1);">이전</button>
			<button type="button" class="btn_basic2" id="btnConfirm">다음</button>
		</div>
	</form>
</div>



<script>
	var code = ""; //이메일전송 인증번호 저장위한 코드
	/* 인증번호 이메일 전송 */
	$(".mail_check_button").click(function() {

		var email = $(".mail_input").val(); // 입력한 이메일
		var cehckBox = $(".mail_check_input"); // 인증번호 입력란
		var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스

		$.ajax({
			type : "GET",
			url : "/join/mailCheck?email=" + email,
			success : function(data) {
				//console.log("data : " + data);
				cehckBox.attr("disabled", false);
				boxWrap.attr("id", "mail_check_input_box_true");
				code = data;
			}
		});

	});
	/* 인증번호 비교 */
	$(".mail_check_input").blur(function() {

		var inputCode = $(".mail_check_input").val(); // 입력코드    
		var checkResult = $("#mail_check_input_box_warn"); // 비교 결과     

		if (inputCode == code) { // 일치할 경우
			checkResult.html("인증번호가 일치합니다.");
			checkResult.attr("class", "correct");
		} else { // 일치하지 않을 경우
			checkResult.html("인증번호를 다시 확인해주세요.");
			checkResult.attr("class", "incorrect");
		}

	});

	/* 유효성 검사 통과유무 변수 */
	var mailCheck = false; // 이메일

	$(document).ready(
			function() {
				//회원가입 버튼(회원가입 기능 작동)
				$(".join_button").click(
						function() {
							$(".join_button").click(
									function() {

										/* 입력값 변수 */
										var mail = $('.mail_input').val(); // 이메일 입력란

										/* 이메일 유효성 검사 */
										if (mail == "") {
											$('.final_mail_ck').css('display',
													'block');
											mailCheck = false;
										} else {
											$('.final_mail_ck').css('display',
													'none');
											mailCheck = true;
										}

										/* 최종 유효성 검사 */
										if (mailCheck) {
											$("#memberJoinForm").attr("action",
													"/join/mbshInformation");
											$("#memberJoinForm").submit();
										} else {
											consol.log("fail");
										}
										return false;
									});
						});
			});
	// 클릭시 email함수 호출
	$("#emailDubChkBtn").click(function() {
		email();
	});

	//직접입력을 눌러야만 입력창이 나오는 함수
	$("#emailDomainSel").click(function() {

		if ($("#emailDomainSel").val() == "06") {

			$("#emailDomain").show();
			console.log($("#emailDomain").val());
		} else {

			$("#emailDomain").hide();

		}

	})
</script>
<%@ include file="../common/Footer.jsp"%>