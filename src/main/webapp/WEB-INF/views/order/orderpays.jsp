<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hyundai.dutyfree.vo.OrderItemListVO" %>
<%@ page import="com.hyundai.dutyfree.vo.OrderItemVO" %>
	<%@ include file="../common/Header.jsp"%>
<main id="container" class="container">
<form method="post" name="orderForm" id="orderForm">

	<ul class="goosUl" style="display: none;">
		<li test="887" svmtUsePsbYn="Y" goosCd="56026250035601">
			<p class="txt goosNmTxt">0.2 테라피 에어 마스크 달팽이</p>
			<p class="txt BranCd">602601</p>
			<p class="txt finaPmptDcCupDcAmt">380</p>
			<p class="txt finaGoosSellPric">887</p>
			<p class="txt cupDcAmtKrw"></p>
			<p class="txt ptnrPmptDcDivAmt"></p>
			<p class="txt svmtUseDivAmt"></p>
			<p class="txt pmptSvmtUseDivAmt"></p>
			<p class="txt finaDivAmt"></p>
		</li>
	</ul>


	<article id="content">
		<section class="orderpayment_wrap">
			<ul class="title_tab">
				<li>장바구니</li>
				<li>여권정보</li>
				<li>출국정보</li>
				<li><strong class="on" id="tabOrder">주문결제</strong></li>
			</ul>
			<div class="payment_board">
				<div class="order_sheet">
					<ul class="accordion">
						<li>
							<div class="title">
								<h4>쿠폰할인</h4>
								<em>$</em><em id="dispCupDcTotalAmt" class="pirce">0</em><em
									class="sale">할인</em> <a href="javascript:void(0);" class="btn">자세히보기</a>
							</div>
							<div class="coupon_list accordion_box">
								<div class="coupon_select">
									<div class="box">
										<strong> 상품쿠폰 (0 장)
											<div class="square_tooltip">
												<a href="javascript:void(0);" class="btn">도움말</a>
												<div class="tooltip">
													<p class="ti">상품쿠폰 안내</p>
													<ul class="dot_list_new">
														<li>상품쿠폰으로 할인하여 구매할 수 있습니다.</li>
														<li>상품쿠폰과 중복해서 사용할 수 있는 더블쿠폰이 있습니다.</li>
														<li>단, 상품 또는 브랜드별로 사용할수 있는 쿠폰의 최대한도는 차이가 있을 수 있습니다.</li>
													</ul>
													<button type="button" class="close" onclick="return false;">닫기</button>
												</div>
											</div>
										</strong>
										<p>사용할 수 있는 쿠폰이 없습니다.</p>
									</div>
								</div>
								<div class="coupon_select">
									<div class="box">
										<strong> 장바구니쿠폰 (3 장)
											<div class="square_tooltip">
												<a href="javascript:void(0);" class="btn">도움말</a>
												<div class="tooltip">
													<p class="ti">장바구니쿠폰 안내</p>
													<ul class="dot_list_new">
														<li>장바구니 쿠폰으로 할인하여 구매할 수 있습니다.</li>
														<li>장바구니 쿠폰과 중복해서 사용할 수 있는 더블쿠폰이 있습니다.</li>
														<li>단, 브랜드별로 사용할수 있는 쿠폰의 최대한도는 차이가 있을 수 있습니다.</li>
													</ul>
													<button type="button" class="close" onclick="return false;">닫기</button>
												</div>
											</div>
										</strong>
										<p>사용할 수 있는 쿠폰이 없습니다.</p>
									</div>
								</div>
							</div>
						</li>

						<li id="cardInfoTit" style="display: none;">
							<div class="title">
								<h4>카드/제휴 즉시 할인정보</h4>
								<a href="javascript:void(0);" class="btn">자세히보기</a>
							</div> <input type="hidden" id="tempCardPtnrSeq" value="" />
							<div class="card_discount accordion_box"
								id="cardPtnrRsvgDcInfoDoma" style="display: none;"></div>
						</li>
						<li>
							<div class="title">
								<h4>적립금할인</h4>
								<em id="dispSvmtTotalAmt"></em> <a href="javascript:void(0);"
									class="btn">자세히보기</a>
							</div>
							<div class="point_discount accordion_box">
								<div class="enter_amount" style='width: 700px;'>
									<dl>
										<dt>
											일반적립금
											<div class="square_tooltip">
												<a href="javascript:void(0);" class="btn">도움말</a>
												<div class="tooltip">
													<p class="ti">일반적립금 안내</p>
													<ul class="dot_list_new">
														<li>일반 적립금으로 할인하여 구매할 수 있습니다.</li>
														<li>단, 브랜드별로 사용할수 있는 적립금의 최대 한도는 차이가 있을 수 있습니다. 상세한
															내용은 상품상세페이지 혹은 브랜드사이트를 참조하여 주십시오.</li>
													</ul>
													<button type="button" class="close" onclick="return false;">닫기</button>
												</div>
											</div>
										</dt>
										<dd>
											<input type="hidden" name="mhpoint"/>
											<em class='mhpoint'>${member.mhpoint }</em>원
										</dd>
									</dl>
									<div class="input">
										<input type="hidden" value="" name="svmtAmtInput">
										<input type="text" value="" name="svmtAmt" placeholder="0원" onkeypress="enrollsavings(event)">
										<a href="javascript:void(0);" class="btn"
											onclick="allUseSvmtClick(); return false;">전액사용</a>
									</div>
									<p id="geneSvmtUseYn"></p>
								</div>
							</div>
						</li>

						<!-- 대한항공 스카이패스 마일리지 적립 -->
						<li>
							<div class="title">
								<h4>대한항공 스카이패스 마일리지 적립</h4>
								<a href="javascript:void(0);" class="btn">자세히보기</a>
							</div>
							<div class="partnership_discount accordion_box">
								<button type="button" class="btn_basic4 small" id="koreanAir"
									onclick="koreanAirSkyPass(); return false;">조회</button>
								<div class="aff_air_info" style="display: none;">
									<input type="text" style="width: 250px; text-align: center;"
										value="" disabled>
								</div>
								<div id="cont" class="guide">
									<ul class="dot_list_new">
										<li>현대백화점면세점 회원 중 내국인(KOR)에 한하여 적립 가능합니다. ※ 대량구매자 제외</li>
										<li>마일리지는 교환권별 할인(멤버십, 쿠폰 등)/적립금/포인트 등을 제외한 실결제금액 기준으로
											$100 이상 구매 시 $5당 1마일리지가 적립됩니다.<br> (실결제금액 기준 $5 미만의 금액은
											절사됩니다.)
										</li>
										<li>주문번호의 교환권별 실결제금액이 $100 이상 조건에 충족 되지 않을 경우, 해당 건은 마일리지
											적립에서 제외됩니다.</li>
										<li>유효하지 않은 회원번호를 입력하거나 타인의 회원번호를 입력한 경우 마일리지 적립이 불가합니다.
											또한, 여권상의 영문성명과 스카이패스 회원정보상의 영문성명 스펠링이 일치해야만마일리지 적립이 가능합니다.</li>
										<li>면세품 인도 완료 후 마일리지 적립까지 최대 8주가 소요되며, 마일리지 적립 내역은 대한항공
											홈페이지에서 확인 가능합니다.</li>
										<li>적립이 완료된 마일리지는 현금 환급 등은 불가합니다.</li>
									</ul>
								</div>
							</div>
						</li>
						<!-- E: 2022-08-26 쇼핑백 추가-->

						<li id="settInfoTit" class="cat_tit">
							<div class="title">
								<h4>결제정보</h4>
								<em style="font-size: 13px;">(미선택시 카드 결제로 됩니다)</em> <a href="javascript:void(0);" class="btn">자세히보기</a>
							</div>
							<div class="payment_method accordion_box">
								<div class="tab-action">
									<div class="payment_method_dim" style="display: none;"></div>
									<ul class="tab_square ">
										<li><a class="settGrpDoma" id="settGrpDoma_003_3"
											 nohref="003_3" data-cardbadge="Y" onclick="tab_change(this);">간편결제
										</a></li>
										<li><a class="settGrpDoma" id="settGrpDoma_004_4"
											 nohref="004_4" data-cardbadge="" onclick="tab_change(this);">다른결제수단</a></li>
									</ul>

									<div class="panel">
										<div id="003_3" class="payway_area_easy  cont_item">
											<div class="easypayment">
												<a noHref class="item settSvmt simpSett_003_3"
													data-grpsettcd="003" data-grpdispordg="3"
													data-dispsettwaycd="106" data-settwaynm="삼성페이"
													data-settovsecd="">
													<div class="active">
														<span class="img"> <img
															src="/resources/images/samsung_pay.png"
															alt="삼성페이">
														</span>
														<p>삼성페이</p>
													</div>
												</a> <a noHref class="item settSvmt simpSett_003_3"
													data-grpsettcd="003" data-grpdispordg="3"
													data-dispsettwaycd="109" data-settwaynm="LG페이"
													data-settovsecd="">
													<div class="active">
														<span class="img">
															<img
															src="/resources/images/lg_pay.png"
															alt="LG페이">
														</span>
														<p>LG페이</p>
													</div>
												</a> <a noHref class="item settSvmt simpSett_003_3"
													data-grpsettcd="003" data-grpdispordg="3"
													data-dispsettwaycd="202" data-settwaynm="토스페이"
													data-settovsecd="P141">
													<div class="active">
														<span class="img"> <img
															src="/resources/images/tosspay.png"
															alt="토스페이">
														</span>
														<p>토스페이</p>
													</div>
												</a><a noHref class="item settSvmt simpSett_003_3"
													data-grpsettcd="003" data-grpdispordg="3"
													data-dispsettwaycd="108" data-settwaynm="네이버페이"
													data-settovsecd="">
													<div class="active">
														<span class="img"> <img
															src="https://cdn.hddfs.com/front/images/KO/payment/easy_ic_biz_KRO0102108.png"
															alt="네이버페이">
														</span>
														<p>네이버페이</p>
													</div>
												</a>
											</div>

											<div class="paymentguide payment1063 settTextDataNoti">
												<strong>결제안내</strong>
												<ul class="dot">
													* 구매 유의사항
													<br /> &nbsp; 카카오페이를 이용한 주문건은 영수증 출력이 불가하오니 참고바랍니다.
													<br />
												</ul>
											</div>
											<div class="paymentguide payment1093 settTextDataNoti">
												<strong>결제안내</strong>
												<ul class="dot">
													※ PAYCO 간편결제 유의사항
													<br /> - 온/오프라인 쇼핑은 물론 송금, 멤버십 적립까지 가능한 통합 서비스 입니다.
													<br /> - 휴대폰과 카드 명의자가 동일해야 결제 가능하며, 결제금액 제한은 없습니다.
													<br /> &nbsp; (지원카드: 모든 국내 신용/체크 카드)
													<br /> - PAYCO에서 제공하는 제휴사 쿠폰을 이용한 주문건의 경우, 쿠폰 사용금액보다 적은
													금액은 부분취소/부분반품이 되지 않습니다.
													<br /> - PAYCO 결제 건 취소의 경우&nbsp;환불완료까지 1~2주 정도 소요될 수 있는 점
													양해부탁드립니다.
												</ul>
											</div>
										</div>
										<div id="004_4" class="payway_area_other cont_item">
											<div class="otherpayment">
												<div class="item card_mobilepayment">
													<div class="chk">
														<input type="radio" name="etcSett"
															id="etcSett_004_4_102" value="휴대폰" data-grpsettcd="004"
															data-grpdispordg="4" data-dispSettWayNm="휴대폰 결제"
															class="settSvmt" data-dispsettwaycd="104"
															data-settovsecd=""> <label
															for="etcSett_004_4_102">
															<div>
																<p>휴대폰 결제</p>
															</div>
														</label>

													</div>
												</div>
												<div class="item VirtualAccount_payment" style="margin-left: 0px;">
													<div class="chk">
														<input type="radio" name="etcSett" id="etcSett_004_4_103" value="가상계좌" data-grpsettcd="004" data-grpdispordg="4" data-dispsettwaynm="가상계좌" class="settSvmt" data-dispsettwaycd="104" data-settovsecd="" data-gtm-form-interact-field-id="1"> 
														<label for="etcSett_004_4_103">
															<div>
																<p>가상계좌</p>
															</div>
														</label>

													</div>
												</div>
												<div class="item BankTransfer_payment" style="margin-left: 0px;">
													<div class="chk">
														<input type="radio" name="etcSett" id="etcSett_004_4_104" value="계좌이체" data-grpsettcd="004" data-grpdispordg="4" data-dispsettwaynm="계좌이체" class="settSvmt" data-dispsettwaycd="104" data-settovsecd="" data-gtm-form-interact-field-id="1"> <label for="etcSett_004_4_104">
															<div>
																<p>계좌이체</p>
															</div>
														</label>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="cash_receipts">
									<div class="chk">
										<input type="checkbox" name="tempTrdrClsCd" id="receipt__rcnt">
										<label for="receipt__rcnt">현금영수증 신청</label>
									</div>
									<div class="tel">
										<input type="text" name="idntCfmNo1" class="tc idntCfmNo"
											maxlength="3" value="" onkeyup="isNumber(this);"
											data-inputloc="1"> <input type="text"
											name="idntCfmNo2" class="tc idntCfmNo" maxlength="2" value=""
											onkeyup="isNumber(this);" data-inputloc="2"> <input
											type="text" name="idntCfmNo3" class="tc idntCfmNo"
											maxlength="5" value="" onkeyup="isNumber(this);"
											data-inputloc="3">
									</div>
									<dl>
										<dt>신청대상</dt>
										<dd>법인사업자</dd>
									</dl>
									<dl>
										<dt>발행대상</dt>
										<dd>상품권전환금, 무통장입금, 선수금, 예치금, 네이버페이(포인트)</dd>
									</dl>
								</div>
							</div>
						</li>
					</ul>
				</div>

				<div class="payment_sheet scroll-sticky">
					<div class="title">
						<h4>최종결제금액</h4>
						<em>총  ${cartstock} 개</em>
					</div>
					<ul class="total_bill">
						<li><strong>총 주문금액합계</strong> <span> 
						<input type="hidden" name="total_bill_dollar"/>
						<em class="total_bill_dollar_text">$1</em>
						<input type="hidden" name="total_bill_won"/>
								<p class="total_bill_won_text">1,267원</p>
						</span></li>
						<li class="discount_list"><strong>
								<button type="button" class="btn">총할인금액</button>
						</strong> <span> 
						<input type="hidden" name="totalDcUsd"/>
						<em class="totalDcUsd">$0.3</em>
						<input type="hidden" name="totalDcKrw"/>		
								<p class="totalDcKrw">380원</p>
						</span>
							<ul class="details" style="display: none;">
								<li><span>상품할인</span> <em>원</em><em class="exceptDc dcInfo">380</em>
								</li>
								<li><span>적립금 할인</span> <em>원</em><em class="exceptmhpoint">0</em>
								</li>
							</ul></li>
						<li id="chagDcEvtInfoDl"><strong>
								청구할인 예상금액
								<div class="square_tooltip">
									<a href="javascript:void(0);" class="btn"
										data-tooltip="#pay_discount">도움말</a>
									<div class="tooltip">
										<p class="ti">청구할인 예상금액 안내</p>
										<ul>
											<li>청구할인 카드로 결제 시 적용되는 할인 금액이며, 실제 청구금액은 예상금액과 상이할 수
												있습니다.</li>
										</ul>
										<button type="button" class="close" onclick="return false;">닫기</button>
									</div>
								</div>
								<p id="chagDcEvtInfoP"></p>
						</strong> <span> <em></em>
						</span></li>
					</ul>
					<div class="total_amount">
						<h5>최종결제금액</h5>
						<div>
							<input type="hidden" name="totalSettUsd"/>
							<em class="totalSettUsd">$0.7</em>
							<input type="hidden" name="wontotalSettKrw"/>
							<p class="won totalSettKrw">887원</p>
						</div>
					</div>
					<div class="confirm">
						<a href="javascript:void(0);" class="btn" onclick="orderexec();">결제하기</a>
						<div class="chk">
							<input type="checkbox" id="chkAgree"> <label
								for="chkAgree"> <span>주문내역 확인 동의</span>
								<p>주문할 상품의 정보를 확인하였으며, 해당 주문에 대한 구매에 동의 합니다.</p>
							</label>
						</div>
					</div>
				</div>
			</div>
		</section>
	</article>

	<input type="hidden" name="smsRcvYn" /> <input type="hidden"
		name="befSettWaySaveYn" /> <input type="hidden" name="dpatInfoSavYn" />
	<input type="hidden" value="0" name="mbshIosdClsCd" /> <input
		type="hidden" value="380" name="totalGoosDcKrw" /> <input
		type="hidden" value="0.3" name="totalGoosDcUsd" /> <input
		type="hidden" value="1" name="totalGoosUsd" /> <input type="hidden"
		value="0.7" name="totalSettUsd" /> <input type="hidden" value="1267"
		name="totalGoosKrw" /> <input type="hidden" value="887"
		name="totalSettKrw" /> <input type="hidden" value="0"
		name="totalSetGoosDcPricKrw" /> <input type="hidden"
		id="sumFinaPmptDcCupDcAmtTest" value="0"> <input type="hidden"
		id="totalSettKrwTest" value="887"> <input type="hidden"
		value="887" name="settPrrgAmt" /><input type="hidden" value="887"
		name="settPrrgAmtTmp" /><input type="hidden" value="0.7"
		name="settPrrgUsd" /><input type="hidden" value="0"
		name="totalCupUseLmtUsd" /><input type="hidden" value=""
		name="hpoinOccpAucaNo" /> <input type="hidden" value="0"
		class="svmtAmt" /> <input type="hidden" value="0" class="moblSvmtAmt" />

	<input type="hidden" value="0" class="evntSvmtAmt" /> <input
		type="hidden" value="0" class="branSvmtAmt" /> <input type="hidden"
		name="ptnsSvmtSeqList" value="" class="ptnsSvmtSeqList" /> <input
		type="hidden" name="ptnsSvmtAmt" value="0" class="ptnsSvmtAmt" /> <input
		type="hidden" value="N" id="ptnsSvmtCalcCheck" /> <input
		type="hidden" value="0" name="settWaySvmtAmt" /> <input type="hidden"
		id="settWaySvmtSeq" name="settWaySvmtSeq" value="0"> <input
		type="hidden" value="0" name="pmptDcAmt" /> <input type="hidden"
		value="0" name="ptnrPmptDcAmt" /> <input type="hidden" value=""
		name="ptnrPmptDcEvtSeq" /> <input type="hidden" value=""
		name="ptnrPmptDcCompTypeCd" /> <input type="hidden" value=""
		name="ptnrPmptDcLvlInfoCd" /> <input type="hidden" value=""
		name="ptnrPmptDcCardNum" /> <input type="hidden" value=""
		name="ptnrPmptDcBirth" /> <input type="hidden" value="0.2"
		name="hpoinSavRat" /> <input type="hidden" value="0"
		name="hpoinSimpSavRat" /> <input type="hidden" value="887"
		name="svmtUseMaxAmt" /> <input type="hidden" value="887"
		name="svmtUseMaxAmtTmp" /> <input type="hidden" value="0"
		name="pay_data_pmptUseSvmtAmt" /><input type="hidden"
		name="settWayCd" id="settWayCd" value="001" /> <input type="hidden"
		name="hdCardMPointYn" id="chkMpoint" /> <input type="hidden"
		name="cardCd" id="cardCd" /> <input type="hidden"
		name="virtAcntBnkCd" id="virtAcntBnkCd" /> <input type="hidden"
		name="istmMonsCnt" id="istmMonsCnt" /> <input type="hidden"
		name="rateYn" /> <input type="hidden" name="svacOwrNm" id="svacOwrNm" />

	<input type="hidden" name="hpoinPsbAmt" id="hpoinPsbAmt" value="" /> <input
		type="hidden" name="hpoinPlsAmt" id="hpoinPlsAmt" /> <input
		type="hidden" name="hpoinPlsCupNo" id="hpoinPlsCupNo" /> <input
		type="hidden" value="" name="trdrClsCd" /> <input type="hidden"
		id="mbshSvmtAmt" value="10000" /> <input type="hidden"
		id="mbshEvntSvmtAmt" value="0" /> <input type="hidden"
		id="mbshBranSvmtAmt" value="0" /> <input type="hidden"
		id="mbshPtnsSvmtAmt" value="0" /> <input type="hidden"
		id="mbshSettSvmtAmt" value="0" /> <input type="hidden" value=""
		id="tempCashRcptTable" /> <input type="hidden" value=""
		name="ovseSettWayCd" /> <input type="hidden"
		value="0.2 테라피 에어 마스크 달팽이" name="goosNm2" /> <input type="hidden"
		value="0.2 테라피 에어 마스크 달팽이" name="goosNm" /> <input type="hidden"
		value="" name="memberNum" />

	<!-- 약관 동의 팝업 -->
	<div id="hpay_layer_popup" class="hpay_term_pop"
		title="H.Point Pay 서비스 약관"></div>

	<div id="geneSvmtLayerPopup" class="evplus_pop" title="사용가능 일반적립금"
		style="display: none;">
		<div class="layer_popup">
			<div class="popupcont_wrap" id="mbshSvmtList"></div>
			<ul class="btn_group">
				<li><a href="javascript:void(0);"
					class="btnde_type1 mid bg_black"
					onclick="plusSvmtLayerPopupClose('gene'); return false;">확인</a>
			</ul>
		</div>
	</div>

	<div id="evntSvmtLayerPopup" class="evplus_pop" title="사용가능 이벤트플러스 적립금"
		style="display: none;">
		<div class="layer_popup">
			<div class="popupcont_wrap" id="mbshEvntSvmtList"></div>
			<ul class="btn_group">
				<li><a href="javascript:void(0);"
					class="btnde_type1 mid bg_black"
					onclick="plusSvmtLayerPopupClose('evnt'); return false;">확인</a>
			</ul>
		</div>
	</div>

	<div id="branSvmtLayerPopup" class="brplus_pop" title="사용가능 브랜드플러스 적립금"
		style="display: none;">
		<div class="layer_popup">
			<div class="popupcont_wrap" id="mbshBranSvmtList"></div>
			<ul class="btn_group">
				<li><a href="javascript:void(0);"
					class="btnde_type1 mid bg_black"
					onclick="plusSvmtLayerPopupClose('bran'); return false;">확인</a>
			</ul>
		</div>
	</div>

	<div id="ptnsSvmtLayerPopup" class="partnerplus_pop" title="제휴플러스 적립금"
		style="display: none;">
		<div class="layer_popup">
			<div class="popupcont_wrap">
				<div class="loading transparent" id="ptnsSvmtLayerPopupLoading"
					style="display: none;">
					<div class="loading_img">
						<img
							src="https://cdn.hddfs.com/front/images/KO/common/loading_apng.png"
							alt="loading">
					</div>
				</div>
				<div class="total_point" id="mbshPtnsSvmtListPoint"></div>
				<div class="point_couwrap">
					<ul id="mbshPtnsSvmtList"></ul>
				</div>
			</div>
			<ul class="btn_group">
				<li><a href="javascript:void(0);"
					class="btnde_type1 mid bg_black" onclick="ptnsPlsSvmtAppl();">확인</a></li>
			</ul>
		</div>
	</div>

	<div id="settSvmtLayerPopup" class="payplus_pop" title="결제 플러스 적립금"
		style="display: none;">
		<div class="layer_popup">
			<div class="popupcont_wrap">
				<div class="allchk">
					<span class="chk"> <input type="radio" name="settWaySvmtSeq"
						id="settWaySvmtSeq0" checked value="" cardId="" dispSettWayCd=""
						settWaySvmtAmt="0"> <label for="settWaySvmtSeq0">사용안함</label>
					</span>
				</div>
				<div class="point_couwrap">
					<input type="hidden" id="settWaySvmtSeqApplTmp" value="">
					<ul id="mbshSettSvmtList">
					</ul>
				</div>
			</div>
			<ul class="btn_group">
				<li><a href="javascript:void(0);"
					class="btnde_type1 mid bg_black" onclick="settPlsSvmtAppl();">확인</a></li>
			</ul>
		</div>
	</div>

	<div id="goosCupLayerPopup" class="cou_pop" title="상품쿠폰 할인"
		style="display: none;">
		<div class="layer_popup">
			<div class="popupcont_wrap">
				<div class="loading transparent" id="orderLoading"
					style="display: none;">
					<div class="loading_img">
						<img
							src="https://cdn.hddfs.com/front/images/KO/common/loading_apng.png"
							alt="loading">
					</div>
				</div>
			</div>
			<ul class="btn_group">
				<li><a href="javascript:void(0);"
					class="btnde_type2 mid bg_black" style="cursor: pointer;"
					onclick="setChoiGoosCupChk();">확인</a></li>
			</ul>
		</div>
	</div>
	<div id="cartCupLayerPopup" class="cart_pop" title="장바구니쿠폰 할인"
		style="display: none;">
		<div class="layer_popup">
			<div class="popupcont_wrap">
				<div class="loading transparent" id="cartCupLayerPopupLoading"
					style="display: none;">
					<div class="loading_img">
						<img
							src="https://cdn.hddfs.com/front/images/KO/common/loading_apng.png"
							alt="loading">
					</div>
				</div>
				<div class="item_coupon">
					<div class="couponlist">
						<div>
							<p class="fztit13">장바구니쿠폰</p>
							<span class="input_de"> <select name="geneMbshCupSeq"
								data-cupseq="" class="choiCartCup">
									<option value="">쿠폰선택</option>
							</select>
							</span>
						</div>
					</div>
				</div>
			</div>
			<ul class="btn_group">
				<li><a href="javascript:void(0);"
					class="btnde_type2 mid bg_black" onclick="choiCartCup();">확인</a></li>
			</ul>
		</div>
	</div>

	<div id="simpRsvgPoinIssuLayerPopup" class="applypoint_pop"
		title="간편적립포인트 발급신청" style="display: none;">
		<div class="layer_popup">
			<div class="popupcont_wrap point_pop">
				<p>간편적립포인트 신규발급 신청에 동의 하시고 구매하시면 구매포인트가 간편적립포인트로 적립됩니다. (H.Point
					적립과 동일)</p>
				<ul class="dot_terms">
					<li>포인트 적립은 면세점 인도 완료 후 지급되며 간편적립 가입 이후 주문 건부터 적용됩니다.</li>
					<li>포인트의 유효기간은 적립일로부터 30일간 유효합니다.</li>
					<li>유효기간 만료된 포인트는 사용이 불가합니다.</li>
					<li>간편적립포인트의 사용은 통합회원으로 전환 시 가능하며 통합회원으로 전환 시 보유한 간편적립포인트는 모두
						H.Point로 전환됩니다.</li>
				</ul>
				<div class="chk">
					<input type="checkbox" name="orderSimpRsvgPoinAgrYn"
						id="orderSimpRsvgPoinAgrYn"> <label
						for="orderSimpRsvgPoinAgrYn"><strong>간편적립포인트 발급
							신청에</strong> 동의합니다.</label>
				</div>
				<ul class="btn_group">
					<li><a href="javascript:void(0);" class="btnde_type1 mid"
						onclick="simpRsvgPoinIssuLayerPopup('close');">취소</a></li>
					<li><a href="javascript:void(0);"
						class="btnde_type1 mid bg_black"
						onclick="simpRsvgPoinIssuLayerPopup('agree');">확인</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="settInfoLayerPopup" class="bankbook_pop"></div>

	<div id="orcomplete_pop" class="orcomplete_pop"></div>

	<div id="failed_pop" class="failed_pop"></div>

	<div id="layer_popup" class="pop_quantity" title="SMS 인증"></div>

	<div id="ptnrPmptLayerPopup" class="" title=""></div>

	<div id="settCardListLayerPopup" class="card_pop" title="카드 선택하기"></div>

	<div id="koreanAirSkyPassLayerPopup" class="koreaair_pop"
		title="대한항공 스카이패스 회원 인증" style="display: none;">

		<div class="layer_popup">
			<div class="popupcont_wrap membership_pop">
				<div class="form_list">
					<ul>
						<li>
							<p class="fztit13">회원번호 (12자리 숫자)</p>
							<div class="membership_numbox">
								<span class="input_de"> <input id="skyPassMemberNum"
									maxlength="12" name="skyPassMemberNum" type="text">
								</span>
							</div>
						</li>
						<li>
							<p class="fztit13">영문성명 (대문자)</p>
							<div class="membership_numbox">
								<div class="cols2">
									<input id="skyPassMemberEngLstNm" type="text" class="numb"
										placeholder="Last name (성)" value="YOU" readonly>
								</div>
								<div class="cols2">
									<input id="skyPassMemberEngFstNm" type="text" class="numb"
										placeholder="First name (이름)" value="HYESEUNG" readonly>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<ul class="dot_terms">
					<li>대한항공 스카이패스 마일리지 적립을 위해 개인정보 수집/이용 동의 및 제 3자 제공 동의가 필요합니다.</li>
					<li>대한항공 스카이패스 마일리지 적립을 위한 스카이패스 회원번호 및 영문성명은 대한항공 홈페이지에서 확인하실
						수 있습니다.</li>
					<li><a href="https://www.koreanair.com/kr/ko" target="_blank"
						class="link_membership">(대한항공 바로가기)</a></li>
				</ul>

				<ul class="terms_item">
					<li>
						<div class="terms_title">
							<span class="chk"> <input type="checkbox" name=""
								id="air01"> <label for="air01"><strong>[필수]
										개인정보 수집 이용에</strong> 동의합니다.</label>
							</span>
							<div class="terms_toggle">
								<a href="javascript:void(0);">내용보기</a>
							</div>
						</div>
						<div class="terms_cont">
							<div>
								수집/이용 목적 : 대한항공 스카이패스 마일리지 적립 및 CS응대<br> 수집/이용 항목 : 스카이패스
								회원번호, 영문성명<br> 보유 및 이용기간 : <strong class="f_size02">회원
									탈퇴 시 까지</strong> <br>
								<br> 고객님께서는 개인정보 수집/이용에 동의 거부 권리가 있으며 동의 거부 시 대한항공 스카이패스
								마일리지 적립이 제한됩니다.
							</div>
						</div>
					</li>
					<li>
						<div class="terms_title">
							<span class="chk"> <input type="checkbox" name=""
								id="air02"> <label for="air02"><strong>[필수]
										개인정보 제3자 제공에</strong> 동의합니다.</label>
							</span>
							<div class="terms_toggle">
								<a href="javascript:void(0);">내용보기</a>
							</div>
						</div>
						<div class="terms_cont">
							<div>
								제공 받는자 : <strong class="f_size02">㈜대한항공</strong><br> 제공 목적
								: <strong class="f_size02">대한항공 마일리지 적립</strong><br> 제공 항목
								: 스카이패스 회원번호, 영문성명<br> 보유 및 이용기간 : <strong class="f_size02">회원
									탈퇴 시 까지</strong><br>
								<br> 고객님께서는 개인정보 제 3자 제공 동의 거부 권리가 있으며 동의 거부 시 대한항공 스카이패스
								마일리지 적립이 제한됩니다.
							</div>
						</div>
					</li>
				</ul>
				<ul class="btn_group">
					<li><a href="javascript:void(0);" id="koreanAirClose"
						class="btnde_type1 mid bg_black">취소</a></li>
					<li><a href="javascript:void(0);" id="koreanAirSearch"
						class="btnde_type1 mid">적용하기</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!--e 리뉴얼 대한항공 스카이패스 회원 인증 -->
