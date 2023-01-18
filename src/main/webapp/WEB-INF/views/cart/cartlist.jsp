<!-- 장바구니 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/Header.jsp"%>
<main id="container" class="">

<form id="selfReplace" action="https://www.hddfs.com/shop/or/order/listCart.do" method="post">
<input id="selfReplaceCartCd" type="hidden" name="cartCd" value="">
<input id="selfReplaceScrollMove" type="hidden" name="scrollMove" value="">
</form>

<article id="content">
<section class="cart_wrap">
<input type="hidden" id="checkedCartSeq" value=""> <input type="hidden" id="checkedCartSetId" value=""> <input type="hidden" id="buyNow" value=""><input type="hidden" id="buyNowSetGoosId" value=""><input type="hidden" id="chkPspt" value="0"> <input type="hidden" id="chkDpat" value="0"> <input type="hidden" id="buyNowType" value=""> <input type="hidden" id="buyNowOnlnGoosCdList" value=""> <input type="hidden" id="adtAucaYn" value="N"> <ul class="title_tab">
<li><a href="/cart/cartlist?mid=${member.mid}" onclick='javascript:goCartTab("CART");' class="on" id="tabCart">장바구니</a></li>
<li><a href="" onclick='javascript:goCartTab("PSPT");' class="" id="tabPspt">여권정보</a></li>
<li><a href="" onclick='javascript:goCartTab("DPAT");' class="" id="tabDpat">출국정보</a></li>
<li>주문결제</li>
</ul>
<div class="cart_contens">
<div class="cont_left" id="CART" style="display: block;">

<input type="hidden" id="cartListLength" value="3">
<input type="hidden" id="cartSetListLength" value="0"> 

<div class="sorting_wrap">
<div class="txt_total">
   <!--  <span class="chk nolabel">
        <input type="checkbox" name="" id="cart_chk1" checked="checked">
        <label for="cart_chk1">선택</label>
    </span> -->
    <div class="cartdel_btn">
        <!-- <a href="javascript:void(0);" onclick="deleteSelectedCart();">선택삭제</a> -->
       <!--  <a href="javascript:void(0);" onclick="deleteRostCart();">품절삭제</a> -->
    </div>
</div>
<div class="sort_r">
    <input type="hidden" id="lgcpBuyMbshGrpDtlCd" value="001">
    <select name="cartCd" onchange="listalign(this);" id="cartCd">
<option value="001" <c:if test="${align eq '늦게담은순' }"> selected="selected" </c:if>>늦게담은순</option>
<option value="002" <c:if test="${align eq '먼저담은순' }"> selected="selected" </c:if>>먼저담은순</option>
<option value="003" <c:if test="${align eq '높은금액순' }"> selected="selected" </c:if>>높은금액순</option>
<option value="004" <c:if test="${align eq '낮은금액순' }"> selected="selected" </c:if>>낮은금액순</option>
<option value="005" <c:if test="${align eq '브랜드순(ABC)' }"> selected="selected" </c:if>>브랜드순(ABC)</option>
</select>
</div>
</div>
 <c:choose>
    	<c:when test="${empty cartlist}">	
 <div class="no_cartitem">
        <img src="//www.hddfs.com/shop/images/KO/common/cart_default.png" alt="">
        <p>
            장바구니가 비어있습니다 :)
        </p>
    </div>
    </c:when>
    <c:when test="${not empty cartlist}">
