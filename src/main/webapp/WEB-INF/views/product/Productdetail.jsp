<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>
<!-- // header -->
<body>
	<div id="wrap">
	    <!-- container -->
		<main id="container" >
			<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/productdetail.css">
<link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/product.css">
<script src="https://cdn.hddfs.com/front/js/KO/product.js"></script>

<article id="content" class="productdetail">
	<section class="pd_area">
		<div class="pd_visual">
			<div class="info_button">
				<div class="por_icons">
					<span >세일</span><span>사은품</span><span>품절임박</span></div>
				
				<div class="pd_share">
					<a href="javascript://" onclick="" class="wish_popup">
						<button id="wishPop" class="btn_like likethis ">
                            <div class="motion_area" id="heart01_2"></div>
                        </button>
						<span id="cnrAcumCnt">1</span>
					</a>
					<div class="sns_popup">
						<a href="javascript://">
							<button class="btn_sns">sns</button>
						</a>
						<div class="sns_link">
							<a href="javascript://" class="facebook shareFacebook">facebook</a>
							<a href="javascript://" class="blog shareNaver">blog</a>
							<a href="javascript://" class="kakao shareKakao">kakao</a>
							<a href="javascript:showEmlSendFormLayer();" class="email">email</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="swiper-container swiper_visual">
				<div class="swiper-wrapper">
					
                        <c:forEach var="img" items="${imglist }">
                            <div class="swiper-slide">
											<img src=<c:out value="${img}"/>
                                            alt=""
												onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img500.jpg';" />
                                            </div>
                                            </c:forEach>
												
										
				</div>
			</div>
			<div class="thumbnail_box ">
				<div class="swiper-container swiper_visual_thumbnail">
					<div class="swiper-wrapper">
					<c:forEach var="img" items="${imglist }">
					
					<div class="swiper-slide ">
						<img src=<c:out value="${img}"/> alt="" title="" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img60.jpg';"/>
					</div>
					</c:forEach>
					</div>
				</div>	
				<div class="controller">
					<div class="thumbnail-prev"></div>
					<div class="thumbnail-next"></div>
				</div>

			</div>
			<div class="summary_info">
			    <div class="tit">
					<p>
						</p>
					<strong><a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=642001"><c:out value="${product.pbrand }"/></a><c:out value="${product.pname }"/></strong>
				</div>
				<div class="price">
					<span class="upto">
											    <i><c:out value="${product.pdiscount }"/></i>%
											</span>
											<ul class="del">				
												<li class="priceInfo">
													<del>
														$<fmt:formatNumber
													value="${product.pprice}"
													pattern="#,##0.##"/></del>
													<del class="won">
														<fmt:formatNumber
													value="${product.pprice*1267}"
													pattern="#,#00"/>원</del>
												</li>
												<li class="dispriceInfo">
													<strong>
														$<fmt:formatNumber
													value="${product.pprice*(1-(product.pdiscount/100))}"
													pattern="#,##0.##" /></strong>
													<p>
														<fmt:formatNumber
													value="${product.pprice*(1-(product.pdiscount/100))*1267}" pattern="#,#00"/>원</p>
												</li>
											</ul>
										</div>
				<div class="prd_no">
	                   <!--  <ul>
	                    	<li><em>SKU NO</em>566380400007</li>
	                    	<li><em>REF NO</em>CV2CFUK680AIVM</li>
	                    	</ul> -->
	                </div>
                </div>
			</div>
		<div class="pd_info">
		
		    <div class="purchase_benefits">
				<h4>구매혜택</h4>
				<ul class="con">
					<li>
							<strong>
								<p>적립금</p>
								<div class="square_tooltip">
									<a href="javascript:" class="btn">도움말</a>
									<div class="tooltip">
										일반적립금은 주문 시 각 브랜드별로 설정 된 한도내에서 바로 사용할 수 있으며, 즉시할인적립금은 결제금액 기준으로 '즉시할인' 혹은 '적립' 중 선택하여 사용 가능합니다.
										* 아래 표기 된 사용률은 당사 및 브랜드사의 정책에 따라 브랜드별로 상이할 수 있습니다.
										<button class="close">닫기</button>
									</div>
								</div>
							</strong>
						
							<div class="box">
								
									 일반적립금 30%
								</div>
						</li>
					<li>
							<strong>
								<p>H.Point</p>
								<div class="square_tooltip">
									<a href="javascript://" class="btn">도움말</a>
									<div class="tooltip">
										H.Point는 H.Point로 적립되며, 비 H.Point고객은 적립이 불가합니다. H.Point가입 후 이용
										부탁 드립니다. (H.Point 구매적립 대상은 H.Point 통합회원 중 한국 국적 고객입니다.)
										<button class="close">닫기</button>
									</div>
								</div>
							</strong>
							<div class="box">결제금액 0.2
								% 적립
							</div>
						</li>
					</ul>
			</div>
			<form id="cartBuy" method="" action="" >
				<input type="hidden" name="orderitem[0].pcode" value="${product.pcode }"/>
				<input type="hidden" name="orderitem[0].oamount" value=""/>
			</form>
			<div class="productdetail_cart">
						<div class="selectlist"><!-- HDDFS 리뉴얼 프로젝트 [이민우-2021.03.22] - 구매레이어 추가 -->    
