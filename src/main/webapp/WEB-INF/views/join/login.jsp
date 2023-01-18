<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>
<script type="text/javascript">
/* const Presenturl = new URL(window.location.href);
const urlParams = Presenturl.searchParams;
console.log("url: "+urlParams);
if(urlParams =="error=true"){
	document.getElementById("loginErr").style.display = "block";
	/* console.log("들어왓다");
	alert("사용자 ID 또는 비밀번호를 잘못 입력하셨습니다."); 
} */

/* if("${error eq 'yes'}"){
	console.log("에러");
	$("#login_warn").text("로그인 실패");
	$("#login_warn").css('color','red');
} */
console.log("error+ ${error}");
</script>
<main id="container" class="container">
<div class="pop_wrap">
	<h1 class="h1_type">로그인</h1>

	<div class="tab_view_box block" id="login01">
		<form id="frmIntgLgin" name="frmIntgLgin" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="join_form">
				<div class="join_row">
					<input type="text" id="custId" name="mid" placeholder="아이디"
						maxlength="20" style="ime-mode: inactive;" autocomplete="off">
				</div>
				<div class="join_row placeholder_wrap">
					<input type="password" id="custPwd" name="mpassword"
						placeholder="비밀번호" maxlength="100" autocomplete="off"
						onkeyup="f_enterLogin()">
				</div>
			</div>
			<div class="dang_type" id="loginErr">
			<c:if test="${error eq 'yes'}">
				<p class="d_txt" id="login_warn" style="color: red">아이디와 비밀번호를 다시 한번 확인해주세요</p>
			</c:if>
			</div>	

			<div class="id_save">
				<span class="checkbox small"> <input type="checkbox"
					name="saveId" id="umbSaveId" value="Y"> <label
					for="umbSaveId">아이디 저장</label>
				</span> 
				<span class="find_idpw"> 
					<a href="#;" id="aFindId">아이디찾기</a>
				</span>
			</div>
			<div class="btn_login">
				<button type="button" class="btn_basic2 big" id="login_button"
					href="javascript:f_loginCheck();">로그인</button>
			</div>
		</form>

	</div>

	<div class="txt_btn tl">
		<p>
			회원가입 시 더 많은 혜택이 제공됩니다.<a href="./termsAgree/" class="btn_basic1">회원가입</a>
		</p>
	</div>
</div>
</main>

<script>
	/* 로그인 버튼 클릭 메서드 */
	$("#login_button").click(function() {
		/* 로그인 메서드 서버 요청 */
		$("#frmIntgLgin").attr("action", "/join/login");
		$("#frmIntgLgin").submit();
	});

	function showFindID() {
		window.open("/join/findID.do", "a",
				"width=600, height=700, left=100, top=50");
	}

	function f_enterLogin() {
		if (window.event.keyCode == 13) {
			$("#frmIntgLgin").attr("action", "/join/login");
			$("#frmIntgLgin").submit();
		}
	}
	$(function() {

		fnInit();

	});

	function frm_check() {
		saveid();
	}

	function fnInit() {
		var cookieid = getCookie("saveid");
		console.log(cookieid);
		if (cookieid != "") {
			$("input:checkbox[id='saveId']").prop("checked", true);
			$('#mid').val(cookieid);
		}

	}

	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setTime(todayDate.getTime() + 0);
		if (todayDate > expiredays) {
			document.cookie = name + "=" + escape(value) + "; path=/; expires="
					+ expiredays + ";";
		} else if (todayDate < expiredays) {
			todayDate.setDate(todayDate.getDate() + expiredays);
			document.cookie = name + "=" + escape(value) + "; path=/; expires="
					+ todayDate.toGMTString() + ";";
		}

		console.log(document.cookie);
	}

	function getCookie(Name) {
		var search = Name + "=";
		console.log("search : " + search);

		if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
			offset = document.cookie.indexOf(search);
			console.log("offset : " + offset);
			if (offset != -1) { // 쿠키가 존재하면 
				offset += search.length;
				// set index of beginning of value
				end = document.cookie.indexOf(";", offset);
				console.log("end : " + end);
				// 쿠키 값의 마지막 위치 인덱스 번호 설정 
				if (end == -1)
					end = document.cookie.length;
				console.log("end위치  : " + end);

				return unescape(document.cookie.substring(offset, end));
			}
		}
		return "";
	}

	function saveid() {
		var expdate = new Date();
		if ($("#saveId").is(":checked")) {
			expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
			setCookie("saveid", $("#mid").val(), expdate);
		} else {
			expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
			setCookie("saveid", $("#mid").val(), expdate);

		}
	}
</script>
<%@ include file="../common/Footer.jsp"%>