</form>


<iframe id=MPIFRAME name=MPIFRAME style="display: none"></iframe>
<div style="display: none">
	<form name=Visa3d target="MPIFRAME" method=post>
		<input type="text" name=pan size="19" maxlength="19" value="">
		<input type="text" name=expiry size="6" maxlength="6" value="4912">
		<input type="text" name=purchase_amount size="20" maxlength="20"
			value=""> <input type="text" name=amount size="20"
			maxlength="20" value=""> <input type="text" name=description
			size="80" maxlength="80" value="none"> <input type="text"
			name=currency size="3" maxlength="3" value="410"> <input
			type="text" name=recur_frequency size="4" maxlength="4" value="">
		<input type="text" name=recur_expiry size="8" maxlength="8" value="">
		<input type="text" name=installments size="4" maxlength="4" value="">
		<input type="text" name=device_category size="20" maxlength="20"
			value="0"> <input type="text" name="name" size="20"
			value="%C7%F6%B4%EB%B9%E9%C8%AD%C1%A1%B8%E9%BC%BC%C1%A1"> <input
			type="text" name="url" size="20" value="https://www.hddfs.com/shop">
		<input type="text" name="country" size="20" value="410"> <input
			type="password" name="dummy" value=""> <input type="text"
			name="returnUrl"
			value="https://www.hddfs.com/shop/or/order/mpiReturn.do"> <input
			type="text" name=cardcode value=""> <input type="text"
			name="merInfo" value="DPT0Q21075"> <input type="text"
			name="bizNo" value="8508800325"> <input type="text"
			name="instType" value="1"> <input type="hidden"
			name="sspayInfo" value=""> <input type="hidden"
			name="goodname" value="0.2 테라피 에어 마스크 달팽이"> <input
			type="hidden" name="PgId" value="K0036">
	</form>