<div class="selectitem" data-id="10073250016301">
			<strong>${product.pname }</strong>
				<div class="box detailBox"> 
                <div class="num_amount">
                    <input value="-" count_range="m" type="button" class="minus" onclick="javascript:fn_qtySubtraction(this);">
                    <input type="number" class="counts" id="0" value="1" min="1" max="1091" onkeydown="return checkNumber(event);" onfocusout="return changeGoosList(this,event,'0','M','N');" onpaste="return false;">
                    <input value="+" count_range="p" type="button" class="plus" onclick="javascript:fn_qtyAdd(this);">
                </div>
                
                <dl class="priceInfo">
                	<dt class="dorPrice0" value=<c:out value="${product.pprice*(1-(product.pdiscount/100))}"/>>$<fmt:formatNumber
													value="${product.pprice*(1-(product.pdiscount/100))}"
								pattern="#,##0.##" /></dt>
                    <dd class="wonPrice0" value=<c:out value="${product.pprice*(1-(product.pdiscount/100))*1267}"/>><fmt:formatNumber
													value="${product.pprice*(1-(product.pdiscount/100))*1267}" pattern="#,#00" /> <em>원</em></dd>
                 </dl>
                </div>
        </div>
	<input type="hidden" id="isTotal" value="Y">
	<input type="hidden" id="totalCnt" value="1">
	<input type="hidden" id="totalDorSum" value="148">
	<input type="hidden" id="totalWonSum" value="183,638">
	<input type="hidden" id="priceUnit" value="원">