<div class="cart_list">
        <c:forEach var="cart" items="${cartlist}" varStatus="idx">
        		<div class="item_area">
        		<input type="hidden" id="pcode" name="pcode" value="${cart.pcode }"/>
        		<input type="hidden" id="cartstock"name="cartstock" value="${cart.cartstock }">
        		<input type="hidden" name="cartprice" value="${cart.pprice*cart.cartstock}">
        		<input type="hidden" name="cartdisprice" value="${cart.pprice*(1-(cart.pdiscount/100))*cart.cartstock}">
        		<input type="hidden" name="cartdis" value="${cart.pprice*(cart.pdiscount/100)*cart.cartstock}">
        		<input type="hidden" name="pstock" value="${cart.pstock }"/>
        		<input type="hidden" name="cartno" value="${cart.cartno }"/>
                    <div class="item_chk">
                        <span class="chk nolabel">
                           <!--  <input type="checkbox" name="cartSeq" id="cart_ch0" value="439727524" class="cartSeqs" data-onlngooscd="10073250016301" data-idx="0">
                             <label for="cart_ch0">선택</label> -->
                        </span>
                        <div class="btn_area">
                            <button class="btn_onoff btn_pin" onclick="mergeCnrRetn('439727524','10073250016301',this)">핀</button>
                                    <input type="hidden" id="btn_pin0" value="N">
                                        <button class="btn_onoff btn_like" onclick="registCnrGoos('10073250016301', '0' ,this);">좋아요</button>
                                    <button class="btn_onoff btn_del" onclick="javascript:deleteCart(this);">삭제</button>
                                </div>
                    </div>
                    <div class="item_cont type_de">
                        <div class="item_info_wrap">
                                <a href="
                                    /product/Productdetail?pcode=${ cart.pcode}
                                ">
                                <div class="item_img">
                                   <img src=<c:out value="${cart.img1 }"/> alt="키엘 클리어리 코렉티브 다크 스팟 솔루션 115ML" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img252.jpg';"> 
                                        </div>
                                <div class="por_icons">
                                    <span class="pr_sale">세일</span><!-- #156. 선주호. 상품 3시간전, 5시간전 아이콘 삭제 및 조건검색항목 삭제

-->
</div>
                                <div class="item_title">
                                    <strong>${cart.pbrand }</strong>
                                    <span>${cart.pname }</span>  
                                </div>
                                <del>$<fmt:formatNumber value="${cart.pprice*cart.cartstock}"
													pattern="#,##0.##"/></del>
                                            <p class="pay">
                                                <strong>$<fmt:formatNumber
													value="${cart.pprice*(1-(cart.pdiscount/100))*cart.cartstock}"
													pattern="#,##0.##" /></strong>
                                                <span><fmt:formatNumber
													value="${cart.pprice*(1-(cart.pdiscount/100))*1267*cart.cartstock}"
													pattern="#,#00" />원</span>
                                            </p>                                                
                                            </a>
                            <div class="item_sel">
                                </div>
                        </div>
                        <div class="item_buy_wrap">
                            <div class="item_buy">
                                <div class="num_amount cart_amount">
                                    <input value="-" type="button" id="minGoosQty0" onclick="javascript:fn_qtySubtraction(this);">
                                            <input type="text" class="count" id="count0" value="${cart.cartstock }" min="0" name="goosQty" maxlength="5" onkeyup="isNumber(this);" onfocusout="changeGoosQty(439727524,'0','c',this, false);">                                          
                                        
                                        <input value="+" type="button" id="plusGoosQty0" onclick="javascript:fn_qtyAdd(this);">
                                            </div>
                                <button type="button" class="btnde_type1 large" onclick="OrderSingle(this);"><span class="font_14b">바로구매</span></button> 
                            </div>
                        </div>                                     
                    </div>                              
                </div>
            <hr class="hr_part">
        </c:forEach> 
        </div>
      </c:when>
       </c:choose>              
 <form id="Orderexec" method="post">
 </form>   

<div class="attention_area">
<p class="attention_tit">유의사항</p>
<div class="attention_list">
    • 장바구니에 담긴 상품은 30일간 보관됩니다.(장기간 보관을 원하실 경우 관심상품으로 등록(180일간 저장)하여 이용하시길 바랍니다.)<br>
