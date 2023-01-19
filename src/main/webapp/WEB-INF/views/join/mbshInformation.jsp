<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/Header.jsp"%>

<!--  <script type="text/javascript">
	$(
			function() {
				// 달력 설정
				$("#birth")
						.datepicker(
								{
									showOn : "button",
									buttonImage : SERVER_IMAGE
											+ "/images/KO/common/calendar.png",
									buttonImageOnly : true,
									dateFormat : "yy-mm-dd",
									buttonText : "Select date",
									changeYear : true,
									changeMonth : true,
									showOtherMonths : true,s
									monthNamesShort : [ "1", "2", "3", "4",
											"5", "6", "7", "8", "9", "10",
											"11", "12" ],
									dayNamesMin : [ "일", "월", "화", "수", "목",
											"금", "토" ],
									yearRange : "1900:+0"
								});
			})
</script>-->

<main id="container" class="container">
	<div class="container">
		<section>
			<div class="join_wrap ">
				<form id="frmMbshInformation" name="frmMbshInformation" method="post" action="/join/mbshInformation"
					onsubmit="return joinCheck();">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
							<input type="text" id="id" name="mid" value="" maxlength="20" class="id_input"
								required><label for="mbshId">아이디<span>(4~20자의
									영문 대소문자, 숫자만 사용)</span></label> <span class="id_input_re"></span>
						</div>

						<div class="join_row placeholder_wrap" id="divPwd">
							<input type="password" id="pw" name="mpassword" maxlength="20" required
								class="pw_input"><label for="mbshPwd">비밀번호<span>(8~20자
									이내 영문자, 숫자, 특수문자 3가지 조합)</span></label><span class="pw_input_re"></span>
						</div>

						<div class="join_row placeholder_wrap" id="divRePwd">
							<input type="password" id="pwc" class="pwck_input" maxlength="20" required> <label
								for="reMbshPwd"> 비밀번호 확인<span>(비밀번호와
									동일하게 입력)</span></label> <span class="pwck_input_re"></span>
						</div>

						<div class="join_row" id="divMbshHnglNm">
							<input type="text" id="name" name="mname" value="" placeholder="성명" maxlength="50"
								style="text-transform: uppercase;" required>
						</div>
						<div class="join_row blocks_tb select">
							<div class="join_row" id="divSexCd">
								<select name="mgender" class="sel_type" id="gender" required>
									<option value="성별">성별</option>
									<option value="남성">남성</option>
									<option value="여성">여성</option>
								</select>
							</div>
						</div>
						<!-- 					<div class="join_row"> -->
						<!-- 						<input type="text" id="birth" class="Datepicker" name="mbirth" -->
						<!-- 							class="datepicker" maxlength="10" placeholder="YYYY-MM-DD"> -->
						<!-- 					</div> -->

						<div class="join_row blocks2 type2" id="divMophNo">
							<div class="join_col w08 select">
								<select name="mphone_fir" class="sel_type" id="phone_fir" required>
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
								</select>
								<!-- 2020.10.30.추가함-->
								<input type="hidden" name="mphone_fir" value="82">
							</div>

							<div class="join_col w09">
								<input type="text" id="phone" name="mphone" placeholder="01000000000" required>
							</div>

						</div>
						<div class="join_row">
							<div class="join_cols" id="divMailAddr">
								<input type="text" id="email2" name="memail2" value="${email}" disabled>
								<input type="hidden" id="email" name="memail" value="${email}"/>
							</div>
						</div>

						<div class="basic_btn_box mgtsm">
							<button type="button" class="btn_basic1" onclick="javascript:history.back(-1);">이전</button>
							<button type="submit" id="join_button" class="btn_basic2">가입</button>
						</div>
					</div>

				</form>
			</div>
		</section>
	</div>
</main>