<script>

    
  //수량버튼 내렸을때! 무조건 1개 이상이여야겠지?
	function fn_qtySubtraction(el) {
		let count = parseInt($(".counts").val());
		if(count-1<1){
			alert("해당 상품의 최소 주문 수량은 1개 입니다.");
			return false;
		}else{
			count--;
			$(".counts").val(count);
				
			var dorprice = $(el).closest(".detailBox").find(".priceInfo").children().eq(0).attr("value");
			var wonprice = $(el).closest(".detailBox").find(".priceInfo").children().eq(1).attr("value");
	      		
			var chDorprice = count*dorprice;
			var chWonprice = "${product.pprice*1267}"*count;
			console.log(chDorprice.toFixed(2));
				
			$(el).closest(".detailBox").find(".priceInfo").children().eq(0).text('$'+chDorprice.toFixed(2).toLocaleString());
			$(el).closest(".detailBox").find(".priceInfo").children().eq(1).text(priceComma(chWonprice.toFixed(0))+'원');
			$(el).closest(".detailBox").find(".priceInfo").children().eq(0).val(chDorprice.toFixed(2));
			$(el).closest(".detailBox").find(".priceInfo").children().eq(1).val(chWonprice.toFixed(0));
			
			$("#totalamount").text(count);
			
			$(".totalamount").find(".priceInfo").children().eq(0).text('$'+chDorprice.toFixed(2).toLocaleString());
			$(".totalamount").find(".priceInfo").children().eq(1).text(priceComma(chWonprice.toFixed(0))+'원');
			$(".totalamount").find(".priceInfo").children().eq(0).val(chDorprice.toFixed(2));
			$(".totalamount").find(".priceInfo").children().eq(1).val(chWonprice.toFixed(0));
		}
		
	}
  
	//수량버튼 올렸을때
	function fn_qtyAdd(el) {
		let count = parseInt($(".counts").val());
		count++;
		$(".counts").val(count);
			
		var dorprice = $(el).closest(".detailBox").find(".priceInfo").children().eq(0).attr("value");
		var wonprice = $(el).closest(".detailBox").find(".priceInfo").children().eq(1).attr("value");
      		
		var chDorprice = count*dorprice;
		var chWonprice = "${product.pprice*1267}"*count;
			
			
		$(el).closest(".detailBox").find(".priceInfo").children().eq(0).text('$'+chDorprice.toFixed(2).toLocaleString());
		$(el).closest(".detailBox").find(".priceInfo").children().eq(1).text(priceComma(chWonprice.toFixed(0))+'원');
		$(el).closest(".detailBox").find(".priceInfo").children().eq(0).val(chDorprice.toFixed(2));
		$(el).closest(".detailBox").find(".priceInfo").children().eq(1).val(chWonprice.toFixed(0));
		
		
		$("#totalamount").text(count);
		
		$(".totalamount").find(".priceInfo").children().eq(0).text('$'+chDorprice.toFixed(2).toLocaleString());
		$(".totalamount").find(".priceInfo").children().eq(1).text(priceComma(chWonprice.toFixed(0))+'원');
		$(".totalamount").find(".priceInfo").children().eq(0).val(chDorprice.toFixed(2));
		$(".totalamount").find(".priceInfo").children().eq(1).val(chWonprice.toFixed(0));
		
	}
	
	function priceComma(price) {
		return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	function preventClick(e){
		e.preventDefault()
	}
	
	function cartBuy(){
		var totalamount=parseInt($("#totalamount").text(count));
		$("#cartBuy").find("input[name='orderitem[0].oamount']").val(totalamount);
		/* if(){
			$("#cartBuy").attr("action","/order/DepartureInfo");
		}else{
			$("#cartBuy").attr("action","/order/PassportInfo");
		}
		$("#cartBuy").submit(); */
	}
	

</script></div>
							<div class="totalamount"><div>총 <strong id="totalamount">1</strong> 개</div><dl class="priceInfo">
							<dt>$<fmt:formatNumber
													value="${product.pprice*(1-(product.pdiscount/100))}"
													pattern="#,##0.##" /></dt>
													<dd><fmt:formatNumber value="${product.pprice*(1-(product.pdiscount/100))*1267}" pattern="#,#00" /> <em>원</em></dd></dl>
													</div>
		                </div>
					<div class="button_area">
					<c:choose>
						<c:when test="${product.pstock ne 0}">
						<div class="square_tooltip maxprice">
								<button class="btnxl_type1 btnico btn_tooltip btn_view_rv" onclick="javascript:calcMaxDcPrc()" disabled="disabled">
									<em class="ico_sale">적립금 혜택 엿보기</em>
									<!-- <div class="info_reserve">적립금 혜택 엿보기</div> --><!--//2022-04-19 추가-->
								</button>
                                
								<div class="tooltip" id="maxSvmtInfoPop">
									<ul class="dl_price">
									</ul>
									<button class="close" onclick="closeMaxDcPrc();">닫기</button>
								</div>
							</div>
						<a class="addcart" onclick="cartConsist();">장바구니</a>
                        <a class="buynow" onclick="cartBuy();">바로구매</a>
                        </c:when>
                        <c:otherwise>
                        <a href="#" onclick="preventClick(event);"class="buynow">품절되었습니다</a>
                        </c:otherwise>
                        </c:choose>
						  </div>
				<ul class="layercall" onclick="preventClick(event);">
				<li class="call_panel_b">
						<a href="#" onclick="preventClick(event);"><p>사은품</p></a>
					</li>
				<li class="call_panel_c">
					<a href="#" onclick="preventClick(event);"><p>상품정보</p></a>
				</li>
				<li class="call_panel_d">
					<a href="javascript://" onclick="">
						<p>추천상품</p></a>
				</li>
				<li class="call_panel_e">
					<a href="#" onclick="preventClick(event);"><p>상품평</p></a>
				</li>
			</ul>
		</div>
		</section>
	</article>

<!-- <section class="pd_full_layer">
    <div class="productdetail_box">
    	<div class="tab-style">
            <ul class="tab_textlarge">
            	<li class="tab_02">
	                    <a href="#panel_02">사은품</a>
	                </li>
                <li class="tab_03">
                    <a href="#panel_03">상품정보</a>
                </li>
                <li class="tab_04">
                    <a href="#panel_04">
                    	추천상품</a>
                </li>
                <li class="tab_05">
                    <a href="#panel_05">상품평</a>
                </li>
            </ul>
        </div>
        
        <div class="panel">
        	<div id="panel_02" class="productdetail_02">
            		<h4>사은품</h4>
            		<ul class="gift_selection">
            			<li class="item">
            					<div class="tit">
            						<span class="img">
            								<img src="https://cdn.hddfs.com/files/fregf/20230106/c9c2d5f0_202301061545068210.jpg?sf=webp&RS=80X80"
            									alt="SOCKS 랜덤1개 증정"
            									onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img160.jpg?sf=webp&RS=80X80';">
            							</span>
            						<div class="gift_content">
	            						<strong class="sub_tit">SOCKS 랜덤1개 증정</strong>
            							<div>
            								$150 이상 구매시</div>	
            							</div>
            					</div>
            					<ul class="screen">
            						<li>
            							<strong>행사기간</strong>
            							<p>
            								이벤트 기간 : 
            								2023-01-09
            								~
            								재고소진시까지</p>
            						</li>
            						<li>
            								<strong>유의사항</strong>
            								<ul class="dot_list">
	<li>
		사은품 이미지는 참고용이며, 실제 상품과 다를 수 있습니다</li>
	<li>
		본 사은품은 한정수량으로 조기품절 될 수 있습니다.</li>
	<li>
		한 주문번호에 한하며 주문번호당 합산되지 않습니다.</li>
	<li>
		타 사은행사와 중복 증정되지 않습니다</li>
	<li>
		사은품은 할인쿠폰 사용 후 최종 결제 금액 기준으로 증정됩니다.</li>
	<li>
		<span style="color: #0000ff">결제 단계에서 사은품 선택 옵션이 나오는 경우에만 사은품이 증정됩니다.</span></li>
	<li>
		<span style="color: #0000ff">사은품은 한 ID당 1일 1회 증정 가능합니다. </span></li>
	<li>
		<span style="color: #0000ff">주문 취소 후 재구매시 해당일에는 사은품이 지급되지 않습니다</span></li>
	<li>
		<span style="color: #0000ff">비회원은 사은품 증정대상에서 제외됩니다.</span></li>
	<li>
		<p>
			화기류 증정품의 경우 제주공항 출국시 증정품 지급이&nbsp;불가합니다.&nbsp;</p>
	</li>
</ul>
</li>
            						</ul>
            				</li>
            			</ul>
            	</div>
            <div id="panel_03" class="productdetail_03">
                <h4>상품정보</h4>
                <div class="brand_info">
                    <a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=638101" class="tit">
						<span class="img">
							<img src="https://cdn.hddfs.com/files/gd/20220513/c1e5ba7f_202205131542549050.png?sf=webp" alt="LACOSTE">
						</span>
						<p>
							라코스테(의류)</p>
					</a>
					<ul>
                        <li>
                            <button class="b_notice heart-motion after_login "
								onclick="javascript:likeMyBrand('638101', this);">
                            	<img src="https://cdn.hddfs.com/front/images/KO/common/btn_like_r.png" alt="좋아요">
                            	<div class="motion_area" id="heart01_1"></div>
                            </button>
                        </li>
                        <li>
                            <button class="b_favorites " id="alarmBtn"
								onclick="javascript:showBrandAlarmViewLayer('638101');">
								관심브랜드 알람
							</button>
                        </li>
                    </ul>
                    </div>
                <div class="basic_information">
                    <ul class="productcode">
                        <li>REF NO : BF533E-52N02S036</li>
                        <li>SKU NO : 563811207990</li>
                    </ul>
                    <div class="tel">
                    	<a href="tel:02-3668-8206">
                    				<strong>
                    					동대문점</strong>
                    				<span>
                    					02-3668-8206</span>
                    			</a>
                    		</div>
                    </div>
                <div class="product_view">
                    	<div>
                        	<img alt="" src="https://cdn.hddfs.com/files/editor/20221019/4f1f6cab_202210191009566940.jpg" style="height: 1131px; width: 1000px" /></div>
                    	<a href="javascript://" class="more">더보기</a>
                	</div>
                <div class="pro_notice">
                    <div class="screen">
	                    	<a href="javascript://" class="tit">상품정보고시</a>
	                    	<div class="box">
	                    		<table>
	                    			<colgroup>
	                    				<col width="150px">
	                    				<col>
	                    			</colgroup>
	                    			<tbody>
	                    				<tr>
	                    							<th scope="row">제품소재</th>
	                    							<td>NYLON 100%</td>
	                    								</tr>
	                    					<tr>
	                    							<th scope="row">색상</th>
	                    							<td>02S</td>
	                    								</tr>
	                    					<tr>
	                    							<th scope="row">치수</th>
	                    							<td>036</td>
	                    								</tr>
	                    					<tr>
	                    							<th scope="row">제조자/수입자</th>
	                    							<td>동일드방레</td>
	                    								</tr>
	                    					<tr>
	                    							<th scope="row">세탁방법 및 취급시 주의사항</th>
	                    							<td>품질 경영 촉진법에 의한 품질 표시를 꼭 참조하시어 세탁하십시오.</td>
	                    								</tr>
	                    					<tr>
	                    							<th scope="row">제조연월일</th>
	                    							<td>2022년 8월</td>
	                    								</tr>
	                    					<tr>
	                    							<th scope="row">품질보증기준</th>
	                    							<td>제품이상 있을 시 구매시점 기준 1년, 교환/반품은 반드시 원래의 포장(박스,비닐 및 택)의 훼손이 없어야 하며 착용 흔적이 있는 경우 교환/반품에서 제외 될 수 있습니다.</td>
	                    								</tr>
	                    					<tr>
	                    							<th scope="row">A/S 책임자와 전화번호</th>
	                    							<td>02-3668-8206</td>
	                    								</tr>
	                    					<tr>
	                    							<th scope="row">원산지</th>
	                    							<td>KOREA</td>
	                    								</tr>
	                    					</tbody>
	                    		</table>	
	                    	</div>		
	                    </div>
	                <div class="screen">
	                        <a href="javascript://" class="tit">취소/교환/환불 안내</a>
	                        <div class="box">
	                        	<div class="conTitle">
	<p>
		<span style="font-size: 14px">1. 상품을 수령하신 날로부터 15일 이내에 교환, 환불이 가능합니다.<strong>&nbsp;</strong><br />
		&nbsp;&nbsp;&nbsp; 단, 다음 각호에 해당하는 경우에는 반품 및 교환이 불가합니다.<br />
		ㆍ이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우 (단, 재화의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)<br />
		ㆍ이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우<br />
		ㆍ시간의 경과에 의해 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우<br />
		ㆍ복제가 가능한 재화의 포장을 훼손한 경우<br />
		<br />
		2. 상품이 표시 광고 또는 계약내용과 다를 경우, 상품 수령일로부터 3개월 이내에 (그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에) 교환, 환불 할 수 있습니다.<br />
		<br />
		3. 면세품의 교환,환불 절차는 관세법령에 따라 진행합니다.<br />
		ㆍ교환, 환불 물품이 $800 초과 : 해외에서 국제 우편을 통해 요청, 또는 입국 시 세관에 휴대품 신고 및 유치 시 교환, 환불 가능<br />
		ㆍ교환, 환불 물품이 $800 이하 : 국제 우편 또는 세관에 휴대품 신고 및 유치 절차 없이 교환, 환불 가능<br />
		&nbsp;&bull; 교환된 면세물품은 반드시 면세품 구입절차에 따라 재 구입후 출국장 인도장에서 인도 가능<br />
		<br />
		4. 환불은 결제 시 사용한 동일한 결제수단으로 환불됩니다.<br />
		&nbsp;&nbsp;&nbsp; 단, 다음의 경우는 주문취소 접수시 등록하신 출국자 본인 계좌번호로 환불이 됩니다.<br />
		ㆍ주문 시 휴대폰 소액결제로&nbsp;결제 후&nbsp;익월 취소하는 경우<br />
		ㆍ주문 시 무통장입금 결제 후 30일 이후에 취소하는 경우<br />
		<br />
		5. 고객의 단순변심 등의 개인적 사유로 인한 반품 비용은 고객 본인부담입니다.<br />
		&nbsp;&nbsp;&nbsp; (지방거주 고객限/ 수도권,서울권 거주 고객의 경우 택배 불가하며 매장 방문 必)<br />
		<br />
		6. 온라인 전용상품 인도 후 반품 시&nbsp;고객센터로 문의해 주시기 바랍니다.<br />
		<br />
		※ 고객센터 상담시간이 아닐 때는 1:1 문의에 남겨주시기 바랍니다.<br />
		&nbsp;&nbsp;&nbsp;<span style="color: #ff0000">&nbsp; 현대백화점 면세점 고객센터 :&nbsp;1811-6688 / 고객센터 운영시간 : 오전 09:30 ~ 오후 18:30</span><br />
		&nbsp;</span></p>
</div>
</div>
	                    </div>
                    <div class="screen">
	                        <a href="javascript://" class="tit">쇼핑가이드</a>
	                        <div class="box">
	                        	<div><span style="font-size: 14px">ㆍ현대백화점 면세점에서 구입하는 물품은 세금이 면제된 면세품이므로 해외에서 사용 또는 소비하거나<br />
&nbsp;&nbsp;&nbsp; 해외 거주인의 선물용 등 외국으로 반출한다는 조건하에 구매가 가능합니다. (단, 제주도를 포함한 모든 국내 여행시에는 이용 불가)<br />
ㆍ14세 미만의 고객은 현대백화점인터넷면세점 이용 (회원가입, 비회원 구매) 이 불가합니다.<br />
ㆍ면세품 구입시 반드시 출국자 본인의 ID로 로그인 후 구입하셔야 합니다.&nbsp;<br />
&nbsp;&nbsp;&nbsp; 회원 정보 및 주문시 입력한&nbsp;정보 (국적, 성별, 여권상의 영문이름, 여권번호, 여권 유효기간 등) 가 출국자 본인 여권정보와 다를경우 상품인도가 불가합니다.<br />
ㆍ구매하신 상품은 반드시 출국 일에 지정된 인도장에서 수령하셔야 합니다.<br />
ㆍ오프라인 지점 면세점 방문 시 본인여권과 정확한 출국정보 확인이 가능한 항공권(e-ticket)을 소지하여 주시기 바랍니다.<br />
ㆍ인터넷 쇼핑 및 면세점 매장 방문으로 상품 구매 시 출국일 60일 전부터 구매 가능합니다.</span></div>
	                        	<div><span style="font-size: 14px">ㆍ현대백화점인터넷면세점은 연중 무휴 24시간 운영되고 있습니다.<br />
ㆍ당사 사정이나 교통편으로 인해 인도 가능 시간이 다를 수도 있습니다.<br />
ㆍ출국 공항 별로 출국 시간대에 따라 주문 가능한 시간이 정해져 있습니다.</span></div>
	                        	<div><span style="font-size: 14px"><span style="font-size: 14px">ㆍ내국인의 총 구매한도는 2022년 03월 18일 부터&nbsp;<span style="color: #ff0000">구매 한도 폐지</span><span style="color: #ff0000">&nbsp;</span>(2022년 03월 17일까지는 미화 $5,000)<br />
&nbsp;&nbsp;&nbsp;&nbsp;(국내/외 브랜드 구매금액 모두 포함)<br />
ㆍ입국 시 1인당 면세 금액은 미화<span style="color: #ff0000"> $ 800</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;(단,&nbsp;면세에서 구입한 모든 물품 및 해외에서 구입한 모든 물품 포함)</span></span><br />
<br />
</div>
	                        	<div><span style="font-size: 14px">ㆍ외국인의 구매한도액은 <span style="color: #ff0000">제한이 없음 </span><br />
&nbsp;&nbsp; (단, 단, 국내에서 생산된 물품의 경우 구매한도에 포함되지 않음)<br />
ㆍ입국 시 1인당 면세&nbsp;금액은 미화<span style="color: #ff0000">&nbsp;$ 800</span><br />
&nbsp;&nbsp; (단,&nbsp;면세에서 구입한 모든 물품 및 해외에서 구입한 모든 물품 포함) </span><br />
<br />
<br />
</div>
	                        	<div><span style="font-size: 14px">ㆍ출국당일 각 출국장소의 지정된&nbsp;보세구역 (공항 및 항만 인도장) 에서 <span style="color: #ff0000">교환권, 본인 여권, 탑승권</span>을<span style="color: #ff0000"> </span>제시하시면 상품을 인도받으실 수 있습니다.<br />
ㆍ출국당일 인도장이 혼잡할 수 있사오니 출국 1시간 전 인도장으로 내방해 주시기 바랍니다.<br />
ㆍ주문 시 편명과 시간을 정확히 입력하셔야 상품수령 가능합니다.<br />
ㆍ면세품은 고객님의 주소지로 배송되지 않으며, 비행기/배 탑승전 지정된 인도장에서만 수령이 가능합니다. 또한 별도의 보관장소가 없습니다.<br />
&nbsp;&nbsp;&nbsp; (입국 시 수령이 불가합니다.)</span></div>
	                        	<div><span style="font-size: 14px">ㆍ출국 당일에 각 출국지 현대백화점면세점 인도장에서 여권, 항공권, 교환권을 제시하여 주시면 본인 확인 후 상품을 인도받을 수 있습니다.<br />
ㆍ주문시 입력한&nbsp;정보 (국적, 성별, 여권상의 영문이름, 여권번호, 여권 유효기간 등) 가 출국자 본인 여권정보와 다를경우 상품인도가 불가합니다.<br />
ㆍ상품 인도 시 수량과 품명, 상품의 상태를 확인하신 후에 인수란에 서명하여 주시고, 이상이 있는경우 즉시 인도장 직원에게 말씀해주세요.&nbsp;<br />
ㆍ상품 인도 완료 및 출국 후의&nbsp;물건에 대해서는 현대백화점인터넷면세점에서 책임을 지지 않습니다.</span><br />
</div>
	                        	<div><p>
	<span style="font-size: 14px">ㆍ교환권 인쇄가 불가능한 경우에는 교환권번호를 메모 또는 교환권을 SMS로 보내신 후 여권, 탑승권과 함께 제시해주시기 바랍니다.</span></p>
</div>
	                        	<div><span style="font-size: 14px">※ 액체 폭발물질 기내 반입 차단을 위한 국제민간항공기구(ICAO)의 권고에 따라 액체류 및 젤류의 휴대 반입 제한조치가 실시 중이니 상품 구매에 참고하시기 바랍니다.<br />
리튬이온배터리 용량이 160Wh 초과인 상품에 대해서는 휴대가 불가합니다. 다만, 국가별 항공사 규정에 따라 리튬이온배터리의 기내 반입 규정이 상이하므로 자세한 사항은 이용하시는 항공사로 문의 바랍니다.<br />
<br />
※ 기내 반입 제한 물품<br />
ㆍ액체류/젤류(화장품, 향수, 홍삼엑기스, 음료, 치약, 헤어젤, 샴푸, 마스카라, 립스틱, 스프레이, 리튬여분 배터리, 만년필 등) 액체 폭발물질 기내 반입 차단을 위한 국제민간항공기구(ICAO)의 권고에 따라 액체류 및 젤류의 휴대반입 제한조치가 실시 중이니 상품 구매에 참고하시기 바랍니다.<br />
<br />
※ 직항으로 출국하는 경우<br />
ㆍ전체 면세점에서 공동 제작된 투명 봉인봉투(Tamper-evident bag)로 포장시, 용량, 수량에 관계 없이 반입 가능합니다.<br />
ㆍ현대백화점인터넷면세점 구입 당시 교부 받은 영수증이 투명 봉인봉투에 동봉 또는 부착된 경우 반입 가능합니다.<br />
ㆍ투명 봉인봉투는 최종 목적지에 도착하신 후 개봉 하셔야 하며, 그전에 개봉된 흔적이 있거나 훼손 되었을 경우 반입이 금지되어 있습니다.<br />
<br />
※ 다른 국가를 경유하여 출국하는 경우<br />
ㆍ항공기 기내반입 제한 규정으로 경유/도착지에 따라 액체류, 젤류 제품의 구매가 제한되오니 반드시 확인해 주시기 바랍니다.<br />
ㆍ액체류, 젤류 제품이 구매 불가한 경유지로 출국 시, 구매하신 규제 제품에 대해서 추후 책임지지 않으니 이점 유의해 주시기 바랍니다.<br />
ㆍ환승 시 해당국가의 보안규정이 달라 액체류에 대한 압수절차를 따라야 할 경우가 있으니, 이용하시는 항공사에 사전문의 해주시기 바랍니다.<br />
ㆍ수하물 처리가 원칙이며, 미사용한 새 제품은 수하물이 아닐 경우 반입 불가합니다.<br />
ㆍ개인이 소지한 물품은 아래의 개인 물품 기내반입조건을 충족해야 반입 가능합니다.<br />
&nbsp;&nbsp;&nbsp; - 예외 1. 미국을 경유하실 경우<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 불투명용기 및 금속용기에 담긴 액체류, 젤류 제품은 반입이 제한됩니다. 투명 용기에 담긴 제품만 구매 가능합니다.<br />
&nbsp;&nbsp;&nbsp; - 예외 2. 경유 후 도착지가 미국령, 호주령, 캐나다, 버진아일랜드인 경우<br />
&nbsp;&nbsp; 위의 경우, 액체류, 젤류 상품을 구매하실 수 없습니다.<br />
<br />
※ 개인 물품에 대한 기내반입조건<br />
ㆍ1리터 규격의 투명 지퍼백 안에 용기를 보관 하셔야 반입 가능합니다.<br />
ㆍ내용물 용량 한도 : 용기 1개당 100ml 이하, 총 1리터 이내 만 반입 가능합니다.<br />
ㆍ투명 지퍼백 규격은 약 20cm*20cm 이어야 하며 지퍼가 잠겨 있어야 반입 가능합니다.<br />
ㆍ투명 지퍼백이 완전히 잠겨있지 않을 경우 반입 불가합니다.<br />
ㆍ승객 1인당 1리터 이하의 투명 지퍼백 1개만 반입 가능합니다.<br />
ㆍ유아용 음식, 액체 및 젤 형태의 약품 등은 미리 검색요원에게 휴대 사실을 신고하면 용량에 관계없이 반입 가능합니다.<br />
&nbsp;&nbsp;&nbsp; - 지퍼백의 경우 고객이 직접 구비하시거나 공항 내 편의점에서 구매 가능합니다.<br />
<br />
※ 미주/호주행 탑승구 앞 액체류 추가 검색 폐지<br />
ㆍ미국 행 (사이판 등 미국령 포함) 항공편의 탑승구 앞 액체류 2차 추가 검색이 폐지되었습니다. (2014-12-22)<br />
ㆍ호주행 항공편의 탑승구 앞 액체류 2차 추가 검색이 폐지되었습니다.(2014-12-08)<br />
ㆍ미주/호주행 출국 고객께서는 액체류, 젤류를 포함한 구매하신 모든 상품을 인도장에서 직접 수령하시기 바랍니다.</span></div>
	                        	</div>
	                    </div>
                    <div class="screen">
                    		<a href="javascript://" class="tit">구매전유의사항</a>
                    		<div class="box"><ul class="dot_list">
	<li>
		본 상품은 실제 상품과 이미지가 다소 차이가 날 수 있습니다.</li>
	<li>
		현대백화점인터넷면세점 상품은 매장과 가격이 상이 할 수 있습니다.</li>
	<li>
		인도받으신 상품은 관세법령 및 관련 고시에 따라 교환이 제한되오니 유의하여 주시기 바랍니다.</li>
	<li>
		주문 완료 후에도 상품 하자, 품절 등으로 인해 취소될 수 있습니다.</li>
	<li>
		제품 이상 시에는 고객센터에서 고객님께 연락을 드립니다.</li>
	<li>
		출국일 이후 30일 이내 수령하지 않은 상품은 자동으로 주문 취소 처리되며, 해당 주문에 사용한 적립금, 쿠폰은 본래의 유효기간에 따라 소멸될 수 있습니다.</li>
</ul>
</div>
                    	</div> 
                    </div>
            </div>
            <div id="panel_04" class="productdetail_04">
            </div>
                        

            <div id="panel_05" class="productdetail_05">
                <div class="score_board" id="avgArea">
                    <div class="total_score">
                        <div class="star">
                            <p>상품만족도</p>
                            <div>
                                <span></span>
                            </div>
                        </div>
                        <div class="score">
                        	<strong>
                        		
                        			0
                        			</strong> /5
                        </div>
                    </div>
                    <ul class="detailscore">
                        <li>
                            <strong>디자인</strong>
                            <div class="star_point">
                                <span>
                                	
                                		0
                                		</span>
                            </div>
                        </li>
                        <li>
                            <strong>품질</strong>
                            <div class="star_point">
                                <span>
                                	
                                		0
                                		</span>
                            </div>
                        </li>
                        <li>
                            <strong>가격</strong>
                            <div class="star_point">
                                <span>
                                	
                                		0
                                		</span>
                            </div>
                        </li>
                    </ul>
				</div>
				<div class="user_review">
					<div class="photo_review">
						<div class="title">
								<h4 id="photoGrvwsCnt">포토상품평<span>(0)</span></h4>
								<div>
                                    <select id="photoGrvwsSort"  onchange="onchangePhotoGrvwsSort()">
                                        <option value="01">최근 등록일순</option>
                                        <option value="02">상품 만족도 높은순</option>
                                        <option value="03">조회수 높은순</option>
                                    </select>
                                    <a href="javascript://" onclick="createMyPhotoGrvwsList(1)">내 상품평 보기</a>
                                    <a href="javascript://" class="sub" onclick="openInsGoosGrvwsFormPop('Y')">상품평 쓰기</a>
                                </div>
							</div>
							<div class="nodata" id="photoGrvwsList">
										등록된 상품평이 없습니다.
									</div>
									<div class="paging review" id="photoGrvwsPaging"></div>
								</div>
					
					<div class="text_review">
						<div class="title">
								<h4 id="grvwsCnt">상품평<span>(0)</span></h4>
								<div>
									<select id="normalGrvwsSort"  onchange="onchangeNomalGrvwsSort()">
					                    <option value="01">최근 등록일순</option>
					                    <option value="02">상품 만족도 높은순</option>
					                    <option value="03">조회수 높은순</option>
					                </select>
					                <a href="javascript://" onclick="createMyNomalGrvwsList(1)">내 상품평 보기</a>
					                <a href="javascript://" class="sub" onclick="openInsGoosGrvwsFormPop('N')">상품평 쓰기</a>
								</div>
							</div>
							<div class="nodata" id="grvwsList">
										등록된 상품평이 없습니다.
									</div>
									<div class="paging review" id="grvwsPaging"></div>
								</div>
				</div>
            </div>
        </div>
    </div>
    <a href="javascript://" class="full_layer_close">닫기</a>
</section> -->

</div>

<section class="setproduct">
	<div class="box setGoosEvtList">
	</div>	
	<div class="selectedproduct selectEvtProductList addtocart">
		<div class="zone">
        	<div class="swiper-container selecteditem_swiper product_list">
            	<ul class="swiper-wrapper setEvtGoosChoiList">
            		</ul>
        	</div>
        	<div class="selecteditem-prev"></div>
        	<div class="selecteditem-next"></div>
        	<a href="javascript:" onclick="cartConsist();" class="addcart_btn">장바구니 담기</a>
        </div>
        <input type="hidden" name="targetListTotPage" id="targetListTotPage"/>
		<input type="hidden" name="layerSetGoosId" id="layerSetGoosId" />
		<input type="hidden" name="layerGoosChoiClsCd" id="layerGoosChoiClsCd" />
	</div>
</section>
<input type="hidden" name="defaultSetGoosId" id="defaultSetGoosId"/>
<input type="hidden" name="defaultSetGoosCnt" id="defaultSetGoosCnt"/>

<div class="layer_unit pop_o1" style="display: none;">
    <div class="layer_popup">
        <div class="layer_cont">
            <p class="txt_ty1">중복 세트 안내</p>
            <p class="text_ty2">
   		            이미 장바구니에 담긴 세트입니다.<br>
   		            신규 세트를 구성하거나, 기존 세트에 <br>수량을 추가 할 수 있습니다.
            </p>
                
            <ul class="btn_group">
                <li><a href="javascript:evtGoosAddCart('I');" class="btnde_type1 mid bg_black">새로담기</a></li>
                <li><a href="javascript:evtGoosAddCart('U');" class="btnde_type1 mid">기존 세트 수량 추가하기</a></li>
            </ul>
        </div>
        </div>
    <div class="event_type_close">취소</div>
</div>

<div class="layer_unit pop_o2" style="display: none;">
    <div class="layer_popup">
        <div class="layer_cont">
            <p class="txt_ty1">중복 세트 안내</p>
            <p class="text_ty2">
            	이미 장바구니에 담긴 세트입니다.<br>
            	중복 세트를 새로 담으시겠습니까?
            </p>
            <ul class="btn_group">
                <li><a href="javascript:evtGoosAddCart('I');" class="btnde_type1 mid bg_black">새로담기</a></li>
            </ul>
        </div>
    </div>
    <div class="event_type_close">취소</div>
</div>


<input type="hidden" id="goCallGoosInfo" value="go" />
<input type="hidden" id="goCallReviewInfo" value="go" />
<div class="ordertime_btn" onclick="location.href='https://www.hddfs.com/shop/om/consmGuide/useNotice.do#orderTimeInfo'"></div>

<script src="https://cdn.hddfs.com/front/js/KO/productdetail.js"></script>
<script type="text/javascript">

/* function buyCart(){
	alert("넘어간다");
	location.href="/order/orderpays";
	return;
	 location.href="/order/PassportInfo?mid=${mid}&pcode=${product.pcode}$pprice=${product.pprice}"; 
}   */  
    
function productamount(){
	
	if("${product.pstock}"-parseInt($("#totalamount").text())<0){
		return false;
	}else{
		return true;
	}
}    
    
  
function addCart(){
	
	console.log("카트 들어감!")
	const Data = {
			cartstock :$("#totalamount").text(),
			mid : "${member.mid}",
			pcode : "${product.pcode}"
		}

		$.ajax({
			type :"POST",
		    data : Data,
		    url : "/cart/insertCart",
		    success : function(data){
				console.log('담기 성공!')	
			},
			error : function(){
				console.log("실패");
    		}
		});
}

function updateCart(){
	
	console.log("카트 들어감!")
	const Data = {
			cartstock :$("#totalamount").text(),
			mid : "${member.mid}",
			pcode : "${product.pcode}"
		}

		$.ajax({
			type :"POST",
		    data : Data,
		    url : "/cart/updateCart",
		    success : function(data){
				console.log('담기 성공!')	
			},
			error : function(){
				console.log("실패");
    		}
		});
}

    
 function cartConsist(){
    	var productconsist=productamount();
    	if(productconsist==true){
    		const Data = {
        			cartstock :$("#totalamount").text(),
        			mid : "${member.mid}",
        			pcode : "${product.pcode}"
        		}

        		$.ajax({
        			type :"POST",
        		    data : Data,
        		    url : "/cart/isselect",
        		    success : function(data){
        		    	console.log(data);
        		    	if(data === 'yes'){
        		    		let param=confirm("장바구니에 동일한 상품이 존재합니다. 추가로 담으시겠습니까?");
        		    		if(param===true){
        		    			updateCart();
        		    			let param=confirm("선택하신 상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?");
            					if(param){
            						location.href="/cart/cartlist?mid=${member.mid}&align=늦게담은순";
            						/* location.href="/cart/cartlist?mid="+${member.mid};  */
            	    			}		
        		    		}else{
        		    			return false;
        		    		}
        		    		
        		    	}else{
        		    		addCart();
        		    		let param=confirm("선택하신 상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?");
        					if(param){
        						/* location.href="/cart/cartlist"; */
        						location.href="/cart/cartlist?mid=${member.mid}&align=늦게담은순";
        	    			}		
        		    	}
        			},
        			error : function(){
        				console.log("실패");
            		}
        		});
    	}else{
    		alert("재고량이 부족합니다");
    		return false;
    	}
    	
    }



    
   	
   	var cateNm = cateLNm = cateMNm = cateSNm = cateDNm = "";
    var cat = catL = catM = catS = catD = "";
    var goos_status = "";
    var name = code = amt = prc = salePrc = img = brand = brandNm = "";
              	
    if("1" != '1' || "Y" == 'N'){	// 상품 상태 코드(1:판매중, 2:재고없음, 3:MD중단, 9:영구중단), 상품 판매 여부
    	goos_status = 'SS';
    }else{
        goos_status = '';	
    }
              	
    if("00" == '02'){
        cat = "00070201";
        catL = "0007";
        catM = "000702";
        catS = "00070201";
        catD = "00070201";
        cateNm = "";
        cateLNm = "패션/잡화";
        cateMNm = "여성의류";
        cateSNm = "상의";
        cateDNm = "";
    }else{
        cat = "00070201";
        catL = "0007";
        catM = "000702";
        catS = "00070201";
        catD = "";
        cateNm = "상의";
        cateLNm = "패션/잡화";
        cateMNm = "여성의류";
        cateSNm = "상의";
        cateDNm = "";
     }
              	
     name = "여성 푸퍼 다운 점퍼 036";
     code = "56381120799001";
     amt = "322532";
     prc = "460761";
     salePrc = "322532";
     img = "https://cdn.hddfs.com/files/";
     brand = "638101";
     brandNm = "라코스테(의류)";
           	
              	groobee( "VG",{
              			goods :[
              			{
              			name: name,
              			code: code,
              			amt: amt,	
              			prc: prc,
              			salePrc: salePrc,
              			status: goos_status,
              			img: img,
              			cat: cat,
              			cateNm: cateNm,
              			catL: catL,
              			cateLNm: cateLNm,
              			catM: catM,
              			cateMNm: cateMNm,
              			catS: catS,
              			cateSNm: cateSNm,
              			catD: catD,
              			cateDNm: cateDNm,
              			brand: brand,
              			brandNm: brandNm
              			}
              		]
           	   });
   </script>

</main>
	    <!-- // container -->
	    <script type="text/javascript">
	function sellerInfo(){
	    $("#seller_information").dialog("open");
	}
	$(document).ready(function(){
        // 다이얼로그 초기화
        $("#seller_information").dialog({
            autoOpen: false,
            resizable: false,
            width:400,
            maxHeight: 340,
            modal: true
        });
    });
	function moveToMain(){
		location.href = ctx_shop + '/dm/main.do';
	}
</script>
<%@ include file="/WEB-INF/views/common/Footer.jsp"%>