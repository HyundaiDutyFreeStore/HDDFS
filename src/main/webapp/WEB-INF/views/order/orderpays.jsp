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
				<li><a href="/order">장바구니</a></li>
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
								<div class="enter_amount whether_use_points">
									<strong>즉시할인 적립금</strong>
									<ul class="chk">
										<li><input type="radio" name="pmptUseSvmtUseYn"
											id="pmptUseSvmtUse_Y" value="Y" disabled="disabled">
											<label for="pmptUseSvmtUse_Y">전액 즉시사용(<em
												class="pmptUseSvmtAmt">0</em>원)
										</label></li>
										<li><input type="radio" name="pmptUseSvmtUseYn"
											id="pmptUseSvmtUse_N" value="N" checked disabled="disabled">
											<label for="pmptUseSvmtUse_N">적립</label></li>
									</ul>
								</div>
								<div class="enter_amount">
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
											<em>10,000</em>원
										</dd>
									</dl>
									<div class="input">
										<input type="number" value="" name="svmtAmt" placeholder="0원">
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
						<!-- //대한항공 스카이패스 마일리지 적립 -->

						<!-- S: 2022-08-26 쇼핑백 추가-->
						<li id="sbagUseYn" class="open">
							<div class="title">
								<h4>친환경 캠페인 참여</h4>
								<a href="#none" class="btn">자세히보기</a>
							</div>
							<div class="shoping_bag accordion_box">
								<ul class="box_bag chk">
									<li><input type="radio" name="sbagUseYn" value="N"
										id="sbagUse_N"> <label for="sbagUse_N"> <span>
												<strong>쇼핑백 사용안함</strong> <em>함께하는 친환경 캠페인에 동참해주세요</em> <i>쇼핑백
													금액에 당사 상생기금을 추가 적립하여 사회취약계층에 기부됩니다.</i>
										</span>
									</label></li>
									<li><span> <input type="radio" name="sbagUseYn"
											value="Y" id="sbagUse_Y"> <label for="sbagUse_Y"><strong>쇼핑백
													사용</strong></label>
									</span></li>
								</ul>
								<p class="p_dot_list mgtxs">친환경 캠페인에 동참하시면 상품 인도시 일회용 쇼핑백 없이
									완충재만 제공 됩니다.</p>
							</div>
						</li>
						<!-- E: 2022-08-26 쇼핑백 추가-->

						<li id="settInfoTit" class="cat_tit">
							<div class="title">
								<h4>결제정보</h4>
								<em></em> <a href="javascript:void(0);" class="btn">자세히보기</a>
							</div>
							<div class="payment_method accordion_box">
								<div class="tab-action">
									<div class="payment_method_dim" style="display: none;"></div>
									<ul class="tab_square ">
										<li><a class="settGrpDoma" id="settGrpDoma_005_1"
											noHref="#005_1" data-cardbadge="Y">H.POINT PAY
												<p class="flag">혜택</p>
										</a></li>
										<li><a class="settGrpDoma" id="settGrpDoma_001_2"
											noHref="#001_2" data-cardbadge="Y">신용카드
												<p class="flag">혜택</p>
										</a></li>
										<li><a class="settGrpDoma" id="settGrpDoma_003_3"
											noHref="#003_3" data-cardbadge="Y">간편결제
												<p class="flag">혜택</p>
										</a></li>
										<li><a class="settGrpDoma" id="settGrpDoma_004_4"
											noHref="#004_4" data-cardbadge="">다른결제수단</a></li>
									</ul>

									<div class="panel">
										<div id="005_1" class="payway_area_hpay cont_item">
											<div class="alsoused chk">
												<input type="checkbox" id="befSettWaySaveYn_005_1"
													class="befSettWaySaveYn"> <label
													for="befSettWaySaveYn_005_1">선택한 결제수단 다음에도 사용</label>
											</div>

											<div class="mgts hpay_choose">
												<div class="chk">
													<input type="radio" id="hpay_01" name="hpay"
														checked="checked"> <label for="hpay_01"><img
														src="https://cdn.hddfs.com/front/images/KO/common/logo_hpay_s.jpg"
														alt="H.Point Pay"> 카드결제 <span class="hpay_tag">15만원이상
															8%리워드</span> </label>
												</div>
											</div>
											<div class="hpay_box card active">
												<div class="payway-swiper">
													<div class="swiper-wrapper">
														<!--
                                                                
                                                                 -->
														<div class="swiper-slide item">
															<div class="default">
																<button type="button" onclick="checkHpayTerms('card');">카드선택</button>
															</div>
														</div>
													</div>
												</div>
											</div>

											<div class="mgtm hpay_choose">
												<div class="chk">
													<input type="radio" id="hpay_02" name="hpay"> <label
														for="hpay_02"><img
														src="https://cdn.hddfs.com/front/images/KO/common/logo_hpay_s.jpg"
														alt="H.Point Pay"> 계좌이체 </label>
												</div>
											</div>
											<div class="hpay_box bankbook">
												<div class="payway-swiper">
													<div class="swiper-wrapper">

														<div class="swiper-slide item">
															<div class="default">
																<button type="button" onclick="checkHpayTerms('bank');">계좌추가</button>
															</div>
														</div>
													</div>
												</div>
											</div>


											<div class="paymentguide settGrp110">
												<strong>결제안내</strong>
												<ul class="dot">
													<span style="color: #ff0000">2023.01.01~01.31&nbsp;H.Point
														Pay(카드,계좌) 15만원 이상 결제시 최대 8만포인트&nbsp;적립 프로모션</span>
													<br />
													<br /> &bull; 리워드는 결제금액 구간별로 상이하며, 세부 내용은 혜택페이지를 참고하시기
													바랍니다.
													<br />
													<ul class="attention_list"
														style="list-style-type: none; box-sizing: border-box; font-size: 13px; font-family: &amp; quot; Noto Sans CJK KR&amp;quot; , 본고딕 , &amp;quot; sans-serif &amp;quot; , sans-serif; white-space: normal; word-spacing: 0px; text-transform: none; font-weight: 400; color: rgb(27, 30, 35); padding-bottom: 0px; font-style: normal; padding-top: 0px; padding-left: 0px; orphans: 2; widows: 2; margin: 0px; letter-spacing: 0px; padding-right: 0px; background-color: rgb(255, 255, 255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial">
														<br />
													</ul>
												</ul>
											</div>
											<div class="paymentguide settGrp005">
												<strong>유의사항</strong>
												<p>
													&middot; H.Point Pay는&nbsp; 현대백화점그룹 온라인몰에서 사용하실 수 있는 그룹 통합
													간편결제 서비스 입니다.<br /> &middot; 현대백화점 그룹 전 계열사 어느곳에서나 가입이
													가능하며, 해당 계열사에서 등록하신 결제수단을 통해 인터넷면세점에서 주문이 가능하십니다.<br />
													&nbsp; ※단, 현대백화점카드는 제외
												</p>
											</div>
										</div>
										<div id="001_2" class="payway_area_card  cont_item">
											<div class="item" id="defaultItem">
												<div class="default settSvmt orderSettCardList_001_2"
													data-grpsettcd="001" data-grpdispordg="2"
													data-dispsettwaycd="001" data-settwaycd=""
													data-settwaynm="" data-settcardid="" data-settovsecd="">
													<button type="button" class="orderSettCardList"
														data-depth="1">카드선택</button>
												</div>
											</div>
											<div class="item" id="cartItem">
												<div class="item_card settSvmt orderSettCardList_001_2"
													data-grpsettcd="001" data-grpdispordg="2"
													data-dispsettwaycd="001" data-settwaycd="06"
													data-settwaynm="현대카드" data-settcardid="4"
													data-settovsecd="" style="display: none;">
													<div class="alsoused chk">
														<input type="checkbox" id="befSettWaySaveYn_001_2_2"
															class="befSettWaySaveYn"> <label
															for="befSettWaySaveYn_001_2_2">선택한 결제수단 다음에도 사용</label>
													</div>
													<div class="color_KRO016406">
														<dl>
															<dt>현대카드</dt>
															<dd>
																<a href="javascript:void(0);"
																	class="btn orderSettCardList" data-depth="2"
																	onclick="return false;">카드변경</a>
															</dd>
														</dl>
														<div class="chk">
															<input type="checkbox" name="hyundaiCardM_001_2"
																id="hyundaiCardM_001_2"> <label
																for="hyundaiCardM_001_2">M포인트 사용</label>
														</div>
														<select name="istmMonsCnt_001_2" data-grpsettcd="001"
															data-grpdispordg="2" data-dispsettwaycd="001"
															data-settcardid="4" data-settovsecd="" data-reload="N">
														</select>
													</div>
												</div>
												<div class="item_card settSvmt orderSettCardList_001_2"
													data-grpsettcd="001" data-grpdispordg="2"
													data-dispsettwaycd="001" data-settwaycd="04"
													data-settwaynm="신한카드" data-settcardid="6"
													data-settovsecd="" style="display: none;">
													<div class="alsoused chk">
														<input type="checkbox" id="befSettWaySaveYn_001_2_3"
															class="befSettWaySaveYn"> <label
															for="befSettWaySaveYn_001_2_3">선택한 결제수단 다음에도 사용</label>
													</div>
													<div class="color_KRO016404">
														<dl>
															<dt>신한카드</dt>
															<dd>
																<a href="javascript:void(0);"
																	class="btn orderSettCardList" data-depth="2"
																	onclick="return false;">카드변경</a>
															</dd>
														</dl>
														<select name="istmMonsCnt_001_2" data-grpsettcd="001"
															data-grpdispordg="2" data-dispsettwaycd="001"
															data-settcardid="6" data-settovsecd="" data-reload="N">
														</select>
													</div>
												</div>
												<div class="item_card settSvmt orderSettCardList_001_2"
													data-grpsettcd="001" data-grpdispordg="2"
													data-dispsettwaycd="001" data-settwaycd="01"
													data-settwaynm="비씨카드" data-settcardid="0100"
													data-settovsecd="" style="display: none;">
													<div class="alsoused chk">
														<input type="checkbox" id="befSettWaySaveYn_001_2_4"
															class="befSettWaySaveYn"> <label
															for="befSettWaySaveYn_001_2_4">선택한 결제수단 다음에도 사용</label>
													</div>
													<div class="color_KRO016401">
														<dl>
															<dt>비씨카드</dt>
															<dd>
																<a href="javascript:void(0);"
																	class="btn orderSettCardList" data-depth="2"
																	onclick="return false;">카드변경</a>
															</dd>
														</dl>
														<select name="istmMonsCnt_001_2" data-grpsettcd="001"
															data-grpdispordg="2" data-dispsettwaycd="001"
															data-settcardid="0100" data-settovsecd="" data-reload="N">
														</select>
													</div>
												</div>
												<div class="item_card settSvmt orderSettCardList_001_2"
													data-grpsettcd="001" data-grpdispordg="2"
													data-dispsettwaycd="001" data-settwaycd="02"
													data-settwaynm="국민카드" data-settcardid="0204"
													data-settovsecd="" style="display: none;">
													<div class="alsoused chk">
														<input type="checkbox" id="befSettWaySaveYn_001_2_5"
															class="befSettWaySaveYn"> <label
															for="befSettWaySaveYn_001_2_5">선택한 결제수단 다음에도 사용</label>
													</div>
													<div class="color_KRO016402">
														<dl>
															<dt>국민카드</dt>
															<dd>
																<a href="javascript:void(0);"
																	class="btn orderSettCardList" data-depth="2"
																	onclick="return false;">카드변경</a>
															</dd>
														</dl>
														<select name="istmMonsCnt_001_2" data-grpsettcd="001"
															data-grpdispordg="2" data-dispsettwaycd="001"
															data-settcardid="0204" data-settovsecd="" data-reload="N">
														</select>
													</div>
												</div>
												<div class="item_card settSvmt orderSettCardList_001_2"
													data-grpsettcd="001" data-grpdispordg="2"
													data-dispsettwaycd="001" data-settwaycd="21"
													data-settwaynm="롯데카드" data-settcardid="5"
													data-settovsecd="" style="display: none;">
													<div class="alsoused chk">
														<input type="checkbox" id="befSettWaySaveYn_001_2_6"
															class="befSettWaySaveYn"> <label
															for="befSettWaySaveYn_001_2_6">선택한 결제수단 다음에도 사용</label>
													</div>
													<div class="color_KRO016421">
														<dl>
															<dt>롯데카드</dt>
															<dd>
																<a href="javascript:void(0);"
																	class="btn orderSettCardList" data-depth="2"
																	onclick="return false;">카드변경</a>
															</dd>
														</dl>
														<select name="istmMonsCnt_001_2" data-grpsettcd="001"
															data-grpdispordg="2" data-dispsettwaycd="001"
															data-settcardid="5" data-settovsecd="" data-reload="N">
														</select>
													</div>
												</div>
												<div class="item_card settSvmt orderSettCardList_001_2"
													data-grpsettcd="001" data-grpdispordg="2"
													data-dispsettwaycd="001" data-settwaycd="05"
													data-settwaynm="삼성카드" data-settcardid="2"
													data-settovsecd="" style="display: none;">
													<div class="alsoused chk">
														<input type="checkbox" id="befSettWaySaveYn_001_2_7"
															class="befSettWaySaveYn"> <label
															for="befSettWaySaveYn_001_2_7">선택한 결제수단 다음에도 사용</label>
													</div>
													<div class="color_KRO016405">
														<dl>
															<dt>삼성카드</dt>
															<dd>
																<a href="javascript:void(0);"
																	class="btn orderSettCardList" data-depth="2"
																	onclick="return false;">카드변경</a>
															</dd>
														</dl>
														<select name="istmMonsCnt_001_2" data-grpsettcd="001"
															data-grpdispordg="2" data-dispsettwaycd="001"
															data-settcardid="2" data-settovsecd="" data-reload="N">
														</select>
													</div>
												</div>
												<div class="item_card settSvmt orderSettCardList_001_2"
													data-grpsettcd="001" data-grpdispordg="2"
													data-dispsettwaycd="001" data-settwaycd="03"
													data-settwaynm="하나카드" data-settcardid="11"
													data-settovsecd="" style="display: none;">
													<div class="alsoused chk">
														<input type="checkbox" id="befSettWaySaveYn_001_2_8"
															class="befSettWaySaveYn"> <label
															for="befSettWaySaveYn_001_2_8">선택한 결제수단 다음에도 사용</label>
													</div>
													<div class="color_KRO016403">
														<dl>
															<dt>하나카드</dt>
															<dd>
																<a href="javascript:void(0);"
																	class="btn orderSettCardList" data-depth="2"
																	onclick="return false;">카드변경</a>
															</dd>
														</dl>
														<select name="istmMonsCnt_001_2" data-grpsettcd="001"
															data-grpdispordg="2" data-dispsettwaycd="001"
															data-settcardid="11" data-settovsecd="" data-reload="N">
														</select>
													</div>
												</div>
												<div class="item_card settSvmt orderSettCardList_001_2"
													data-grpsettcd="001" data-grpdispordg="2"
													data-dispsettwaycd="001" data-settwaycd="08"
													data-settwaynm="NH카드" data-settcardid="14"
													data-settovsecd="" style="display: none;">
													<div class="alsoused chk">
														<input type="checkbox" id="befSettWaySaveYn_001_2_9"
															class="befSettWaySaveYn"> <label
															for="befSettWaySaveYn_001_2_9">선택한 결제수단 다음에도 사용</label>
													</div>
													<div class="color_KRO016408">
														<dl>
															<dt>NH카드</dt>
															<dd>
																<a href="javascript:void(0);"
																	class="btn orderSettCardList" data-depth="2"
																	onclick="return false;">카드변경</a>
															</dd>
														</dl>
														<select name="istmMonsCnt_001_2" data-grpsettcd="001"
															data-grpdispordg="2" data-dispsettwaycd="001"
															data-settcardid="14" data-settovsecd="" data-reload="N">
														</select>
													</div>
												</div>
												<div class="item_card settSvmt orderSettCardList_001_2"
													data-grpsettcd="001" data-grpdispordg="2"
													data-dispsettwaycd="002" data-settwaycd=""
													data-settwaynm="해외신용카드" data-settcardid=""
													data-settovsecd="P000" style="display: none;">
													<div class="alsoused chk">
														<input type="checkbox" id="befSettWaySaveYn_001_2_10"
															class="befSettWaySaveYn"> <label
															for="befSettWaySaveYn_001_2_10">선택한 결제수단 다음에도 사용</label>
													</div>
													<div class="color_KRO0164P000">
														<dl>
															<dt>해외신용카드</dt>
															<dd>
																<a href="javascript:void(0);"
																	class="btn orderSettCardList" data-depth="2"
																	onclick="return false;">카드변경</a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
											<div class="paymentguide payment00142 settTextDataNoti">
											</div>
											<div class="paymentguide payment00162 settTextDataNoti">
											</div>
											<div class="paymentguide payment00101002 settTextDataNoti">
												<strong>결제안내</strong>
												<ul class="dot">
													<strong>※BC카드 적용회원사: </strong>
													<br />
													우리(BC)카드,SC제일은행,하나(BC)카드,NH농협(BC)카드,IBK기업은행,KB국민(BC)카드,DGB대구은행,
													<br /> BNK부산은행,BNK경남은행,한국씨티(BC)카드,신한(BC)카드,비씨카드㈜
													자체발행카드(바로카드)에서 발행된 BC카드&nbsp;
													<br />
													<br />
													<u><strong>자세한 내용은 카드사에 문의해 주시기 바랍니다.</strong></u>
												</ul>
											</div>
											<div class="paymentguide payment00102042 settTextDataNoti">
											</div>
											<div class="paymentguide payment00152 settTextDataNoti">
											</div>
											<div class="paymentguide payment00122 settTextDataNoti">
											</div>
											<div class="paymentguide payment001112 settTextDataNoti">
											</div>
											<div class="paymentguide payment001142 settTextDataNoti">
											</div>
											<div class="paymentguide payment0022 settTextDataNoti">
											</div>
											<div class="paymentguide settGrp001 settTextDataNtc"></div>

											<div class="paymentguide payment002 settTextDataNoti">
											</div>

											<div class="paymentguide payment002 settTextDataNtc">
												<strong>유의사항</strong>
												<p>
													<strong>[해외카드&nbsp;결제 시 유의사항]</strong><br /> <span
														style="color: #ff0000">&bull;&nbsp;카드 발급 국가와 국적이
														상이할 경우 결제가 불가할 수 있습니다.</span><br /> &bull; 주문 전체가 아닌 부분 취소 시에는
													카드 취소가 불가하며, 현금으로 환불됩니다.<br /> &bull; 반품 금의 해외송금을 원하시는 경우
													해외송금 수수료가 부과될 수 있습니다.<br /> &bull; 부분 취소 시
													고객센터&nbsp;(1811-6688 / 운영시간 09:30~18:30) 로 문의하여 주시기 바랍니다.<br />
												</p>
											</div>

										</div>
										<div id="003_3" class="payway_area_easy  cont_item">
											<div class="chk">
												<input type="checkbox" id="befSettWaySaveYn_003_3"
													class="befSettWaySaveYn"> <label
													for="befSettWaySaveYn_003_3">선택한 결제수단 다음에도 사용</label>
											</div>
											<div class="easypayment">
												<a noHref class="item settSvmt simpSett_003_3active"
													data-grpsettcd="003" data-grpdispordg="3"
													data-dispsettwaycd="106" data-settwaynm="카카오페이"
													data-settovsecd="">
													<div class="active">
														<span class="img"> <img
															src="https://cdn.hddfs.com/front/images/KO/payment/easy_ic_biz_KRO0102106.png"
															alt="카카오페이">
														</span>
														<p>카카오페이</p>
													</div>
												</a> <a noHref class="item settSvmt simpSett_003_3"
													data-grpsettcd="003" data-grpdispordg="3"
													data-dispsettwaycd="109" data-settwaynm="페이코"
													data-settovsecd="">
													<div class="">
														<span class="tag">PAYCO 2% 포인트 적립</span> <span class="img">
															<img
															src="https://cdn.hddfs.com/front/images/KO/payment/easy_ic_biz_KRO0102109.png"
															alt="페이코">
														</span>
														<p>페이코</p>
													</div>
												</a> <a noHref class="item settSvmt simpSett_003_3"
													data-grpsettcd="003" data-grpdispordg="3"
													data-dispsettwaycd="202" data-settwaynm="위쳇페이"
													data-settovsecd="P141">
													<div class="">
														<span class="img"> <img
															src="https://cdn.hddfs.com/front/images/KO/payment/easy_ic_biz_KRO0102202.png"
															alt="위쳇페이">
														</span>
														<p>위쳇페이</p>
													</div>
												</a> <a noHref class="item settSvmt simpSett_003_3"
													data-grpsettcd="003" data-grpdispordg="3"
													data-dispsettwaycd="201" data-settwaynm="Alipay+"
													data-settovsecd="P003">
													<div class="">
														<span class="img"> <img
															src="https://cdn.hddfs.com/front/images/KO/payment/easy_ic_biz_KRO0102201.png"
															alt="Alipay+">
														</span>
														<p>Alipay+</p>
													</div>
												</a> <a noHref class="item settSvmt simpSett_003_3"
													data-grpsettcd="003" data-grpdispordg="3"
													data-dispsettwaycd="107" data-settwaynm="스마일페이"
													data-settovsecd="">
													<div class="">
														<span class="img"> <img
															src="https://cdn.hddfs.com/front/images/KO/payment/easy_ic_biz_KRO0102107.png"
															alt="스마일페이">
														</span>
														<p>스마일페이</p>
													</div>
												</a> <a noHref class="item settSvmt simpSett_003_3"
													data-grpsettcd="003" data-grpdispordg="3"
													data-dispsettwaycd="108" data-settwaynm="네이버페이"
													data-settovsecd="">
													<div class="">
														<span class="img"> <img
															src="https://cdn.hddfs.com/front/images/KO/payment/easy_ic_biz_KRO0102108.png"
															alt="네이버페이">
														</span>
														<p>네이버페이</p>
													</div>
												</a> <a noHref class="item settSvmt simpSett_003_3"
													data-grpsettcd="003" data-grpdispordg="3"
													data-dispsettwaycd="205" data-settwaynm="UnionPay"
													data-settovsecd="P002">
													<div class="">
														<span class="img"> <img
															src="https://cdn.hddfs.com/front/images/KO/payment/easy_ic_biz_KRO0102205.png"
															alt="UnionPay">
														</span>
														<p>UnionPay</p>
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
													<span style="color: #ff0000">2022.10.01~10.31 PAYCO
														결제금액의 3% 무제한 포인트 적립 프로모션</span>
													<br />
													<br /> ※ PAYCO 간편결제 유의사항
													<br /> - 온/오프라인 쇼핑은 물론 송금, 멤버십 적립까지 가능한 통합 서비스 입니다.
													<br /> - 휴대폰과 카드 명의자가 동일해야 결제 가능하며, 결제금액 제한은 없습니다.
													<br /> &nbsp; (지원카드: 모든 국내 신용/체크 카드)
													<br /> - PAYCO에서 제공하는 제휴사 쿠폰을 이용한 주문건의 경우, 쿠폰 사용금액보다 적은
													금액은 부분취소/부분반품이 되지 않습니다.
													<br /> - PAYCO 결제 건 취소의 경우&nbsp;환불완료까지 1~2주 정도 소요될 수 있는 점
													양해부탁드립니다.
												</ul>
											</div>
											<div class="paymentguide payment2023 settTextDataNoti">
											</div>
											<div class="paymentguide payment2013 settTextDataNoti">
											</div>
											<div class="paymentguide payment1073 settTextDataNoti">
											</div>
											<div class="paymentguide payment1083 settTextDataNoti">
												<strong>결제안내</strong>
												<ul class="dot">
													&middot; 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수
													있습니다.
													<br />
													<br /> &middot; 네이버페이는 네이버 ID 로 별도 앱 설치 없이 신용카드 또는 은행계좌
													정보를 등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다.
													<br />
													<br /> &middot; 결제 가능한 신용카드 :&nbsp; 신한 ,&nbsp; 삼성 ,&nbsp;
													현대 , BC,&nbsp; 국민 ,&nbsp; 하나 ,&nbsp; 롯데 , NH 농협 ,&nbsp; 씨티
													,&nbsp; 카카오뱅크
													<br />
													<br /> &middot; 결제 가능한 은행 : NH 농협 ,&nbsp; 국민 ,&nbsp; 신한
													,&nbsp; 우리 ,&nbsp; 기업 , SC 제일 ,&nbsp; 부산 ,&nbsp; 경남 ,&nbsp;
													수협 ,&nbsp; 우체국 ,&nbsp; 미래에셋대우 ,&nbsp; 광주 ,&nbsp; 대구 ,&nbsp;
													전북 ,&nbsp; 새마을금고 ,&nbsp; 제주은행 ,&nbsp; 신협 ,&nbsp; 하나은행
													,&nbsp; 케이뱅크 ,&nbsp; 카카오뱅크 ,&nbsp; 삼성증권 , KDB 산업은행 , 씨티은행 ,
													SBI 은행 ,&nbsp; 유안타증권 ,&nbsp; 유진투자증권
													<br />
													<br /> &middot; 네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사 별 무이자
													,&nbsp; 청구할인 혜택을 받을 수 있습니다.
													<br />
												</ul>
											</div>
											<div class="paymentguide payment2053 settTextDataNoti">
											</div>
											<div class="paymentguide settGrp003 settTextDataNtc"></div>

										</div>
										<div id="004_4" class="payway_area_other cont_item">
											<div class="otherpayment">
												<div class="alsoused chk">
													<input type="checkbox" id="befSettWaySaveYn_004_4"
														class="befSettWaySaveYn"> <label
														for="befSettWaySaveYn_004_4">선택한 결제수단 다음에도 사용</label>
												</div>
												<div class="item card_banktransfer checked">
													<div class="chk">
														<input type="radio" class="settSvmt" name="etcSett_004_4"
															id="etcSett_004_4_103" checked value="103"
															data-grpsettcd="004" data-grpdispordg="4"
															data-dispsettwaynm="무통장입금" data-dispsettwaycd="103">
														<label for="etcSett_004_4_103">
															<div>
																<p>무통장입금</p>
																<span>예금주 : (주)현대백화점면세점</span>
															</div>
															<ul>
																<li><label>은행선택<i>*</i></label> <select
																	name="virtAcntBnkCd_004_4" class="settSvmt"
																	data-grpsettcd="004" data-grpdispordg="4">
																		<option value="" data-bdgedispwrd="">선택</option>
																		<option value="31" data-bdgedispwrd="">대구은행</option>
																		<option value="37" data-bdgedispwrd="">전북은행</option>
																		<option value="27" data-bdgedispwrd="">시티은행</option>
																		<option value="20" data-bdgedispwrd="">우리은행</option>
																		<option value="11" data-bdgedispwrd="">농협은행</option>
																		<option value="04" data-bdgedispwrd="">국민은행</option>
																		<option value="03" data-bdgedispwrd="">기업은행</option>
																		<option value="34" data-bdgedispwrd="">광주은행</option>
																		<option value="05" data-bdgedispwrd="">
																			하나(외환)은행</option>
																		<option value="26" data-bdgedispwrd="">신한은행</option>
																		<option value="23" data-bdgedispwrd="">
																			SC제일은행</option>
																		<option value="71" data-bdgedispwrd="">우체국</option>
																		<option value="32" data-bdgedispwrd="">부산은행</option>
																		<option value="39" data-bdgedispwrd="">경남은행</option>
																</select>
																	<p>원하는 은행을 선택하시면, 결제완료페이지에서 입금하실 계좌번호를 확인할 수 있습니다.</p>
																</li>
																<li><label>입금자<i>*</i></label> <input type="text"
																	name="svacOwrNm_004_4" value="유혜승" maxlength="7"
																	placeholder="홍길동"></li>
																<li><strong> 입금기한 <em id="004_4_depoDttm">2023년
																			01월 10일 23:54</span>
																	</em>
																</strong>
																	<ol class="list">
																		<li>가상계좌의 입금가능 기한은 주문 당일 23:54분까지 이며, 미 입금 시 자동으로
																			취소됩니다.</li>
																		<li>매장 판매분으로 인해, 입금완료. 이후라도 입금 시점에 따라 재고부족으로 자동취소
																			될 수 있습니다.</li>
																	</ol></li>
															</ul>
														</label>
													</div>

													<div class="paymentguide payment1044 settTextDataNoti">
													</div>
													<div class="paymentguide payment103314 settTextDataNoti">
													</div>
													<div class="paymentguide payment103374 settTextDataNoti">
													</div>
													<div class="paymentguide payment103274 settTextDataNoti">
													</div>
													<div class="paymentguide payment103204 settTextDataNoti">
													</div>
													<div class="paymentguide payment103114 settTextDataNoti">
													</div>
													<div class="paymentguide payment103044 settTextDataNoti">
													</div>
													<div class="paymentguide payment103034 settTextDataNoti">
													</div>
													<div class="paymentguide payment103344 settTextDataNoti">
													</div>
													<div class="paymentguide payment103054 settTextDataNoti">
													</div>
													<div class="paymentguide payment103264 settTextDataNoti">
													</div>
													<div class="paymentguide payment103234 settTextDataNoti">
													</div>
													<div class="paymentguide payment103714 settTextDataNoti">
													</div>
													<div class="paymentguide payment103324 settTextDataNoti">
													</div>
													<div class="paymentguide payment103394 settTextDataNoti">
													</div>
													<div class="paymentguide settGrp004 settTextDataNtc">
													</div>
												</div>
												<div class="item card_mobilepayment">
													<div class="chk">
														<input type="radio" name="etcSett_004_4"
															id="etcSett_004_4_104" value="104" data-grpsettcd="004"
															data-grpdispordg="4" data-dispSettWayNm="휴대폰 소액결제"
															class="settSvmt" data-dispsettwaycd="104"
															data-settovsecd=""> <label
															for="etcSett_004_4_104">
															<div>
																<p>휴대폰 소액결제</p>
															</div>
														</label>

													</div>

													<div class="paymentguide payment1044 settTextDataNoti">
													</div>
													<div class="paymentguide payment103314 settTextDataNoti">
													</div>
													<div class="paymentguide payment103374 settTextDataNoti">
													</div>
													<div class="paymentguide payment103274 settTextDataNoti">
													</div>
													<div class="paymentguide payment103204 settTextDataNoti">
													</div>
													<div class="paymentguide payment103114 settTextDataNoti">
													</div>
													<div class="paymentguide payment103044 settTextDataNoti">
													</div>
													<div class="paymentguide payment103034 settTextDataNoti">
													</div>
													<div class="paymentguide payment103344 settTextDataNoti">
													</div>
													<div class="paymentguide payment103054 settTextDataNoti">
													</div>
													<div class="paymentguide payment103264 settTextDataNoti">
													</div>
													<div class="paymentguide payment103234 settTextDataNoti">
													</div>
													<div class="paymentguide payment103714 settTextDataNoti">
													</div>
													<div class="paymentguide payment103324 settTextDataNoti">
													</div>
													<div class="paymentguide payment103394 settTextDataNoti">
													</div>
													<div class="paymentguide settGrp004 settTextDataNtc">
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
						<li><strong>총 주문금액합계</strong> <span> <em class="total_bill_dollar_text">$1</em>
								<p class="total_bill_won_text">1,267원</p>
						</span></li>
						<li class="discount_list"><strong>
								<button type="button" class="btn">총할인금액</button>
						</strong> <span> <em class="totalDcUsd">$0.3</em>
								<p class="totalDcKrw">380원</p>
						</span>
							<ul class="details">
								<li><span>세트상품할인</span> <em>원</em><em
									class="exceptDc dcInfo">0</em></li>
								<li><span>상품할인</span> <em>원</em><em class="exceptDc dcInfo">380</em>
								</li>
								<li><span>인터넷회원할인</span> <em>원</em><em
									class="exceptDc dcInfo">0</em></li>
								<li><span>쿠폰할인</span> <em>원</em><em class="dcCupKrw dcInfo">0</em>
								</li>
								<li><span class="card"> <empty
											id="cardPtnrPmptDcTypeText"></empty>즉시할인(<ez class="card"></ez>)
								</span> <em>원</em><em class="pmptDcAmt dcInfo">0</em></li>
								<li><span class="type">제휴사인증할인 (<ez class="type"></ez>)
								</span> <em>원</em><em class="ptnrPmptDcAmt dcInfo">0</em></li>
								<li><span>즉시할인 적립금</span> <em>원</em><em
									class="pay_data_pmptUseSvmtAmt dcInfo">0</em></li>
								<li><span>일반적립금</span> <em>원</em><em
									class="svmtUseKrw settWay dcInfo">0</em></li>
								<li><span>이벤트플러스적립금</span> <em>원</em><em
									class="evntSvmtUseKrw settWay dcInfo">0</em></li>
								<li><span>브랜드플러스적립금</span> <em>원</em><em
									class="branSvmtUseKrw settWay dcInfo">0</em></li>
								<li><span>제휴플러스적립금</span> <em>원</em><em
									class="ptnsSvmtUseKrw settWay dcInfo">0</em></li>
								<li><span>결제플러스적립금</span> <em>원</em><em
									class="settSvmtUseKrw settWay dcInfo">0</em></li>
								<li><span>H.Point</span> <em>원</em><em
									class="hPoinUseKrw settWay dcInfo">0</em></li>
								<li><span>H.Point Plus 포인트</span> <em>원</em><em
									class="hPoinPlsUseKrw settWay dcInfo">0</em></li>
								<li><span>제휴포인트 (복지포인트)</span> <em>원</em><em
									class="ezwelWlfrPoinUseKrw dcInfo">0</em></li>
								<li><span>제휴포인트 (복지적립금)</span> <em>원</em><em
									class="ezwelSvmtUseKrw dcInfo">0</em></li>
								<li><span>제휴포인트 (특별 복지포인트)</span> <em>원</em><em
									class="ezwelSpclPoinUseKrw dcInfo">0</em></li>
								<li><span>예치금</span> <em>원</em><em
									class="cdpstUseKrw settWay dcInfo">0</em></li>
								<li><span>선수금</span> <em>원</em><em
									class="advsUseKrw settWay dcInfo">0</em></li>
								<li><span>상품권 전환금</span> <em>원</em><em
									class="gfCaCdpstUseKrw settWay dcInfo">0</em></li>
							</ul></li>
						<li id="chagDcEvtInfoDl" style="display: none"><strong>
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
							<em class="totalSettUsd">$0.7</em>
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

		console.log("common.ui bind start")

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

		if (isLogin) {

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

		if (isLogin) {
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
			toggleCashRcpt();
			paymentSettInfo();
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
<script type="text/javascript">
	function sellerInfo() {
		$("#seller_information").dialog("open");
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
		$('.total_bill_dollar_text').text('$'+priceComma(parseFloat("${cartprice}").toFixed(2)));
		$('.total_bill_won_text').text(priceComma((parseFloat("${cartprice}") * 1267).toFixed(0))+ "원");
		$('.totalDcUsd').text("$"+ priceComma(parseFloat("${cartdis}").toFixed(2)));
		$('.totalDcKrw').text(priceComma((parseFloat("${cartdis}") * 1267).toFixed(0))+ "원");
		$('.totalSettUsd').text("$"+ priceComma(((parseFloat("${cartprice}") - parseFloat("${cartdis}"))).toFixed(2)));
		$('.won.totalSettKrw').text(priceComma(((parseFloat("${cartprice}") * 1267) - (parseFloat("${cartdis}") * 1267)).toFixed(0))+ "원");
		$('.totalRsvgDcKrw').text(priceComma((((parseFloat("${cartprice}") * 1267) - (parseFloat("${cartdis}") * 1267))*parseFloat("${mhdiscount}")).toFixed(0))+"원");
		$('.totalRsvg').text("${mhdiscount}"+"%");
		
		
		
		<% 
		
		List<OrderItemVO> list = (List<OrderItemVO>)request.getAttribute("orderitemlist");

		for(int i=0;i<list.size();i++){ 
		%>
		 var pcode=<%=list.get(i).getPcode() %>;
		 var oamount=<%=list.get(i).getOamount() %>
		 var index=<%=i%>;
		 console.log(<%=list.get(i).getPcode() %>);
		 
		$('#orderexec').append('<input name="orderitem['+index+'].pcode" type="hidden" value="'+pcode +'">');
		$('#orderexec').append('<input name="orderitem['+index+'].oamount" type="hidden" value="'+oamount+'">');
		$('#orderexec').append('<input name="orderitem['+index+'].oid" type="hidden" value="">');
		
		<%
		}
		%>
		
		var wontotalSettKrw =((parseFloat("${cartprice}") * 1267) - (parseFloat("${cartdis}") * 1267)).toFixed(0);
		var mhpoint =(((parseFloat("${cartprice}") * 1267) - (parseFloat("${cartdis}") * 1267))*parseFloat("${mhdiscount}")).toFixed(0);
		$("#orderexec").append('<input type="hidden" name="wontotalSettKrw" value="'+wontotalSettKrw +'">');
		$("#orderexec").append('<input type="hidden" name="olvoarrdate" value="${orderlist.oarrdate}">');
		$("#orderexec").append('<input type="hidden" name="olvoplnum"  value="${orderlist.oplnum}">');
		$("#orderexec").append('<input type="hidden" name="olvoelnum"  value="${orderlist.oelnum}">');
		$("#orderexec").append('<input type="hidden" name="olvoplace"  value="${orderlist.oplace}">');
		$("#orderexec").append('<input type="hidden" name="mhpoint"  value="'+mhpoint +'">');
		
	});

	function moveToMain() {
		location.href = ctx_shop + '/dm/main.do';
	}
	
	function priceComma(price) {
		return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	function orderexec(){
		
		$('#orderexec').submit();
		
	}
	
</script>

<%@ include file="../common/Footer.jsp"%>