• 환율 변경 시점과 적립금의 사용조건에 따라 장바구니의 예상결제금액과 최종결제금액은 상이할 수 있습니다.<br>
• 실제 할인금액은 개인별로 보유하신 적립금에 따라 차이가 있을 수 있습니다.<br>
• 장바구니에 보관된 상품은 재고품절 및 할인율, 사은품이 수시로 변경될 수 있습니다.<br>
• 주문 전 기내반입제한 안내를 확인하시기 바랍니다.<br>
• 상품별로 한 주문번호당 주문 가능 수량이 제한될 수 있습니다.<br>
• 세트상품은 함께 사면 할인 혜택을 받을 수 있는 상품이며, 주문 후 매장에 따라 교환권이 각기 다르게 발급될 수 있습니다.
</div>
</div>          
<div id="changeSetGoosQtyList"></div>
</div>
<div class="cont_left" id="TAB" style="display: none;"></div>
<script type="text/javascript">

function goCartTab(type) {
    
	var url = "";
	console.log("carttab");
    if(!psptMnge()){return false;} 
    if(!dpatMnge()){return false;} 

    $("#tabCart, #tabPspt, #tabDpat").removeClass("on");
    $("#TAB , #CART , .pay_btm").hide();
    
    if(type == "CART"){
    	location.href="/cart/cartlist?mid=${member.mid}";
    }else if(type == "PSPT"){
    	location.href="/order/PassportInfo";
    }else if(type == "DPAT"){
    	location.href="/order/DepartureInfo";

    }

}

</script>

<input type="hidden" id="oldPsptNo" value="">
<input type="hidden" id="oldMbshEngLstnm" value="">
<input type="hidden" id="oldMbshEngFstnm" value="">
<input type="hidden" id="mbshPsptInfo" value="0">
<input type="hidden" id="oldPsptExpiDt" value="">
<!-- <div class="passport_wrap">
<a href="javascript:void(0);" class="tit_guide has_onoff" id="guidePspt" onclick="guidePspt();">여권정보 등록가이드</a>
<div class="guide_wrap">
<div class="guide_cont">
    <div class="guide_img"><img src="https://cdn.hddfs.com/front/images/KO/temp/passport_img.png" alt="여권정보 입력안내"></div>
    <div class="guide_info">
        <dl>
            <dt>내국인 여권번호 유형</dt>
            <dd>
            영문 1자리 + 숫자 8자리 예) M 01234567<br>영문 2자리 + 숫자 7자리 예) JR 123467<br>숫자 7자리 예) M01234567<br>관용여권 : S숫자 7자리 예) S 1234567
            </dd>
        </dl>
        <dl>
            <dt>외국인 여권번호 유형</dt>
            <dd>국적이 일본일 때는 9자리까지 허용 그 외 16자리까지 허용</dd>
        </dl>
        <dl>
            <dt>영문 성명</dt>
            <dd>'-' 제외하고 붙여서 기입하셔야 합니다. 성(Last Name), 이름(First Name)순으로 입력하시기 바랍니다. 예) HONG GILDONG / 홍 길동</dd>
        </dl>
        <dl>
            <dt>여권 만료일</dt>
            <dd>기간이 만료된 구 여권의 경우 상품인도를 하시지 못할 수 있으니 신규 발급받으신 여권으로 입력하셔야 합니다.</dd>
        </dl>
        <dl>
            <dt>오프라인 매장 이용</dt>
            <dd>여권번호 미입력시 오프라인 매장에서 구매가 불가하오니 오프라인 이용을 원하시는 고객님은 여권번호를 입력해주시기 바랍니다.</dd>
        </dl>
    </div>
