<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/Header.jsp"%>
<main id="container" class="container">

<form method="post" name="qr" id="qr" action="/order/qr">
	<div class="qrtest">
		<input type="text" id="qr" name=qr placeholder="qr입력" maxlength="20">
	</div>
	<div class="btn_login">
		<button type="button" class="btn_basic2 big" id="qr_button">로그인</button>
	</div>
</form>

<script>
	/* 로그인 버튼 클릭 메서드 */
	$("#qr_button").click(function() {
		/* 로그인 메서드 서버 요청 */
		$("#qr").attr("action", "/order/qr");
		$("#qr").submit();
	});
</script> <%@ include file="../common/Footer.jsp"%>