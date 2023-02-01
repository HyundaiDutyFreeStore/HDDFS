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
				<li style="color: black;">장바구니</li>
				<li style="color: black;">여권정보</li>
				<li style="color: black;">출국정보</li>
				<li><strong class="on" id="tabOrder">주문결제</strong></li>
			</ul>
			<div class="payment_board">
				<div class="order_sheet">
					<ul class="accordion">
						<li>
							<div class="title">
								<h4>쿠폰할인</h4>
								<em id="dispCupDcTotalAmt" class="pirce">(${coupon_count }</em><em
									class="sale">장)</em> 
									<c:if test="${coupon_count ne 0}">
									<a href="javascript:void(0);" class="btn">자세히보기</a>
									</c:if>
							</div>
							<c:if test="${coupon_count ne 0}">
							<div class="coupon_list accordion_box">
							<c:forEach var="coupon" items="${order_couponlist}">
								<div class="enter_amount whether_use_points">
										<strong> ${coupon.event.ename }</strong>
										<ul class="chk">
			                                    <li>
			                                        <input type="radio" name="pmptUseSvmtUseYn" id="${coupon.cid }_N" value="N">
			                                        <label for="${coupon.cid }_N">사용 안함</label>
			                                    </li>
			                                    <li>
			                                        <input type="radio" name="pmptUseSvmtUseYn" id="${coupon.cid }" value="${coupon.event.esale }" >
			                                        <label for="${coupon.cid }">사용</label>
			                                    </li>
			                            </ul>
								</div>
								</c:forEach>
							</div>
						</c:if>
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
								<li><span>쿠폰 할인</span> <em>원</em>
								<input type="hidden" name="coupondiscount"/>
								<em class="coupondiscount">0</em>
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
</form>

<iframe id=MPIFRAME name=MPIFRAME style="display: none"></iframe>
</div>
<form id="orderexec" method="post" action="/order/postorderpays">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>


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
            
        } else if(type == "dpatproh") {
            $(".jeju_pop").dialog("close");
        } else {
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
                       <c:when test="${ orderlist.odept eq 'ICNT1'}">
                       <td>인천공항 T1</td>
                       </c:when>
                       <c:when test="${ orderlist.odept eq 'ICNT2'}">
                       <td>인천공항 T2</td>
                       </c:when>
                       <c:when test="${ orderlist.odept eq 'GMP'}">
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
	}
	
})

