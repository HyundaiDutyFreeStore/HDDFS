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



    function deleteCartList(onlnGoosCd, qty){
        for(var i=0;i<uniqGoosList.length;i++){
			if(uniqGoosList[i] === onlnGoosCd){
				uniqGoosList.splice(i, 1);
				cntList.splice(i, 1);
				i--;
			}
		}
        
		var searchCondi = {
	        goosList:uniqGoosList,
	        cntList:cntList
	    }
        
        // 데이터 요청
        $.ajax({
            async       : true,
            traditional : true,
            url         : ctx_curr+"/gd/dtl/goosOrderLayer.json",
            dataType    : "html",            
            type        : "POST",
            cache       : false,
            data        : searchCondi,
            success     : function(data, textStatus, jqXHR){
        	    
        	    if(!crew.ajaxValidate(data)){ return; }
        	   
        	    $('.selectlist').html(data);
        	    if($("#isTotal").val() == 'Y') {
                	var totalCnt = $("#totalCnt").val();
                	var totalDorSum = $("#totalDorSum").val();
                	var totalWonSum = $("#totalWonSum").val();
                	var priceUnit = $("#priceUnit").val();
                	var html = "";
                	html += "<div>";
                	html += "총 <strong>"+totalCnt+"</strong> 개";
                	html += "</div>";
            	    html += "<dl>";
            	    html += "<dt>$"+totalDorSum+"</dt>";
            	    html += "<dd>"+totalWonSum+" <em>"+priceUnit+"</em></dd>";
            	    html += "</dl>";
            	    $('.totalamount').html(html);
            	    $('.totalamount').show();
                }else {
                	$('.totalamount').hide();
                }
	            //delete qtyList[qty];
	            //qtyList.splice(qty, 1);
	        },
	        error       : function(jqXHR, textStatus, errorThrown){
	            //console.log(jqXHR.status);
	        }
        });
    }
    
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
	

</script></div>
							<div class="totalamount"><div>총 <strong id="totalamount">1</strong> 개</div><dl class="priceInfo">
							<dt>$<fmt:formatNumber
													value="${product.pprice*(1-(product.pdiscount/100))}"
													pattern="#,##0.##" /></dt>
													<dd><fmt:formatNumber value="${product.pprice*(1-(product.pdiscount/100))*1267}" pattern="#,#00" /> <em>원</em></dd></dl>
													</div>
		                </div>
					<div class="button_area">
						<div class="square_tooltip maxprice">
								<button class="btnxl_type1 btnico btn_tooltip btn_view_rv" onclick="javascript:calcMaxDcPrc()">
									<em class="ico_sale">적립금 혜택 엿보기</em>
									<div class="info_reserve">적립금 혜택 엿보기</div><!--//2022-04-19 추가-->
								</button>
                                
								<div class="tooltip" id="maxSvmtInfoPop">
									<ul class="dl_price">
									</ul>
									<button class="close" onclick="closeMaxDcPrc();">닫기</button>
								</div>
							</div>
						<a href="" class="addcart" onclick="cartConsist();">장바구니</a>
                        <a href="/order/PassportInfo" class="buynow">바로구매</a>
						  </div>
				<ul class="layercall">
				<li class="call_panel_b">
						<a href="javascript://" onclick=""><p>사은품</p></a>
					</li>
				<li class="call_panel_c">
					<a href="javascript://" onclick=""><p>상품정보</p></a>
				</li>
				<li class="call_panel_d">
					<a href="javascript://" onclick="">
						<p>추천상품</p></a>
				</li>
				<li class="call_panel_e">
					<a href="javascript://" onclick=""><p>상품평</p></a>
				</li>
			</ul>
		</div>
		</section>
	</article>

<section class="pd_full_layer">
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
</section>
<p class="white_dim"></p>


<div id="layer_popup" class="pop_o3" title="쿠폰 다운로드">
    <div class="layer_popup">
        <div class="popupcont_wrap" id="coupon_list">
            <div class="btn_area">
	            </div>
            <div class="product_list">
                <ul class="pop_coupon">
                    </ul>
            </div>
        </div>
    </div>
</div>

<div id="layer_popup" class="pop_o4" title="적립금 다운로드">
    <div class="layer_popup">
        <div class="popupcont_wrap">
            <div class="btn_area">
                </div>
            <div class="product_list">
                <ul class="pop_coupon">
                    </ul>
            </div>
        </div>
    </div>
</div>

<div id="send_email" title="이메일 보내기" style="display: none">
    <div class="layer_popup">
        <div class="send_email_layer">
            <div class="product_list01">
                <dl class="product_type">
                    <dt>
                        <span class="brand_name">라코스테(의류)</span>
                        <span class="tit">여성 푸퍼 다운 점퍼 036</span>
                        <span class="price">
                            <span class="price_name">정상가<em>(오프라인 매장가)</em></span>
                            <span class="off_line">$370(460,761원)</span>
                        </span>
                        </dt>
                    <dd><img src="https://cdn.hddfs.com/files/goos/6381/20221117/69343c11.jpg?sf=webp" alt="" title=""></dd>
                </dl>

            </div>
            <div class="attention_wrap mgtsm">
                <p class="attention">유의사항</p>
                <ul class="dot_list">
                    <li>발송일 기준의 정보이므로, 가격 등의 정보가 변경되었을 수 있습니다.</li>
                    <li>2023-01-13 발송되었으며, 기준환율 $1 = <em>1,245.3</em>입니다.</li>
                </ul>
            </div>
            <div class="mail_write mgtmm">
                <form name="mailForm">
                        <span class="checkbox small">
                            <input type="checkbox" name="my_mail" id="my_mail" onclick="checkMyMail(this)">
                            <label for="my_mail">내 메일로 받기</label>
                        </span>
                    <table class="tb_write01 vm">
                        <caption>이메일 보내기</caption>
                        <colgroup>
                            <col style="width:100px">
                            <col style="width:auto">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">보내는사람</th>
                            <td>
                                <input name="sndrNm" type="text" value="" style="width:65px" class="required" valMsg="보내는사람 이름은 필수입니다.">
                                <input name="sndrEml1" type="text" value="" style="width:110px" class="required" valMsg="보내는사람 메일주소는 필수입니다.">
                                <span class="gap">@</span>
                                <input name="sndrEml2" type="text" value="" style="width:130px" class="required" valMsg="보내는사람 메일주소는 필수입니다.">
                                <span class="selw04">
                                    <select name="sndrEmlCd"
    class="sel_type"id="sndrEmlCd"
>
    <option value="">선택</option>
    <option value="001" >naver.com</option>
    <option value="002" >hanmail.net</option>
    <option value="003" >gmail.com</option>
    <option value="004" >nate.com</option>
    <option value="005" >hotmail.com</option>
    <option value="006" >daum.net</option>
    <option value="007" >yahoo.com</option>
    <option value="999" >직접입력</option>
    </select>
</span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">받는사람</th>
                            <td>
                                <input name="reciNm" type="text" value="" placeholder="이름" style="width:65px" class="required" valMsg="받는사람 이름은 필수입니다.">
                                <input name="reciEml1" type="text" value="" placeholder="" style="width:110px" class="required" valMsg="받는사람 메일주소는 필수입니다.">
                                <span class="gap">@</span>
                                <input name="reciEml2" type="text" value="" placeholder="" style="width:130px" class="required" valMsg="받는사람 메일주소는 필수입니다.">
                                <span class="selw04">
                                    <select name="reciEmlCd"
    class="sel_type"id="reciEmlCd"
>
    <option value="">선택</option>
    <option value="001" >naver.com</option>
    <option value="002" >hanmail.net</option>
    <option value="003" >gmail.com</option>
    <option value="004" >nate.com</option>
    <option value="005" >hotmail.com</option>
    <option value="006" >daum.net</option>
    <option value="007" >yahoo.com</option>
    <option value="999" >직접입력</option>
    </select>
</span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">내용</th>
                            <td>
                                <textarea name="emlCont" placeholder="내용을 입력해주세요." class="required" valMsg="내용항목은 필수입니다."></textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>

        <div class="basic_btn_box">
            <button type="button" class="btn_basic1" onclick="$('#send_email').dialog('close');">취소</button>
            <button type="button" class="btn_basic2" onclick="sendGoosSharEml()">보내기</button>
        </div>
    </div>
</div>
<div id="layer_popup_brandAlarm" class="pop_o6" title="브랜드 혜택 알림 신청" style="display: none;">
    <div class="layer_popup" id="brandAlarmArea">
		<form name="form" id="form">
	<input type="hidden"  id="onlnBranCd" name="onlnBranCd" value=''>
	<input type="hidden"  id= "mbshNo" name="mbshNo" value=''>

<!--s 브랜드 혜택 알림 신청 -->
<!-- <div id="layer_popup" class="pop_o6" title="브랜드 혜택 알림 신청">
    <div class="layer_popup"> -->
        <div class="popupcont_wrap">
            <p>브랜드 혜택 알림 신청을 하시면, 출국일에 맞춰 브랜드 기획전, 이벤트, 쿠폰 등 다양한 혜택 정보를 안내해 드립니다.</p>

            <ul class="form_lsit">
                <li class="w100">
                    <p class="f_ti ">출국일</p>
                    <span class="input_de datepicker_box">
                        <input type="text" id="endDt" name="endDt" class="datepicker" value="" maxlength="10" onkeyup="dateChk(this,event);" readonly>
                    </span>
                    <p class="txt_ps">설정하신 출국일로 알림이 신청되며 출국일까지 알림이 제공됩니다.</p>
                </li>
                <li class="w100">
                    <p class="f_ti ">휴대폰번호</p>
                    <span class="input_de">
                        <select name="telNatiCd"
    class="required"onchange="telNatiCdOnchange(this);"disabled="disabled"id="telNatiCd"valMsg='휴대폰 국가번호를 선택해주세요.'