</div>

<div style="display: none">
	<form name=KSMpiAuthForm method=post action="" onSubmit="">
		<input type=hidden name="expdt" value=""> <input type=hidden
			name="idnum" value=""> <input type=hidden name="goodname"
			value="goodName"> <input type=hidden name="amount" value="">
		<input type=hidden name="currencytype" value="410"> <input
			type=hidden name="expyear" value="2049"> <input type=hidden
			name="expmon" value="12"> <input type=hidden name="termID"
			value="DPT0Q21075"> <input type=hidden name="gubun"
			value="1130"> <input type=hidden name="installment">
		<input type=hidden name="rateYn"> <input type=hidden
			name="issuerCode"> <input type="hidden" name="xid" value="">
		<input type="hidden" name="eci" value=""> <input type="hidden"
			name="cavv" value=""> <input type="hidden" name="cardno"
			value=""> <input type="hidden" name="otc" value=""> <input
			type="hidden" name="usepoint" value=""> <input type="hidden"
			name="KVP_PGID" value=""> <input type="hidden"
			name="KVP_CARDCODE" value=""> <input type="hidden"
			name="KVP_SESSIONKEY" value=""> <input type="hidden"
			name="KVP_ENCDATA" value=""> <input type="hidden"
			name="certitype" value=""> <input type="hidden"
			name="interest" value="">
	</form>
