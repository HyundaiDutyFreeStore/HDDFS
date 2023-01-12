<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/Header.jsp"%>
<script type="text/javascript">
	
</script>
<main id="container" class="container">
<div class="container">
	<section>
		<div class="join_wrap ">
			<form id="frmMbshInformation" name="frmMbshInformation" method="post"
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
							required class="pw_input"
							onkeypress="javascript:noSpaceEvnt(event);"><label
							for="mbshPwd">비밀번호<span>(8~20자 이내 영문자, 숫자, 특수문자
								3가지 조합)</span></label>
					</div>

					<div class="join_row placeholder_wrap" id="divRePwd">
						<input type="password" id="pwc" required class="pwck_input"
							maxlength="20" onkeypress="javascript:noSpaceEvnt(event);">
						<label for="reMbshPwd"> 비밀번호 확인<span>(비밀번호와 동일하게
								입력)</span></label>
					</div>

					<div class="join_row" id="divMbshHnglNm">
						<input type="text" id="name" name="mname" value=""
							placeholder="성명" maxlength="50"
							style="text-transform: uppercase;"
							onkeypress="javascript:noSpaceEvnt(event);">
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
						<input type="text" id="birth" class="noHasDatepicker"
							name="mbirth" value="" placeholder="생년월일(YYYY-MM-DD)"
							class="datepicker" maxlength="10">
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
							<input type="text" id="phone_sec" name="mphone_sec"
								value="01012345678">
						</div>

					</div>
					<div class="join_row">
						<div class="join_cols" id="divMailAddr">
							<input type="text" id="mailAddr1" name="mbshBase[mailAddr]"
								value="" placeholder="이메일" disabled>
						</div>
					</div>
				</div>

			</form>
		</div>
	</section>
</div>
</main>

<%@ include file="../common/Footer.jsp"%>