>
    <option value="82" >한국 (+82)</option>
    <option value="86" >중국 (+86)</option>
    <option value="886" >대만 (+886)</option>
    <option value="65" >싱가포르 (+65)</option>
    <option value="84" >베트남 (+84)</option>
    <option value="852" >홍콩 (+852)</option>
    <option value="81" >일본 (+81)</option>
    <option value="61" >호주 (+61)</option>
    <option value="66" >태국 (+66)</option>
    <option value="64" >뉴질랜드 (+64)</option>
    <option value="1" >미국/캐나다 (+1)</option>
    <option value="63" >필리핀 (+63)</option>
    <option value="233" >가나 (+233)</option>
    <option value="241" >가봉 (+241)</option>
    <option value="592" >가이아나 (+592)</option>
    <option value="220" >감비아 (+220)</option>
    <option value="590" >과델로프 (+590)</option>
    <option value="502" >과테말라 (+502)</option>
    <option value="1671" >괌 (+1671)</option>
    <option value="379" >교황청 (+379)</option>
    <option value="1473" >그레나다 (+1473)</option>
    <option value="995" >그루지아 (+995)</option>
    <option value="30" >그리스 (+30)</option>
    <option value="299" >그린랜드 (+299)</option>
    <option value="245" >기네비소 (+245)</option>
    <option value="224" >기니 (+224)</option>
    <option value="264" >나미비아 (+264)</option>
    <option value="234" >나이지리아 (+234)</option>
    <option value="27" >남아프리카 (+27)</option>
    <option value="31" >네덜란드 (+31)</option>
    <option value="599" >네덜란드 열도 (+599)</option>
    <option value="977" >네팔 (+977)</option>
    <option value="47" >노르웨이 (+47)</option>
    <option value="687" >뉴 칼레도니아 (+687)</option>
    <option value="227" >니제르 (+227)</option>
    <option value="505" >니카라과 (+505)</option>
    <option value="45" >덴마크 (+45)</option>
    <option value="1767" >도미니카 (+1767)</option>
    <option value="1809" >도미니카 공화국 (+1809)</option>
    <option value="49" >독일 (+49)</option>
    <option value="856" >라오스 (+856)</option>
    <option value="231" >라이베리아 (+231)</option>
    <option value="371" >라트비아 (+371)</option>
    <option value="7" >러시아/카자흐 (+7)</option>
    <option value="961" >레바논 (+961)</option>
    <option value="266" >레소토 (+266)</option>
    <option value="40" >루마니아 (+40)</option>
    <option value="250" >루안다 (+250)</option>
    <option value="352" >룩셈부르그 (+352)</option>
    <option value="218" >리비아 (+218)</option>
    <option value="370" >리투아니아 (+370)</option>
    <option value="423" >리히텐슈타인 (+423)</option>
    <option value="261" >마다카스카르 (+261)</option>
    <option value="692" >마샬군도 (+692)</option>
    <option value="389" >마세도니아 (+389)</option>
    <option value="691" >마이크로네시아 (+691)</option>
    <option value="853" >마카오 (+853)</option>
    <option value="596" >마티니크 (+596)</option>
    <option value="265" >말라위 (+265)</option>
    <option value="60" >말레이지아 (+60)</option>
    <option value="223" >말리 (+223)</option>
    <option value="269" >코모로스/메요트 (+269)</option>
    <option value="52" >멕시코 (+52)</option>
    <option value="377" >모나코 (+377)</option>
    <option value="212" >모로코/서사하라 (+212)</option>
    <option value="230" >모리셔스 (+230)</option>
    <option value="258" >모잠비크 (+258)</option>
    <option value="1664" >몬트세라트 (+1664)</option>
    <option value="373" >몰도바 (+373)</option>
    <option value="960" >몰디브 (+960)</option>
    <option value="356" >몰타 (+356)</option>
    <option value="976" >몽골 (+976)</option>
    <option value="1284" >미령 버진군도 (+1284)</option>
    <option value="95" >미얀마 (+95)</option>
    <option value="678" >바누아투 (+678)</option>
    <option value="973" >바레인 (+973)</option>
    <option value="1246" >바베이도스 (+1246)</option>
    <option value="880" >방글라데시 (+880)</option>
    <option value="1441" >버뮤다 (+1441)</option>
    <option value="58" >베네주엘라 (+58)</option>
    <option value="229" >베닝 (+229)</option>
    <option value="375" >베라루스 (+375)</option>
    <option value="32" >벨기에 (+32)</option>
    <option value="501" >벨리제 (+501)</option>
    <option value="387" >보스니아-헤르체고비나 (+387)</option>
    <option value="267" >보츠와나 (+267)</option>
    <option value="591" >볼리비아 (+591)</option>
    <option value="257" >부룬디 (+257)</option>
    <option value="226" >부르키나 파소 (+226)</option>
    <option value="975" >부탄 (+975)</option>
    <option value="850" >북한 (+850)</option>
    <option value="359" >불가리아 (+359)</option>
    <option value="594" >불령 가이아나 (+594)</option>
    <option value="262" >불령 리유니온,코모도 제도 (+262)</option>
    <option value="689" >불령 폴리네시아 (+689)</option>
    <option value="55" >브라질 (+55)</option>
    <option value="673" >브루나이 (+673)</option>
    <option value="685" >사모아 (+685)</option>
    <option value="966" >사우디아라비아 (+966)</option>
    <option value="357" >사이프러스 (+357)</option>
    <option value="378" >산마리노 (+378)</option>
    <option value="239" >상토메 프린스페 (+239)</option>
    <option value="221" >세네갈 (+221)</option>
    <option value="248" >세이쉘 (+248)</option>
    <option value="1758" >세인트 루시아 (+1758)</option>
    <option value="1784" >세인트 빈센트 그레나딘 (+1784)</option>
    <option value="1869" >세인트 키츠 네비스 (+1869)</option>
    <option value="290" >세인트 헬레나 (+290)</option>
    <option value="252" >소말리아 (+252)</option>
    <option value="677" >솔로몬 군도 (+677)</option>
    <option value="249" >수단 (+249)</option>
    <option value="597" >수리남 (+597)</option>
    <option value="94" >스리랑카 (+94)</option>
    <option value="268" >스와질랜드 (+268)</option>
    <option value="46" >스웨덴 (+46)</option>
    <option value="41" >스위스 (+41)</option>
    <option value="34" >스페인 (+34)</option>
    <option value="421" >슬로바키아 (+421)</option>
    <option value="386" >슬로베니아 (+386)</option>
    <option value="963" >시리아 (+963)</option>
    <option value="232" >시에라 리온 (+232)</option>
    <option value="971" >아랍에미리트 연합 (+971)</option>
    <option value="297" >아루바 (+297)</option>
    <option value="374" >아르메니아 (+374)</option>
    <option value="54" >아르헨티나 (+54)</option>
    <option value="1684" >아메리칸 사모아 (+1684)</option>
    <option value="354" >아이슬란드 (+354)</option>
    <option value="509" >아이티 (+509)</option>
    <option value="353" >아일랜드 (+353)</option>
    <option value="994" >아제르바이잔 (+994)</option>
    <option value="93" >아프카니스탄 (+93)</option>
    <option value="376" >안도라 (+376)</option>
    <option value="1268" >안티가 바부다 (+1268)</option>
    <option value="355" >알바니아 (+355)</option>
    <option value="213" >알제리 (+213)</option>
    <option value="244" >앙골라 (+244)</option>
    <option value="1264" >앙귈라 (+1264)</option>
    <option value="372" >에스토니아 (+372)</option>
    <option value="593" >에쿠아도르 (+593)</option>
    <option value="503" >엘살바도르 (+503)</option>
    <option value="44" >영국 (+44)</option>
    <option value="1340" >영령 버진군도 (+1340)</option>
    <option value="1345" >영령 캐이맨 군도 (+1345)</option>
    <option value="967" >예맨 (+967)</option>
    <option value="968" >오만 (+968)</option>
    <option value="43" >오스트리아 (+43)</option>
    <option value="504" >온두라스 (+504)</option>
    <option value="962" >요르단 (+962)</option>
    <option value="256" >우간다 (+256)</option>
    <option value="598" >우루과이 (+598)</option>
    <option value="998" >우즈베크 (+998)</option>
    <option value="380" >우크라이나 (+380)</option>
    <option value="251" >이디오피아 (+251)</option>
    <option value="964" >이라크 (+964)</option>
    <option value="98" >이란 (+98)</option>
    <option value="972" >이스라엘 (+972)</option>
    <option value="20" >이집트 (+20)</option>
    <option value="39" >이탈리아 (+39)</option>
    <option value="62" >인도네시아 (+62)</option>
    <option value="91" >인디아 (+91)</option>
    <option value="1876" >자마이카 (+1876)</option>
    <option value="260" >잠비아 (+260)</option>
    <option value="240" >적도 기니 (+240)</option>
    <option value="236" >중앙아프리카 (+236)</option>
    <option value="253" >지부티 (+253)</option>
    <option value="350" >지브랄타 (+350)</option>
    <option value="263" >짐바브웨 (+263)</option>
    <option value="235" >챠드 (+235)</option>
    <option value="420" >체코공화국 (+420)</option>
    <option value="56" >칠레 (+56)</option>
    <option value="237" >카메룬 (+237)</option>
    <option value="238" >카보 베르데 (+238)</option>
    <option value="974" >카타르 (+974)</option>
    <option value="855" >캄보디아 (+855)</option>
    <option value="254" >케냐 (+254)</option>
    <option value="506" >코스타리카 (+506)</option>
    <option value="57" >콜롬비아 (+57)</option>
    <option value="243" >콩고 (+243)</option>
    <option value="53" >쿠바 (+53)</option>
    <option value="965" >쿠웨이트 (+965)</option>
    <option value="682" >쿡 아일랜드 (+682)</option>
    <option value="385" >크로아티아 (+385)</option>
    <option value="996" >키르기스 (+996)</option>
    <option value="686" >키리바티 (+686)</option>
    <option value="992" >타지크 (+992)</option>
    <option value="255" >탄자니아 (+255)</option>
    <option value="90" >터키 (+90)</option>
    <option value="228" >토고 (+228)</option>
    <option value="676" >통가 (+676)</option>
    <option value="1649" >투르크 & 카이코스 군도 (+1649)</option>
    <option value="993" >투르크멘 (+993)</option>
    <option value="688" >투발루 (+688)</option>
    <option value="216" >튀니지 (+216)</option>
    <option value="1868" >트리니다드 토바고 (+1868)</option>
    <option value="670" >티모르 (+670)</option>
    <option value="507" >파나마 (+507)</option>
    <option value="595" >파라과이 (+595)</option>
    <option value="298" >파로에 군도 (+298)</option>
    <option value="92" >파키스탄 (+92)</option>
    <option value="675" >파푸아 뉴기니 (+675)</option>
    <option value="680" >팔라우 (+680)</option>
    <option value="970" >팔레스타인 (+970)</option>
    <option value="51" >페루 (+51)</option>
    <option value="351" >포루투갈 (+351)</option>
    <option value="500" >포클랜드 군도 (+500)</option>
    <option value="48" >폴란드 (+48)</option>
    <option value="1787" >푸에르토리코 (+1787)</option>
    <option value="33" >프랑스 (+33)</option>
    <option value="679" >피지 (+679)</option>
    <option value="358" >핀란드 (+358)</option>
    <option value="36" >헝가리 (+36)</option>
    </select>
