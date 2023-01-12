<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>
<script type="text/javascript">
	
</script>
<main id="container" class="container">
<div class="container">
	<section>
		<div class="join_wrap ">
			<form id="frmMbshInformation" name="frmMbshInformation"
				action="/join/mbshInformation" onsubmit="return joinCheck();">

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
						<input type="text" id="id" name="mid" value="" maxlength="20"
							class="id_input" oninput="checkId()"><label for="mbshId">아이디<span>(4~20자의
								영문 대소문자, 숫자만 사용)</span></label> <span class="id_input_re_1">사용 가능한
							아이디입니다.</span> <span class="id_input_re_2">아이디가 이미 존재합니다.</span> <span
							class="final_id_ck">아이디를 입력해주세요.</span>
					</div>

					<div class="join_row placeholder_wrap" id="divPwd">
						<input type="password" id="pw" name="mpassword" maxlength="20"
							required class="pw_input"><label for="mbshPwd">비밀번호<span>(8~20자
								이내 영문자, 숫자, 특수문자 3가지 조합)</span></label>
					</div>

					<div class="join_row placeholder_wrap" id="divRePwd">
						<input type="password" id="pwc" required class="pwck_input"
							maxlength="20"> <label for="reMbshPwd"> 비밀번호 확인<span>(비밀번호와
								동일하게 입력)</span></label>
					</div>

					<div class="join_row" id="divMbshHnglNm">
						<input type="text" id="name" name="mname" value=""
							placeholder="성명" maxlength="50"
							style="text-transform: uppercase;">
					</div>
					<div class="join_row blocks_tb select">
						<div class="join_row" id="divSexCd">
							<select name="mgender" class="sel_type" id="gender">
								<option value="">성별</option>
								<option value="1">남</option>
								<option value="2">여</option>
							</select>
						</div>
					</div>
					<div class="join_row">
						<input type="date" id="birth" class="noHasDatepicker"
							name="mbirth" class="datepicker" maxlength="10">
					</div>

					<div class="join_row blocks2 type2" id="divMophNo">
						<div class="join_col w08 select">
							<select name="mphone_fir" class="sel_type" id="phone_fir">
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
							<input type="text" id="phone" name="mphone" value="01012345678">
						</div>

					</div>
					<div class="join_row">
						<div class="join_cols" id="divMailAddr">
							<input type="text" id="email" name="memail"
								value="${member.email}" disabled>
						</div>
					</div>
					<div class="btnwrap">
						<input type="button" value="취소" class="btn wt" id="cancleBtn"
							onClick="javascript:history.back(-1);" />
						<button id="join_button" class="btn gray mr0">회원가입</button>

					</div>
				</div>

			</form>
		</div>
	</section>
</div>
</main>

<script>
	/* 유효성 검사 통과유무 변수 */
	var idCheck = false; // 아이디
	var idckCheck = false; // 아이디 중복 검사
	var pwCheck = false; // 비번
	var pwckCheck = false; // 비번 확인
	var pwckcorCheck = false; // 비번 확인 일치 확인
	var nameCheck = false; // 이름

	$(document).ready(
			function() {
				//회원가입 버튼(회원가입 기능 작동)
				$(".join_button").click(
						function() {
							/* 입력값 변수 */
							var id = $('.id_input').val(); // id 입력란
							var pw = $('.pw_input').val(); // 비밀번호 입력란
							var pwck = $('.pwck_input').val(); // 비밀번호 확인 입력란
							var name = $('.user_input').val(); // 이름 입력란

							/* 아이디 유효성검사 */
							if (id == "") {
								$('.final_id_ck').css('display', 'block');
								idCheck = false;
							} else {
								$('.final_id_ck').css('display', 'none');
								idCheck = true;
							}

							/* 비밀번호 유효성 검사 */
							if (pw == "") {
								$('.final_pw_ck').css('display', 'block');
								pwCheck = false;
							} else {
								$('.final_pw_ck').css('display', 'none');
								pwCheck = true;
							}
							/* 비밀번호 확인 유효성 검사 */
							if (pwck == "") {
								$('.final_pwck_ck').css('display', 'block');
								pwckCheck = false;
							} else {
								$('.final_pwck_ck').css('display', 'none');
								pwckCheck = true;
							}

							/* 이름 유효성 검사 */
							if (name == "") {
								$('.final_name_ck').css('display', 'block');
								nameCheck = false;
							} else {
								$('.final_name_ck').css('display', 'none');
								nameCheck = true;
							}

							/* 최종 유효성 검사 */
							if (idCheck && idckCheck && pwCheck && pwckCheck
									&& pwckcorCheck && nameCheck) {
								$("#join_form").attr("action",
										"/join/mbshInformation");
								$("#join_form").submit();
							}
							return false;
						});
			});
	//아이디 중복검사
	$('.id_input').on("propertychange change keyup paste input", function() {
		var mid = $('.id_input').val(); // .id_input에 입력되는 값
		var data = {
			mid : mid
		} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		$.ajax({
			type : "post",
			url : "/join/memberIdChk",
			data : data,
			success : function(result) {// console.log("성공 여부" + result);
				if (result != 'fail') {
					$('.id_input_re_1').css("display", "inline-block");
					$('.id_input_re_2').css("display", "none");
					// 아이디 중복이 없는 경우
					idckCheck = true;
				} else {
					$('.id_input_re_2').css("display", "inline-block");
					$('.id_input_re_1').css("display", "none");
					// 아이디 중복된 경우
					idckCheck = false;
				}
			}
		});
	});
	/* 비밀번호 확인 일치 유효성 검사 */

	$('.pwck_input').on("propertychange change keyup paste input", function() {

		var pw = $('.pw_input').val();
		var pwck = $('.pwck_input').val();
		$('.final_pwck_ck').css('display', 'none');

		if (pw == pwck) {
			$('.pwck_input_re_1').css('display', 'block');
			$('.pwck_input_re_2').css('display', 'none');
			pwckcorCheck = true;
		} else {
			$('.pwck_input_re_1').css('display', 'none');
			$('.pwck_input_re_2').css('display', 'block');
			pwckcorCheck = false;
		}

	});
</script>

<%@ include file="../common/Footer.jsp"%>