$(document).on("click", ".easypayment .item", function() {
	$(this).addClass("active").siblings().removeClass("active");
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
		var mhpoint=(parseFloat("${member.mhpoint}"));
		if(parseFloat($("input[name='svmtAmt']").val())>mhpoint){
			alert('적립금이 부족합니다.');
			$("input[name='svmtAmt']").val("");
			return false;
		}
		if(e.keyCode==13){

			$("input[name='svmtAmtInput']").val($("input[name='svmtAmt']").val());
			$('.mhpoint').text(priceComma(mhpoint-parseInt($("input[name='svmtAmt']").val())));
			$('input[name="mhpoint"]').val((parseFloat("${member.mhpoint}")-parseInt($("input[name='svmtAmt']").val())).toFixed(2));
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
	$(document).ready(function() {
		
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
	
	function priceComma(price) {
		return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	
	
	let oid="";
	
	var pay_cancel=document.getElementById("payment-cancel");
	var pay_button = document.getElementById("payment-button");
	
	pay_cancel.addEventListener("click", function () { 
		
		var order_dollar=$('input[name="totalSettUsd"]').val();
		
		const Data={
				oid: oid,
				order_dollar:order_dollar
		};
		$.ajax({
			method:"post",
			data : Data,
			url : "/order/cancelorder",
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
	var isallchecked=false;
	function allUseSvmtClick(){
		var won_totalSettKrw=(parseFloat($('input[name="wontotalSettKrw"]').val())).toFixed(0);
		var mhpoint=(parseFloat("${member.mhpoint}")).toFixed(0);
		if(isallchecked){
			$('input[name="totalDcKrw"]').val(parseInt($('input[name="totalDcKrw"]').val())-parseInt($('input[name="svmtAmtInput"]').val()));
			$('.mhpoint').text(priceComma(parseInt($('input[name="mhpoint"]').val())+parseInt($("input[name='svmtAmtInput']").val())));
			$('input[name="mhpoint"]').val(parseInt($('input[name="mhpoint"]').val())+parseInt($("input[name='svmtAmtInput']").val()));
			$("input[name='svmtAmt']").val("0");
			$("input[name='svmtAmtInput']").val(0);
			isallchecked=false;
		}else{
			if(won_totalSettKrw-mhpoint<0){
				$("input[name='svmtAmtInput']").val((won_totalSettKrw*0.1).toFixed(0));
				$("input[name='svmtAmt']").val(priceComma($("input[name='svmtAmtInput']").val()));
				$('input[name="mhpoint"]').val((mhpoint-parseInt($("input[name='svmtAmtInput']").val())));
				$('.mhpoint').text(priceComma($('input[name="mhpoint"]').val()));
				$('input[name="totalDcKrw"]').val(parseInt($('input[name="svmtAmtInput"]').val())+parseInt($('input[name="totalDcKrw"]').val()));
			}else{
				$("input[name='svmtAmtInput']").val(mhpoint);
				$("input[name='svmtAmt']").val(priceComma(mhpoint));
				$('input[name="mhpoint"]').val(0);
				$('.mhpoint').text("0");
				$('input[name="totalDcKrw"]').val(parseInt($('input[name="svmtAmtInput"]').val())+parseInt($('input[name="totalDcKrw"]').val()));
			}
			isallchecked=true;
		}
	
		$('.exceptmhpoint').text($("input[name='svmtAmt']").val());
		$('.totalDcKrw').text(priceComma(parseInt($("input[name='totalDcKrw']").val()))+"원");
		$('input[name="totalDcUsd"]').val((parseFloat($('input[name="totalDcKrw"]').val())/parseFloat("${KRW_WON}")).toFixed(2));
		$('.totalDcUsd').text("$"+priceComma(parseFloat($('input[name="totalDcUsd"]').val()).toFixed(2)));
		
		
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
	
	var cid="";
	var isUsedChecked=false;
	$("input[name='pmptUseSvmtUseYn']").on('click', function() {
		
		cid=$(this).attr("id");
		
		var totalprice=parseInt($('input[name="totalDcKrw"]').val());
		var totaldollarprice=parseFloat($('input[name="totalDcUsd"]').val()).toFixed(2);
		
		if($(this).val()!='N' && isUsedChecked==false){
				var discountwonprice=($('input[name="total_bill_won"]').val()*($(this).val()/100)).toFixed(0);
				var discountdollarprice=($('input[name="total_bill_dollar"]').val()*($(this).val()/100)).toFixed(2);
			    var won_result=totalprice+parseInt(discountwonprice);
			    var dollar_result=(parseFloat(totaldollarprice)+parseFloat(discountdollarprice)).toFixed(2);
			    $('input[name="coupondiscount"]').val(parseInt(discountwonprice));
			 	$('.coupondiscount').text(priceComma(discountwonprice));
			 	$('input[name="totalDcKrw"]').val(won_result);
			 	$('.totalDcKrw').text(priceComma(won_result)+"원");
			 	$('input[name="totalDcUsd"]').val(dollar_result);
			 	$('.totalDcUsd').text("$"+priceComma(dollar_result));
			 	var totaldollarpay=($('input[name="total_bill_dollar"]').val()-$('input[name="totalDcUsd"]').val()).toFixed(2);
			 	var totalwonpay=$('input[name="total_bill_won"]').val()-$('input[name="totalDcKrw"]').val();
			 	$('input[name="totalSettUsd"]').val(totaldollarpay);
			 	$('.totalSettUsd').text("$"+priceComma(totaldollarpay));
			 	$('input[name="wontotalSettKrw"]').val(totalwonpay);
			 	$('.won.totalSettKrw').text(priceComma(totalwonpay)+"원");
			 	isUsedChecked=true;
				
		}else if($(this).val()=='N'){
			 
			 var discountwonprice= $('input[name="coupondiscount"]').val();
			 var discountdollarprice=(parseFloat(discountwonprice)/parseFloat("${KRW_WON}")).toFixed(2);
			 var dollar_result=(totaldollarprice-discountdollarprice).toFixed(2);
			 var won_result=totalprice-parseInt(discountwonprice);
			 $('input[name="coupondiscount"]').val("0");
		 	 $('.coupondiscount').text("0");
		 	 $('input[name="totalDcKrw"]').val(won_result);
		 	 $('.totalDcKrw').text(priceComma(won_result)+"원");
		 	 $('input[name="totalDcUsd"]').val(dollar_result);
		 	 $('.totalDcUsd').text("$"+priceComma(dollar_result));
		 	 var totaldollarpay=(parseFloat($('input[name="totalSettUsd"]').val())+parseFloat(discountdollarprice)).toFixed(2);
		 	 var totalwonpay=(parseInt($('input[name="wontotalSettKrw"]').val())+parseInt(discountwonprice)).toFixed(0);
		 	 $('input[name="totalSettUsd"]').val(totaldollarpay);
		 	 $('.totalSettUsd').text("$"+priceComma(totaldollarpay));
		 	 $('input[name="wontotalSettKrw"]').val(totalwonpay);
		 	 $('.won.totalSettKrw').text(priceComma(totalwonpay)+"원");
		 	 isUsedChecked=false;
		}
	    
	});
		
	function orderexec(){
		
		if(!$('#chkAgree').is(':checked')){
			alert("주문내역확인 동의를 체크해주세요.");
			return false;
		}
		showpopup();
		
		var mhpoint =(((parseFloat("${cartprice}") * parseFloat("${KRW_WON}")) - (parseFloat("${cartdis}") * parseFloat("${KRW_WON}")))*(parseFloat("${mhdiscount}")/100)).toFixed(0);
		var used_mhpoint=0;
		if($('input[name="svmtAmtInput"]').val()!=''){
			used_mhpoint =parseFloat($('input[name="svmtAmtInput"]').val()).toFixed(0);
			mhpoint =(((parseFloat("${cartprice}") * parseFloat("${KRW_WON}")) - (parseFloat("${cartdis}") * parseFloat("${KRW_WON}"))-used_mhpoint)*(parseFloat("${mhdiscount}")/100)).toFixed(0);
		}
		
		var total_bill_dollar_text=parseInt($('input[name="wontotalSettKrw"]').val());
		var total_bill_dollar=parseFloat($('input[name="totalSettUsd"]').val());
		console.log(total_bill_dollar_text);
		
		
		const Data={
				
				orderitemlists: "${orderitemlist}",
				olvodeptdate : "${orderlist.odeptdate}",
				olvoplnum : "${orderlist.oplnum}",
				olvoplace : "${orderlist.odept}",
				olvoelnum:"${orderlist.oelnum}",
				mid:"${mid}",
				total_bill_dollar_text:total_bill_dollar_text,
				total_bill_dollar:total_bill_dollar,
				mhpoint : mhpoint,
				used_mhpoint: used_mhpoint,
				total_bill_dollar_text:$('.total_bill_dollar_text').text(),
				total_bill_won_text:$('.total_bill_won_text').text(),
				totalDcUsd:$('.totalDcUsd').text(),
				totalDcKrw: $('.totalDcKrw').text(),
				totalSettUsd: $('.totalSettUsd').text(),
				wontotalSettKrw: $('.won.totalSettKrw').text(),
				cid:cid
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