</span>
                    <span class="input_de mbshIosdClsCd0" style="display:none">
                    	<input type="text" id="mophNo" value="" placeholder="-없이 숫자만 입력해주세요" readonly>
                    </span>
                    <span class="input_de mbshIosdClsCd1" style="display:none">
                    	<input type="text" id="mophNo" value="" placeholder="-없이 숫자만 입력해주세요" readonly>
                    </span>
                    <p class="txt_ps font_13">
                    	다른 연락처로 알림 정보를 받으시려면 마이현대 > 기본정보관리에서 휴대폰 번호를 수정 후 신청해주세요.
                    </p>
                </li>
            </ul>

            <!-- 유의사항 -->
            <div class="attention_area">
                <p class="attention_tit">유의사항</p>
                <ul class="attention_list">
                    <li>알림 신청일은 별도로 저장되지 않습니다</li>
					<li>알림 신청 이후 출국일 기준 7일 전, 1일 전까지 관련 알림이 발송됩니다.</li>
					<li>브랜드 별 개별 발송되며, 출국일자가 지나면 설정된 알림은 해제됩니다.</li>
					<li>알림 설정된 브랜드는 마이현대에서 확인 가능하며, 알림 브랜드는 출국일 전까지 설정해제 가능합니다.</li>
                </ul>
            </div>
            <!-- //유의사항 -->
            
            <ul class="btn_group">
                <li><a href="javascript:layerClose()" id="btnAlarmClose" class="btnde_type1 mid" >취소</a></li>
                <li><a href="javascript:SendData();" class="btnde_type1 mid bg_black">동의 후 신청</a></li>
            </ul>
            <input type="hidden" id="parType" value="" />
        </div>
    <!-- </div>
</div> -->

</form>

<script type="text/javascript">

//브랜드 알림 신청
function SendData(){
	
	if($('#mophNo').val()== null || $('#mophNo').val() == ""){
		alert('휴대폰 번호를 입력해주세요.');
	    return false;
	}
	var now = new Date();
	var endDate = $("#endDt").val();
	var endDt = endDate.replace(/-/gi,"");
	
	var outDate = new Date(endDate);
	
	
 	if($('#endDt').val() =="" || $('#endDt').val() == null){
 		alert('출국날짜를 입력해주세요.');
	    return false;
	} 
 	
 	if(now > outDate){
 		alert('출국일자는 오늘 이후로 선택해주세요.');
 		return false;
 	}
 	
 	
 	var params = {
            onlnBranCd : $('#onlnBranCd').val(),
            mbshNo : $('#mbshNo').val(),
            endDt : endDt
    }
    
     $.ajax({
            async       : true,
            url         : ctx_curr + "/mm/my/alarmMyBrand.json",
            dataType    : "json",
            type        : "POST",
            data        : params,
            success     : function(data, textStatus, jqXHR){
                if(!crew.ajaxValidate(data)){ return; }
                alert('브랜드 혜택 알림을 신청하셨습니다.');
                // 콜백함수가 존재하는 경우
                if(typeof(fn) == "function"){ fn(obj); }
                
                if($('#parType').val() == 'brand'){
                	$('.btn_bell30').addClass('on');
                }else{
                	$('.b_favorites').addClass('check');
                }
                $("#layer_popup_brandAlarm").dialog("close");
                
                 //location.href = ctx_curr + "/dm/bran/brand.do?onlnBranCd=" + $('#onlnBranCd').val();
            },
            error       : function(jqXHR, textStatus, errorThrown){
                  console.log(jqXHR.status);
            },complete : function(data){
            	if(data.responseJSON.resultCode == 100){
            		//location.href = ctx_curr + "/dm/bran/brand.do?onlnBranCd=" + $('#onlnBranCd').val();
            		if($('#parType').val() == 'brand'){
                    	$('.btn_bell30').addClass('');
                    }else{
                    	$('.b_favorites').addClass('check');
                    }
                    //parent.layerPopupClose();
            	}
            }
        });
}

function layerClose(){
	$("#layer_popup_brandAlarm").dialog("close");
}

function dateChk(el,e){
	
	if(e.keyCode != 8){
		if(el.value.replace(/[0-9\-]/g,"").length == 0){
			
			var number = el.value.replace(/[^0-9]/g,"");
			var ymd = "";
			
			if(number.length < 4){
				return number;
			}else if(number.length < 6){
				ymd += number.substr(0,4);
				ymd += "-";
				ymd += number.substr(4);
			}else{
				ymd += number.substr(0,4);
				ymd += "-";
				ymd += number.substr(4,2);
				ymd += "-";
				ymd += number.substr(6);
			}
			el.value = ymd;
		}else{
			$(el).val($(el).val().replace(/[^0-9]/g,""));
			return false;
		}
	}else{
		return false;
	}
	
	
}




</script>

</div>
</div>

<div class="sets_viewpopup" title="세트구성보기" style="display:none;">
	<script type="text/javascript">
	function setEvtGoosInfoLayer(setGoosId,optionYn){
		$.ajax({
	        async			: true,
	        url				: ctx_curr + "/op/setEvt/setEvtGoosInfoModule.json",
	        dataType	: "html",
	        type			: "POST",
	        data			: {
									"setGoosId" : setGoosId
							   },
	        success		: function(data){
	        					$(".setEvtGoosInfoDiv").html(data);
	        					/*
	        					//세트 구성품 보기 
	        					$(".setEvtGoosInfoDiv").find(".num_amount input[count_range]").click(function(e){
        							e.preventDefault();
        							var type = $(this).attr("count_range");
        							var $count = $(this).siblings("input.count");
        							var count_val = $count.val(); // min 1
        							if(type=="m"){
        								if(count_val<1){
        									return;
        								}
        								$count.val(parseInt(count_val)-1);
        							}else if(type=="p"){
        								$count.val(parseInt(count_val)+1);
        							}
        						});
	        					*/
        			            $(".sets_viewpopup").dialog({
        			                //resizable: false,
        			                dialogClass: "pop_type1",
        			                width: 420,
        			                minHeight: 120,
        			                maxHeight: 600,
        			                modal: true,
        			                close : function(){
        			                	$('body').removeClass('fixed');
        			    			}
        			            });
	        					if(optionYn =="Y"){
	        						$('body').addClass('fixed');	
	        					}
        			            //
	        },
	        error			: function(jqXHR, textStatus, errorThrown){
	        }
	    });
	}