</div>
</div>
<div style="display: none">
	<form name="ispForm" method=post>
		<input type="text" name="KVP_PGID" value="K0036"> <input
			type="text" name="KVP_GOODNAME" value="0.2 테라피 에어 마스크 달팽이" /> <input
			type="text" name="KVP_CARDCOMPANY" value=""> <input
			type="text" name="KVP_PRICE" value=""> <input type="text"
			name="KVP_CURRENCY" value="WON"> <input type="text"
			name=KVP_QUOTA_INF value=""> <input type="text"
			name=KVP_NOINT_INF value=""> <input type="text"
			name="KVP_NOINT" /> <input type="text" name="KVP_NOINT_FLAG" /> <input
			type="text" name="KVP_QUOTA" value="" /> <input type="text"
			name="KVP_OACERT_INF" /> <input type="text" name="KVP_BC_OACERT_INF" />
		<input type="text" name="Kvp_NOINT_FLAG" /> <input type="text"
			name="KVP_CARDCODE" /> <input type="text" name="VP_BC_ISSUERCODE" />
		<input type="text" name="KVP_KB_SAVEPOINTREE" /> <input type="text"
			name="KVP_WR_SAVEPOINT" /> <input type="text" name="VP_BC_SAVEPOINT" />
		<input type="text" name="VP_RET_SAVEPOINT" /> <input type="text"
			name="KVP_FIXPAYFLAG" /> <input type="text" name="KVP_MERCHANT_KB" />
		<input type="text" name="VP_MERCHANT_ID" /> <input type="text"
			name="VP_REQ_AUTH" value="FALSE" /> <input type="text"
			name="KVP_CARD_PREFIX" /> <input type="text" name="KVP_IMGURL" /> <input
			type="text" name="KVP_CONAME" /> <input type="text"
			name="KVP_SESSIONKEY" /> <input type="text" name="KVP_ENCDATA" /> <input
			type="text" name="KVP_RESERVED1" /> <input type="text"
			name="KVP_RESERVED2" /> <input type="text" name="KVP_RESERVED3" />
		<input type="text" name="KVP_PAYSET_FLAG" /> <input type="hidden"
			name="KVP_USING_POINT" />
	</form>