</div>
</div>
<form id="frmMbshPsptMnge" name="frmMbshPsptMnge" method="post" action="">
<input type="hidden" id="checkedCartSeq" value="">
<input type="hidden" id="checkedCartSetId" value="">
<input type="hidden" id="minBymdDt" value="20090112">
<div class="form_wrap">
    <ul class="form_lsit">
        <li>
            <p class="f_ti">한글성명</p>
            <span class="input_de"><input type="text" name="ordrrNm" placeholder="성명을 입력해주세요" disabled="disabled" value="김민규"></span>
                </li>
        <li>
            <p class="f_ti">성별</p>
            <span class="input_de"><input type="text" placeholder="남" disabled=""></span>
                    </li>
        <li>
            <p class="f_ti">생년월일</p>
            <span class="input_de"><input type="text" name="bymdDt" id="bymdDt" disabled="disabled" value="1997-01-16"></span>
                </li>
        <li>
            <p class="f_ti">국적</p>
            <span class="input_de"><input type="text" disabled="disabled" value="한국"></span>
                </li>
        <li>
            <p class="f_ti ico_compulsory">Last Name 성</p>
            <span class="input_de">
                <input type="text" id="mbshEngLstnm" name="mbshEngLstnm" class="input_passport" onkeypress="javascript:noSpaceEvnt(event);" value="" placeholder="영문 성을 공백없이 입력해주세요">
                    </span>
        </li>
        <li>
            <p class="f_ti ico_compulsory"> First Name 이름</p>
            <span class="input_de">
                <input type="text" id="mbshEngFstnm" name="mbshEngFstnm" class="input_passport" onkeypress="javascript:noSpaceEvnt(event);" value="" placeholder="영문 이름을 공백없이 입력해주세요">
                    </span>
        </li>
        <li>
            <p class="f_ti ico_compulsory">여권번호</p>
            <span class="input_de">
            <input type="text" id="psptNo" name="psptNo" class="input_passport" onkeypress="javascript:noSpaceEvnt(event);" value="" placeholder="여권번호를 입력해주세요">
                </span>
        </li>
        <li>
            <p class="f_ti ico_compulsory">여권기간만료일</p>
            <span class="input_de datepicker_box">
                <input type="hidden" id="pridRmn" value="">
                <input type="text" name="psptExpiDt" id="psptExpiDt" class="datepicker input_passport hasDatepicker" onkeyup="isNumber(this);" placeholder="YYYY-MM-DD" value=""><button type="button" class="ui-datepicker-trigger"><img src="https://cdn.hddfs.com/front/images/KO/common/ic_calendar.png" alt="..." title="..."></button>
                    </span>
            <div class="form_txt_comment"></div>
        </li>
        </ul>
    
    
        <div class="nomem_terms">
            <ul class="terms_chk">
                <li class="uniq_sub_option">
                        <span class="chk">
                            <input type="checkbox" name="" class="ch_term uniqeChk" id="ch_term03" onclick="uniqAgree()">
                            <label for="ch_term03">[필수] 고유식별정보 수집/이용 동의</label>
                        </span>
                        <a href="javascript:void(0);" class="ck_arrow" onclick="showUnqIdtInfoTermsPop('open')">약관보기</a>
                    </li>
                </ul>
        </div>                          
    
    <div class="btn_area">
        <a href="javascript:void(0);" class="btnxl_type type2" id="btnInptMbshPwdPop" onclick="inptMbshPwdPop();">저장</a>
            </div>
</div>
</form>
<div class="attention_area">
    <p class="attention_tit">유의사항</p>
    <ul class="attention_list">
       • 주문 완료한 주문건의 여권정보 변경은 이 페이지에서 변경되지 않으므로, 변경을 원하시면 출국 3일전까지 고객센터로 문의 부탁드립니다.<br>
• 여권 영문 성명에서 First Name은 붙여서 입력해주셔야 합니다.<br>
• 주문서에 기재된 여권번호와 상품 인도 시 제시한 여권번호가 일치한 경우에만 상품 인도가 가능합니다.<br>
• 유효기간이 만료되거나 유효기간이 6개월 미만으로 남은 여권으로 구매하신&nbsp;경우 상품 인도가 불가합니다.
    </ul>