</script>
<div class="viewpop_wrap setEvtGoosInfoDiv">
</div></div>
<script type="text/javascript">
	var initEvtGoosScroll = false;
	var evtGoosListPage = 1;
	var evtGoosListTotPage = 0; 	//초기값 0
	
	$(document).ready(function(){
		$(".pop_o1").dialog({
    		autoOpen: false,
    		resizable: false,
            dialogClass:"event_type",
            width:420,
            minHeight: 120,
            maxHeight: 600,
            modal: true,
            close : function(){
				$(".ui-widget-overlay").css({"z-index":"98"});
			}
    	});
		$(".pop_o2").dialog({
			autoOpen: false,
	        resizable: false,
	        dialogClass:"event_type",
	        width:340,
	        minHeight: 120,
	        maxHeight: 600,
	        modal: true,
	        close : function(){
				$(".ui-widget-overlay").css({"z-index":"98"});
			}
	    });
	});
	
	function searchSetEvt() {
		var setId = $("#layerSetGoosId").val();
		//유효성 체크
		var str = $("#setKeyword").val();
		
		if(str != '' && str.replace(/\s/g,'') != '' ) {
			$("#setKeyword").val(str);
		}else {
			$("#setKeyword").val("");
		}
		moreSetGoosEvtInfo(setId, "N", str, 'Y');
	}
	
	//세트 상품 선택 레이어 호출
	function addSetEvtLayer(setGoosId){
		$(".setGoosEvtList").css("height","100%");
		$(".selectEvtProductList").hide();
		$(".whitespace").show();
		
		sessionStorage.setItem("setGoosEvtChk", "");	//초기화
		$.ajax({
	        async			: true,
	        url				: ctx_curr + "/op/setEvt/setEvtLayer.json",
	        dataType	: "html",
	        type			: "POST",
	        data			: {
									"setGoosId" : setGoosId
							   },
	        success		: function(data){
	        					$(".setGoosEvtList").html(data);
	        					if($(".evtGoosMoreList > ul > li").length <1){
	        						$(".noDataEvtGoosList").show();
	        						$("#setSearchBox").hide();
	        					}
	        					evtGoosListTotPage = $("#targetListTotPage").val();
	        },
	        complete   : function(){
       		 	$(".setGoosEvtList").unbind("scroll");
	        	$(function(){
	        		//스크롤 bind
	        		$(".setGoosEvtList").scroll(function(){
	        			if($(this).scrollTop()+$(".setproduct")[0].scrollHeight > $(".setGoosEvtList")[0].scrollHeight-300){
	        				if(initEvtGoosScroll ==false){
	        					moreSetGoosEvtInfo(setGoosId,"N");	        
	        					initEvtGoosScroll =true;
	        				}	
	        			}
	        		});
	        		// 브랜드 변경 bind
	        		$("input[name='evtSetBrand']").on("change",function(){
	        			$("#setKeyword").val("");
	        			moreSetGoosEvtInfo(setGoosId,"Y");
	        		});
	        		//체크박스 bind
	        		$("input[name='setGoosEvtChk']").click(function(){
	        		    	
	        			var Productselecteditemswiper = new Swiper('.setproduct .selecteditem_swiper', {
        				    slidesPerView: 'auto',
        				    // freeMode: true,
        				    spaceBetween: 24,
        				    observer:true,
        				    observeParents:true,
        				    navigation: {
        					    prevEl: ".selecteditem-prev",
        					    nextEl: ".selecteditem-next",
        				    },
        			    });
	        			
	        			var id =$(this).data("id");
	        			var essnYn = $(this).parent().parent().find(".counter").html() != undefined ? 'Y' : '';
	        			var essnQty = 1;
	        			if(essnYn == 'Y'){
	        				essnQty = parseInt($(this).parent().parent().find(".counter").children().eq(1).html());
	        			}
	        			var minQty = $(this).parent().parent().find("#setGoos"+id).data("minqty");
	        			var maxQty = $(this).parent().parent().find("#setGoos"+id).data("stoc");
	        			var isSetGoosEvt = 'Y';
	        			var goosNm = $(this).parent().parent().find(".goosNm").html();
	        			var imgArea = $(this).parent().parent().find(".img_w > img ").attr("src");
	        			var salePrice = ($(this).parent().parent().find(".price2 > strong").data("price")*1).toFixed(2);
	        			var typePrice = $(this).parent().parent().find(".price2 > span").data("price")*1;
	        			var qtySalePrice = ($(this).parent().parent().find(".price2 > strong").data("price")*minQty).toFixed(2);
	        			var qtyTypePrice = $(this).parent().parent().find(".price2 > span").data("price")*minQty;
	        			var flag = true;
	        			var adultYn = $(this).closest("li").data("adult");
	        			if($("input[name='setGoosEvtChk']:checked").length >0){
	        				$(".selectEvtProductList").show();
	        				$(".evtGoosMoreList").css("padding-bottom","200px");
	        				$(".whitespace").hide();
	        			}else{
	        				$(".selectEvtProductList").hide();
	        				$(".evtGoosMoreList").css("padding-bottom","0px");
	        				$(".whitespace").show();
	        			}
	        			
	        			$(".setEvtGoosChoiList").each(function(){
	        				if($(this).data("id") == id){
	        					flag = true;
	        				}
	        			});
	        			if(flag == true){
	        				if($(this).is(":checked") ==false){
	        					if($("input[name='setGoosEvtChk']:checked").length <1){
	        						$(".evtGoosMoreList > ul > li").removeClass("chk_on");
	        					}
		        				removeEvtCartProuct(id);	
		        			}else{
		        				$(".evtGoosMoreList > ul > li").addClass("chk_on");
		        				var ntnlCd = "원"; 
		        				var html = "";
		        				html+="<li class='swiper-slide' id='evtCart"+id+"' data-id='"+id+"' data-adult='"+adultYn+"'>";
		        				html+="<div class='item'>";
		        				if($(this).closest("li").attr("data-adult") == "Y"){
		        					html+="<div class='img_w adult'><img src='"+imgArea+"' alt='"+goosNm+"'/></div>";
		        				}else{
			        				html+="<div class='img_w'><img src='"+imgArea+"' alt='"+goosNm+"'/></div>";
		        				}
		        				html+="<div class='pro_i'>";
		        				html+="<p class='tx_ex'>"+goosNm+"</p>";
		        				html+="<p class='price2'>";
		        				html+="<strong data-price='"+salePrice+"'>$"+qtySalePrice+"</strong>";
		        				html+="<span data-price='"+typePrice+"'>"+comma(qtyTypePrice)+ntnlCd+"</span>";
		        				html+="</p>";
		        				html+="</div>";
		        				html+="</div>";
		        				html+="<div class='amount_box'>";
		        				if(essnYn != "") {
		        					html+="<p>필수</p>";
		        				}
		        				html+="<div class='num_amount'>";
		        				html+="<input value='-' count_range='m' type='button' onclick=\"changeSetAmt(this, '"+isSetGoosEvt+"');\">";
		        				html+="<input type='number' class='count' value='"+minQty+"' min='"+minQty+"' max='"+maxQty+"' onkeydown='return checkNumber(event);' onfocusout=\"return checkSetAmt(this,event, '"+isSetGoosEvt+"');\" onpaste='return false;' >";
		        				html+="<input value='+' count_range='p' type='button'  onclick=\"changeSetAmt(this, '"+isSetGoosEvt+"');\">";
		        				html+="</div>";
		        				html+="</div>";
		        				html+="<a href='javascript:' onclick=\"removeEvtCartProuct('"+id+"');\" class='delbtn'>닫기</a>";
		        				html+="</li>";
		        				Productselecteditemswiper.prependSlide(html);	
		        				
		        				setTimeout(function(){
		        					Productselecteditemswiper.slideTo(0);
		    					});
		        				
		        			}	
	        			}
	        		});
	        	});
	        },
	        error			: function(jqXHR, textStatus, errorThrown){
	        }
	    });
	}
	
	//선택 세트상품 삭제 
	function removeEvtCartProuct(id){
		$("#evtCart"+id).remove();
		$("#setGoos"+id).prop("checked",false);
		if($("input[name='setGoosEvtChk']:checked").length >0 || $(".setEvtGoosChoiList > li").length > 0){
			$(".selectEvtProductList").show();
			$(".evtGoosMoreList").css("padding-bottom","200px");
			$(".whitespace").hide();
		}else{
			$(".selectEvtProductList").hide();
			$(".evtGoosMoreList").css("padding-bottom","0px");
			$(".whitespace").show();
		}
	}
	
	//이상 세트상품 수량변경 ('-','+' 버튼 클릭)
	//isSetGoosEvt - 기본세트 : 'N', 이상세트 : 'Y'
	function changeSetAmt(obj, isSetGoosEvt){
		var amount = changeAmtBtn(obj);
		if(amount == false) {
			return false;
		}
		$(obj).parent().children().eq(1).val(amount);
		if(isSetGoosEvt == 'Y') {
			var salePrice = (($(obj).parent().parent().parent().find("strong").data("price")*amount)*1).toFixed(2);
			var typePrice = comma($(obj).parent().parent().parent().find("span").data("price")*amount);
			var ntnlCd = "원"; 
			$(obj).parent().parent().parent().find("strong").html("$"+salePrice);
			$(obj).parent().parent().parent().find("span").html(typePrice+ntnlCd);			
		}
	}
	
	//이상 세트 수량 변경 (키보드 클릭)
	//isSetGoosEvt - 기본세트 : 'N', 이상세트 : 'Y'
	function checkSetAmt(obj, event, isSetGoosEvt) {
		var amount = checkAmt(obj, event);
		if(amount == false) {
			return false;
		} else {
			$(obj).val(amount);	
			if(isSetGoosEvt == 'Y') {
			var salePrice = (($(obj).parent().parent().parent().find("strong").data("price")*amount)*1).toFixed(2);
			var typePrice = comma($(obj).parent().parent().parent().find("span").data("price")*amount);
			var ntnlCd = "원"; 
			$(obj).parent().parent().parent().find("strong").html("$"+salePrice);
			$(obj).parent().parent().parent().find("span").html(typePrice+ntnlCd);
		}
		}
	}
	
	//기본세트 장바구니 담기 체크
	function checkSetCartCnt(cnt, setId, type, setAdultCnt) {
		if(cnt == "") {
			alert("수량을 확인해주세요.");	//"수량을 확인해주세요."
			return false;
		}else {
			
			var goCart = true;
			
			if(type=="layer"){
				
				$.each($(".sets_list li"),function(i,el){
					if($(el).attr("data-adult") == "Y"){
						goCart = false;
					}
				});
				
			}else if(type == "floor"){
				if(setAdultCnt >= 1 && "N" == "N"){
					goCart = false;
				}
			}
			if(type =="layer"){
				$(".sets_viewpopup").dialog("close");
			}
			
			if(goCart){
				newAddSetCartMulti('',  cnt, setId,'');
			}else{
				if(!isLogin){
					login("","","set","",cnt,setId,"","",""); 
				 return false;
				}
				adultPopup("set","",cnt,"",setId,'','',"","");
				return false;
			}
			
		}
	}
	
	//세트 상품 더보기
	function moreSetGoosEvtInfo(setGoosId , chgBranYn, keyword, isSearch){
		$(".noDataEvtGoosList").hide();
		$(".noSearchDataEvtGoosList").hide();
		if(chgBranYn =="Y" || isSearch == "Y"){
			evtGoosListPage = 0;		 // 브랜드 변경시 
			evtGoosListTotPage = 1;	 // 최초 1
			$(".evtGoosMoreList > ul").html("");	//초기화
		}
		$("#setSearchBox").show();
		if(evtGoosListTotPage > evtGoosListPage){
			evtGoosListPage++;
			$.ajax({
		        async			: true,
		        url				: ctx_curr + "/op/setEvt/setEvtMore.json",
		        dataType		: "html",
		        type			: "POST",
		        data			: {
										"setGoosId" : setGoosId ,											
										"page" : evtGoosListPage ,
										"onlnBranCd" : $("input[name='evtSetBrand']:checked").val(),
										"keyword" : keyword
								   },
			    beforeSend : function(){
					$(".loadProgBar").css("display","block");
				},			   
		        success		: function(data, textStatus, jqXHR){
		        					$(".evtGoosMoreList > ul").append(data);
		        					if($(".evtGoosMoreList > ul > li").length <1){
		        						if(isSearch == 'Y') {
		        							$(".noSearchDataEvtGoosList").show();
		        						}else {
		        							$(".noDataEvtGoosList").show();	
		        							$("#setSearchBox").hide();
		        						}
		        					}else{ 
		        						evtGoosListTotPage = $("#targetListTotPage").val();
			        					initEvtGoosScroll = false;	
		        					}
		        },
		        complete   : function(){
		        				 //탭 변경 시 선택 상품 체크 표기
		        				 $(".setEvtGoosChoiList > li").each(function(){
		        					 var id = $(this).data("id");
		        					 $("#setGoos"+id).prop("checked",true); 
		        				 })
		        	
					        	 $(function(){
					        		 //bind 초기화
					        		 $(".setGoosEvtList").unbind("scroll");
					        		 $("input[name='setGoosEvtChk']").unbind("click");
					        		 $("input[name='evtSetBrand']").unbind("change");
					        		//스크롤
					        		$(".setGoosEvtList").scroll(function(){
					        			if($(this).scrollTop()+$(".setproduct")[0].scrollHeight > $(".setGoosEvtList")[0].scrollHeight-300){
					        				if(initEvtGoosScroll ==false){
					        					moreSetGoosEvtInfo(setGoosId,"N",keyword);	        	        
					        					initEvtGoosScroll =true;					
					        				}	
					        			}
					        		});
					        		// 브랜드 변경 bind
					        		$("input[name='evtSetBrand']").on("change",function(){
					        			$("#setKeyword").val("");
					        			moreSetGoosEvtInfo(setGoosId,"Y");
					        		});
					        		//체크박스 bind
					        		$("input[name='setGoosEvtChk']").click(function(){
					        		    	
					        			var Productselecteditemswiper = new Swiper('.setproduct .selecteditem_swiper', {
				        				    slidesPerView: 'auto',
				        				    // freeMode: true,
				        				    spaceBetween: 24,
				        				    observer:true,
				        				    observeParents:true,
				        				    navigation: {
				        					    prevEl: ".selecteditem-prev",
				        					    nextEl: ".selecteditem-next",
				        				    },
				        			    });
					        			
					        			
					        			var id =$(this).data("id");
					        			var essnYn = $(this).parent().find(".counter").html() != undefined ? 'Y' : '';
					        			var essnQty = 1;
					        			if(essnYn == 'Y'){
					        				essnQty = parseInt($(this).parent().parent().find(".counter").children().eq(1).html());
					        			}
					        			var minQty = $(this).parent().parent().find("#setGoos"+id).data("minqty");
					        			var maxQty = $(this).parent().parent().find("#setGoos"+id).data("stoc");
					        			var isSetGoosEvt = 'Y';
					        			var goosNm = $(this).parent().parent().find(".goosNm").html();
					        			var imgArea = $(this).parent().parent().find(".img_w > img ").attr("src");
					        			var salePrice = ($(this).parent().parent().find(".price2 > strong").data("price")*1).toFixed(2);
					        			var typePrice = $(this).parent().parent().find(".price2 > span").data("price")*1;
					        			var qtySalePrice = ($(this).parent().parent().find(".price2 > strong").data("price")*minQty).toFixed(2);
					        			var qtyTypePrice = $(this).parent().parent().find(".price2 > span").data("price")*minQty;
					        			var flag = true;
					        			var adultYn = $(this).closest("li").data("adult");
					        			if($("input[name='setGoosEvtChk']:checked").length >0){
					        				$(".selectEvtProductList").show();
					        				$(".evtGoosMoreList").css("padding-bottom","200px");
					        				$(".whitespace").hide();
					        			}else{
					        				$(".selectEvtProductList").hide();
					        				$(".evtGoosMoreList").css("padding-bottom","0px");
					        				$(".whitespace").show();
					        			}
					        			
					        			$(".setEvtGoosChoiList").each(function(){
					        				if($(this).data("id") == id){
					        					flag = true;
					        				}
					        			});
					        			if(flag == true){
					        				if($(this).is(":checked") ==false){
					        					if($("input[name='setGoosEvtChk']:checked").length <1){
					        						$(".evtGoosMoreList > ul > li").removeClass("chk_on");
					        					}
						        				removeEvtCartProuct(id);	
						        			}else{
						        				$(".evtGoosMoreList > ul > li").addClass("chk_on");		
						        				var ntnlCd = "원"; 
						        				var html = "";
						        				html+="<li class='swiper-slide' id='evtCart"+id+"' data-id='"+id+"' data-adult='"+adultYn+"'>";
						        				html+="<div class='item'>";
						        				if($(this).closest("li").attr("data-adult") == "Y"){
						        					html+="<div class='img_w adult'><img src='"+imgArea+"' alt='"+goosNm+"'/></div>";
						        				}else{
							        				html+="<div class='img_w'><img src='"+imgArea+"' alt='"+goosNm+"'/></div>";
						        				}
						        				html+="<div class='pro_i'>";
						        				html+="<p class='tx_ex'>"+goosNm+"</p>";
						        				html+="<p class='price2'>";
						        				html+="<strong data-price='"+salePrice+"'>$"+qtySalePrice+"</strong>";
						        				html+="<span data-price='"+typePrice+"'>"+comma(qtyTypePrice)+ntnlCd+"</span>";
						        				html+="</p>";
						        				html+="</div>";
						        				html+="</div>";
						        				html+="<div class='amount_box'>";
						        				if(essnYn != "") {
						        					html+="<p>필수</p>";;
						        				}
						        				html+="<div class='num_amount'>";
						        				html+="<input value='-' count_range='m' type='button' onclick=\"changeSetAmt(this, '"+isSetGoosEvt+"');\">";
						        				html+="<input type='number' class='count' value='"+minQty+"' min='"+minQty+"' max='"+maxQty+"' onkeydown='return checkNumber(event);' onfocusout=\"return checkSetAmt(this,event, '"+isSetGoosEvt+"');\" onpaste='return false;' >";
						        				html+="<input value='+' count_range='p' type='button'  onclick=\"changeSetAmt(this, '"+isSetGoosEvt+"');\">";
						        				html+="</div>";
						        				html+="</div>";
						        				html+="<a href='javascript:' onclick=\"removeEvtCartProuct('"+id+"');\" class='delbtn'>닫기</a>";
						        				html+="</li>";
						        					
						        				Productselecteditemswiper.prependSlide(html);
						        				
						        				setTimeout(function(){
						        					Productselecteditemswiper.slideTo(0);
						    					});
						        				
						        			}	
					        			}
					        		});
					        	}); 
		        				$(".loadProgBar").css("display","none");
		        },
		        error			: function(jqXHR, textStatus, errorThrown){
		        }
		    });
		}
	}
	
	//선택 세트상품 장바구니 담기
	function evtGoos(type){
		var listLength = $(".setEvtGoosChoiList > li").length;
		//이상세트
		if(listLength > 0){
			var layerSetGoosId = $("#layerSetGoosId").val();
			var onlnGoosCds = "";
			var goosQtys = "";
			var notAdtGoosCds = new Array();
			var notAdtGoosQtys = new Array();
			var checkCnt = true;
			var adultVali = true;
			$(".setEvtGoosChoiList > li").each(function(idx){
				
				var adultYn = $(this).find(".img_w").hasClass("adult");
				
				
				if($(this).find(".num_amount > .count").val() == "") {
					alert("수량을 확인하세요");
					checkCnt = false;
					return false;
				}
				
				if((idx+1) ==listLength){
					onlnGoosCds += $(this).data("id"); 
					goosQtys += $(this).find(".num_amount > .count").val();
				}else{
					onlnGoosCds += $(this).data("id")+",";
					goosQtys += $(this).find(".num_amount > .count").val()+",";
				}
				
				if(adultYn){
					notAdtGoosCds.push($(this).data("id"));
					notAdtGoosQtys.push($(this).find(".num_amount > .count").val());
					adultVali = false;
				}
				
			});
			
			if(adultVali == false){
				if(!isLogin){
					login("","","set",onlnGoosCds,goosQtys,layerSetGoosId,"N",notAdtGoosCds.join(","),notAdtGoosQtys.join(",")); 
				 return false;
				}
				
				adultPopup("set",onlnGoosCds,goosQtys,"N",layerSetGoosId,'','',notAdtGoosCds.join(","),notAdtGoosQtys.join(","));
				
				return false;
			}
			
			
			if(checkCnt)	newAddSetCartMulti(onlnGoosCds, goosQtys, layerSetGoosId, type);		//세트 장바구니 호출
		}else {
			var setGoosId = $("#defaultSetGoosId").val();
			$(".pop_o1").dialog("close");
			newAddSetCartMulti('', $("#defaultSetGoosCnt").val(), $("#defaultSetGoosId").val(), type);		//세트 장바구니 호출
		}
	}
	
	// 신규 담기 , 기존 수량 update 관련 layer
	function evtCartLayer(type, cnt, setGoosId){
		var listLength = $(".setEvtGoosChoiList > li").length;
		if(listLength <1){
			$("#defaultSetGoosId").val(setGoosId);
			$("#defaultSetGoosCnt").val(cnt);
		}
		if(type=="exist"){
			//이상 세트인 경우
			if($("#layerGoosChoiClsCd").val() =="002" || $("#layerGoosChoiClsCd").val() =="001"){
				$(".pop_o2").dialog("open");
			}else{	//이상세트 아닌 경우
				$(".pop_o1").dialog("open");
			}
			
			$(".event_type_close").click(function(){
				$(this).parent().dialog("close");
			})
			$(".ui-widget-overlay").css({"z-index":"9999"});
			$(".event_type").css({"z-index":"10000"});	
		}else if(type=="success"){
			
			$("input[name='evtSetBrand']").eq(0).click();
			$.each($("input[name='setGoosEvtChk']"),function(i,el){
				$(el).attr("checked",false);
			})
			$(".setEvtGoosChoiList").html("");
			$(".layer_unit").dialog('close');
		}
	}
	
	//선택 세트 상품 레이어 닫기 초기화  
	function setGoosEvtClose(){
		$(".evtGoosMoreList > ul").html("");	//초기화
		$(".setEvtGoosChoiList").html("");	// 선택 상품 영역 초기화
		$("#layerGoosChoiClsCd").val("");	//세트상품코드 초기화
		evtGoosListPage = 1;
		evtGoosListTotPage = 0;
		$(".setGoosEvtList").scrollTop(0);		
		var $body = $("body"),
		$win = $(window),
        $close = $(".setproduct_close");
		$body.css({
			"overflow":"",
			"position":"",
			"top":""
		});
		$(".whitespace").show();
        $(".setproduct").animate({right:"-100%"},200)
        $(".selectEvtProductList").animate({right:"-100%"},200)
        setTimeout(function(){
            $(".setproduct").hide()
        }, 200)
		$("#container").css({zIndex:""})
		$win.scrollTop(offsetY);
	}
	
