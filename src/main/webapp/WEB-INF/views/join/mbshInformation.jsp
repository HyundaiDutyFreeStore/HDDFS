<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/Header.jsp"%>
<script type="text/javascript">
	
</script>
<main id="container" class="container">
<div class="container">
	<section>
		<div class="join_wrap ">
			<form method="post" id="frmMbshInformation" name="frmMbshInformation"
				action="/join/mbshInformation">

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
						<input type="text" id="id" name="mid" maxlength="20" required
							class="id_input">아이디<span>(4~20자의 영문 대소문자, 숫자만 사용)</span>
						<span class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
							class="id_input_re_2">아이디가 이미 존재합니다.</span> <span
							class="final_id_ck">아이디를 입력해주세요.</span>
					</div>

					<div class="join_row placeholder_wrap" id="divPwd">
						<input type="password" id="pw" name="mpassword" maxlength="20"
							required class="pw_input">비밀번호<span>(8~20자 이내 영문자,
							숫자, 특수문자 3가지 조합)</span>
					</div>

					<div class="join_row placeholder_wrap" id="divRePwd">
						<input type="password" id="pwc" required class="pwck_input"
							maxlength="20"> 비밀번호 확인<span>(비밀번호와 동일하게 입력)</span>
					</div>

					<div class="join_row blocks_tb select">
						<div class="join_row" id="divSexCd">
							<select name="mgender" class="sel_type" id="gender">
								<option value="">성별</option>
								<option value="남성">남성</option>
								<option value="여성">여성</option>
							</select>
						</div>
					</div>

					<div class="join_row">

						<div class="join_cols" id="divMailAddr">
							<input type="text" id="email" name="memail" value="${email}">
						</div>
					</div>

					<div class="join_row blocks2 type2" id="divMophNo">
						<div class="join_col w08 select">
							<select class="sel_type">
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
						</div>

						<div class="join_col w09">
							<input type="text" id="phone" name="mphone" value="01012345678">
						</div>

					</div>

					<div class="join_row" id="divMbshHnglNm">
						<input type="text" id="name" name="mname" required
							placeholder="성명" maxlength="50"
							style="text-transform: uppercase;">
					</div>

					<div class="basic_btn_box mgtsm">
						<button type="button" class="btn_basic1"
							onclick="javascript:history.back(-1);">이전</button>
						<button onclick="javascript:please();" id="join_button"
							class="btn_basic2">가입</button>
					</div>
				</div>
			</form>
		</div>
	</section>
</div>
</main>

<script>
	//회원가입 버튼(회원가입 기능 작동)
	function please() {
		console.log("please");
		$("#frmMbshInformation").attr("action", "/join/mbshInformation");
		$("#frmMbshInformation").submit();
	};

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