</div>

<div style="display: none">
	<form class="form-horizontal" name="ovseForm" method="post"
		action="https://www.hddfs.com/shop/or/order/ovseCreditCardRequest.do">
		<input type="hidden" name="statusurl"
			value="https://www.hddfs.com/shop/or/order/procOvseCreditCardCplt.do" />
		<input type="hidden" name="returnurl"
			value="https://www.hddfs.com/shop/or/order/ovseCreditCardResponse.do" />
		<input type="hidden" name="mid" value="5DBD8A86B4"> <input
			type="hidden" name="ref" value="demo20170418202020"> <input
			type="hidden" name="ostype" value="P"> <input type="hidden"
			name="displaytype" value="P"> <input type="hidden" name="cur"
			value="USD"> <input type="hidden" name="amt" value="">
		<input type="hidden" name="buyer" value=""> <input
			type="hidden" name="email" value=""> <input type="hidden"
			name="tel" value=""> <input type="hidden" name="lang"
			value="KR"> <input type="hidden" name="paymethod" value="">
		<input type="hidden" name="shop" value=""> <input
			type="hidden" name="item_0_product" value="0.2 테라피 에어 마스크 달팽이">
		<input type="hidden" name="item_0_quantity" value="1"> <input
			type="hidden" name="item_0_unitPrice" value="">
	</form>
</div>

<div style="display: none">
	<form class="form-horizontal" name="payForm" method="post" action="">
		<input type="text" name="CASH_GB" id="CASH_GB" size="30" value="MC">
		<input type="text" name="Okurl" id="Okurl" size="50"
			value="https://www.hddfs.com/shop/or/order/mobiliansReturn.do?hddfsSession=xwzcbXABj91d8IdmqHaeaHYtyascs26DhTj6y79mvTIIJ216baYP29HfeTg1PYgJ.b25saW5lX2RvbWFpbi9zZXJ2ZXJfZGZwa29fMg==">
		<input type="text" name="MC_SVCID" id="MC_SVCID" size="30" value="">
		<input type="text" name="Prdtnm" id="Prdtnm" size="30"
			value="0.2 테라피 에어 마스크 달팽이"> <input type="text"
			name="Prdtprice" id="Prdtprice" size="30" value=""> <input
			type="text" name="Siteurl" id="Siteurl" size="30"
			value="http://naver.com"> <input type="text" name="PAY_MODE"
			id="PAY_MODE" size="30" value=""> <input type="text"
			name="Tradeid" id="Tradeid" size="50" value=""> <input
			type="text" name="LOGO_YN" id="LOGO_YN" size="30" value="N">
		<input type="text" name="CALL_TYPE" id="CALL_TYPE" size="30" value="P">
		<input type="text" name="MC_AUTHPAY" id="MC_AUTHPAY" size="30"
			value="Y">
	</form>
</div>


<div style="display: none">
	<form name="kakaoPayform" id="kakaoPayform" method="post" action="">
		<input type="hidden" name="cid" value="" /> <input type="hidden"
			name="partnerOrderId" value="" /> <input type="hidden"
			name="partnerUserId" value="" /> <input type="hidden"
			name="itemName" value="0.2 테라피 에어 마스크 달팽이" /> <input type="hidden"
			name="quantity" value="1" /> <input type="hidden" name="totalAmount"
			value="887" /> <input type="hidden" name="taxFreeAmount" value="887" />
		<input type="hidden" name="approvalUrl"
			value="https://www.hddfs.com/shop/or/order/kakaoPaySuccess.do" /> <input
			type="hidden" name="cancelUrl"
			value="https://www.hddfs.com/shop/or/order/kakaoPayCanCel.do" /> <input
			type="hidden" name="failUrl"
			value="https://www.hddfs.com/shop/or/order/kakaoPayFail.do" /> <input
			type="hidden" name="pgToken" value="" /> <input type="hidden"
			name="tid" value="" />
	</form>
</div>


<form name="smilepayForm" id="smilepayForm" action="" method="post"
	accept-charset="">
	<input type="hidden" name="requestUrl"
		value="https://pg.cnspay.co.kr/pay/v2/approve" /> <input
		type="hidden" name="Mid" value="hddfsco00m" /> <input type="hidden"
		name="Moid" id="Moid" value="167338900480494107" /> <input
		type="hidden" name="GoodsNm" value="0.2 테라피 에어 마스크 달팽이" /> <input
		type="hidden" name="Amt" value="887" /> <input type="hidden"
		name="SupplyAmt" value="887" /> <input type="hidden"
		name="ServiceAmt" value="0" /> <input type="hidden" name="GoodsVat"
		value="0" /> <input type="hidden" name="TaxationAmt" value="0" /> <input
		type="hidden" name="Currency" value="KRW" /> <input type="hidden"
		name="PointUseYn" value="Y" /> <input type="hidden" name="Etc1"
		value="" /> <input type="hidden" name="Etc2" value="" /> <input
		type="hidden" name="Etc3" value="" /> <input type="hidden"
		name="UserKey" value="" maxlength="200" /> <input type="hidden"
		name="SmileCash" value="0" /> <input type="hidden"
		name="IsSmileAppInstalled" id="IsSmileAppInstalled" value="U"
		readonly="readonly" style="background-color: #e2e2e2;" /> <input
		type="hidden" name="CalledFromAppOrElse" value="WEB" /> <input
		type="hidden" name="ShopAppIosScheme" placeholder="IOS APP 사용시 필수" />
	<input type="hidden" name="ReturnUrl2" type="text"
		value="https://www.hddfs.com/shop/or/order/smilepayApproveReturn2.do?hddfsSession=xwzcbXABj91d8IdmqHaeaHYtyascs26DhTj6y79mvTIIJ216baYP29HfeTg1PYgJ.b25saW5lX2RvbWFpbi9zZXJ2ZXJfZGZwa29fMg==" />
	<input type="hidden" name="possiCard" value="" /> <input type="hidden"
		name="itemType" value="1" /> <input type="hidden" name="PayMethod"
		value="SMILEPAY" /> <input type="hidden" name="GoodsCnt" value="1" />
	<input type="hidden" name="BuyerName" value="유혜승" /> <input
		type="hidden" name="LogoURL" type="text"
		value="https://pg.cnspay.co.kr" readonly="readonly"
		style="background-color: #e2e2e2;" /> <input type="hidden"
		name="requestDealApproveUrl" id="requestDealApproveUrl"
		value="https://pg.cnspay.co.kr/smile/v2/createTxnId"
		readonly="readonly" style="background-color: #e2e2e2;" /> <input
		type="hidden" name="EncodeKey"
		value="/MbPBwqUTsnv5DCLikoH8ildWyCZ+uDoCiO+x5fp9abPLngj2hA1ZZShdNDQ/yLpAqpvH2zaqMZ3Ff6TWj9t6A==" />
	<input type="hidden" name="merchantEncKey" value="/MbPBwqUTsnv5DCL"
		style="background-color: #e2e2e2;" /> <input type="hidden"
		name="merchantHashKey" value="AicQKBlKQjOl6kKk"
		style="background-color: #e2e2e2;" /> <input type="hidden"
		name="UsePopup" value="true" />

	<div id="txnContents">
		<input id="ResultCode" name="ResultCode" type="hidden" value="" /> <input
			id="ResultMsg" name="ResultMsg" type="hidden" value="" /> <input
			id="TxnId" name="TxnId" type="hidden" value="" /> <input id="PrDt"
			name="PrDt" type="hidden" value="" /> <input id="TlsVer"
			name="TlsVer" type="hidden" value="" />
	</div>
	<div id="dlpContents">
		<input name="GoodsName" type="hidden" value="" /> <input
			name="SpuSignToken" type="hidden" value="" /> <input
			name="SmileCash" type="hidden" value="" /> <input name="Spu"
			type="hidden" value="" /> <input name="Tid" type="hidden" value="" />
		<input name="AuthToken" type="hidden" value="" />
	</div>