</div>
</div> -->

<div id="mbshPwdPop"></div>
<div id="layer_popup" class="pop_quantity" title="SMS 인증"></div>  
<div id="popTcndCont" class="pop_tcndCont" title=""></div>


<script type="text/javascript">
$(document).ready(function(){
$(".loadProgBar").css("display","none");


$(".item_area").each(function(index,item){
	let pstock = parseInt($(this).find("input[name='pstock']").val());
	let cartstock=parseInt($(this).find("input[name='goosQty']").val());
	console.log(pstock);
	if(pstock-cartstock<0){
		console.log("작다.")
		$("#plusGoosQty0").attr("disabled",true);
	}else{
		$("#plusGoosQty0").removeAttr("disabled"); 
	}
	
	if(cartstock==1){
		console.log("1이다");
		$(this).find("input[id='minGoosQty0']").attr("disabled",true);
	}else{
		$("#minGoosQty0").removeAttr("disabled"); 
	}
	console.log('네에');
});


setOrderPrice();

	  $("#cartCd").change(function(){
	    // Value값 가져오기
	    var val = $("#cartCd :selected").val();
	    if(val=='001'){
	    	location.href="/cart/cartlist?mid=${member.mid}&align=늦게담은순";
	    }else if(val =='002'){
	    	location.href="/cart/cartlist?mid=${member.mid}&align=먼저담은순";
	    }else if(val == '003'){
	    	location.href="/cart/cartlist?mid=${member.mid}&align=높은금액순";
	    }else if(val=='004'){
	    	location.href="/cart/cartlist?mid=${member.mid}&align=낮은금액순";
	    }else{
	    	location.href="/cart/cartlist?mid=${member.mid}&align=브랜드순(ABC)";
	    }

	  });

});
</script>
<script>

var passportconsist;

//장바구니 수량 1 늘이기
function fn_qtyAdd(el){
	
	let cartstock=parseInt($(el).closest(".num_amount.cart_amount").find("input[name='goosQty']").val());
	let pcode=$(el).closest(".item_area").find("input[name='pcode']").val();
	cartstock++;
	$(el).closest(".num_amount.cart_amount").find("input[name='goosQty']").val(cartstock);
	updateCart(1,pcode);
	location.href="/cart/cartlist?mid=${member.mid}&align=${align}";
}

//장바구니 수량 1 줄이기
function fn_qtySubtraction(el){
	
	let cartstock=parseInt($(el).closest(".num_amount.cart_amount").find("input[name='goosQty']").val());
	let pcode=$(el).closest(".item_area").find("input[name='pcode']").val();
	cartstock--;
	$(el).closest(".num_amount.cart_amount").find("input[name='goosQty']").val(cartstock);
	updateCart(-1,pcode);
	location.href="/cart/cartlist?mid=${member.mid}&align=${align}";
}

