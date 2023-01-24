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
<script>
function loginChk() {
	if ("${mid}" === '') {
		console.log("아이디는공백");
		return false;
	} else if ("${mid}" === 'null') {
		console.log("아이디는null");
		return false;
	} else {
		console.log("로그인아이디: ${mid}");
		return true;
	}
}
</script>
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
								
									 일반적립금  <fmt:formatNumber type="number" maxFractionDigits="0"  value="${mhdiscount }" /> %
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
			<form id="cartBuy" method="post" action="" >
				<input type="hidden" name="orderitem[0].pcode" value="${product.pcode }"/>
				<input type="hidden" name="orderitem[0].oamount" value=""/>
				<input type="hidden" name="mhdiscount" value="${mhdiscount }"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
let count = parseInt($(".counts").val());
	$('.minus').attr("disabled",true);
	
	function fn_qtySubtraction(el) {
		count = parseInt($(".counts").val());
		if(count-1<1){
			$(el).attr("disabled",true);
			return false;
		}else{
			$(el).closest(".num_amount").find(".plus").attr("disabled",false);
			$(el).attr("disabled",false);
			count--;
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
			if(count==1){
				$(el).attr("disabled",true);
			}else{
				$(el).attr("disabled",false);
			}
		}
		
	}
  
	//수량버튼 올렸을때
	function fn_qtyAdd(el) {
		$(el).closest('.num_amount').find('.minus').attr("disabled",false);
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
		
		if("${product.pstock}"-count<=0){
			$(el).attr("disabled",true);
		}else{
			$(el).attr("disabled",false);
		}
		
	}
	
	function priceComma(price) {
		return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	function preventClick(e){
		e.preventDefault()
	}
	
	function cartBuy(){
		var totalamount=parseInt($("#totalamount").text());
		$("#cartBuy").find("input[name='orderitem[0].oamount']").val(totalamount);
		if("${userpassport}"== ""){
			$("#cartBuy").attr("action","/order/PassportInfo");
		}else{
			$("#cartBuy").attr("action","/order/goDepartureInfo");
		}
		$("#cartBuy").submit();
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
						<a href="javascript:void(0);" class="addcart" onclick="cartConsist();">장바구니</a>
                        <a href="javascript:void(0);"class="buynow" onclick="cartBuy();">바로구매</a>
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

function productamount(){
	
	if("${product.pstock}"-parseInt($("#totalamount").text())<0){
		return false;
	}else{
		return true;
	}
}    
    
  
function addCart(){
	
	const Data = {
			cartstock :$("#totalamount").text(),
			mid : "${mid}",
			pcode : "${product.pcode}"
		}

		$.ajax({
			type :"POST",
		    data : Data,
		    url : "/cart/insertCart",
		    success : function(data){
			},
			error : function(){
    		}
		});
}

function updateCart(){
	
	const Data = {
			cartstock :$("#totalamount").text(),
			mid : "${mid}",
			pcode : "${product.pcode}"
		}

		$.ajax({
			type :"POST",
		    data : Data,
		    url : "/cart/updateCart",
		    success : function(data){
			},
			error : function(){
    		}
		});
}

    
 function cartConsist(){
	 if (loginChk() == false) {
			alert("로그인이 필요한 서비스입니다. 로그인해주세요");
			location.href = "/join/login";
			return false; 
		} else {
			var productconsist=productamount();
	    	if(productconsist==true){
	    		const Data = {
	        			cartstock :$("#totalamount").text(),
	        			mid : "${mid}",
	        			pcode : "${product.pcode}"
	        		}

	        		$.ajax({
	        			type :"POST",
	        		    data : Data,
	        		    url : "/cart/isselect",
	        		    success : function(data){
	        		    	if(data === 'yes'){
	        		    		let param=confirm("장바구니에 동일한 상품이 존재합니다. 추가로 담으시겠습니까?");
	        		    		if(param===true){
	        		    			updateCart();
	        		    			let param=confirm("선택하신 상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?");
	            					if(param){
	            						location.href="/cart/cartlist?mid=${mid}&align=lput";
	            	    			}		
	        		    		}else{
	        		    			return false;
	        		    		}
	        		    		
	        		    	}else{
	        		    		addCart();
	        		    		let param=confirm("선택하신 상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?");
	        					if(param){
	        						location.href="/cart/cartlist?mid=${mid}&align=lput";
	        	    			}		
	        		    	}
	        			},
	        			error : function(){
	            		}
	        		});
	    	}else{
	    		alert("재고량이 부족합니다");
	    		return false;
	    	}
    	
		}
    	
    }
  
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