</form>

<div class='div_frame' id="smilePay_layer"></div>
<iframe name="txnIdGetterFrame" id="txnIdGetterFrame" width="0px"
	height="0px"
	style="border-left-width: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px;"></iframe>
<div style="display: none">
	<form name="naverPayForm" id="naverPayForm" method="post" action="">
		<input type="hidden" name="paymentId" value="" /> <input
			type="hidden" name="detail" value="" />
	</form>
</div>
<form id="orderexec" method="post" action="/order/postorderpays">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<div style="display: none">
	<form name="paycoForm" id="paycoForm" method="post" action="">
		<input type="hidden" name="paymentCertifyToken" value="" /> \ <input
			type="hidden" name="reserveOrderNo" value="" /> \ <input
			type="hidden" name="totalPaymentAmt" value="" /> \ <input
			type="hidden" name="sellerOrderReferenceKey" value="" /> \
	</form>
</div>
<div id="Mask"></div>
<div id="settInfoLayerPopupmodal" tabindex="-1" role="dialog" style="position: absolute; height: auto; width: 412px; top: 351.5px; left: 1000px; display: none;" class="ui-dialog ui-corner-all ui-widget ui-widget-content ui-front event_type ui-draggable ui-resizable" aria-describedby="settInfoLayerPopup" aria-labelledby="ui-id-11">
<div class="ui-dialog-titlebar ui-corner-all ui-widget-header ui-helper-clearfix ui-draggable-handle">
<span id="ui-id-11" class="ui-dialog-title">&nbsp;</span>
<button type="button" class="ui-button ui-corner-all ui-widget ui-button-icon-only ui-dialog-titlebar-close" title="Close">
<span class="ui-button-icon ui-icon ui-icon-closethick"></span>
<span class="ui-button-icon-space"> </span>Close</button></div>
<div id="settInfoLayerPopup" class="bankbook_pop ui-dialog-content ui-widget-content" style="width: auto; min-height: 150px; max-height: 720px; height: auto;"">
<script type="text/javascript">
$(document).ready(function(){
 
    
    
    $(".bankbook_caution .terms_toggle").off("click").on("click", function() {
        if($(this).parent(".bankbook_caution").hasClass("open")){
            $(this).parent(".bankbook_caution").removeClass("open")
        }else{
            $(this).parent(".bankbook_caution").addClass("open")
        }
    });
    
    
   	$("a.btnde_type1").off("click").on("click", function() {
   		
   		
        var type = $(this).data("type");
        
        if(type == "proc") {
            if("001" == "103") {
                if(!$("#orderConsmInfo103").is(":checked")) {
                    alert('무통장 입금 유의사항을 확인해주세요.'); 
                    $("#orderConsmInfo103").focus();
                    return false;
                }
            }
            
            /* $("#settInfoLayerPopup").dialog("close"); */
            
            /* 
                doSett(); */
            
        } else if(type == "dpatproh") {
            $(".jeju_pop").dialog("close");
        } else {
        	/* $("#settInfoLayerPopup").dialog("close"); */
        }
    });
    
    
    $(".cont_tg").off("click").on("click", function() {
        $(this).toggleClass("is_active");
        $(this).next(".cont_tg_box").slideToggle();
    });
});
</script>
<div class="layer_popup">
    <div class="popupcont_wrap">
        <p class="lartitle">고객님의 정보를<br> 다시 한번 확인해주세요.</p>
        <div class="info_table3">
            <table>
                <colgroup>
                    <col style="width:102px">
                    <col style="width:auto">
                </colgroup>
                <tbody>
                    <tr>
                       <th>여권번호</th>
                       <td>${passport.passportno }</td>
                   </tr>
                   <tr>
                       <th>출국장소</th>
                       <c:choose>
                       <c:when test="${ orderlist.oplace eq 'ICNT1'}">
                       <td>인천공항 T1</td>
                       </c:when>
                       <c:when test="${ orderlist.oplace eq 'ICNT2'}">
                       <td>인천공항 T2</td>
                       </c:when>
                       <c:when test="${ orderlist.oplace eq 'GMP'}">
                       <td>김포공항</td>
                       </c:when>
                       </c:choose>
                   </tr>
                   <tr>
                       <th>출국예정일</th>
                       <td>${orderlist.odeptdate }</td>
                   </tr>
                   <tr>
                       <th>편명</th>
                       <td>${orderlist.oplnum }</td>
                   </tr>
                </tbody>
            </table>
        </div>
        <p class="lartitle">결제를 진행하시겠습니까?</p>
        <ul class="btn_group">
            <li>
                <a href="javascript:void(0);" id="payment-cancel" class="btnde_type1 mid data-type=" close"="">취소</a>
            </li>
            <li>
                <a href="javascript:void(0);" id="payment-button"class="btnde_type1 mid bg_black" data-type="proc">확인</a>
            </li>
        </ul>
    </div>
</div>

</div><div class="ui-resizable-handle ui-resizable-n" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-w" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-sw" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-ne" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-nw" style="z-index: 90;"></div></div>

<div style="display: none">
	<form name="hpayForm" id="hpayForm" method="post" action="">
		<input type="hidden" id="hpayPaymentId" name="hpayPaymentId" value="" />
		<input type="hidden" id="methodId" name="methodId" value="" /> <input
			type="hidden" id="orderNo" name="orderNo" value="" /> <input
			type="hidden" id="paymentKey" name="paymentKey" value="" /> <input
			type="hidden" id="istmMonsCnt" name="istmMonsCnt" value="0" /> <input
			type="hidden" id="orderName" name="orderName"
			value="0.2 테라피 에어 마스크 달팽이" /> <input type="hidden"
			id="totalOrderAmt" name="totalOrderAmt" value="887" /> <input
			type="hidden" id="poinUseYn" name="poinUseYn" value="" />
	</form>
</div>