//장바구니 수량 변경
function updateCart(cartstock,pcode){
	
	console.log("카트 들어감!")
	const Data = {
			cartstock :cartstock,
			mid : "${member.mid}",
			pcode : pcode
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

//장바구니 상품 삭제
function deleteCart(el){
	console.log("삭제");
	let cartno=parseInt($(el).closest(".item_area").find("input[name='cartno']").val());
	var Data={
			cartno :cartno,
			mid :"${member.mid}"
	}
	$.ajax({
		type :"POST",
	    data : Data,
	    url : "/cart/deleteCart",
	    success : function(data){
			console.log('담기 성공!')	
			location.reload();
		},
		error : function(){
			console.log("실패");
		}
	});
}
//시작할 때 주문 가격 및 합계 구하기
function setOrderPrice(){
	
	
	let cartpricetotal = 0; 
	let cartdispricetotal = 0;
	let cartdistotal = 0;
	let cartcounttotal=0;
	$(".item_area").each(function(index,item){
		const cartprice=parseFloat($(this).find("input[name='cartprice']").val());
		const cartdisprice=parseFloat($(this).find("input[name='cartdisprice']").val());
		const cartdis=parseFloat($(this).find("input[name='cartdis']").val());
		const cartcount=parseInt($(this).find("input[name='goosQty']").val());
		cartpricetotal+=cartprice;
		cartdispricetotal+=cartdisprice;
		cartdistotal+=cartdis;
		cartcounttotal+=cartcount;
	});
	$(".totalGoosUsd").text("$"+priceComma(cartpricetotal.toFixed(2)));
	$(".totalGoosKrw").text(priceComma((cartpricetotal*1267).toFixed(0))+"원");
	$(".sale.totalDcUsd").text("$"+priceComma(cartdistotal.toFixed(2)));
	$(".sale.totalDcKrw").text(priceComma((cartdistotal*1267).toFixed(0))+"원");
	$(".sumGoosQty").text(cartcounttotal);
	$(".payTotalSettUsd").text("$"+priceComma((cartpricetotal-cartdistotal).toFixed(2)));
	$(".payTotalSettKrw").text(priceComma(((cartpricetotal*1267)-(cartdistotal*1267)).toFixed(0))+"원");
}

function priceComma(price) {
	return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

function OrderSingle(el){
	let passportflag=false;
	let cartstock=parseInt($(el).closest(".item_area").find("input[name='cartstock']").val());
	let pcode=$(el).closest(".item_area").find("input[name='pcode']").val();
	$('#Orderexec').append('<input name="orderitem[0].pcode" type="hidden" value="'+pcode+'">');
	$('#Orderexec').append('<input name="orderitem[0].oamount" type="hidden" value="'+cartstock+'">');
	$('#Orderexec').append('<input name="orderitem[0].oid" type="hidden" value="">');
	console.log("${member.mid}");
	console.log("${userpassport}");
	if("${userpassport}"== ""){
		passportflag=false;
	}else{
		passportflag=true;
	}
	
	 if(passportflag==true){
		$("#Orderexec").attr("action","/order/goDepartureInfo");
		$("#Orderexec").submit();
		
	}else{
		$("#Orderexec").attr("action","/order/PassportInfo");
		$("#Orderexec").submit();
	}
	 
}

var orderproductlist=[];

//상품에 대한 정보가 있는 태그를 반복하고 각각 상품에 대한 정보를 map으로 담는다.

	function AllItemOrder(){
		let itemindex = 0;
		$(".item_area").each(function(index, item){
				var cartstock=parseInt($(this).find("input[name='cartstock']").val());
				var pcode=$(this).find("input[name='pcode']").val();
				$('#Orderexec').append('<input name="orderitem['+itemindex+'].pcode" type="hidden" value="'+pcode+'">');
				$('#Orderexec').append('<input name="orderitem['+itemindex+'].oamount" type="hidden" value="'+cartstock+'">');
				itemindex ++;
		});
		
		/* $('#itemsOrderForm').append('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>');
		$('#itemsOrderForm').append('<input type="hidden" name="tocart" value="true" />'); */
		if("${userpassport}"==null){
			passportflag=false;
		}else{
			passportflag=true;
		}
		if(passportflag==true){
			$("#Orderexec").attr("action","/order/goDepartureInfo");
			$("#Orderexec").submit();
			
		}else{
			$("#Orderexec").attr("action","/order/PassportInfo");
			$("#Orderexec").submit();
		}

	}
	

</script>
<div class="cont_right" style="height: 415.333px;">
   <div class="pay_table">
           <div class="pay_tit">예상주문금액</div>
           <div class="pay_list">
               <dl>
                   <dt>주문금액합계</dt> 
                   <dd>
                       <strong class="totalGoosUsd">$</strong>
                       <span class="totalGoosKrw">원</span>
                   </dd>
               </dl>
               <dl>
                   <dt>예상할인금액</dt>
                   <dd>
                       <strong class="sale totalDcUsd">$</strong>
                       <span class="sale totalDcKrw">원</span>
                   </dd>
               </dl>
               <dl id="totalRsvgDcKrwDl" style="">
                         <dt>적립금</dt>
                         <dd>
                             <strong class="totalRsvgDcKrw">0원</strong>
                             <span class="totalRsvg">0.0%</span>
                         </dd>
                     </dl>
                   <input type="hidden" id="totalDcUsd" value="44.400001525878906">
                                <input type="hidden" id="totalDcKrw" value="55092">
                                <input type="hidden" id="totalSetGoosDcKrw" value="">
                                <input type="hidden" id="sumFinaPmptDcCupDcAmt" value="">
                                <input type="hidden" id="totalInetMbshGoosDcKrw" value="">
                                <input type="hidden" id="totalGoosUsd" value="148">
                                <input type="hidden" id="totalGoosKrw" value="183638">
                                
                                <input type="hidden" id="totalRsvgDcKrw" value="0">
                                <input type="hidden" id="totalHpoinRsvgAmt" value="257">
                                <input type="hidden" id="hpoinRsvgRate" value="">
                                <input type="hidden" id="totalSimpRsvgAmt" value="0">
                                <input type="hidden" id="simpRsvgRate" value="">
                               
                                <input type="hidden" id="totalExptSettAmtUsd" value="103.5999984741211">  <input type="hidden" id="totalExptSettAmtKrw" value="128546">  <input type="hidden" id="totalExptSettGoosQty" value="1">  <input type="hidden" id="notTotalExptSettAmtUsd" value="0"> <input type="hidden" id="notTotalExptSettAmtKrw" value="0">  <input type="hidden" id="notTotalExptSettGoosQty" value="0">  <input type="hidden" id="oldsumGoosQty" value="1">
                                 <input type="hidden" id="sumGoosQty" value="1">
                                 <input type="hidden" id="totalSettUsd" value="103.5999984741211">
                                 <input type="hidden" id="totalSettKrw" value="128546">
                            <dl class="total_pay">
                   <dt>총 <strong class="sumGoosQty">1</strong>개</dt>
                   <dd>
                       <strong class="payTotalSettUsd">$</strong>
                       <span class="payTotalSettKrw">원</span>
                   </dd>
               </dl>
           </div>
           <div class="pay_btm" style="display: block;">
              <div class="pay_check">
                  <span class="chk">
                      <input type="checkbox" id="rost_cart_chk1" onchange="setRostUSettAmt();">
                      <label for="rost_cart_chk1">품절포함</label>
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
                          <button class="btnxl_type1 btnico btn_view_rv" onclick="maxDcAmtInfo();" disabled="disabled"><em class="ico_sale">적림금 혜택 엿보기 </em>
                                    <div class="info_reserve">적립금 혜택 엿보기</div><!--//2022-04-19 추가-->
                                   </button>
                                  <div class="tooltip" id="maxSvmtInfoPop" style="display: none;">
                                      <p class="ti">적립금 혜택 엿보기</p>
                                      <ul class="dl_price"></ul>
                                      <button class="close" onclick="closeMaxDcPrc();">닫기</button>
                                  </div>
                              </div>                            
                    <a href="javascript:void(0);" class="btnxl_type1" onclick="AllItemOrder();">주문하기</a>
              </div>
           </div>
       </div>
</div> 
</div> 
      
</section>
<div class="totop" style="display: none;"><a href="#none">처음으로 이동</a></div></article>


<div id="changeSetGoosQtyList"></div>  <div id="layer_unit_pspt" class="layer_unit pop_o1" title="여권 정보 안내"></div>
<div id="layer_unit_dpat" class="layer_unit pop_o1" title="출국 정보 안내"></div>

</main>
<%@ include file="/WEB-INF/views/common/Footer.jsp"%>