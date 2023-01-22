<!-- 출국정보 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/Header.jsp"%>
<%@ page import="com.hyundai.dutyfree.vo.OrderItemListVO"%>
<%@ page import="com.hyundai.dutyfree.vo.OrderItemVO"%>
<%@ page import="java.util.*"%>
<main id="container" class=""> <script type="text/javascript">

</script>

<form id="selfReplace"
	action="https://www.hddfs.com/shop/or/order/listCart.do" method="post">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" /> <input id="selfReplaceCartCd" type="hidden"
		name="cartCd" value=""> <input id="selfReplaceScrollMove"
		type="hidden" name="scrollMove" value="">
</form>

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
			<li style="color: black">여권정보</li>
			<li class="on" id="tabDpat">출국정보</li>
			<li>주문결제</li>
		</ul>
		<div class="cart_contens">
			<div class="cont_left" id="CART" style="display: none;">
				<input type="hidden" id="cartListLength" value="3"> <input
					type="hidden" id="cartSetListLength" value="0">

				<div class="attention_area">
					<p class="attention_tit">유의사항</p>
					<div class="attention_list">
						• 장바구니에 담긴 상품은 30일간 보관됩니다.(장기간 보관을 원하실 경우 관심상품으로 등록(180일간 저장)하여
						이용하시길 바랍니다.)<br> • 환율 변경 시점과 적립금의 사용조건에 따라 장바구니의 예상결제금액과
						최종결제금액은 상이할 수 있습니다.<br> • 실제 할인금액은 개인별로 보유하신 적립금에 따라 차이가 있을 수
						있습니다.<br> • 장바구니에 보관된 상품은 재고품절 및 할인율, 사은품이 수시로 변경될 수 있습니다.<br>
						• 주문 전 기내반입제한 안내를 확인하시기 바랍니다.<br> • 상품별로 한 주문번호당 주문 가능 수량이
						제한될 수 있습니다.<br> • 세트상품은 함께 사면 할인 혜택을 받을 수 있는 상품이며, 주문 후 매장에
						따라 교환권이 각기 다르게 발급될 수 있습니다.
					</div>
				</div>

			</div>
			<div class="cont_left" id="TAB" style="display: block;">

				<form name="form" id="sendDepartInfo" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<input type="hidden" id="mhdiscount" name="mhdiscount" value="${mhdiscount }"/>
					<div class="passport_wrap">
						<div class="form_wrap">
							<div class="form_tit">
								<p class="ti">출국정보</p>
								<div class="right_btn">
									<a href="javascript:void(0);" class="btnc_type small btn_pop1"
										style="cursor: pointer;" onclick="openDpatLimitGuide();">기내반입
										제한안내</a>
								</div>
							</div>
							<ul class="form_lsit">
								<li>
									<p class="f_ti ico_compulsory">출국장소</p> <span class="input_de">
										<select name="orderDpatPlacCd" class="required"
										onchange="changeOrderDpatPlacCd(this.value)"
										id="orderDpatPlacCd" valmsg="출국장소를 선택해 주십시오.">
											<option value="">선택</option>
											<option value="ICN">인천공항</option>
											<option value="KIM">김포공항</option>
									</select>
								</span>
								</li>
								<li>
									<p class="f_ti ico_compulsory">편명</p> <span
									class="input_de hasbtn"> <input type="hidden"
										id="arrvClsCd" name="arrvClsCd" value=""> <span><input
											type="text" id="openNm" name="openNm" value=""
											placeholder="편명"></span> <em class="nbsp"></em>
								</span>
								</li>
								<li>
									<p class="f_ti ico_compulsory">출국일시</p> <span
									class="input_de datepicker_box" id="dpatDtSpan"> <input
										type="text" id="oarrdate" name="oarrdate" value=""
										placeholder="YYYY-MM-DD"
										src="https://cdn.hddfs.com/front/images/KO/common/ic_calendar.png" />

								</span> <span class="input_de hasemail" id="dpatTmSpan"> <span>
											<select name="dpatTmH" id="dpatTmH" class="required"
											valmsg="출국시간을 선택해주세요.">
												<option value="">선택</option>
												<option value="00">00시</option>
												<option value="01">01시</option>
												<option value="02">02시</option>
												<option value="03">03시</option>
												<option value="04">04시</option>
												<option value="05">05시</option>
												<option value="06">06시</option>
												<option value="07">07시</option>
												<option value="08">08시</option>
												<option value="09">09시</option>
												<option value="10">10시</option>
												<option value="11">11시</option>
												<option value="12">12시</option>
												<option value="13">13시</option>
												<option value="14">14시</option>
												<option value="15">15시</option>
												<option value="16">16시</option>
												<option value="17">17시</option>
												<option value="18">18시</option>
												<option value="19">19시</option>
												<option value="20">20시</option>
												<option value="21">21시</option>
												<option value="22">22시</option>
												<option value="23">23시</option>
										</select>
									</span> <span class="cols_txt">:</span> <span> <select
											name="dpatTmM" id="dpatTmM" class="required"
											valmsg="출국시간을 선택해주세요.">
												<option value="">선택</option>
												<option value="00">00분</option>
												<option value="05">05분</option>
												<option value="10">10분</option>
												<option value="15">15분</option>
												<option value="20">20분</option>
												<option value="25">25분</option>
												<option value="30">30분</option>
												<option value="35">35분</option>
												<option value="40">40분</option>
												<option value="45">45분</option>
												<option value="50">50분</option>
												<option value="55">55분</option>
										</select>
									</span>
								</span>
									<p class="txt_ps error" id="dpatErrormsg"
										style="display: none;">출국날짜 및 시간을 선택해주세요.</p>
								</li>
								<li>
									<p class="">긴급연락처</p>
									<span class="input_de"> <select name="ugntComuTelNatiCd"
										id="ugntComuTelNatiCd">
											<option value="">선택</option>
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
											<option value="63">필리핀 (+63)</option>
											<option value="233">가나 (+233)</option>
											<option value="241">가봉 (+241)</option>
											<option value="592">가이아나 (+592)</option>
											<option value="220">감비아 (+220)</option>
											<option value="590">과델로프 (+590)</option>
											<option value="502">과테말라 (+502)</option>
											<option value="1671">괌 (+1671)</option>
											<option value="379">교황청 (+379)</option>
											<option value="1473">그레나다 (+1473)</option>
											<option value="995">그루지아 (+995)</option>
											<option value="30">그리스 (+30)</option>
											<option value="299">그린랜드 (+299)</option>
											<option value="245">기네비소 (+245)</option>
											<option value="224">기니 (+224)</option>
											<option value="264">나미비아 (+264)</option>
											<option value="234">나이지리아 (+234)</option>
											<option value="27">남아프리카 (+27)</option>
											<option value="31">네덜란드 (+31)</option>
											<option value="599">네덜란드 열도 (+599)</option>
											<option value="977">네팔 (+977)</option>
											<option value="47">노르웨이 (+47)</option>
											<option value="687">뉴 칼레도니아 (+687)</option>
											<option value="227">니제르 (+227)</option>
											<option value="505">니카라과 (+505)</option>
											<option value="45">덴마크 (+45)</option>
											<option value="1767">도미니카 (+1767)</option>
											<option value="1809">도미니카 공화국 (+1809)</option>
											<option value="49">독일 (+49)</option>
											<option value="856">라오스 (+856)</option>
											<option value="231">라이베리아 (+231)</option>
											<option value="371">라트비아 (+371)</option>
											<option value="7">러시아/카자흐 (+7)</option>
											<option value="961">레바논 (+961)</option>
											<option value="266">레소토 (+266)</option>
											<option value="40">루마니아 (+40)</option>
											<option value="250">루안다 (+250)</option>
											<option value="352">룩셈부르그 (+352)</option>
											<option value="218">리비아 (+218)</option>
											<option value="370">리투아니아 (+370)</option>
											<option value="423">리히텐슈타인 (+423)</option>
											<option value="261">마다카스카르 (+261)</option>
											<option value="692">마샬군도 (+692)</option>
											<option value="389">마세도니아 (+389)</option>
											<option value="691">마이크로네시아 (+691)</option>
											<option value="853">마카오 (+853)</option>
											<option value="596">마티니크 (+596)</option>
											<option value="265">말라위 (+265)</option>
											<option value="60">말레이지아 (+60)</option>
											<option value="223">말리 (+223)</option>
											<option value="269">코모로스/메요트 (+269)</option>
											<option value="52">멕시코 (+52)</option>
											<option value="377">모나코 (+377)</option>
											<option value="212">모로코/서사하라 (+212)</option>
											<option value="230">모리셔스 (+230)</option>
											<option value="258">모잠비크 (+258)</option>
											<option value="1664">몬트세라트 (+1664)</option>
											<option value="373">몰도바 (+373)</option>
											<option value="960">몰디브 (+960)</option>
											<option value="356">몰타 (+356)</option>
											<option value="976">몽골 (+976)</option>
											<option value="1284">미령 버진군도 (+1284)</option>
											<option value="95">미얀마 (+95)</option>
											<option value="678">바누아투 (+678)</option>
											<option value="973">바레인 (+973)</option>
											<option value="1246">바베이도스 (+1246)</option>
											<option value="880">방글라데시 (+880)</option>
											<option value="1441">버뮤다 (+1441)</option>
											<option value="58">베네주엘라 (+58)</option>
											<option value="229">베닝 (+229)</option>
											<option value="375">베라루스 (+375)</option>
											<option value="32">벨기에 (+32)</option>
											<option value="501">벨리제 (+501)</option>
											<option value="387">보스니아-헤르체고비나 (+387)</option>
											<option value="267">보츠와나 (+267)</option>
											<option value="591">볼리비아 (+591)</option>
											<option value="257">부룬디 (+257)</option>
											<option value="226">부르키나 파소 (+226)</option>
											<option value="975">부탄 (+975)</option>
											<option value="850">북한 (+850)</option>
											<option value="359">불가리아 (+359)</option>
											<option value="594">불령 가이아나 (+594)</option>
											<option value="262">불령 리유니온,코모도 제도 (+262)</option>
											<option value="689">불령 폴리네시아 (+689)</option>
											<option value="55">브라질 (+55)</option>
											<option value="673">브루나이 (+673)</option>
											<option value="685">사모아 (+685)</option>
											<option value="966">사우디아라비아 (+966)</option>
											<option value="357">사이프러스 (+357)</option>
											<option value="378">산마리노 (+378)</option>
											<option value="239">상토메 프린스페 (+239)</option>
											<option value="221">세네갈 (+221)</option>
											<option value="248">세이쉘 (+248)</option>
											<option value="1758">세인트 루시아 (+1758)</option>
											<option value="1784">세인트 빈센트 그레나딘 (+1784)</option>
											<option value="1869">세인트 키츠 네비스 (+1869)</option>
											<option value="290">세인트 헬레나 (+290)</option>
											<option value="252">소말리아 (+252)</option>
											<option value="677">솔로몬 군도 (+677)</option>
											<option value="249">수단 (+249)</option>
											<option value="597">수리남 (+597)</option>
											<option value="94">스리랑카 (+94)</option>
											<option value="268">스와질랜드 (+268)</option>
											<option value="46">스웨덴 (+46)</option>
											<option value="41">스위스 (+41)</option>
											<option value="34">스페인 (+34)</option>
											<option value="421">슬로바키아 (+421)</option>
											<option value="386">슬로베니아 (+386)</option>
											<option value="963">시리아 (+963)</option>
											<option value="232">시에라 리온 (+232)</option>
											<option value="971">아랍에미리트 연합 (+971)</option>
											<option value="297">아루바 (+297)</option>
											<option value="374">아르메니아 (+374)</option>
											<option value="54">아르헨티나 (+54)</option>
											<option value="1684">아메리칸 사모아 (+1684)</option>
											<option value="354">아이슬란드 (+354)</option>
											<option value="509">아이티 (+509)</option>
											<option value="353">아일랜드 (+353)</option>
											<option value="994">아제르바이잔 (+994)</option>
											<option value="93">아프카니스탄 (+93)</option>
											<option value="376">안도라 (+376)</option>
											<option value="1268">안티가 바부다 (+1268)</option>
											<option value="355">알바니아 (+355)</option>
											<option value="213">알제리 (+213)</option>
											<option value="244">앙골라 (+244)</option>
											<option value="1264">앙귈라 (+1264)</option>
											<option value="372">에스토니아 (+372)</option>
											<option value="593">에쿠아도르 (+593)</option>
											<option value="503">엘살바도르 (+503)</option>
											<option value="44">영국 (+44)</option>
											<option value="1340">영령 버진군도 (+1340)</option>
											<option value="1345">영령 캐이맨 군도 (+1345)</option>
											<option value="967">예맨 (+967)</option>
											<option value="968">오만 (+968)</option>
											<option value="43">오스트리아 (+43)</option>
											<option value="504">온두라스 (+504)</option>
											<option value="962">요르단 (+962)</option>
											<option value="256">우간다 (+256)</option>
											<option value="598">우루과이 (+598)</option>
											<option value="998">우즈베크 (+998)</option>
											<option value="380">우크라이나 (+380)</option>
											<option value="251">이디오피아 (+251)</option>
											<option value="964">이라크 (+964)</option>
											<option value="98">이란 (+98)</option>
											<option value="972">이스라엘 (+972)</option>
											<option value="20">이집트 (+20)</option>
											<option value="39">이탈리아 (+39)</option>
											<option value="62">인도네시아 (+62)</option>
											<option value="91">인디아 (+91)</option>
											<option value="1876">자마이카 (+1876)</option>
											<option value="260">잠비아 (+260)</option>
											<option value="240">적도 기니 (+240)</option>
											<option value="236">중앙아프리카 (+236)</option>
											<option value="253">지부티 (+253)</option>
											<option value="350">지브랄타 (+350)</option>
											<option value="263">짐바브웨 (+263)</option>
											<option value="235">챠드 (+235)</option>
											<option value="420">체코공화국 (+420)</option>
											<option value="56">칠레 (+56)</option>
											<option value="237">카메룬 (+237)</option>
											<option value="238">카보 베르데 (+238)</option>
											<option value="974">카타르 (+974)</option>
											<option value="855">캄보디아 (+855)</option>
											<option value="254">케냐 (+254)</option>
											<option value="506">코스타리카 (+506)</option>
											<option value="57">콜롬비아 (+57)</option>
											<option value="243">콩고 (+243)</option>
											<option value="53">쿠바 (+53)</option>
											<option value="965">쿠웨이트 (+965)</option>
											<option value="682">쿡 아일랜드 (+682)</option>
											<option value="385">크로아티아 (+385)</option>
											<option value="996">키르기스 (+996)</option>
											<option value="686">키리바티 (+686)</option>
											<option value="992">타지크 (+992)</option>
											<option value="255">탄자니아 (+255)</option>
											<option value="90">터키 (+90)</option>
											<option value="228">토고 (+228)</option>
											<option value="676">통가 (+676)</option>
											<option value="1649">투르크 &amp; 카이코스 군도 (+1649)</option>
											<option value="993">투르크멘 (+993)</option>
											<option value="688">투발루 (+688)</option>
											<option value="216">튀니지 (+216)</option>
											<option value="1868">트리니다드 토바고 (+1868)</option>
											<option value="670">티모르 (+670)</option>
											<option value="507">파나마 (+507)</option>
											<option value="595">파라과이 (+595)</option>
											<option value="298">파로에 군도 (+298)</option>
											<option value="92">파키스탄 (+92)</option>
											<option value="675">파푸아 뉴기니 (+675)</option>
											<option value="680">팔라우 (+680)</option>
											<option value="970">팔레스타인 (+970)</option>
											<option value="51">페루 (+51)</option>
											<option value="351">포루투갈 (+351)</option>
											<option value="500">포클랜드 군도 (+500)</option>
											<option value="48">폴란드 (+48)</option>
											<option value="1787">푸에르토리코 (+1787)</option>
											<option value="33">프랑스 (+33)</option>
											<option value="679">피지 (+679)</option>
											<option value="358">핀란드 (+358)</option>
											<option value="36">헝가리 (+36)</option>
									</select>
								</span> <span class="input_de"><input type="text"
										name="ugntComuMophNo" id="ugntComuMophNo"
										placeholder="01012345678" placeholder="- 없이 입력" maxlength="11"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></span>
								</li>
							</ul>

							<div class="btn_area">
								<a href="javascript:void(0);" class="btnxl_type type2"
									onclick="sendDepartInfo();">저장</a>
							</div>
						</div>
					</div>
				</form>

				<div id="dpatLimitGuide"></div>
				<div id="mbshDpatInfoList"></div>
				<div id="popSrchOpenNm"></div>

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
					</div>
				</div>
			</div>
		</div>
	</section>