<script>
	$(function() {
		$('.ui-widget-overlay').on('click', function() {
			$('#dialog').dialog('close');
		})
		$(".accordion_box").hide()
		$(".open .accordion_box").show();
		$(".accordion .title .btn").on("click", function() {
			if ($(this).parents(".accordion li").hasClass("open")) {
				$(this).parents(".accordion li").removeClass("open");
				$(this).parent().siblings().slideUp(200)
			} else {
				$(this).parents(".accordion li").addClass("open");
				$(this).parent().siblings().slideDown(200)
			}
		});
		$(".discount_list .details").hide()
		$(".discount_list .btn").on("click", function() {
			if ($(".discount_list").hasClass("open")) {
				$(".discount_list").removeClass("open");
				$(".discount_list .details").slideUp(200)
			} else {
				$(".discount_list").addClass("open");
				$(".discount_list .details").slideDown(200)
			}
		});
		// S: 2022-05-11 H.Point Pay 카드, 계좌 선택 추가
		$(function() {
			$(".payway_area_hpay .hpay_choose").on("click", function() {
				if (!applSettFixInit()) {
					return false;
				}
				setTimeout(function() {
					paymentSettInfo();
				}, 100);
				var hpayBox = $(this).next(".hpay_box");
				$(".hpay_box").removeClass("active");
				hpayBox.addClass("active");
			});
		});
		// E: 2022-05-11 H.Point Pay 카드, 계좌 선택 추가
		if ("${mid ne null }") {
			if ($("#fregInfoTit").length > 0) {
				$("#fregInfoTit").addClass("open");
				$(".gift_list").show();
			}
			$(".cont_item").hide();
			$(".tab_square > li:first").addClass("ui-tabs-active").show();
			$(".tab_square > li:first").parent().addClass("ui-tabs-active");
			var strArray = $(".tab_square > li:first > a").prop('id')
					.split('_');
			var strId = '#' + strArray[1] + '_' + strArray[2];
			if ("#rcnt_0" === strId) {
				$("#payway_tab_01").show();
			} else {
				$(strId).show();
			}
			$("#settInfoTit").addClass("open");
			$(".payment_method").show();
		} else {
			$(".cont_item").hide();
			$(".tab_square > li:first").addClass("ui-tabs-active").show();
			$(".tab_square > li:first").parent().addClass("ui-tabs-active");
			var strArray = $(".tab_square > li:first > a").prop('id')
					.split('_');
			var strId = '#' + strArray[1] + '_' + strArray[2];
			$(strId).show();
		}
		if ($("#sbagUseYn").length > 0) {
			$("#sbagUseYn > a:first").click();
		}
		if ("${mid ne null }") {
			$(".payway-swiper")
					.each(
							function(index, element) {
								var $this = $(this);
								$this.addClass("instance-swipwe-" + index);
								var ProductModuleSwiper = new Swiper(
										".instance-swipwe-" + index,
										{
											slidesPerView : "auto",
											slidesPerView : 1.5,
											loop : false,
											observer : true,
											observeParents : true,
											centeredSlides : true,
											on : {
												slideChange : function() {
													setTimeout(
															function() {
																if (checkSettGrpDoma()[0] == "001") {
																	getIstmMonsList(
																			'',
																			'001',
																			'rcnt',
																			'001',
																			checkSettGrpDoma()[1]);
																}
															}, 100);
												}
											},
										});
							});
		}
		setTimeout(function() {
		}, 100);
		$(".loadProgBar").css("display", "none");
	})
	$(document).on("click", ".card_discount .chk input", function() {
		if ($(this).is(":checked")) {
			$(".card_discount li").removeClass("checked");
			$(this).next().parent("li").addClass("checked");
		}
	});
	$(document).on("click", ".easypayment .item", function() {
		$(this).addClass("active").siblings().removeClass("active");
	});
	$(document)
			.on(
					"click",
					".otherpayment .chk input[type='radio']",
					function() {
						if ($(this).is(":checked")) {
							$(".otherpayment .item").removeClass("checked");
							$(this).next().parent().parent(".item").addClass(
									"checked");
						}
					});
</script> </main>
<!-- // container -->
<script src="https://js.tosspayments.com/v1/payment"></script>

<script type="text/javascript">
function tab_change(el){
	$('#settGrpDoma_005_1').closest("li").removeClass('ui-tabs-active');
	$('#settGrpDoma_001_2').closest("li").removeClass('ui-tabs-active');
	$('#settGrpDoma_003_3').closest("li").removeClass('ui-tabs-active');
	$('#settGrpDoma_004_4').closest("li").removeClass('ui-tabs-active');
	
	$(el).closest("li").addClass('ui-tabs-active').show();
	
	
	var id=$(el).attr("nohref");
	$(".item.settSvmt.simpSett_003_3.active").attr("class","item settSvmt simpSett_003_3");
	$("input:radio[name='etcSett']").prop('checked',false);
	$('#005_1').css('display','none');
	$('#001_2').css('display','none');
	$('#003_3').css('display','none');
	$('#004_4').css('display','none');
	$('#'+id).css('display', 'block');
}
	
	
	//다른 결제 수단인지 확인
	var otherpayment='';
	$("input:radio[name=etcSett]").click(function(){
    otherpayment=$("input[name=etcSett]:checked").val();
    console.log(otherpayment);
	});