</script>
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
        	<a href="javascript:" onclick="addCart();" class="addcart_btn">장바구니 담기</a>
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

	var ptnrChlCd = window.location.href.split("&ptnrChlCd=");
	if(ptnrChlCd[1] != undefined) {
		var ptnrChlCd2 = ptnrChlCd[1].split("&");
		if(ptnrChlCd2[0] == "00001805" && $.cookie('closePopNaver') != "Y"){
		    var ctx_event = "https://www.hddfs.com/event";
		    window.open(ctx_event+'/op/evnt/otsdEvnt/otsdEvntNaverPtnrP.do', 'otsdEvntNaverPtnrP', 'width=401, height=635');
		}	
	}
	
    var isLogin = false;
    
    if("N" == "Y"){
        if(isLogin){
            isHSharePtcp("56381120799001","N");
        }else{
        	$("#addHSharePtcp").show();
        }
    }
    
    $(document).ready(function(){
    	
    	sessionStorage.setItem("currUrl", window.location.href .split('?')[0]);				// 현재 URL
    	
    	likeHeart("heart01_1"); //관심브랜드 하트뿅뿅
    	likeHeart("heart01_2"); //관심상품 하트뿅뿅

    	if(getCookie("ADULT_TYPE") == "branAlarm"){
			$("#endDt").datepicker("option", "minDate", 0);
	        
	        setTimeout(function(){
	        	$('#brand_layer').dialog('open');
		    },1000);
	        
	        deleteCookie("ADULT_TYPE");
		}
		
		//슬라이딩되도록 클래스 추가 (브랜드 베스트 / 함께 본 상품)
    	$('ul > .product_itme ').addClass('swiper-slide');
		
		//기내 리튬 배터리 클래스 추가
		$('#ntcClsCdList3 > ul').addClass('dot');
    	
		//묶음 상품이 아닌 경우 주문 카트 표시
		
			changeOrderList("56381120799001", "1", "${goosDtl.goosNm}", "", "N");
		
    	
        //HDDFS 리뉴얼 프로젝트 [쿠폰 다운로드 퍼블 변경]
        $(".pop_o3").dialog({
            autoOpen: false,
            resizable: false,
            dialogClass:"pop_type1",
            width:420,
            minHeight: 120,
            maxHeight: 720,
            modal: true
        });
        //HDDFS 리뉴얼 프로젝트 [적립금 다운로드 레이어 추가]
        $(".pop_o4").dialog({
        	autoOpen: false,
            resizable: false,
            dialogClass: "pop_type1",
            width: 420,
            minHeight: 120,
            maxHeight: 600,
            modal: true
        });
        $("#send_email").dialog({
            autoOpen: false,
            resizable: false,
            width:670,
            // height:250,
            maxHeight: 720,
            modal: true
        });
        
        
        $('div.mail_write .selw04 select').selectmenu({
            change: function( event, ui ) {
                if (ui.item.value == '') {
                    return;
                }
                var vTxt = ( ui.item.value != '999') ? ui.item.label : '';
                $(this).parent().prev().val(vTxt);
            }
        });
        
        $(document).on("click",".tr_open .detail_grvws_open",function(){
            if($(this).parent().parent().next().is(":hidden")){
                addReadCntOfGrvws($(this).attr("grvwsSeq"),$(this).attr("photoYn"));
                $(".tr_open .detail_grvws_open").parent().parent().next().hide();
                $(this).parent().parent().next().show();
                $('.tr_open .detail_grvws_open').removeClass("active");
                $('.tr_open .detail_grvws_open_box').removeClass("active");
                $(this).parent().parent().addClass("active")
            }else if($(this).parent().parent().next().is(":visible")){
                $(this).parent().parent().next().hide();
                $(this).parent().parent().removeClass("active");
            }
        });
        
        //상품평이벤트에서 상품평쓰기로 접속시 상품평탭 활성화
        selectGrvwsTab();
    });
    
    $(".default_menu > a").click(function(){
    	
    });
    
    function selectGrvwsTab(){
        if(window.location.hash){
            var hash = window.location.hash;
            if(hash.indexOf("grvws") > 0){
                $("[title='detail03']").trigger("click");
                $('html, body').animate({scrollTop : $("[title='detail03']").offset().top - 110}, 400);
                window.location.hash = '';
            }
        }
    }
    
    // HDDFS 리뉴얼 프로젝트 [관심상품 등록 변경 적용]
    
    function mergeMyGoosCnt(onlnGoosCd){
    	if(!isLogin){ 
    		$(".btn_onoff").removeClass("on");
    		login(); 
    		return; 
    	}

        $.ajax({
            async       : true,
            url         : ctx_curr + "/mm/my/mergeMyGoos.json",
            dataType    : "json",
            type        : "POST",
            data        : { onlnGoosCd : onlnGoosCd },
            success     : function(data, textStatus, jqXHR){
            	
            	if(!crew.ajaxValidate(data)){ return; }

                if(data.info.mode == "insert"){
                    $("#wishPop").addClass("on");
                    alert("관심상품으로 등록되었습니다.");	//"관심상품으로 등록되었습니다."
                    
                }else if(data.info.mode == "update"){
                	$("#wishPop").addClass("on");
                }

            	var cnt = Number($('#cnrAcumCnt').text());
                	$('#cnrAcumCnt').text(++cnt);
                
                sessionStorage.setItem("cnrAcumCnt", cnt);
                
                var cnrGoosYn = 'N';
                if(cnrGoosYn == 'Y'){
                	$("#wishPop").addClass("on");   
                }
            },
            error       : function(jqXHR, textStatus, errorThrown){
                
            }
        });
    }
    
    
    function showCouponDowonloadLayer() {
        if ( !isLogin ) {
            login();
            return;
        }
        
        //HDDFS 리뉴얼 프로젝트 [쿠폰 다운로드 레이아웃 퍼블 변경]
        $(".pop_o3").dialog('open');
        $.each($(".cupArea"),function(i,el){
        	var value = $(el).find(".cop_point").attr('value');
        	if(value.length < 7){
				$(el).find(".coupon162").addClass("less_million");
			}
        });
    }
    
    function issueGoosCoupon(cupId){
        if ( $('#cup_'+cupId).attr("issuPsbYn") != 'Y' ) {
        	alert('이미 다운로드되었거나 유효기간이 지난 쿠폰입니다.');	//이미 다운로드되었거나 유효기간이 지난 쿠폰입니다.
            return;
        }
        issueCoupon(cupId,function(data){
            if ( data.resultCode == 1 ) {
                alert('쿠폰이 다운로드 되었습니다.');	//"쿠폰이 다운로드 되었습니다."
                $('#cup_'+cupId).attr("issuPsbYn","N");
                $('#cup_'+cupId+' button').attr("disabled",true);
                $('#cup_'+cupId+' button').text("받기완료");
            }
            else {
                alert(data.message);
            }
        });
    }
    
    function issueAllGoosCoupon(){
        var cupIds  = new Array();
        $('#coupon_list li[issuPsbYn=Y]').each(function(i,cup){
            cupIds.push($(this).attr('cupId'));
        });
        if ( cupIds.length == 0 ) {
        	alert("다운로드 받을 수 있는 쿠폰이 없습니다.");	//이미 다운로드되었거나 유효기간이 지난 쿠폰입니다.
            return;
        }
        issueMultiCoupon(cupIds,function(datas){
            var succCnt     = 0;
            var failCnt     = 0;
            $(cupIds).each(function(i,cupId){
                if ( datas[cupId].resultCode == '1' ) {
                    $('#cup_'+cupId).attr("issuPsbYn","N")
                    $('#cup_'+cupId+' button').attr("disabled",true);
                    $('#cup_'+cupId+' button').text("받기완료");
                    succCnt+=1;
                }
                else {
                    failCnt+=1;
                }
            });
            if ( succCnt == 0 ) {
                alert('다운로드 받을 수 없는 쿠폰입니다.');	//"다운로드 받을 수 없는 쿠폰입니다."
            }else {
            	var alertMsg = "쿠폰  %s건이 다운로드 되었습니다.".replace("%s", succCnt);
                alert(alertMsg);	//"쿠폰 N 건이 다운로드 되었습니다"
            }
        });
    }
    
    //HDDFS 리뉴얼 프로젝트 [적립금 다운로드 기능 추가]
    
    function showSaveLayer() {
    	if ( !isLogin ) {
            login();
            return;
        }
    	$(".pop_o4").dialog('open');
		$.each($(".svmt_point"),function(i,el){
        	var value = $(el).attr("value");
        	if(value.length < 7){
				$(el).find(".benefit158").addClass("less_million");
        	}else if(7 <= value.length < 10) {
        		$(el).find(".benefit158").addClass("over_million");
        	}
        })
    }
    
    function issueSvmt(svmtId, baseRsvgAmt, dupIssuYn){

    	$.ajax({
    		async       : true,
    		url         : ctx_curr + "/cm/comm/issueSvmt.json",
    		dataType    : "json",
    		type        : "POST",
    		data        : {
    			svmtId : svmtId,
    			rsvgAmt : baseRsvgAmt
    		},
    		success     : function(data, textStatus, jqXHR){
    			if(!crew.ajaxValidate(data)){ return; }
    			
    			if ( data.resultCode == 1 ) {
    				alert('적립금이 다운로드 되었습니다.');	//"적립금이 다운로드 되었습니다."
    				if(dupIssuYn != 'Y'){
    					$('#svmt_'+svmtId).attr("disabled",true);
    					$('#svmt_'+svmtId).text("받기완료");
    				}
    			}
    			else {
    				alert('적립금 다운로드 대상이 아닙니다.');	//"적립금 다운로드 대상이 아닙니다."
    			}
    		},
    		
    		error       : function(jqXHR, textStatus, errorThrown){}
    	});
    }
    
    
    function issueSvmts(){
      // 로그인 체크
      if ( !isLogin ) {
          alert("로그인 후 이용 가능합니다.");		//"로그인 후 이용 가능합니다 "
          login();
          return;
      }

      var svmtIdList = [];
      var baseRsvgAmtList = [];
      var dupIssuYnList = [];
      
      
      
      if ( svmtIdList.length == 0 ) {
          alert("이미 다운로드되었거나 유효기간이 지난 적립금입니다.");	//이미 다운로드되었거나 유효기간이 지난 적립금입니다.
          return;
      }
      
      $.ajax({
          async       : true,
          traditional : true,
          url         : ctx_curr + "/cm/comm/issueSvmt.json",
          dataType    : "json",
          type        : "POST",
          data        : {
              svmtId : 'multi',
              svmtIdList : svmtIdList,
              rsvgAmtList : baseRsvgAmtList,
              dupIssuYnList : dupIssuYnList
          },
          success     : function(data, textStatus, jqXHR){
        	  
	          for(var i=0;i<data.successList.length;i++){
	        	  
	              //console.log('i  =  '+i);
	        	  //console.log(data.successList[i]);
	        	  //console.log(data.dupIssuList[i]);
	        	  if(data.dupIssuList[i] != 'Y'){
	        		  $('#svmt_'+data.successList[i]).attr("disabled",true);
		        	  $('#svmt_'+data.successList[i]).text("받기완료");
	        	  }
	          }
          
              if(!crew.ajaxValidate(data)){ return; }
          
              if ( data.resultCode == 1 ) {
            	  alert(data.message);	//"적립금이 다운로드 되었습니다."
              }
              else {
                  alert('적립금 다운로드 대상이 아닙니다.');	//"적립금 다운로드 대상이 아닙니다."
              }
          },
          error       : function(jqXHR, textStatus, errorThrown){

          }
      });
    }
    
    
    var uniqGoosList = [];
    var cntList = [];
      
    function changeOrderList(onlnGoosCd, minBuyQty, goosNm, orderType, isBndl){
        if(uniqGoosList.indexOf(onlnGoosCd) >= 0) {
        	if(isBndl != 'N'){
                $('.select_wrap').removeClass('open');                	
            }
        	return;
        }
        
    	uniqGoosList.push(onlnGoosCd);
      	cntList.push(minBuyQty);
      	
      	var searchCondi = {
      			onlnGoosCd:onlnGoosCd,
      			goosList:uniqGoosList,
      			cntList:cntList,
      			orderType:orderType,
      			isBndl:isBndl
      	}
      	
      	// 데이터 요청
        $.ajax({
            async       : true,
            traditional : true,
            url         : ctx_curr+"/gd/dtl/goosOrderLayer.json",
            dataType    : "html",            
            type        : "POST",
            cache       : false,
            data        : searchCondi,
            success     : function(data, textStatus, jqXHR){
                if(!crew.ajaxValidate(data)){ return; }
                if(isBndl != 'N'){
                    $('.select_wrap').removeClass('open');                	
                }
                $('.selectlist').html(data);
                if($("#isTotal").val() == 'Y') {
                	var totalCnt = $("#totalCnt").val();
                	var totalDorSum = $("#totalDorSum").val();
                	var totalWonSum = $("#totalWonSum").val();
                	var priceUnit = $("#priceUnit").val();
                	var html = "";
                	html += "<div>";
                	html += "총 <strong>"+totalCnt+"</strong> 개";
                	html += "</div>";
            	    html += "<dl>";
            	    html += "<dt>$"+totalDorSum+"</dt>";
            	    html += "<dd>"+totalWonSum+" <em>"+priceUnit+"</em></dd>";
            	    html += "</dl>";
            	    $('.').html(html);
            	    $('.totalamount').show();
                }else {
                	$('.totalamount').hide();
                }
            },
            error       : function(jqXHR, textStatus, errorThrown){
            }
        });
    }
      
    
    function calcMaxDcPrc() {
    	
    	// 로그인 체크
        if ( !isLogin ) {
          alert("로그인 후 이용 가능합니다.");		//"로그인 후 이용 가능합니다 "
            login();
            return;
        }
    	
    	var onlnGoosCdList = [];
    	var goosQtyList = [];
    	var amountVali = true;
    	if($(".selectitem").length < 1) {
    		alert("상품을 선택해 주세요.");	//상품을 선택해주세요
    		return false;
    	}
      	$.each($(".selectitem"),function(i,el){
      		var onlnGoosCd = $(el).data("id");
      		var goosQty = $(el).find(".count").val();
      		if(goosQty == ""){
				alert("수량을 확인해주세요.");	//"수량을 확인해주세요."
				amountVali = false;
				return false;
			}else {
				onlnGoosCdList.push(onlnGoosCd);
	      		goosQtyList.push(goosQty);
			}
      		
      	});
      	
      	if(amountVali == true) {
      		onlnGoosCdList = onlnGoosCdList.join(",");
          	goosQtyList = goosQtyList.join(",");
            
          	getMaxDcPrc(onlnGoosCdList, goosQtyList);
          	$(".maxprice > .tooltip").addClass("on");
      	}
    }    
    
    
    function closeMaxDcPrc(){
    	$(".maxprice > .tooltip").removeClass("on");
    }

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
			mid : "jjjj",
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
			mid : "jjjj",
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
        			mid : "jjjj",
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
            						location.href="/cart/cartlist?mid=jjjj";
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
        						location.href="/cart/cartlist?mid=jjjj";
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

    
    
    
    function showEmlSendFormLayer(){
        if ( !isLogin ) {
            login();
            return;
        }
        $("#send_email").dialog('open');
    }
    
    function sendGoosSharEml(){
        if ( !isLogin ) {
            login();
            return;
        }

        // 유효성 체크
        var form = $("form[name=mailForm]");
        if(!form.validateForm()){ return; }

        // 데이터 요청
        $.ajax({
            async       : true,
            url         : ctx_curr+"/gd/dtl/sendMailGoos.json",
            dataType    : "json",
            type        : "POST",
            cache       : false,
            data        : {
                onlnGoosCd  : '56381120799001',
                fromName    : $('input[name=sndrNm]').val(),
                fromEmail   : $('input[name=sndrEml1]').val() + "@" + $('input[name=sndrEml2]').val(),
                toName      : $('input[name=reciNm]').val(),
                toEmail     : $('input[name=reciEml1]').val() + "@" + $('input[name=reciEml2]').val(),
                mapContent  : $('textarea[name=emlCont]').val()
            },
            success     : function(data, textStatus, jqXHR){
                if(!crew.ajaxValidate(data)){ return; }

                alert("발송되었습니다.");	//"발송되었습니다."
                $("#send_email").dialog('close');
            },
            error       : function(jqXHR, textStatus, errorThrown){
            }
        });
    }
    
    function checkMyMail(chk) {
        if ( $(chk).is(':checked') ) {
            $('input[name=reciNm]').val("");
            $('input[name=reciEml1]').val("");
            $('input[name=reciEml2]').val("");
            $('select[name=reciEmlCd]').val('');
            $('select[name=reciEmlCd]').selectmenu('refresh');
        }
        else {
            $('input[name=reciNm]').val('');
            $('input[name=reciEml1]').val('');
            $('input[name=reciEml2]').val('');
            $('select[name=reciEmlCd]').val('');
            $('select[name=reciEmlCd]').selectmenu('refresh');
        }
    }
    
    //HDDFS 리뉴얼 프로젝트 [관심브랜드 등록 function 변경]
    
    function likeMyBrand(onlnBranCd, obj, fn){
    	if ( !isLogin ) {
            login();
            return;
        }

        $.ajax({
            async       : true,
            url         : ctx_curr + "/mm/my/likeMyBrand.json",
            dataType    : "json",
            type        : "POST",
            data        : { onlnBranCd : onlnBranCd },
            success     : function(data, textStatus, jqXHR){
                if(!crew.ajaxValidate(data)){ return; }
                
                if(data.info.mode == "insert"){
                	alert("관심 브랜드로 등록되었습니다.");	//관심 브랜드로 등록되었습니다.
                	$('.b_notice').addClass("on");
                }

                // 콜백함수가 존재하는 경우
                if(typeof(fn) == "function"){ fn(obj); }
            },
            error       : function(jqXHR, textStatus, errorThrown){
                //console.log(jqXHR.status);
            }
        });
    }
    
    
    function initGrvwsList() {
        var d1;
        var d2;
        
        d1  = createNomalGrvwsList(1);
        
        d2  = createPhotoGrvwsList(1);
        
    }
    function createNomalGrvwsList(page){
        return createGrvwsList(page,"N",'');
    }
    function createPhotoGrvwsList(page){
        return createGrvwsList(page,"Y",'');
    }
    function createMyNomalGrvwsList(page){
        if ( !isLogin ) {
            login();
            return;
        }
        createGrvwsList(page,"N",'');
    }
    function createMyPhotoGrvwsList(page){
        if ( !isLogin ) {
            login();
            return;
        }
        createGrvwsList(page,"Y",'');
    }
    
    function onchangePhotoGrvwsSort() {
    	createPhotoGrvwsList(1);
    }
    
    
    function onchangeNomalGrvwsSort(){
        createNomalGrvwsList(1);
    }
    
    
    function createGrvwsList(page, photoYn, mbshNo){
        var sort    = photoYn == 'Y'? $('#photoGrvwsSort').val():$('#normalGrvwsSort').val();
        var searchCondi = {
            onlnGoosCd:'56381120799001',
            onlnBranCd: '638101',
            goosCtgCd:'A12031',
            photoYn:photoYn,
            mbshNo:mbshNo,
            page:page,
            sort:sort
        }
        // 데이터 요청
        return $.ajax({
            async       : true,
            url         : ctx_curr+"/gd/dtl/listGrvws.json",
            dataType    : "json",
            type        : "POST",
            cache       : false,
            data        : searchCondi,
            success     : function(data, textStatus, jqXHR){
                if(!crew.ajaxValidate(data)){ return; }
                if(page == 1){
                	setGrvwsHtml(data,photoYn);	
                }else{
                	setGrvwsMoreHtml(data,photoYn);
                }
            },
            error       : function(jqXHR, textStatus, errorThrown){
                //console.log(jqXHR.status);
            }
        });
    }
    
    function setGrvwsHtml(data,photoYn) {
        if ( photoYn == 'Y' ) {
        	if(data.totcnt < 1) {
        		$('#photoGrvwsList').attr("class", "nodata");
        		$('#photoGrvwsCnt>span').html("("+comma(data.totcnt)+")");
        		$('#photoGrvwsList').html(data.html);
        		$('#photoGrvwsPaging').html(data.paging);
        	}else {
        		$('#photoGrvwsList').attr("class", "screen");
        		$('#photoGrvwsCnt>span').html("("+comma(data.totcnt)+")");
                $('#photoGrvwsList').html(data.html);
                $('#photoGrvwsPaging').html(data.paging);	
        	}
        }
        else {
        	if(data.totcnt < 1) {
        		$('#grvwsList').attr("class", "nodata");
        		$('#grvwsCnt>span').html("("+comma(data.totcnt)+")");
        		$('#grvwsList').html(data.html);
        		$('#grvwsPaging').html(data.paging);
        	}else {
        		$('#grvwsList').attr("class", "screen");
        		$('#grvwsCnt>span').html("("+comma(data.totcnt)+")");
                $('#grvwsList').html(data.html);
                $('#grvwsPaging').html(data.paging);	
        	}
        }
    }
    
    
 	// 리뷰 평균평점 조작
    function changeTotalReview(){
    	var searchCondi = {
                onlnGoosCd:'56381120799001',
                goosCtgCd:'A12031',
                photoYn:''
        }
    	// 데이터 요청
        return $.ajax({
            async       : true,
            url         : ctx_curr+"/gd/dtl/reviewScore.json",
            dataType    : "json",
            type        : "POST",
            cache       : false,
            data        : searchCondi,
            success     : function(data, textStatus, jqXHR){
                if(!crew.ajaxValidate(data)){ return; }
                $("#avgArea").html(data.html);
                var avgData = $(".total_score .score strong").html();
                $(".total_score .star span").css({"width":(avgData*20)+"%"})
                $(".detailscore .star_point span").each(function () {
            		var Pdata = $(this).html();
            		$(this).css({"width":(Pdata*20)+"%"})
            	});
            },
            error       : function(jqXHR, textStatus, errorThrown){
                //console.log(jqXHR.status);
            }
        });
    	
    }
    
    
    function setGrvwsMoreHtml (data, photoYn) {
    	if ( photoYn == 'Y' ) {
            $('#photoGrvwsList').append(data.html);
            $('#photoGrvwsPaging').html(data.paging);
    	}else {
            $('#grvwsList').append(data.html);
            $('#grvwsPaging').html(data.paging);	
    	}

    }
    
    
    function addReadCntOfGrvws(grvwsSeq,photoYn){
        // 데이터 요청
        $.ajax({
            async       : true,
            url         : ctx_curr+"/gd/dtl/addReadCntOfGrvws.json",
            dataType    : "json",
            type        : "POST",
            cache       : false,
            data        : {
                onlnGoosCd:'56381120799001',
                photoYn:photoYn,
                grvwsSeq:grvwsSeq
            },
            success     : function(data, textStatus, jqXHR){
                if(!crew.ajaxValidate(data)){ return; }
            },
            error       : function(jqXHR, textStatus, errorThrown){
                // console.log(jqXHR.status);
            }
        });
    }
    
    function openInsGoosGrvwsFormPop(photoYn){
        if ( !isLogin ) {
        	alert("로그인 후 이용 가능합니다."); 	//"로그인 후 이용 가능합니다."
            login();
            return;
        }
        var url     = ctx_shop + '/gd/dtl/addGoosGrvwsPop.do?onlnGoosCd=56381120799001&photoYn='+photoYn;
        var name    = 'GoosGrvwsForm';
        var width   = 730;
        var height  = 850;
        popOpen(url, name, width, height);
    }
    
    function openEdtGoosGrvwsFormPop(grvwsSeq,photoYn){
        if ( !isLogin ) {
            login();
            return;
        }
        var url     = ctx_shop + '/gd/dtl/uptGoosGrvwsPop.do?onlnGoosCd=56381120799001&photoYn='+photoYn+"&grvwsSeq="+grvwsSeq;
        var name    = 'GoosGrvwsForm';
        var width   = 730;
        var height  = 850;
        popOpen(url, name, width, height);
    }
    
    function delGrvws(grvwsSeq,photoYn,mbshNo){
        if ( !isLogin ) {
            login();
            return;
        }
        if ( !confirm("삭제하시겠습니까?") ) {	//삭제하시겠습니까?
            return;
        }
        var sort    = photoYn == 'Y'? $('#photoGrvwsSort').val():$('#normalGrvwsSort').val();
        $.ajax({
            async       : true,
            url         : ctx_curr+"/gd/dtl/delGrvws.json",
            dataType    : "json",
            type        : "POST",
            cache       : false,
            data        : {
                onlnGoosCd:'56381120799001',
                goosCtgCd:'A12031',
                photoYn:photoYn,
                mbshNo:mbshNo,
                sort:sort,
                grvwsSeq:grvwsSeq
            },
            success     : function(data, textStatus, jqXHR){
                if(!crew.ajaxValidate(data)){ return; }
                if ( photoYn == 'Y') {
                    createPhotoGrvwsList(1);
                }
                else {
                    createNomalGrvwsList(1);
                }
                changeTotalReview();
            },
            error       : function(jqXHR, textStatus, errorThrown){
                //console.log(jqXHR.status);
            }
        });
    }
    
    function callGoosInfo(onlnGoosCd,onlnBranCd,goosCtgId,rcmdGoosTitl){
    	
    	var go = $("#goCallGoosInfo").val();
    	var reviewGo = $("#goCallReviewInfo").val();
    	
    	// 추천상품 , 브랜드 베스트 , 함께본 상품 JSON
    	if(go =="go"){
			var data = {
    				"onlnGoosCd" : onlnGoosCd,
    				"onlnBranCd" : onlnBranCd,
    				"goosCtgId" : goosCtgId,
    				"rcmdGoosTitl" : rcmdGoosTitl
    			};
        	
        	$.ajax({
    	        async			: false,
    	        url				: ctx_curr + "/gd/dtl/callGoosInfo.json",
    	        dataType		: "html",
    	        type			: "POST",
    	        data			: data,
    	        success		: function(data, textStatus, jqXHR){
    	        	
    	        					$(".productdetail_04").html(data).trigger("create");
    	        					$('ul > .product_itme ').addClass('swiper-slide');
    	        					$("#goCallGoosInfo").val("notgo");
    	        					
    	        					setTimeout(function(){
    	        					    var recommend_slide = 3;
    	        					    var recommendationswiper = new Swiper('.recommendation-swiper', {
    	        					        slidesPerView: recommend_slide,
    	        					        loop: $(".recommendation-swiper .swiper-slide").length > recommend_slide,
    	        					        observer:true,
    	        					        observeParents:true,
    	        					        navigation: {
    	        					            prevEl: ".recommendation-prev",
    	        					            nextEl: ".recommendation-next",
    	        					        },
    	        					    });
    									
    	        					    if($(".recommendation-swiper .swiper-slide").length <= recommend_slide){
    	        					        $('.recommendation-prev, .recommendation-next').hide();
    	        					    }

    	        					    console.log('a : '+$(".recommendation-swiper .swiper-slide").length+' / '+recommend_slide+' / '+($(".recommendation-swiper .swiper-slide").length <= recommend_slide));

    	        					    // 브랜드 베스트
    	        					    var brandbest_slide = 4;
    	        					    var brandbestswiper = new Swiper('.product_brandbest .product_list', {
    	        					        slidesPerView: brandbest_slide,
    	        					        spaceBetween: 19,
    	        					        loop: $(".product_brandbest .product_list .swiper-slide").length > brandbest_slide,
    	        					        observer:true,
    	        					        observeParents:true,
    	        					        navigation: {
    	        					            prevEl: ".brandbest-prev",
    	        					            nextEl: ".brandbest-next",
    	        					        },
    	        					    });
    	        					    console.log(brandbest_slide);
    	        					    if($(".product_brandbest .product_list .swiper-slide").length <= brandbest_slide){
    	        					        $('.product_brandbest .controller').hide();
    	        					    }

    	        					    console.log('b : '+$(".product_brandbest .product_list .swiper-slide").length+ ' / '+brandbest_slide+' / '+($(".product_brandbest .product_list .swiper-slide").length <= brandbest_slide));

    	        					    // 함께 본 상품
    	        					    var brandbestswiper = new Swiper('.relatedproducts .product_list', {
    	        					        slidesPerView: brandbest_slide,
    	        					        spaceBetween: 19,
    	        					        loop: $(".relatedproducts .product_list .swiper-slide").length > brandbest_slide,
    	        					        observer:true,
    	        					        observeParents:true,
    	        					        navigation: {
    	        					            prevEl: ".relatedproducts-prev",
    	        					            nextEl: ".relatedproducts-next",
    	        					        },
    	        					    });

    	        					    if($(".relatedproducts .product_list .swiper-slide").length <= brandbest_slide){
    	        					        $('.relatedproducts .controller').hide();
    	        					    }

    	        					    console.log('c : '+$(".relatedproducts .product_list .swiper-slide").length+ ' / '+brandbest_slide+' / '+($(".relatedproducts .product_list .swiper-slide").length <= brandbest_slide));
    	        					},500);
    			},
    	        error			: function(jqXHR, textStatus, errorThrown){
    	        },
    	        complete : function(jqXHR, textStatus, errorThrown){
    	        	
    	        }
    	    });
    		
		}
    	
    	if(reviewGo == "go"){
    		// 상품평 JSON
        	
    	}
    	
    }
    
	
    function isHSharePtcp(onlnGoosCd, btnChk){
    	
        $.ajax({
               async       : true,
               url         : ctx_curr + "/mm/my/isHSharePtcp.json",
               dataType    : "json",
               type        : "POST",
               data        : { onlnGoosCd : onlnGoosCd},
               success     : function(data, textStatus, jqXHR){
                   if(!crew.ajaxValidate(data)){ return; }
                   
                   if(btnChk == 'Y'){
                	   if(confirm("이미 H.Share참여가 완료된 상품입니다. H.Share 리스트 페이지로 이동하시겠습니까?")){
                           location.href = ctx_shop + "/mm/myOrder/listSpord.do?spordClsType=HSHARE"
                           return;
                       }
                   }else{
                	   if(data.info.isHSharePtcp && data.info.hshareOrderStatCd != '999'){
                           $("#addHSharePtcp").hide();
                           $("#completeHSharePtcp").show();
                       }else{
                    	   $("#addHSharePtcp").show();
                           $("#completeHSharePtcp").hide();
                       }
                   }
                   
                   // 콜백함수가 존재하는 경우
                   if(typeof(fn) == "function"){ fn(obj); }
               },
               error       : function(jqXHR, textStatus, errorThrown){
                   //console.log(jqXHR.status);
               }
           });
    }
    
    
   	function hSharePtcp(onlnGoosCd){
           if ( !isLogin ) {
               login();
               return;
           }
           
           var goosQty = $(".selectitem").find(".count").val();
           
      		$.ajax({
               async       : true,
               url         : ctx_curr + "/mm/my/addHSharePtcp.json",
               dataType    : "json",
               type        : "POST",
               data        : { onlnGoosCd : onlnGoosCd, rsvtQty : goosQty },
               success     : function(data, textStatus, jqXHR){
                   if(!crew.ajaxValidate(data)){ return; }
                   
                   if(data.info.mode == "insert"){
                       alert("H.Share 참여가 완료되었습니다.");  //H.Share 참여가 완료되었습니다.
                       window.location.reload();
                       //$("#addHSharePtcp").hide();
                       //$("#completeHSharePtcp").show();
                   }
                   
                   if(data.info.mode == "update"){
                	   alert("H.Share 참여가 완료되었습니다.");  //H.Share 참여가 완료되었습니다.
                       window.location.reload();
                   }

                   // 콜백함수가 존재하는 경우
                   if(typeof(fn) == "function"){ fn(obj); }
               },
               error       : function(jqXHR, textStatus, errorThrown){
                   //console.log(jqXHR.status);
               }
           });
           
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