</article>


<div id="changeSetGoosQtyList"></div>
<div id="layer_unit_pspt" class="layer_unit pop_o1" title="여권 정보 안내"></div>
<div id="layer_unit_dpat" class="layer_unit pop_o1" title="출국 정보 안내"></div>
<script>

$(document)
.ready(
		function() {
			$(".totalGoosUsd")
					.text("$"+ priceComma(parseFloat("${cartprice}").toFixed(2)));
			$(".totalGoosKrw")
					.text(priceComma((parseFloat("${cartprice}") * 1267).toFixed(0))+ "원");
			$(".sale.totalDcUsd")
					.text("$"+ priceComma(parseFloat("${cartdis}").toFixed(2)));
			$(".sale.totalDcKrw")
					.text(priceComma((parseFloat("${cartdis}") * 1267).toFixed(0))+ "원");
			$(".sumGoosQty").text("${cartcounttotal}");
			$(".payTotalSettUsd")
					.text("$"+ priceComma(((parseFloat("${cartprice}") - parseFloat("${cartdis}"))).toFixed(2)));
			$(".payTotalSettKrw")
					.text(priceComma(((parseFloat("${cartprice}") * 1267) - (parseFloat("${cartdis}") * 1267)).toFixed(0))+ "원");
			
			$('#totalGoosUsdinput').attr('value',"${cartprice}");
			$('#totalDcUsdinput').attr('value',"${cardis}");
			$('#cartstockinput').attr('value',"${cartstock}");
			$('.totalRsvgDcKrw').text(priceComma((((parseFloat("${cartprice}") * 1267) - (parseFloat("${cartdis}") * 1267))*parseFloat("${mhdiscount}")/100).toFixed(0))+"원");
			$('.totalRsvg').text("${mhdiscount}"+"%");
		});

function priceComma(price) {
return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

function sendDepartInfo(){
	<%List<OrderItemVO> list = (List<OrderItemVO>) request.getAttribute("orderitemlist");

			for (int i = 0; i < list.size(); i++) {%>
	 var pcode=<%=list.get(i).getPcode()%>;
	 var oamount=<%=list.get(i).getOamount()%>
	 var index=<%=i%>;
	 
	$('#sendDepartInfo').append('<input name="orderitem['+index+'].pcode" type="hidden" value="'+pcode +'">');
	$('#sendDepartInfo').append('<input name="orderitem['+index+'].oamount" type="hidden" value="'+oamount+'">');
	$('#sendDepartInfo').append('<input name="orderitem['+index+'].oid" type="hidden" value="">');
	
	<%}%>
	
	if($("#ugntComuMophNo").val()==""){
		$("#ugntComuMophNo").val("${member.mphone}");
	}
	$('#sendDepartInfo').attr('action','/order/orderpays');
	$('#sendDepartInfo').submit();
}




$(function() {
    //input을 datepicker로 선언
    $("#oarrdate").datepicker({
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
</script> <%@ include file="../common/Footer.jsp"%>