//둘중에 하나라도 지불수단이 있는지 확인
	function consistpayment(){
		if(confpayment==null&&otherpayment==null){
			return false;
		}else{
			return true;
		}
	}	
	
	function enrollsavings(e){
		console.log($("input[name='svmtAmt']").val());
		if(e.keyCode==13){
			//mhpoint 값보다 입력한 값이 더 큰지 확인
			var mhpoint=(parseFloat("${member.mhpoint}")*parseFloat("${KRW_WON}")).toFixed(0);
			if(mhpoint<parseInt($("input[name='svmtAmt']").val())){
			alert('적립금이 부족합니다.');
			}else{
			$("input[name='svmtAmtInput']").val($("input[name='svmtAmt']").val());
			$('.mhpoint').text(priceComma(mhpoint-parseInt($("input[name='svmtAmt']").val())));
			$('input[name="mhpoint"]').val((parseFloat("${member.mhpoint}")-parseInt($("input[name='svmtAmt']").val())/parseFloat("${KRW_WON}")).toFixed(2));
			$('.exceptmhpoint').text($("input[name='svmtAmt']").val());
		$('.totalDcKrw').text(priceComma((parseFloat("${cartdis}") * parseFloat("${KRW_WON}")+parseFloat($("input[name='svmtAmtInput']").val())).toFixed(0))+ "원");
		$('input[name="totalDcKrw"]').val((parseFloat("${cartdis}") * parseFloat("${KRW_WON}")+parseFloat($("input[name='svmtAmtInput']").val())).toFixed(0));
		$('.totalDcUsd').text("$"+((parseFloat("${cartdis}") * parseFloat("${KRW_WON}")+parseFloat($("input[name='svmtAmtInput']").val())).toFixed(0)/parseFloat("${KRW_WON}")).toFixed(2));
		$('input[name="totalDcUsd"]').val(((parseFloat("${cartdis}") * parseFloat("${KRW_WON}")+parseFloat($("input[name='svmtAmtInput']").val())).toFixed(0)/parseFloat("${KRW_WON}")).toFixed(2));
		
		var total_bill_won=parseInt($('input[name="total_bill_won"]').val());
		console.log(total_bill_won);
		var totalDcKrw=parseInt($('input[name="totalDcKrw"]').val());
		console.log(totalDcKrw);
		$('.won.totalSettKrw').text(priceComma(total_bill_won-totalDcKrw)+"원");
		$('input[name="wontotalSettKrw"]').val(total_bill_won-totalDcKrw);
		var total_bill_dollar=parseFloat($('input[name="total_bill_dollar"]').val());
		console.log(total_bill_dollar);
		
		var totalDcUsd=parseFloat($('input[name="totalDcUsd"]').val());
		console.log(totalDcUsd);
		console.log(total_bill_dollar-totalDcUsd);
		$('.totalSettUsd').text("$"+priceComma((total_bill_dollar-totalDcUsd).toFixed(2)));
		$('input[name="totalSettUsd"]').val((total_bill_dollar-totalDcUsd).toFixed(2));
			}
		}
	}
	$(document).ready(function() {
		// 다이얼로그 초기화
		$("#seller_information").dialog({
			autoOpen : false,
			resizable : false,
			width : 400,
			maxHeight : 340,
			modal : true
		});
		
		$('input[name="total_bill_dollar"]').val(parseFloat("${cartprice}").toFixed(2));
		$('input[name="total_bill_won"]').val((parseFloat("${cartprice}") * parseFloat("${KRW_WON}")).toFixed(0));
		$('.total_bill_dollar_text').text('$'+priceComma(parseFloat("${cartprice}").toFixed(2)));
		$('.total_bill_won_text').text(priceComma((parseFloat("${cartprice}") * parseFloat("${KRW_WON}")).toFixed(0))+ "원");
		
		$('.totalDcUsd').text("$"+ priceComma(parseFloat("${cartdis}").toFixed(2)));
		$('.totalDcKrw').text(priceComma((parseFloat("${cartdis}") * parseFloat("${KRW_WON}")).toFixed(0))+ "원");
		$('input[name="totalDcUsd"]').val(parseFloat("${cartdis}").toFixed(2));
		$('input[name="totalDcKrw"]').val((parseFloat("${cartdis}") * parseFloat("${KRW_WON}")).toFixed(0));
		
		$('.totalSettUsd').text("$"+ priceComma(((parseFloat("${cartprice}") - parseFloat("${cartdis}"))).toFixed(2)));
		$('input[name="totalSettUsd"]').val(((parseFloat("${cartprice}") - parseFloat("${cartdis}"))).toFixed(2));
		$('.won.totalSettKrw').text(priceComma(((parseFloat("${cartprice}") * parseFloat("${KRW_WON}")) - (parseFloat("${cartdis}") * parseFloat("${KRW_WON}"))).toFixed(0))+ "원");
		$('input[name="wontotalSettKrw"]').val(((parseFloat("${cartprice}") * parseFloat("${KRW_WON}")) - (parseFloat("${cartdis}") * parseFloat("${KRW_WON}"))).toFixed(0))
		
		$('.totalRsvgDcKrw').text(priceComma((((parseFloat("${cartprice}") * parseFloat("${KRW_WON}")) - (parseFloat("${cartdis}") * parseFloat("${KRW_WON}")))*(parseFloat("${mhdiscount}")/100)).toFixed(0))+"원");
		$('.totalRsvg').text("${mhdiscount}"+"%");
		$("input[name='mhpoint']").val(parseFloat("${member.mhpoint}").toFixed(2));
		$('.mhpoint').text(priceComma((parseFloat("${member.mhpoint}"))));
		$(".exceptDc.dcInfo").text(priceComma((parseFloat("${cartdis}") * parseFloat("${KRW_WON}")).toFixed(0)));
		
		
		
	});
	
	jQuery.fn.center = function () {
	    this.css("position","absolute");
	    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
	    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
	    return this;
	}
	function showpopup(){
		$("#settInfoLayerPopupmodal").show();
		$("#settInfoLayerPopupmodal").center();
		$("#Mask").show();
	}
	
	function moveToMain() {
		location.href = ctx_shop + '/dm/main.do';
	}
	
	function priceComma(price) {
		return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	
	
	let oid="";
	
	var pay_cancel=document.getElementById("payment-cancel");
	var pay_button = document.getElementById("payment-button");
	
	pay_cancel.addEventListener("click", function () { 
		
		const Data={
				oid: oid
		};
		$.ajax({
			method:"post",
			data : Data,
			url : "/order/deleteorder",
			success : function(data){
			if(data=='yes'){
				$('#settInfoLayerPopupmodal').hide();
				$('#Mask').hide();
			}
			},
			error : function(){
	    	}
		});
	});
	
	
	const tossPayments = TossPayments("test_ck_ADpexMgkW36gbJ2kyzpVGbR5ozO0");
	
	function allUseSvmtClick(){
		var won_totalSettKrw=((parseFloat("${cartprice}") * parseFloat("${KRW_WON}")) - (parseFloat("${cartdis}") * parseFloat("${KRW_WON}"))).toFixed(0);
		var mhpoint=(parseFloat("${member.mhpoint}")*parseFloat("${KRW_WON}")).toFixed(0);
		if(won_totalSettKrw-mhpoint<0){
			$("input[name='svmtAmtInput']").val(won_totalSettKrw);
			$("input[name='svmtAmt']").val(priceComma(won_totalSettKrw));
			$('.mhpoint').text(priceComma(mhpoint-won_totalSettKrw));
			$('input[name="mhpoint"]').val(((mhpoint-won_totalSettKrw)/parseFloat("${KRW_WON}")).toFixed(2));
		}else{
			$("input[name='svmtAmtInput']").val(mhpoint);
			$("input[name='svmtAmt']").val(priceComma(mhpoint));
			$('input[name="mhpoint"]').val(0);
			$('.mhpoint').text(0);
		}
		
		

		$('.exceptmhpoint').text($("input[name='svmtAmt']").val());
		$('.totalDcKrw').text(priceComma((parseFloat("${cartdis}") * parseFloat("${KRW_WON}")+parseFloat($("input[name='svmtAmtInput']").val())).toFixed(0))+ "원");
		$('input[name="totalDcKrw"]').val((parseFloat("${cartdis}") * parseFloat("${KRW_WON}")+parseFloat($("input[name='svmtAmtInput']").val())).toFixed(0));
		$('.totalDcUsd').text("$"+((parseFloat("${cartdis}") * parseFloat("${KRW_WON}")+parseFloat($("input[name='svmtAmtInput']").val())).toFixed(0)/parseFloat("${KRW_WON}")).toFixed(2));
		$('input[name="totalDcUsd"]').val(((parseFloat("${cartdis}") * parseFloat("${KRW_WON}")+parseFloat($("input[name='svmtAmtInput']").val())).toFixed(0)/parseFloat("${KRW_WON}")).toFixed(2));
		
		var total_bill_won=parseInt($('input[name="total_bill_won"]').val());
		console.log(total_bill_won);
		var totalDcKrw=parseInt($('input[name="totalDcKrw"]').val());
		console.log(totalDcKrw);
		$('.won.totalSettKrw').text(priceComma(total_bill_won-totalDcKrw)+"원");
		$('input[name="wontotalSettKrw"]').val(total_bill_won-totalDcKrw);
		var total_bill_dollar=parseFloat($('input[name="total_bill_dollar"]').val());
		console.log(total_bill_dollar);
		
		var totalDcUsd=parseFloat($('input[name="totalDcUsd"]').val());
		console.log(totalDcUsd);
		console.log(total_bill_dollar-totalDcUsd);
		$('.totalSettUsd').text("$"+priceComma((total_bill_dollar-totalDcUsd).toFixed(2)));
		$('input[name="totalSettUsd"]').val((total_bill_dollar-totalDcUsd).toFixed(2));
	}
	
/* 	if($("input[name='svmtAmt']").val()!=''){
		console.log('exceptmhpoint');
		$('.exceptmhpoint').text($("input[name='svmtAmt']").val());
	} */
	
	((parseFloat("${cartprice}") * parseFloat("${KRW_WON}")) - (parseFloat("${cartdis}") * parseFloat("${KRW_WON}"))).toFixed(0)

	
	function orderexec(){
		showpopup();
		
		var mhpoint =(((parseFloat("${cartprice}") * parseFloat("${KRW_WON}")) - (parseFloat("${cartdis}") * parseFloat("${KRW_WON}")))*(parseFloat("${mhdiscount}")/100)).toFixed(0);
		if($('input[name="svmtAmtInput"]').val()!=''){
			mhpoint =parseFloat($('input[name="svmtAmtInput"]').val()).toFixed(2);
		}
		
		var total_bill_dollar_text=parseInt($('input[name="wontotalSettKrw"]').val());
		console.log(total_bill_dollar_text);
		
		
		const Data={
				
				orderitemlists: "${orderitemlist}",
				olvodeptdate : "${orderlist.odeptdate}",
				olvoplnum : "${orderlist.oplnum}",
				olvoplace : "${orderlist.oplace}",
				olvoelnum:"${orderlist.oelnum}",
				mid:"${mid}",
				total_bill_dollar_text:total_bill_dollar_text,
				mhpoint : mhpoint
		};
		
		
		$.ajax({
			method:"post",
			data : Data,
			url : "/order/postorderpays",
			success : function(data){
			oid=data;
			console.log(oid);
			$("#settInfoLayerPopupmodal").show();
			},
			error : function(){
	    	}
		});
	  	console.log("oid:"+oid);

		
		
		
}
	
	pay_button.addEventListener("click", function (){ 
		var total_bill_dollar_text=parseInt($('input[name="wontotalSettKrw"]').val());
		//간편결제인지 확인
		var confpayment=$('.item.settSvmt.simpSett_003_3.active').attr('data-settwaynm');
		var otherpayment=$("input[name=etcSett]:checked").val();
		console.log(confpayment);
		console.log(total_bill_dollar_text+ ": 2")
		if(confpayment!=null||otherpayment!=null){
			if(confpayment!=null && otherpayment==null){
				console.log(confpayment);
				var paymentData = {
			            amount: total_bill_dollar_text,
			            orderId : oid,
			            orderName: "${orderName}",
			            customerName: "${mid}",
			            successUrl: window.location.origin+"/pay/"+oid+ "/success",
			            failUrl: window.location.origin+"/pay/" +oid+ "/fail",
			            flowMode: 'DIRECT',
			            easyPay: confpayment
			        };
				tossPayments.requestPayment('카드', paymentData);
			}else if(confpayment==null && otherpayment!=null){
				var paymentData = {
			            amount: total_bill_dollar_text,
			            orderId : oid,
			            orderName: "${orderName}",
			            customerName: "${mid}",
			            successUrl: window.location.origin+"/pay/"+oid+ "/success",
			            failUrl: window.location.origin+"/pay/" +oid+ "/fail"
			        };
				tossPayments.requestPayment(otherpayment, paymentData);
			}else{
				return false;
			}
		}else{
	        var paymentData = {
	            amount: total_bill_dollar_text,
	            orderId : oid,
	            orderName: "${orderName}",
	            customerName: "${mid}",
	            successUrl: window.location.origin+"/pay/"+oid+ "/success",
	            failUrl: window.location.origin+"/pay/" +oid+ "/fail"
	        };
	        tossPayments.requestPayment('카드', paymentData);
		}

    });  

</script>

<%@ include file="../common/Footer.jsp" %>