<script>
	/* 유효성 검사 통과유무 변수 */
	let idCheck = false; // 아이디
	let pwCheck = false; // 비번
	let nameCheck = false; // 이름
	let genderCheck = false; // 성별
	let phoneCheck = false; // 전화번호

	const idreg = /^[a-zA-Z0-9]{4,20}$/; // 아이디 제약사항 정규식
	const pwreg = /^(?=.[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/; // 비밀번호 제약사항 정규식
	$(document).ready(
		function () {
			//회원가입 버튼(회원가입 기능 작동)
			$("#join_button").click(
				function () {
					var name = $('#name').val(); // 이름 입력란
					var gender = $('#gender option:selected').val();
					var phone = $("#phone").val();

					/* 입력값 변수 */
					if (idCheck == false) {
						alert("아이디를 확인해주세요.")
					} else {
						idCheck = true;
						if (pwCheck == false) {
							alert("비밀번호를 확인해주세요.")
						} else {
							pwCheck = true;
							if (name == '') {
								nameCheck = false;
								alert("이름을 입력해주세요.");
							} else {
								nameCheck = true;
								if (gender == '성별') {
									alert("성별을 선택해주세요");
									genderCheck = false;

								} else {
									genderCheck = true;
									if (phone == '') {
										alert("전화번호를 입력해주세요.")
										phoneCheck = false;
										event.preventDefault();
									} else {
										phoneCheck = true;
									}
								}

							}
							/* 최종 유효성 검사 */
							if (idCheck && pwCheck && nameCheck &&
								genderCheck) {
								$("#join_form").attr("action",
									"/join/frmMbshInformation");
								$("#memail").attr("diabled",
								"false");
								$("#join_form").submit();
							} else {

							}
						}
					}

				});
		});

	//아이디 중복검사
	$('#id').blur(function () {

		if ($('#id').val() == '') {
			$('.id_input_re').text('아이디을 입력해주세요.');
			$('.id_input_re').css('color', 'red');
			idCheck = false;
		} else if ($('#id').val().length < 4 || $('#id').val().length > 20) {
			$('.id_input_re').text('아이디는 4~20자 이내로 입력해주세요.');
			$('.id_input_re').css('color', 'red');
			idCheck = false;
		} else {
			if (idreg.test($(this).val())) {
				console.log("아이디" + idreg.test($(this).val()));
				$('.id_input_re').text('');

				var mid = $('.id_input').val(); // .id_input에 입력되는 값
				var data = {
					mid: mid
				} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
				$.ajax({
					type: "post",
					url: "/join/memberIdChk",
					data: data,
					success: function (result) { // console.log("성공 여부" + result);
						if (result != 'fail') {
							$('.id_input_re').text("사용 가능한 아이디 입니다.");
							$('.id_input_re').css('color', 'blue');
							// 아이디 중복이 없는 경우
							idCheck = true;
						} else {
							$('.id_input_re').text("중복된 아이디 입니다.");
							$('.id_input_re').css('color', 'red');
							// 아이디 중복된 경우
							idCheck = false;
						}
					}
				});

			} else {
				$('.id_input_re').text("규칙에 맞게 입력해 주세요.");
				idCheck = false;
			}
		}
	});

	/* 비밀번호 확인 일치 유효성 검사 */
	$('#pw').blur(
		function () {
			if (pwreg.test($(this).val())) {
				console.log("비밀번호" + pwreg.test($(this).val()));
				$('.pw_input_re').text('');
				$('.pwck_input').on(
					"propertychange change keyup paste input",
					function () {
						var pw = $('.pw_input').val();
						var pwck = $('.pwck_input').val();
						if (pw == pwck) {
							$('.pwck_input_re').text('비밀번호가 일치합니다.');
							$('.pwck_input_re').css('color', 'blue');
							pwCheck = true;
						} else {
							$('.pwck_input_re')
								.text("비밀번호가 일치하지 않습니다.");
							$('.pwck_input_re').css('color', 'red');
							pwCheck = false;
						}
					});

			} else {
				console.log("비밀번호" + pwreg.test($(this).val()));
				$('.pw_input_re').text('비밀번호를 확인해주세요');
				$('.pw_input_re').css('color', 'red');
				pwCheck = false;
			}
		});
</script>

<%@ include file="../common/Footer.jsp"%>