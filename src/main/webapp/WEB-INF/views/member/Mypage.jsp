<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>

<script type="text/javascript">
	console.log("토큰: "+"${_csrf.token}");
</script>
<main id="container">
<div class="container">
	<article class="location">
		<section class="box">
			<a nohref onclick="goUrl('/');" class="home">홈</a>
			<div>
				<span>마이현대</span>
			</div>
			<div>
				<span>주문 내역</span>
			</div>
		</section>
	</article>
	<article class="top_fullbg">
		<h2 class="page_tit">주문 내역</h2>
		<div class="myhd_firinfo" style="height: 120px;">
			<div class="myinfo">
				<p class="name">
					<strong> ${member.mname}</strong> <em>님</em>
				</p>
				<c:if test="${passport ne null }">
				<p class="passinfo">
                        <span><c:out value="${fn:substring(passport.passportno, 0, fn:length(passport.passportno) - 3)}" />*****</span> 
                        <span>${passport.expirydate }</span></p>
                 </c:if>
			</div>
			<div class="mypresent" style="height: 120px;">
				<dl style="height: 110px;">
					<a href="https://www.hddfs.com/shop/mm/myBnf/listSvmt.do">
						<dt>적립금</dt>
						<dd id="svmtAmt">
							<strong><fmt:formatNumber value="${member.mhpoint}" pattern="#,##0.##" /></strong>원
						</dd>
					</a>
				</dl>
				<dl style="height: 110px;">
					<a href="/member/Mypage_coupon">
						<dt>쿠폰</dt>
						<dd>
							<strong>${coupon_count }</strong>장
						</dd>
					</a>
				</dl>
				<dl style="height: 110px;">
					<dd id="hpointAmt">
						<strong>0</strong>P
					</dd>
				</dl>
				<dl style="height: 110px;">
					<dt>등급</dt>
					<dd>
					<img alt="" src="/resources/images/${grade }" style="width: 40px; position: relative; left: 1.9px; bottom: 9px;"/>
					</dd>
				</dl>
				<dl style="height: 110px;">
					<dt>구매금액</dt>
					<dd id="setTotBuyAmtNtnl">
						<strong>$ <fmt:formatNumber value="${member.mtotal}" pattern="#,##0.##" /></strong>
					</dd>
				</dl>
			</div>
		</div>
	</article>
	<script type="text/javascript">
		$(document)
				.ready(
						function(evt) {
							getSvmtAmtAble();
							fnGetOffSptmCard();
							getTotBuyAmtNtnl();
							$('#hpointAmt')
									.parent()
									.html(
											"<dt>H.Point</dt><dd><a nohref id='btnHeaderUmbSwitcJoin1'>통합회원 전환</a></dd>");
							$('#btnHeaderUmbSwitcJoin1')
									.click(
											function() {
												popOpen(
														ctx_curr
																+ '/mm/myInfo/umbMbshJoinNtcPop.do',
														'chgUmbMbshPop', 450,
														500);
											});
							$(".btn_view").click(function() {
								$(this).toggleClass("plus");
								$(".mymenu").toggleClass("plus");
							});
						});
		$(function() {
			$('#btnHeaderPsptChg').click(
					function() {
						location.href = ctx_curr
								+ '/mm/myInfo/inptMbshPwd.do?type=pspt';
					});
			$(
					'#btnHeaderUmbSwitcJoin1,#btnHeaderUmbSwitcJoin2,#btnHeaderUmbSwitcJoin3')
					.click(
							function() {
								popOpen(ctx_curr
										+ '/mm/myInfo/umbMbshJoinNtcPop.do',
										'chgUmbMbshPop', 450, 500);
							});
		});
		function fnGetOcrnPntAmt() {
			$
					.ajax({
						async : true,
						url : ctx_curr + '/or/order/getMemberSimpRsvg.json',
						dataType : 'json',
						type : 'POST',
						success : function(data, textStatus, jqXHR) {
							if (!crew.ajaxValidate(data)) {
								return;
							}
							if (data.redirect != null) {
								if (data.redirect.ocrnPnt != null) {
									$('#hpointAmt')
											.html(
													'<strong>'
															+ comma(data.redirect.ocrnPnt)
															+ '</strong>P');
								}
							} else {
								$('#hpointAmt')
										.parent()
										.html(
												"<dt>H.Point</dt><dd><a nohref id='btnHeaderUmbSwitcJoin1'>통합회원 전환</a></dd>");
								$('#btnHeaderUmbSwitcJoin1')
										.click(
												function() {
													popOpen(
															ctx_curr
																	+ '/mm/myInfo/umbMbshJoinNtcPop.do',
															'chgUmbMbshPop',
															450, 500);
												});
							}
						},
						error : function(jqXHR, textStatus, errorThrown) {
						}
					});
		}
		function fnGetOffSptmCard() {
			$.ajax({
				async : true,
				url : ctx_curr + '/mm/myBnf/offSptmCard.json',
				dataType : 'json',
				type : 'POST',
				success : function(data, textStatus, jqXHR) {
					if (!crew.ajaxValidate(data)) {
						return;
					}
					if (data.offSptmCardListInfoAmt != null
							&& data.offSptmCardListInfoAmt != 0
							&& data.offSptmCardListInfoAmt != '0') {
						$('#setOffSptmCard').html(
								'<strong>' + comma(data.offSptmCardListInfoAmt)
										+ '</strong>원');
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}
		function fnGetHpointAmt() {
			$.ajax({
				async : true,
				url : ctx_curr + '/mm/myInfo/getHpointAmt.json',
				dataType : 'json',
				type : 'POST',
				success : function(data, textStatus, jqXHR) {
					if (!crew.ajaxValidate(data)) {
						return;
					}
					$('#hpointAmt').html(
							'<strong>' + comma(data.hpointAmt) + '</strong>P');
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}
		function fnGetHpointPlsAmt() {
			$
					.ajax({
						async : true,
						url : ctx_curr + '/mm/myInfo/getHpointAmt.json',
						dataType : 'json',
						type : 'POST',
						success : function(data, textStatus, jqXHR) {
							if (!crew.ajaxValidate(data)) {
								return;
							}
							$('#hpointPlsAmt').html(
									'<strong>' + comma(data.hpointAmt)
											+ ' </strong>P');
						},
						error : function(jqXHR, textStatus, errorThrown) {
						}
					});
		}
		function getSvmtAmtAble() {
			$.ajax({
				async : true,
				url : ctx_curr + "/mm/myInfo/getSvmtAmtAble.json",
				dataType : "json",
				type : "POST",
				success : function(data, textStatus, jqXHR) {
					var vInfo = data.info;
					if (!crew.ajaxValidate(data)) {
						return;
					}
					$("#svmtAmt").html(
							'<strong>' + comma(vInfo.data.svmtAmt)
									+ '</strong>원');
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}
		function getTotBuyAmtNtnl() {
			$
					.ajax({
						async : true,
						url : ctx_curr + '/mm/my/getTotBuyAmtNtnl.json',
						dataType : "json",
						type : "POST",
						success : function(data, textStatus, jqXHR) {
							var vInfo = data.info;
							var totBuyAmtNtnl = vInfo.data.totBuyAmtNtnl;
							var nextLvluBuyAmtNtnl = vInfo.data.nextLvluBuyAmtNtnl;
							$('#setTotBuyAmtNtnl')
									.html(
											'<strong>＄'
													+ comma(Math
															.round(totBuyAmtNtnl * 100) / 100)
													+ '</strong>');
							if (totBuyAmtNtnl > nextLvluBuyAmtNtnl) {
								$('#setRestPrice').html('<strong>＄0</strong>');
							} else {
								$('#setRestPrice')
										.html(
												'<strong>＄'
														+ comma(Math
																.round((nextLvluBuyAmtNtnl - totBuyAmtNtnl) * 100) / 100)
														+ '</strong>');
							}
							var percentValue = 0;
							if ((totBuyAmtNtnl / nextLvluBuyAmtNtnl * 100) > 100) {
								percentValue = 100;
							} else {
								percentValue = totBuyAmtNtnl
										/ nextLvluBuyAmtNtnl * 100;
							}
						},
						error : function(jqXHR, textStatus, errorThrown) {
						}
					});
		}
		function goUrl(url) {
			location.href = ctx_shop + url;
		}
		function liMyChgPwd() {
			var vAucaType = 'GENE';
			if (vAucaType == 'INTG') {
				alert('고객님은 H.Point통합회원이십니다. H.Point통합회원의 경우 비밀번호변경은 통합멤버십 사이트에서 가능합니다.');
				popup = window.open(gUmbMbshUrl + '/cu/mem/showCustInfo.shd',
						'umbIndexPop', "width=800, height=920");
			} else {
				location.href = ctx_shop + '/mm/myInfo/inptMbshPwd.do?type=pwd';
			}
		}
		function goHPointPay(umbMbshId) {
			if (umbMbshId != '') { // 통합회원: H.Point Pay 이동
				goUrl('/mm/myOrder/listHPointPay.do');
			} else { // 일반회원: 통합회원 전환 창 이동
				popOpen(ctx_curr + '/mm/myInfo/umbMbshJoinNtcPop.do',
						'chgUmbMbshPop', 450, 500);
			}
		}
		$(function() {
			$('.myinfo .name strong').each(function() {
				if (this.offsetHeight < this.scrollHeight) {
					$(this).addClass('ellipsised');
				} else {
					$(this).removeClass('ellipsised');
				}
			});
		});
	</script>
	<article id="content">
		<section class="myhd_content">
			<div class="tab-style">
				<ul class="tab_1depth">
					<li id="online" onclick="fn_changetab('coupon','online');" class="ui-tabs-active"><a>온라인 주문내역</a></li>
					<li id="coupon" onclick="fn_changetab('online','coupon');" class=""><a>쿠폰 내역</a></li>
				</ul>
			</div>
			<div class="tab-action" id="online_list">
				<ul class="tab_2depth tab_center">
					<li class="ui-tab ui-tabs-active" id="tabCtgDpatType" >
						<a href="javascript:void(0);" onclick="fn_search('odeptdate');">출국일 기준</a>
					</li>
					<li class="ui-tab" id="tabCtgOrderType">
					<a href="javascript:void(0);" onclick="fn_search('odate');">주문일 기준</a></li>
				</ul>

				<form id="mainForm" name="mainForm" method="get">
					<input type="hidden" name="srchStdCd" id="srchStdCd" value="order">
					<input type="hidden" name="tabType" id="tabType" value="onln">
					<input type="hidden" name="page" id="page" value="1"> <input
						type="hidden" name="totalPage" id="totalPage" value="0">
					<input type="hidden" name="monVal" id="monVal" value="" />
					<c:if test="${align eq 'odeptdate' }">
					<div id="my_order">
						<div class="cart_list" id="onln_list">
							<div id="dpatDiv">
								<div id="date_departure">
									<div class="sorting_wrap myhd"">
										<span class="txt_total">총 <strong>${orderlistsize }</strong>개
										</span>
									</div>
									<div class="list_table01">
										<table>
											<colgroup>
												<col width="108px">
												<col width="100%">
												<col width="298px">
												<col width="55px">
												<col width="156px">
												<col width="106px">
											</colgroup>
											<tbody id="onlnDpatList_cart">
												<tr>
													<th>출국일자</th>
													<th>주문일자/<br>주문번호
													</th>
													<th>상품명</th>
													<th>수량</th>
													<th>총결제금액</th>
													<th>주문상태</th>
												</tr>
												<c:forEach var="orderlist" items="${orderlists }">
												<tr>
													<td rowspan="${orderlist.orderitemlist.size()}">
													<fmt:parseDate value="${orderlist.odeptdate }" var="odeptdate" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
													<fmt:formatDate value="${odeptdate }" pattern="yyyy-MM-dd HH:mm"/>
													</td>
													<td rowspan="${orderlist.orderitemlist.size()}">
													${orderlist.odate }
													<p>${orderlist.oid }</p>
													</td>
													<c:forEach var="orderitem" items="${orderlist.orderitemlist }" varStatus="status">
													<c:if test="${status.first }">
													<td rowspan="1">
													<div class="product_info">
			                                            <span class="on_img">
			                                            	<img src="/product/Productdetail?pcode=${orderitem.pcode}" alt="0.2 테라피 에어 마스크 달팽이" onerror="this.onerror=null; this.src='${orderitem.product.img1 }';">
			                                            </span>
			                                            <dl>
			                                                <dt>${orderitem.product.pbrand }</dt>
			                                                <dd>${orderitem.product.pname }</dd>
			                                                <dd>
			                                                	</dd>
			                                            </dl>
			                                        </div>
			                                         </td>
			                                         <td>
			                                         ${orderitem.oamount }
			                                         </td>
			                                        </c:if>
			                                        </c:forEach>
			                                        <td rowspan="${orderlist.orderitemlist.size()}">
			                                        <p class="dollar">$ <fmt:formatNumber value="${orderlist.ototal}" pattern="#,##0.##" /></p>
			                                        <p class="k_won"><span><fmt:formatNumber value="${orderlist.ototal*KRW_WON}" pattern="#,##0" />원</span></p>
			                                        </td>
			                                        <td rowspan="${orderlist.orderitemlist.size()}">
			                                    	<c:choose>
			                                       	<c:when test="${orderlist.ostatus eq '결제완료' }">
			                                    	<strong>${orderlist.ostatus }</strong><br/><br/>
			                                    	<a href="javascript:payCancel('${orderlist.opaymentkey }','${orderlist.oid }');">결제취소</a>
			                                    	</c:when>
			                                    	<c:when test="${orderlist.ostatus eq '결제취소' }">
			                                    	<strong style="color: red;">${orderlist.ostatus }</strong>
			                                    	</c:when>
			                                    	<c:otherwise>
			                                    	</c:otherwise>
			                                    	</c:choose>
			                                    	</td>
												</tr>
												<c:if test="${orderlist.orderitemlist.size()> 1}">
												<c:forEach var="orderitem" items="${orderlist.orderitemlist }" varStatus="status">
												<c:if test="${!status.first }">
												<td rowspan="1">
													<div class="product_info">
			                                            <span class="on_img">
			                                            	<img src="/product/Productdetail?pcode=${orderitem.pcode}" alt="0.2 테라피 에어 마스크 달팽이" onerror="this.onerror=null; this.src='${orderitem.product.img1 }';">
			                                            </span>
			                                            <dl>
			                                                <dt>${orderitem.product.pbrand }</dt>
			                                                <dd>${orderitem.product.pname }</dd>
			                                                <dd>
			                                                	</dd>
			                                            </dl>
			                                        </div>
			                                         </td>
			                                         <td>
			                                         ${orderitem.oamount }
			                                         </td>
												</c:if>
												</c:forEach>
												</c:if>
												</c:forEach>
												
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:if>
					<c:if test="${align eq 'odate' }">
					<div id="my_order">
						<div class="cart_list" id="onln_list">
							<div id="dpatDiv">
								<div id="date_departure">
									<div class="sorting_wrap myhd"">
										<span class="txt_total">총 <strong>${orderlistsize }</strong>개
										</span>
										<div class="sort_r">
											<select name="billStat" id="billStat1">
												<option value="">전체</option>
												<option value="010">입금대기</option>
												<option value="020">주문완료</option>
												<option value="030^040">상품준비중</option>
												<option value="050">인도대기</option>
												<option value="065">인도완료</option>
												<option value="060">미인도</option>
												<option value="080">취소신청</option>
												<option value="070">반품신청</option>
												<option value="100">취소완료</option>
												<option value="090">반품완료</option>
											</select>
										</div>
									</div>
									<div class="list_table01">
										<table>
											<colgroup>
												<col width="108px">
												<col width="100%">
												<col width="298px">
												<col width="55px">
												<col width="156px">
												<col width="106px">
											</colgroup>
											<tbody id="onlnDpatList_cart">
												<tr>
													<th>주문일자/<br>주문번호</th>
													<th>출국일자</th>
													<th>상품명</th>
													<th>수량</th>
													<th>총결제금액</th>
													<th>주문상태</th>
												</tr>
												<c:forEach var="orderlist" items="${orderlists }">
												<tr>
												<td rowspan="${orderlist.orderitemlist.size()}">
													${orderlist.odate }
													<p>${orderlist.oid }</p>
													</td>
													<td rowspan="${orderlist.orderitemlist.size()}">
													<fmt:parseDate value="${orderlist.odeptdate }" var="odeptdate" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
													<fmt:formatDate value="${odeptdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
													</td>
													<c:forEach var="orderitem" items="${orderlist.orderitemlist }" varStatus="status">
													<c:if test="${status.first }">
													<td rowspan="1">
													<div class="product_info">
			                                            <span class="on_img">
			                                            	<img src="/product/Productdetail?pcode=${orderitem.pcode}" alt="0.2 테라피 에어 마스크 달팽이" onerror="this.onerror=null; this.src='${orderitem.product.img1 }';">
			                                            </span>
			                                            <dl>
			                                                <dt>${orderitem.product.pbrand }</dt>
			                                                <dd>${orderitem.product.pname }</dd>
			                                                <dd>
			                                                	</dd>
			                                            </dl>
			                                        </div>
			                                         </td>
			                                         <td>
			                                         ${orderitem.oamount }
			                                         </td>
			                                        </c:if>
			                                        </c:forEach>
			                                        <td rowspan="${orderlist.orderitemlist.size()}">
			                                        <p class="dollar">$<fmt:formatNumber value="${orderlist.ototal}" pattern="#,##0.##" /></p>
			                                        <p class="k_won"><span><fmt:formatNumber value="${orderlist.ototal*KRW_WON}" pattern="#,##0" />원</span></p>
			                                        </td>
			                                        <td rowspan="${orderlist.orderitemlist.size()}">
			                                       	<c:choose>
			                                       	<c:when test="${orderlist.ostatus eq '결제완료' }">
			                                    	<strong>${orderlist.ostatus }</strong><br/><br/>
			                                    	<a href="javascript:payCancel('${orderlist.opaymentkey }','${orderlist.oid }','${orderlist.ototal}');">결제취소</a>
			                                    	</c:when>
			                                    	<c:when test="${orderlist.ostatus eq '결제취소' }">
			                                    	<strong style="color: red;">${orderlist.ostatus }</strong>
			                                    	</c:when>
			                                    	<c:otherwise>
			                                    	${orderlist.ostatus }
			                                    	</c:otherwise>
			                                    	</c:choose>
			                                    	</td>
												</tr>
												
												<c:if test="${orderlist.orderitemlist.size()> 1}">
												<c:forEach var="orderitem" items="${orderlist.orderitemlist }" varStatus="status">
												<c:if test="${!status.first }">
												<tr>
												<td rowspan="1">
													<div class="product_info">
			                                            <span class="on_img">
			                                            	<img src="/product/Productdetail?pcode=${orderitem.pcode}" alt="0.2 테라피 에어 마스크 달팽이" onerror="this.onerror=null; this.src='${orderitem.product.img1 }';">
			                                            </span>
			                                            <dl>
			                                                <dt>${orderitem.product.pbrand }</dt>
			                                                <dd>${orderitem.product.pname }</dd>
			                                                <dd>
			                                                	</dd>
			                                            </dl>
			                                        </div>
			                                         </td>
			                                         <td>
			                                         ${orderitem.oamount }
			                                         </td>
			                                         </tr>
												</c:if>
												</c:forEach>
												</c:if>
												</c:forEach>
												
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:if>
				</form>
			</div>
			<div id="coupon_list" style="display: none;">
        	<form id="cupForm" name="cupForm" method="post"> 
				<script> 
$(document).ready(function(){
	
	//최초 페이지 접근시(날짜조건 빈값일경우) - 온라인/출국일기준
	
	
	// 사용자가 날짜 직접 입력시
    $('#stDt, #endDt').keyup(function() {
        $(this).val(fnAutoHypenBymd($(this).val())); // 자동하이픈 처리
    });
	
	// 날짜 수정시 개월버튼 class삭제
	/* $('#stDt, #endDt').on("change", function(){
		$(".monthbox >li >a").removeClass("current")
	}) */
	
});
//개월버튼 선택에 따른 날짜 셋팅
function fnDateSetting(obj, num){
    
    //시작 일자를 기준으로 세팅 - 주문내역
    if($("#tabCtgDpatType").hasClass("ui-tabs-active")){ // 출국일 기준
    	var stDt = $("#stDt").val();
        if($.trim(stDt) == ""){
            alert("시작일자를 입력하세요.");
            return;
        }
        var stDt = new Date($("#stDt").datepicker("getDate")); //시작일자
        var endDt = new Date($("#stDt").datepicker("getDate")); //끝일자
        endDt.setMonth(stDt.getMonth() + Number(num)); // 시작일자 월 계산
    } else {
    	var endDt = $("#endDt").val();
        if($.trim(endDt) == ""){
            alert("끝일자를 입력하세요.");
            return;
        }
    	var stDt = new Date($("#endDt").datepicker("getDate")); //시작일자
        var endDt = new Date($("#endDt").datepicker("getDate")); //끝일자
        stDt.setMonth(stDt.getMonth() - Number(num)); // 시작일자 월 계산
    }   
    
    var sYear = stDt.getFullYear();
    var sMonth = stDt.getMonth()+1;
    var sDay = stDt.getDate();
    
    var eYear = endDt.getFullYear();
    var eMonth = endDt.getMonth()+1;
    var eDay = endDt.getDate();
    
    //월,일 2자리수로 셋팅
    if(sMonth<10) sMonth = "0" + sMonth;
    if(sDay<10) sDay = "0" + sDay;
    
    if(eMonth<10) eMonth = "0" + eMonth;
    if(eDay<10) eDay = "0" + eDay; 
        
    $("#stDt").val(sYear + '-' + sMonth + '-' + sDay);
    $("#endDt").val(eYear + '-' + eMonth + '-' + eDay);
    $("#monVal").val(num);  //개월수 flag
    $(".monthbox >li >a").removeClass("current")
    $(obj).addClass("current")
}

// 조회전 검색조건 검증
function fnValidation(){
	var stDt = $("#stDt").val();
	var endDt = $("#endDt").val();
	
	//오늘날짜
	var today = new Date(); 
	var year = today.getFullYear();
    var month = today.getMonth()+1;
    var day = today.getDate();
    if(month<10) month = "0" + month;
    if(day<10) day = "0" + day;
    today = year + '-' + month + '-' + day;
    
	if($.trim(stDt) == ""){
        alert("시작일자를 입력하세요.");
        return;
    }
    if($.trim(endDt) == ""){
        alert("끝일자를 입력하세요.");
        return;
    }
	if(!isValidDate(stDt)){
		alert("시작일자가 유효하지 않습니다.");
		return;
	}
	if(!isValidDate(endDt)){
		alert("종료 일자를 확인해주세요.");
		return;
	}
	
	
    if(stDt > today || endDt > today){
        alert("오늘날짜까지 조회 가능합니다.");
        if(stDt > today){
            $("#stDt").val(year + '-' + month + '-' + day);
        }
        if(endDt > today){
            $("#endDt").val(year + '-' + month + '-' + day);
        }
        return;
    }
    
	
	var stDt = new Date($("#stDt").datepicker("getDate"));
    var endDt = new Date($("#endDt").datepicker("getDate"));
    var yrDate = new Date($("#endDt").datepicker("getDate"));
    yrDate.setMonth(yrDate.getMonth() - 12); // 종료일자의 1년전
    
    if(stDt - yrDate < 0){
        alert("조회기간은 최대 1년까지입니다.");
        return;
    }
    if (endDt - stDt < 0){
        alert("종료일은 시작일보다 커야합니다."); 
        return;
    }
    
	fnSearch();    //부모창 조회함수 호출!
}

//날짜포맷에 맞는지 검사
function isDateFormat(d) {
    var df = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
    return d.match(df);
}
// 윤년여부 검사
function isLeaf(year) {
    var leaf = false;

    if(year % 4 == 0) {
        leaf = true;

        if(year % 100 == 0) {
            leaf = false;
        }

        if(year % 400 == 0) {
            leaf = true;
        }
    }
    return leaf;
}
//날짜가 유효한지 검사
function isValidDate(d) {
    // 포맷에 안맞으면 false리턴
    if(!isDateFormat(d)) {
        return false;
    }
    var month_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    var dateToken = d.split('-');
    var year = Number(dateToken[0]);
    var month = Number(dateToken[1]);
    var day = Number(dateToken[2]);
    
    // 날짜가 0이면 false
    if(day == 0) {
        return false;
    }

    var isValid = false;

    // 윤년일때
    if(isLeaf(year)) {
        if(month == 2) {
            if(day <= month_day[month-1] + 1) {
                isValid = true;
            }
        } else {
            if(day <= month_day[month-1]) {
                isValid = true;
            }
        }
    } else {
        if(day <= month_day[month-1]) {
            isValid = true;
        }
    }
    return isValid;
}

</script>
<input type="hidden" name="monVal" id="monVal" value="">
<div class="sorting_wrap myhd" id="dash_board_listCup">
					<input type="hidden" class="totCnt" value="0"> 
					<span class="txt_total">
						총 <strong id="tot"> 0</strong>개 					 	
					</span> 
				</div>  
			</form>
			
            <input type="hidden" name="page" id="page" value="1">
	        <input type="hidden" name="totalPage" id="totalPage" value="0">
            <div class="list_table01">
                <table>
                    <colgroup>
                        <col width="100px">
                        <col width="85px">
                        <col width="120px">
                        <col width="120px">
                        <col width="160px">
                        <col width="80px">
                    </colgroup>
                    <tbody id="cupListArea">
                        <tr>
                            <th>쿠폰명</th>
                            <th>주문번호</th>
                            <th>사용금액</th>
                            <th>할인액(율)</th>
                            <th>쿠폰만료일자(잔여일)</th>
                            <th>사용여부</th>
                        </tr>
                        <c:forEach var="coupon" items="${couponlist }">
                        <tr>
                        <td>${coupon.event.ename }</td>
                        <c:choose>
                        <c:when test="${coupon.oid eq null }">
                        <td>x</td>
                        </c:when>
                        <c:otherwise>
                         <td> ${coupon.oid }</td>
                        </c:otherwise>
                        </c:choose>
                        <c:choose>
                        <c:when test="${coupon.oid eq null }">
                        <td>0</td>
                        </c:when>
                        <c:otherwise>
                         <td> ${coupon.event.esale }</td>
                        </c:otherwise>
                        </c:choose>
                        <td>
                        ${coupon.event.esale }
                        </td>                  
                        <td><fmt:parseDate value="${coupon.cexpirationdate }" var="cexpirationdate" pattern="yyyy-MM-dd">
                        </fmt:parseDate>
						<fmt:formatDate value="${cexpirationdate }" pattern="yyyy-MM-dd"/></td>
                        <c:if test="${coupon.cenabled eq 'ENABLED' }">
                        <td>사용가능</td>
                        </c:if>
                        <c:if test="${coupon.cenabled eq 'NOTENABLED' }">
                        <td><strong style="color: red;">사용 불가능</strong></td>
                        </c:if>
                        </tr>
                       </c:forEach>
                        </tbody>
                </table>
            </div>  
            </div>
			<div class="attention_area">
				<p class="attention_tit">유의사항</p>
				<div class="attention_list">
					&bull; 결제 완료 후 주문 내역에서 구매하신 상품이 확인되지 않을 경우 로그아웃 후 재로그인 해주시기 바랍니다.<br />
					&nbsp;&nbsp;<br /> &bull; 아래의 경우 인도장에서 상품 수령이 제한되오니 반드시 확인해 주시기
					바랍니다.<br /> - 주문하신 고객님과 출국하시는 고객님의 정보가 불일치 할 경우<br /> - 주문서에 기재된
					여권번호와 출국 시 여권번호가 불일치 할 경우<br /> - 등록된 출국정보(출국장소, 출국일시, 편명 등)와 실
					출국정보가 다른 경우<br /> <br /> &bull; 출국 정보 변경을 원하실 경우, 출국일 최소 3일 전에
					고객센터로 연락해 주시기 바랍니다.(단, 지방공항 이용 시 4일전)<br /> &bull; 출국 시 인도받지 못한
					물건은 고객센터로 연락 바랍니다.<br /> &bull;&nbsp;화장품/식품等 유통기한과 연관있는 상품의 경우
					출국정보 변경 시 유통기한이 임박 또는 초과된 상품을 받을 수 있으므로 유의하시기 바랍니다.<br /> &bull;
					추가 궁금하신 내용은 고객센터 (1811-6688 / 운영시간 09:30~18:30) 로 문의바랍니다. <a
						href="https://www.hddfs.com/shop/om/consmComm/faq.do"
						class="link_txt_point">FAQ 바로가기</a>
				</div>
			</div>
			<div id="printCoup"></div>
			<div id="oflnEltRcpt"></div>
			<div id="onlnEltRcpt"></div>
		</section>
	</article>
</main>
<!-- // container -->
<script type="text/javascript">
	function fn_changetab(ex,cur){
		$('#'+ex).removeClass('ui-tabs-active');
		$('#'+cur).attr("class",'ui-tabs-active');
		if(cur=='coupon'){
			$('#online_list').hide();
			$('#coupon_list').show();
		}else{
			$('#online_list').show();
			$('#coupon_list').hide();
		}
	}

	if("${align}"=='odeptdate'){
		$("#tabCtgDpatType").attr("class","ui-state-default ui-tabs-active");
		$("#tabCtgOrderType").attr("class","ui-state-default");
	}else{
		 $("#tabCtgDpatType").attr("class","ui-state-default");
		 $("#tabCtgOrderType").attr("class","ui-state-default ui-tabs-active");
	}
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
	});
	function moveToMain() {
		location.href = ctx_shop + '/dm/main.do';
	}
	
	
	function priceComma(price) {
		return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	function fn_search(type){
	    
		if(type=='odeptdate'){
			location.href="/member/Mypage?align=odeptdate";
			
		}else{
			location.href="/member/Mypage?align=odate";
		}
	    
	}
	
	function payCancel(paymentKey,oid,order_dollar){
		var popup=confirm('결제를 취소하시겠어요?');
		if(popup){
			const Data={
					oid: oid,
					order_dollar:parseFloat(order_dollar).toFixed(2)
			};
			$.ajax({
				method:"post",
				data : Data,
				url : "/order/cancelorder",
				success : function(data){
				if(data=='yes'){
					tossPayCancel(paymentKey,oid);
				}
				},
				error : function(){
		    	}
			});
			
		}else{
			return false;
		} 
	}
	function tossPayCancel(paymentKey,oid){
		 var paymentData = {
		            orderId : oid,
		            paymentKey: paymentKey,
		            mid:"${mid}"
		        };
		        $.ajax({
		        	method:"post",
		        	data: paymentData,
		        	url : "/pay/cancelSuccess",
		        	success : function(data){
		        		alert("결제가 취소되었습니다");
		        		location.href="/member/Mypage?mid=${mid}&align=${align}";
		        		
		        	},
		        	error : function(){
		    		}
		        });
	}
	
</script>
<%@ include file="../common/Footer.jsp"%>