<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>
<script type="text/javascript">
	
</script>
<main id="container" class="container">
<div class="pop_wrap">
	<h1 class="h1_type">로그인</h1>
	<div class="pop_content">
		<!-- S : H.Point통합회원 -->
		<div class="tab_view_box block" id="login01">
			<form id="frmIntgLgin" name="frmIntgLgin" method="post" action=""
				autocomplete="off">
				<div class="join_form">
					<div class="join_row">
						<input type="text" id="custId" name="custId" placeholder="아이디"
							onkeypress="javascript:noSpaceEvnt(event);" maxlength="20"
							style="ime-mode: inactive;" autocomplete="off">
					</div>
					<div class="join_row placeholder_wrap">
						<input type="password" id="custPwd" name="custPwd"
							placeholder="비밀번호" onkeypress="javascript:noSpaceEvnt(event);"
							maxlength="100" autocomplete="off">
					</div>
				</div>
				<div class="dang_type">
					<p class="d_txt" id="pError" style="display: none;"></p>
				</div>
				<div class="id_save">
					<span class="checkbox small"> <input type="checkbox"
						name="saveId" id="umbSaveId" value="Y"> <label
						for="umbSaveId">아이디 저장</label>
					</span> <span class="find_idpw"> <a href="#;" id="aFindId">아이디찾기</a>
					</span>
				</div>
				<div class="btn_login">
					<button type="button" class="btn_basic2 big" id="btnLgin1">로그인</button>
				</div>
			</form>

		</div>

		<div class="txt_btn tl">
			<p>
				회원가입 시 더 많은 혜택이 제공됩니다.<a href="./termsAgree/" class="btn_basic1">회원가입</a>
			</p>
		</div>

	</div>
</div>
</main>
<%@ include file="../common/Footer.jsp"%>