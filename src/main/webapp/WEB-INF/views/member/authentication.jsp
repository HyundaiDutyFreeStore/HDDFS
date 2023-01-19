<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>



<script type="text/javascript">

		
</script>

<style>
.child {
	position: relative;
	top: 7px;
}

.checkposition {
	position: relative;
	top: 20px;
}
</style>
<main id="container" class="container">
	<div class="container">
		<section>
			<div class="join_wrap ">
				<form id="frmLocalAuthentication" name="frmLocalAuthentication" method="get" action="">
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
					<div class="join_row blocks type2">
						<div class="join_form clearfix">

							<div class="join_col w06">
								<input type="text" id="email_fir" name="email_fir" value="" placeholder="이메일"
									maxlength="30">
							</div>
							<div class="join_col w14 select">
								<select name="email_sec" class="sel_type" id="email_sec" style="display: none;">
									<option value="@naver.com">@naver.com</option>
									<option value="@daum.net">@daum.net</option>
									<option value="@gmail.com">@gmail.com</option>
									<option value="@yahoo.co.kr">@yahoo.co.kr</option>
									<option value="@lycos.co.kr">@lycos.co.kr</option>
									<option value="@nate.com">@nate.com</option>
									<option value="@empas.com">@empas.com</option>
									<option value="@hotmail.com">@hotmail.com</option>
									<option value="@msn.com">@msn.com</option>
									<option value="@hanmir.com">@hanmir.com</option>
									<option value="@chol.net">@chol.net</option>
									<option value="@korea.com">@korea.com</option>
									<option value="@netsgo.com">@netsgo.com</option>
									<option value="@dreamwiz.com">@dreamwiz.com</option>
									<option value="@hanafos.com">@hanafos.com</option>
									<option value="@freechal.com">@freechal.com</option>
									<option value="@hitel.net">@hitel.net</option>
								</select>
							</div>
							<div class="join_col join_btn ">
								<button type="button" class=" btn_basic2 small mail_check_button"
									id="btnSend" disabled>인증번호 발송</button>
							</div>
						</div>
						<span class="mail_input_re"></span>
					</div>

					<div class="join_row blocks type2 join_time">
						<div class="join_col w06 child" id="mail_check_input_box_false">
							<input class="mail_check_input" type="number" placeholder="인증번호" maxlength="30">
						</div>
						<span id="email_issue" class="checkposition"></span>
					</div>
					<div id="mail_check_input_box_warn" style="margin-top: 13px; margin-left: 10px;"></div>

					<div class="rebtn_warp2">
						<div class="txt_wrap">
							<span class="p_dot_list txt" id="spanError2" style="display: none;"> </span>
						</div>
					</div>
				</form>

				<div class="basic_btn_box mgtsm">
					<button type="button" class="btn_basic1" onclick="javascript:history.back(-1);">이전</button>
					<a class="btn_basic2" id="btnConfirm">다음</a>
				</div>
			</div>
		</section>
	</div>
</main>
<script>
$("#email_fir").blur(function () {
	if ($('#email_fir').val() == "") {
		alert("이메일을 입력해주세요.");
		event.preventDefault();
		return;
	} else {
		const email = $('#email_fir').val() + $('#email_sec').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email);
		 var btnSend = document.getElementById('btnSend');
		$.ajax({
			type: "GET",
			url: "/member/mailChk?mail=" + email,
			success: function (result) {
				if (result != 'fail') {
					console.log("메일중복아님");
					$('.mail_input_re').text("");
					btnSend.disabled = false;
				} else {	//메일중복
					$('.mail_input_re').text("중복된 메일 입니다.");
					$('.mail_input_re').css('color', 'red');
					//$(".btnSend").attr("disabled", false);
					btnSend.disabled = true;
				}
			}
		});
	}
}); 
	var code = ""; //이메일전송 인증번호 저장위한 코드
	/* 인증번호 이메일 전송 */
	$(".mail_check_button").click(function () {
		if ($('#email_fir').val() == "") {
			alert("이메일을 입력해주세요.");
			event.preventDefault();
			return;
		} else {
			const email_issue = $('#email_issue');
			email_issue.html("&nbsp;&nbsp;&nbsp;인증번호가 발급되었습니다.");
			email_issue.css("color", "green");
			const email = $('#email_fir').val() + $('#email_sec').val(); // 이메일 주소값 얻어오기!
			console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
			var cehckBox = $(".mail_check_input"); // 인증번호 입력란
			var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스

			$.ajax({
				type: "GET",
				url: "/member/mailCheck?email=" + email,
				success: function (data) {
					cehckBox.attr("disabled", false);
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;
				}
			});
		}
		

	});
	/* 인증번호 비교 */
	$(".mail_check_input").blur(function () {

		var inputCode = $(".mail_check_input").val(); // 입력코드    
		var checkResult = $("#mail_check_input_box_warn"); // 비교 결과     

		if (inputCode == '') {	//입력안했을경우
			checkResult.html("인증번호를 입력해 주세요");
			checkResult.css("color", "red");
			checkResult.attr("class", "incorrect");
		} else {
			if (inputCode == code) { // 일치할 경우
				checkResult.html("인증번호가 일치합니다.");
				checkResult.css("color", "blue");
				checkResult.attr("class", "correct");
			} else { // 일치하지 않을 경우
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.css("color", "red");
				checkResult.attr("class", "incorrect");
			}

		}
		

	});

	/* 유효성 검사 통과유무 변수 */

	$(document).ready(function () {
		$("#btnConfirm").click(function () {
			/* 입력값 변수 */
			var checkResult = $("#mail_check_input_box_warn").html();
			/* 이메일 유효성 검사 */
			if (checkResult == "인증번호가 일치합니다.") {
				mailCheck = true;
			} else {
				mailCheck = false;
			}

			/* 최종 유효성 검사 */
			if (mailCheck) {
				$("#frmLocalAuthentication").attr("action","/member/mbshInformation");
				$("#frmLocalAuthentication").submit();
			} else {
				alert("이메일 인증을 확인해주세요.")
			}
			return false;
		});
	});
</script>
<%@ include file="../common/Footer.jsp"%>