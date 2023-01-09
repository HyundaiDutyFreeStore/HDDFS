<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
</script>
<script type="text/javascript">
$(function(){
	var option = '${qna.qcategory}';
	console.log("선택된 카테고리: "+option);
	var select = document.getElementById('largeClassificationCode');
	var len = select.options.length;
	for(var i=0; i<len; i++){
		if(select.options[i].value == option){
			select.options[i].selected=true;
		}
	}
});

$(document).ready(
		function() {
			
/* 			var option = ${qna.qcategory};
			console.log("선택된 카테고리: "+option);
			var select = document.getElementById('largeClassificationCode');
			var len = select.options.length;
			for(var i=0; i<len; i++){
				if(select.options[i].value == option){
					select.options[i].selected=true;
				}
			} */
			
		});
</script>

<div id="bodyWrap">
	<h3 class="cnts_title">
		<span>1:1 문의 하기</span>
	</h3>
	<div class="sub_container clearfix">
		<!-- lnbWrap -->
		<div class="iframe_lnb">
			<div class="lnb_wrap">
				<h4>
					<a href="/svcenter/submain">고객센터 <!-- 고객센터 --></a>
				</h4>
				<div class="lnb">
					<p>
						<a href="/ko/svcenter/notice">공지사항 <!-- 공지사항 --></a>
					</p>
					<p>
						<a href="/ko/svcenter/mantomaninquiry">1:1 문의 등록 <!-- 1:1 문의하기 --></a>
					</p>
					<p>
						<a href="/ko/svcenter/faq">FAQ <!-- FAQ; --></a>
					</p>
					<p>
						<a href="/ko/svcenter/mending">수선진행조회 <!-- 수선진행조회; --></a>
					</p>
					<p>
						<a href="/ko/footer/vocProvision">고객의 소리</a>
					</p>
					<!-- <p><a href="#;">APP 다운로드 소개</a></p> -->
					<dl>
						<dt>쇼핑 가이드</dt>
						<dd>
							<a href="/ko/svcenter/memberjoinguide">회원 가입</a>
						</dd>
						<dd>
							<a href="/ko/svcenter/theClubInfo">온라인 멤버십</a>
						</dd>
						<dd>
							<a href="/ko/svcenter/memberbenefitguide">한섬 VVIP 혜택</a>
						</dd>
						<dd>
							<a href="/ko/svcenter/pointguide">한섬마일리지 혜택</a>
						</dd>
						<dd>
							<a href="/ko/svcenter/couponguide">쿠폰</a>
						</dd>
						<dd>
							<a href="/ko/svcenter/paymentguide">주문/결제</a>
						</dd>
						<dd>
							<a href="/ko/svcenter/asguide">배송/교환/반품/AS</a>
						</dd>
					</dl>
				</div>
				<!-- ph_guide -->
				<div class="ph_guide">
					<p class="tlt">고객센터 운영 안내</p>
					<p class="phone">
						1800-5700<span style="color: #c69c6d;" class="txt">(유료)</span>
					</p>
					<p class="txt">
						평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span>
					</p>
					<a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com
					</a>
				</div>
				<!-- //ph_guide -->
			</div>
		</div>
		<!-- //lnbWrap -->
		<div class="sub_cnts">
			<div class="title_wrap mt30 clearfix">
				<h4 class="float_left">1:1 문의 등록</h4>
				<p class="reqd_txt">
					<strong class="reqd">*</strong> 표시는 필수항목입니다.
				</p>
			</div>
			<form id="manToManInquiryForm" name="formm"
				action="/ko/svcenter/mantomaninquiry?refererUrl=" method="post"
				enctype="multipart/form-data">
				<input type="hidden" id="mid" name="mid" value="${member.mid}">
				<input type="hidden" id="qid" name="qid" value="${qna.qid}">
				<fieldset>
					<legend>1:1 문의 입력</legend>
					<div class="tblwrap">
						<table class="tbl_wtype1">
							<caption>1:1 문의 입력</caption>
							<colgroup>
								<col style="width: 140px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><strong class="reqd">*</strong>문의 항목</th>
									<td class="storeQue">
										<p>더한섬닷컴 문의</p>
									</td>
								</tr>
								<tr>
									<th scope="row"><strong class="reqd">*</strong>문의 종류</th>
									<td><select id="largeClassificationCode" name="qcategory"
										title="대분류 선택" style="width: 160px">
											<option value="">분류</option>
											<option value="행사/이벤트">행사/이벤트</option>
											<option value="쿠폰/혜택문의">쿠폰/혜택문의</option>
											<option value="주문/확인취소">주문/확인취소</option>
											<option value="오프라인 문의">오프라인 문의</option>
											<option value="상품문의">상품문의</option>
											<option value="배송관련">배송관련</option>
											<option value="반품">반품</option>
											<option value="교환">교환</option>
											<option value="고객정보">고객정보</option>
											<option value="결제/환불문의">결제/환불문의</option>
											<option value="기타">기타</option>
									</select></td>
								</tr>
								<tr>
									<th scope="row"><strong class="reqd">*</strong>문의제목</th>
									<td><input type="text" id="subject" name="qtitle"
										title="문의제목" class="w_all" value="${qna.qtitle}"></td>
								</tr>
								<tr>
									<th scope="row"><strong class="reqd">*</strong>문의 내용<span
										class="com_txt_p">(2000자 이하)</span></th>
									<td>
										<!-- textarea --> <textarea id="contents" name="qcontent"
											title="문의내용" cols="30" rows="10"
											>${qna.qcontent}</textarea>
										<!-- //textarea -->
									</td>
								</tr>
								<!-- popup end -->

								<!-- 								<tr>
									<th scope="row" class="th_space">사진등록</th>
									<td>
										File upload
										<div class="file_upload">
											<input type="text" id="textManToManFile" class="text" title="파일 첨부하기"
												readonly="readonly" name="fileText">
											<div class="upload_btn">
												<button type="button" id="uploadFile" class="img_upload"
													title="파일찾기"><span>파일찾기</span></button>
													<input type="file" multiple id="mantomanFile" name="qimage"class="btn add_s" title="파일찾기">
											</div>
											
										</div>
										<p class="txt_guide">10MB 미만의 jpg,gif,png 파일만 첨부하실 수 있습니다.</p>
									</td>
								</tr> -->
							</tbody>
						</table>
						<!-- <div class="form_section_content">
							<input type="file" multiple id="fimage" name='fimage'
								style="height: 30px;">
							<div id="uploadResult"></div>
						</div> -->
					</div>
					<!-- btn -->
					<div class="btnwrap">
						<input type="button" id="cancleBtn" value="취소" class="btn wt"
							onclick="goback()"> <input type="button" id="registerBtn"
							value="수정" class="btn gray mr0" onclick="goModify()">
					</div>
					<!-- //btn -->
				</fieldset>
				<div>
					<input type="hidden" name="CSRFToken"
						value="3f7b0754-39ea-4600-a811-552ed37e132c">
				</div>
			</form>
			<ul class="bul_sty01_li mt60">
				<li>문의하신 내용에 대한 답변은 <a href="/qna/qnaMain"><em
						class="ft_point01">마이페이지 &gt; 1:1 문의내역</em></a>에서 확인하실 수 있습니다.
				</li>
			</ul>
		</div>
	</div>
</div>
<script>
	function goback() {
		location.href = '/qna/qnaMain';
	}

	function goModify() {
		if (document.formm.qcategory.value == "") {
			alert("문의 분야를 설정해주세요.");
			document.formm.depth1.focus();
		} else if (document.formm.qtitle.value == "") {
			alert("문의 제목을 입력해주세요.");
			document.formm.cntn.focus();
		} else if (document.formm.qcontent.value == "") {
			alert("문의 내용을 입력해주세요.");
			document.formm.cntn.focus();
		} else {
			document.formm.action = "/qna/qnaModify";
			document.formm.submit();
		}
	}

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>