<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>
<script type="text/javascript">
	
</script>

<style>
.input {
	width: 540px;
	left: 25%;
}

.chdiv {
	position: relative;
	top: 21px;
	left: 25%;
}

.chdiv {
	position: relative;
	top: 14px;
	left: 25%;
}

.join {
	position: relative;
	top: 14px;
	left: 490px;
	font-size: 14px;
	font-weight: bold;
}

.btnlog {
	position: relative;
	top: 7px; width : 540px;
	height: 60px;
	font-size: 16px;
	color: #ffffff !important;
	border: 1px solid #1b1e23;
	background-color: #1b1e23;
	width: 540px
}
</style>
<main id="container" class="container">
<div class="pop_wrap">
	<h1 class="h1_type" style="text-align: center; font-size: 50px;">로그인</h1>
	<div class="pop_content">
		<!-- S : H.Point통합회원 -->
		<div class="tab_view_box block" id="login01">
			<form id="frmIntgLgin" name="frmIntgLgin" method="post"
				autocomplete="off">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<div class="join_form">
					<div class="join_row input">
						<input type="text" id="custId" name="mid" placeholder="아이디"
							onkeypress="javascript:noSpaceEvnt(event);" maxlength="20"
							style="ime-mode: inactive;" autocomplete="off">
					</div>
					<div class="join_row placeholder_wrap input" style="top: 7px;">
						<input type="password" id="custPwd" name="mpassword"
							placeholder="비밀번호" onkeypress="javascript:noSpaceEvnt(event);"
							maxlength="100" autocomplete="off">
					</div>
					<c:if test="${error eq 'yes'}">
						<span class="chdiv" id="login_warn" style="color: red">아이디와
							비밀번호를 다시 한번 확인해주세요</span>
					</c:if>


				</div>
				<div class="dang_type" id="loginErr">
					<%-- <c:if test="${error eq 'yes'}">
					<p class="d_txt" id="login_warn" style="color: red">아이디와 비밀번호를 다시 한번 확인해주세요</p>
				</c:if> --%>
				</div>
				<!-- <div class="id_save">
					<span class="checkbox small"> <input type="checkbox"
						name="saveId" id="umbSaveId" value="Y"> <label
						for="umbSaveId">아이디 저장</label>
					</span> <span class="find_idpw"> <a href="#;" id="aFindId">아이디찾기</a>
					</span>
				</div> -->
				<div class="chdiv">
					<button type="button" class="btnlog" id="btnLgin1">로그인</button>
				</div>
			</form>

		</div>

		<div class="chdiv">
			<p>
				<a href="/join/termsAgree" class="join">회원가입</a>
			</p>
		</div>

	</div>
</div>
</main>
<script>
	$("#btnLgin1").click(function() {
		/* 로그인 메서드 서버 요청 */
		$("#frmIntgLgin").attr("action", "/join/login");
		$("#frmIntgLgin").submit();
	});
	function f_enterLogin() {
		if (window.event.keyCode == 13) {
			$("#frmIntgLgin").attr("action", "/join/login");
			$("#frmIntgLgin").submit();
		}
	}
</script>
<%@ include file="../common/Footer.jsp"%>