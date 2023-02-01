<!-- 여권정보 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hyundai.dutyfree.vo.OrderItemListVO" %>
<%@ page import="com.hyundai.dutyfree.vo.OrderItemVO" %>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>

<main id="container" class=""> <script type="text/javascript">
</script>

<article id="content">
	<section class="cart_wrap">
		<input type="hidden" id="checkedCartSeq" value=""> <input
			type="hidden" id="checkedCartSetId" value=""> <input
			type="hidden" id="buyNow" value=""><input type="hidden"
			id="buyNowSetGoosId" value=""><input type="hidden"
			id="chkPspt" value="0"> <input type="hidden" id="chkDpat"
			value="0"> <input type="hidden" id="buyNowType" value="">
		<input type="hidden" id="buyNowOnlnGoosCdList" value=""> <input
			type="hidden" id="adtAucaYn" value="N">
		<ul class="title_tab">
			<li style="color: black">장바구니</li>
			<li class="on" id="tabDpat">여권정보</li>
			<li style="color: black">출국정보</li>
			<li style="color: black">주문결제</li>
		</ul>
		<div class="cart_contens">
			<div class="cont_left" id="CART" style="display: none;">

				<input type="hidden" id="cartListLength" value="3"> <input
					type="hidden" id="cartSetListLength" value="0">

				<div class="sorting_wrap">
					<div class="txt_total"></div>
				</div>
			</div>
			<div class="cont_left" id="TAB" style="display: block;">

				<input type="hidden" id="oldPsptNo" value=""> <input
					type="hidden" id="oldMbshEngLstnm" value=""> <input
					type="hidden" id="oldMbshEngFstnm" value=""> <input
					type="hidden" id="mbshPsptInfo" value="0"> <input
					type="hidden" id="oldPsptExpiDt" value="">
				<div class="passport_wrap">
					<a href="javascript:void(0);" class="tit_guide has_onoff"
						id="guidePspt" onclick="guidePspt();">여권정보 등록가이드</a>
					<div class="guide_wrap">
						<div class="guide_cont">
							<div class="guide_img">
								<img
									src="https://cdn.hddfs.com/front/images/KO/temp/passport_img.png"
									alt="여권정보 입력안내">
							</div>
							<div class="guide_info">
								<dl>
									<dt>내국인 여권번호 유형</dt>
									<dd>
										영문 1자리 + 숫자 8자리 예) M 01234567<br>영문 2자리 + 숫자 7자리 예) JR
										123467<br>숫자 7자리 예) M01234567<br>관용여권 : S숫자 7자리 예) S
										1234567
									</dd>
								</dl>
								<dl>
									<dt>외국인 여권번호 유형</dt>
									<dd>국적이 일본일 때는 9자리까지 허용 그 외 16자리까지 허용</dd>
								</dl>
								<dl>
									<dt>영문 성명</dt>
									<dd>'-' 제외하고 붙여서 기입하셔야 합니다. 성(Last Name), 이름(First
										Name)순으로 입력하시기 바랍니다. 예) HONG GILDONG / 홍 길동</dd>
								</dl>
								<dl>
									<dt>여권 만료일</dt>
									<dd>기간이 만료된 구 여권의 경우 상품인도를 하시지 못할 수 있으니 신규 발급받으신 여권으로
										입력하셔야 합니다.</dd>
								</dl>
								<dl>
									<dt>오프라인 매장 이용</dt>
									<dd>여권번호 미입력시 오프라인 매장에서 구매가 불가하오니 오프라인 이용을 원하시는 고객님은 여권번호를
										입력해주시기 바랍니다.</dd>
								</dl>
							</div>
						</div>
					</div>
					<form id="enrollPassport" name="enrollPassport" method="post"
						action="/order/enrollPassport">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" id="mId" name="mId" value="${mid}" >
						<input type="hidden" id="mhdiscount" name="mhdiscount" value="${mhdiscount }"/>
						<input type="hidden" id="cartcounttotal" name="cartcounttotal" value="${cartcounttotal }"/>
						<input type="hidden" id="totalGoosUsdinput" name="totalGoosUsdinput"value=""/>
						<input type="hidden" id="totalDcUsdinput" name="totalDcUsdinput" value=""/>
						<input type="hidden" id="cartstockinput" name="cartstockinput" value=""/>
						<div class="form_wrap">
							<ul class="form_lsit">
								<li>
									<p class="f_ti">한글성명</p> <span class="input_de"><input
										type="text" id="mName" name="mName"
										 value="${member.mname }" disabled="disabled"></span>
								</li>
								<li>
									<p class="f_ti">성별</p> <span class="input_de"><input
										type="text" id="mGender" name="mGender" value="${member.mgender }"
										disabled="disabled"></span>
								</li>
								<li>
									<p class="f_ti">생년월일</p> <span class="input_de datepicker_box">
										<input
											type="text" id="mBirth" name="mBirth" value=""
											placeholder="YYYY-MM-DD"
											src="https://cdn.hddfs.com/front/images/KO/common/ic_calendar.png" />
								</span>


								</li>
								<li>
									<p class="f_ti">국적</p> <span class="input_de"><select
										id="mNationality" name="mNationality">
											<option value="">선택</option>
											<option value="한국">한국</option>
											<option value="미국">미국(미국내경유포함)</option>
											<option value="캐나다">캐나다</option>
											<option value="호주">호주</option>
											<option value="인도">인도</option>
											<option value="일본">일본</option>
											<option value="피지">피지</option>
											<option value="뉴질랜드">뉴질랜드</option>
											<option value="EU국가">EU국가</option>
											<option value="말레이지아">말레이지아</option>
											<option value="두바이">UAE(두바이)</option>
											<option value="마카오">마카오</option>
											<option value="그외국가">그외국가</option>
									</select>
								</span>
								</li>
								<li>
									<p class="f_ti ico_compulsory">Last Name 성</p> <span
									class="input_de"> <input type="text" id="mbshEngLstnm"
										name="mLastname" class="input_passport"
										onkeypress="javascript:noSpaceEvnt(event);" value=""
										placeholder="영문 성을 공백없이 입력해주세요">
								</span>
								</li>
								<li>
									<p class="f_ti ico_compulsory">First Name 이름</p> <span
									class="input_de"> <input type="text" id="mbshEngFstnm"
										name="mFirstname" class="input_passport"
										onkeypress="javascript:noSpaceEvnt(event);" value=""
										placeholder="영문 이름을 공백없이 입력해주세요">
								</span>
								</li>
								<li>
									<p class="f_ti ico_compulsory">여권번호</p> <span class="input_de">
										<input type="text" id="psptNo" name="mPsptno"
										class="input_passport"
										onkeypress="javascript:noSpaceEvnt(event);" value=""
										placeholder="여권번호를 입력해주세요">
								</span>
								</li>
								<li>
									<p class="f_ti ico_compulsory">여권기간만료일</p> <span
									class="input_de datepicker_box"><input
											type="text" id="mPsptexdit" name="mPsptexdit" value=""
											placeholder="YYYY-MM-DD"
											src="https://cdn.hddfs.com/front/images/KO/common/ic_calendar.png" />
									</span>
										<div class="form_txt_comment"></div>
								</li>
							</ul>
							<div class="btn_area">
								<a href="javascript:void(0);" class="btnxl_type type2"
									id="btnInptMbshPwdPop" onclick="savePassPort();">저장</a>
							</div>
					</form>
					<div class="attention_area">
						<p class="attention_tit">유의사항</p>
						<ul class="attention_list">
							• 주문 완료한 주문건의 여권정보 변경은 이 페이지에서 변경되지 않으므로, 변경을 원하시면 출국 3일전까지 고객센터로
							문의 부탁드립니다.
							<br> • 여권 영문 성명에서 First Name은 붙여서 입력해주셔야 합니다.
							<br> • 주문서에 기재된 여권번호와 상품 인도 시 제시한 여권번호가 일치한 경우에만 상품 인도가
							가능합니다.
							<br> • 유효기간이 만료되거나 유효기간이 6개월 미만으로 남은 여권으로 구매하신&nbsp;경우 상품
							인도가 불가합니다.
						</ul>
					</div>
				</div>

				<script type="text/javascript">
				
				
				function isvalueEmpty(){
					if($('#mBirth').val()==''){
						alert('생년월일을 입력해주세요.');
						return false;
					}else if($('#mNationality').val()==''){
						alert('국적을 입력해주세요.');
						return false;
					}else if($('#mbshEngLstnm').val()==''){
						alert('성을 입력해주세요.');
						return false;
					}else if($('#mbshEngFstnm').val()==''){
						alert('이름을 입력해주세요.');
						return false;
					}else if($('#psptNo').val()==''){
						alert('여권번호를 입력해주세요.');
						return false;
					}else if($('#psptNo').val().length!=9){
						alert('여권번호형식이 맞지 않습니다.');
						return false;
					}else if($('#mPsptexdit').val()==''){
						alert('여권기간만료일을 입력해주세요.');
						return false;
					}else{
						return true;
					}
					
				}
				
				
				function guidePspt() {
					if ($("#guidePspt").hasClass("on")) {
						$("#guidePspt").removeClass("on");
					} else {
						$("#guidePspt").addClass("on");
					}
				}
				function savePassPort(){
					var pass=isvalueEmpty();
					if(pass){
					 $("#mName").attr("disabled", false);
					 $("#mGender").attr("disabled",false); 
					$("#enrollPassport").submit();
					}
				}
				
				$(function() {
				    //input을 datepicker로 선언
				    $("#mPsptexdit").datepicker({
				        dateFormat: 'yy-mm-dd' //달력 날짜 형태
				        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
				        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
				        ,changeYear: true //option값 년 선택 가능
				        ,changeMonth: true //option값  월 선택 가능                
				        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
				        ,buttonImage: "https://cdn.hddfs.com/front/images/KO/common/ic_calendar.png" //버튼 이미지 경로
				        ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
				        ,buttonText: "선택" //버튼 호버 텍스트              
				        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
				        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
				        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
				        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
				        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
				        ,minDate: 'today'
				    });                    
				    
				    //초기값을 오늘 날짜로 설정해줘야 합니다.
				    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
				});
				$(function() {
				    //input을 datepicker로 선언
				    $("#mBirth").datepicker({
				        dateFormat: 'yy-mm-dd' //달력 날짜 형태
				        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
				        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
				        ,changeYear: true //option값 년 선택 가능
				        ,changeMonth: true //option값  월 선택 가능                
				        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
				        ,buttonImage: "https://cdn.hddfs.com/front/images/KO/common/ic_calendar.png" //버튼 이미지 경로
				        ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
				        ,buttonText: "선택" //버튼 호버 텍스트              
				        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
				        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
				        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
				        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
				        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
				        ,yearRange: "1930:2023"
				        ,maxDate: 'today'
				    });                    
				    
				    //초기값을 오늘 날짜로 설정해줘야 합니다.
				    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
				});
				
				
				</script>

				<script type="text/javascript">
					
					$(document)
							.ready(
									function() {
										<% 
										
										List<OrderItemVO> list = (List<OrderItemVO>)request.getAttribute("orderitemlist");

										for(int i=0;i<list.size();i++){ 
										%>
										 var pcode=<%=list.get(i).getPcode() %>;
										 var oamount=<%=list.get(i).getOamount() %>
										 var index=<%=i%>;
										 
										$('#enrollPassport').append('<input name="orderitem['+index+'].pcode" type="hidden" value="'+pcode +'">');
										$('#enrollPassport').append('<input name="orderitem['+index+'].oamount" type="hidden" value="'+oamount+'">');
										$('#enrollPassport').append('<input name="orderitem['+index+'].oid" type="hidden" value="">');
										
										<%
										}
										%>
										$(".totalGoosUsd").text("$"+ priceComma(parseFloat("${cartprice}").toFixed(2)));
										$(".totalGoosKrw").text(priceComma((parseFloat("${cartprice}") * parseFloat("${KRW_WON}")).toFixed(0))+ "원");
										$(".sale.totalDcUsd").text("$"+ priceComma(parseFloat("${cartdis}").toFixed(2)));
										$(".sale.totalDcKrw").text(priceComma((parseFloat("${cartdis}") * parseFloat("${KRW_WON}")).toFixed(0))+ "원");
										$(".sumGoosQty").text("${cartcounttotal}");
										$(".payTotalSettUsd").text("$"+ priceComma(((parseFloat("${cartprice}") - parseFloat("${cartdis}"))).toFixed(2)));
										$(".payTotalSettKrw").text(priceComma(((parseFloat("${cartprice}") * parseFloat("${KRW_WON}")) - (parseFloat("${cartdis}") * parseFloat("${KRW_WON}"))).toFixed(0))+ "원");
										$('#totalGoosUsdinput').attr('value',"${cartprice}");
										$('#totalDcUsdinput').attr('value',"${cartdis}");
										$('#cartstockinput').attr('value',"${cartstock}");
										$('.totalRsvgDcKrw').text(priceComma((((parseFloat("${cartprice}") * parseFloat("${KRW_WON}")) - (parseFloat("${cartdis}") * parseFloat("${KRW_WON}")))*parseFloat("${mhdiscount}")).toFixed(0))+"원");
										$('.totalRsvg').text("${mhdiscount}"+"%");
									});

					function priceComma(price) {
						return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					}
					
				
				</script>
			</div>
			<div class="cont_right" style="height: 415.333px;">
				<div class="pay_table">
					<div class="pay_tit">예상주문금액</div>
					<div class="pay_list">
						<dl>
							<dt>주문금액합계</dt>
							<dd>
								<strong class="totalGoosUsd">$</strong> <span
									class="totalGoosKrw">원</span>
							</dd>
						</dl>
						<dl>
							<dt>예상할인금액</dt>
							<dd>
								<strong class="sale totalDcUsd">$</strong> <span
									class="sale totalDcKrw">원</span>
							</dd>
						</dl>
						<dl id="totalRsvgDcKrwDl" style="">
							<dt>적립금</dt>
							<dd>
								<strong class="totalRsvgDcKrw">0원</strong> <span
									class="totalRsvg">0.0%</span>
							</dd>
						</dl>
						<dl class="total_pay">
							<dt>
								총 <strong class="sumGoosQty">1</strong>개
							</dt>
							<dd>
								<strong class="payTotalSettUsd">$</strong> <span
									class="payTotalSettKrw">원</span>
							</dd>
						</dl>
					</div>
					<div class="pay_btm" style="display: none;">
						<div class="pay_check">
							<span class="chk"> <input type="checkbox"
								id="rost_cart_chk1" onchange="setRostUSettAmt();"> <label
								for="rost_cart_chk1">품절포함</label>
							</span>
							<div class="square_tooltip">
								<a href="javascript:void(0);" class="btn btn_tooltip">도움말</a>
								<div class="tooltip type02" style="display: none;">
									<p class="ti">품절포함 안내</p>
									<ul class="dot_list_new">
										<li>장바구니에 담긴 품절상품이 전체가 주문금액 합계에 포함되어 계산됩니다.</li>
										<li>실제 주문 시에는 품절상품은 포함되지 않습니다.</li>
									</ul>
									<button class="close">닫기</button>
								</div>
							</div>
						</div>
						<div class="pay_btns">
							<input type="hidden" id="aucaType" value="">
							<div class="square_tooltip maxprice">
								<button class="btnxl_type1 btnico btn_view_rv"
									onclick="maxDcAmtInfo();" disabled="disabled">
									<em class="ico_sale">적림금 혜택 엿보기 </em>
									<div class="info_reserve">적립금 혜택 엿보기</div>
									<!--//2022-04-19 추가-->
								</button>
								<div class="tooltip" id="maxSvmtInfoPop" style="display: none;">
									<p class="ti">적립금 혜택 엿보기</p>
									<ul class="dl_price"></ul>
									<button class="close" onclick="closeMaxDcPrc();">닫기</button>
								</div>
							</div>
							<a href="javascript:void(0);" class="btnxl_type1"
								onclick="goOrder();">주문하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="totop" style="display: none;">
		<a href="#none">처음으로 이동</a>
	</div>
</article>


<div id="changeSetGoosQtyList"></div>
<div id="layer_unit_pspt" class="layer_unit pop_o1" title="여권 정보 안내"></div>
<div id="layer_unit_dpat" class="layer_unit pop_o1" title="출국 정보 안내"></div>

<script type="text/javascript">
	function goosDetail(goosCd) {
		setCookie('ADULT_GOOSCD', goosCd);
		openPopup('', 'cartGoosCdDetail', goosCd, '', '', '', '', '');
	}
</script> </main>
<%@ include file="../common/Footer.jsp"%>