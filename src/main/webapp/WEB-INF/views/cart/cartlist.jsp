<!-- 장바구니 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/Header.jsp"%>
<main id="container" class="">
    <script type="text/javascript">
deleteCookie("ADULT_GOOSCD");
deleteCookie("ADULT_QTY");
deleteCookie("ADULT_SETID");
deleteCookie("ADULT_BUYNOW");
deleteCookie("ADULT_TYPE");
</script>

<script type="text/javascript">
var first = 0;
var isLogin = true;

$(document).ready(function(){

});

</script>

<form id="selfReplace" action="https://www.hddfs.com/shop/or/order/listCart.do" method="post">
<input id="selfReplaceCartCd" type="hidden" name="cartCd" value="">
<input id="selfReplaceScrollMove" type="hidden" name="scrollMove" value="">
</form>

<article id="content">
<section class="cart_wrap">
<input type="hidden" id="checkedCartSeq" value=""> <input type="hidden" id="checkedCartSetId" value=""> <input type="hidden" id="buyNow" value=""><input type="hidden" id="buyNowSetGoosId" value=""><input type="hidden" id="chkPspt" value="0"> <input type="hidden" id="chkDpat" value="0"> <input type="hidden" id="buyNowType" value=""> <input type="hidden" id="buyNowOnlnGoosCdList" value=""> <input type="hidden" id="adtAucaYn" value="N"> <ul class="title_tab">
<li><a href="/cart/cartlist?mid=jjjj" onclick='javascript:goCartTab("CART");' class="on" id="tabCart">장바구니</a></li>
<li><a href="" onclick='javascript:goCartTab("PSPT");' class="" id="tabPspt">여권정보</a></li>
<li><a href="" onclick='javascript:goCartTab("DPAT");' class="" id="tabDpat">출국정보</a></li>
<li>주문결제</li>
</ul>
<div class="cart_contens">
<div class="cont_left" id="CART" style="display: block;">
   <script>
$(document).ready(function(){
groobeeListCart();
});

function groobeeListCart() {
var groobeeGoods = [];
var cateNm = cateLNm = cateMNm = cateSNm = cateDNm = "";
var cat = catL = catM = catS = catD = "";
var name = code = amt = prc = salePrc = cnt = brand = brandNm = "";
var ctgPath = new Array();
var pathLen = '3';
var path0 = path1 = path2 = "";



if("00" == '02'){
    cat = "00010102";
    catL = "0001";
    catM = "000101";
    catS = "00010102";
    catD = "00010102";
    cateNm = "";
    cateLNm = "스킨케어";
    cateMNm = "기초케어";
    cateSNm = "에센스";
    cateDNm = "";
}else{
    cat = "00010102";
    catL = "0001";
    catM = "000101";
    catS = "00010102";
    catD = "";
    cateNm = "에센스";
    cateLNm = "스킨케어";
    cateMNm = "기초케어";
    cateSNm = "에센스";
    cateDNm = "";
 }
    
    name = "키엘 클리어리 코렉티브 다크 스팟 솔루션 115ML";
    code = "10073250016301";
    amt = "128546";
    prc = 183638;
    salePrc = 128546;
    cnt = "1";
    brand = "007301";
    brandNm = "키엘 ";

    var groobeeItem = {
            name: name,
            code: code,
            amt: amt,
            prc: prc,
            salePrc: salePrc,
            cnt: cnt,
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
    };
    
    groobeeGoods.push(groobeeItem);
    
  

if("00" == '02'){
    cat = "00010201";
    catL = "0001";
    catM = "000102";
    catS = "00010201";
    catD = "00010201";
    cateNm = "";
    cateLNm = "스킨케어";
    cateMNm = "선케어";
    cateSNm = "선크림/선젤";
    cateDNm = "";
}else{
    cat = "00010201";
    catL = "0001";
    catM = "000102";
    catS = "00010201";
    catD = "";
    cateNm = "선크림/선젤";
    cateLNm = "스킨케어";
    cateMNm = "선케어";
    cateSNm = "선크림/선젤";
    cateDNm = "";
 }
    
    name = "키엘 울트라 라이트 데일리 유브이 디팬스 썬스크린,키엘 선크림";
    code = "10073250002901";
    amt = "36479";
    prc = 52113;
    salePrc = 36479;
    cnt = "1";
    brand = "007301";
    brandNm = "키엘 ";

    var groobeeItem = {
            name: name,
            code: code,
            amt: amt,
            prc: prc,
            salePrc: salePrc,
            cnt: cnt,
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
    };
    
    groobeeGoods.push(groobeeItem);
    
  

if("00" == '02'){
    cat = "00130202";
    catL = "0013";
    catM = "001302";
    catS = "00130202";
    catD = "00130202";
    cateNm = "";
    cateLNm = "스포츠/레저";
    cateMNm = "골프";
    cateSNm = "골프웨어";
    cateDNm = "";
}else{
    cat = "00130202";
    catL = "0013";
    catM = "001302";
    catS = "00130202";
    catD = "";
    cateNm = "골프웨어";
    cateLNm = "스포츠/레저";
    cateMNm = "골프";
    cateSNm = "골프웨어";
    cateDNm = "";
 }
    
    name = "지포어 우먼 엠지포엑스투 골프 크로스 트레이너 WHITE  6.5 ";
    code = "10677190000801";
    amt = "277939";
    prc = 397056;
    salePrc = 277939;
    cnt = "1";
    brand = "067701";
    brandNm = "지포어";

    var groobeeItem = {
            name: name,
            code: code,
            amt: amt,
            prc: prc,
            salePrc: salePrc,
            cnt: cnt,
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
    };
    
    groobeeGoods.push(groobeeItem);
    
  
  
  groobee("VC", {goods : groobeeGoods});

}

</script>

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
    <select name="cartCd" onchange="listCartAlin(this)" id="cartCd">
<option value="001" selected="selected">늦게담은순</option>
<option value="002">먼저담은순</option>
<option value="003">높은금액순</option>
<option value="004">낮은금액순</option>
<option value="005">브랜드순(ABC)</option>
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
        <c:forEach var="cart" items="${cartlist}">
			<input type="hidden" id="spordYn0" name="spordYn" value="N">
        	<input type="hidden" id="hshareYn0" name="hshareYn" value="N">
        	<input type="hidden" id="goosUsd0" value="148.0">
        	<input type="hidden" id="goosKrw0" value="183638">
        	<input type="hidden" id="DcUsd0" value="44.400001525878906">
        	<input type="hidden" id="DcKrw0" value="55092">
       		<input type="hidden" id="settUsd0" value="103.5999984741211">
        	<input type="hidden" id="settKrw0" value="128546">
        	<input type="hidden" id="goosQty0" value="1">
        	<input type="hidden" id="goosKind0" value="1">
        	<input type="hidden" id="pmptDcCupDcAmt0" value="0.0">
        	<input type="hidden" id="finaPmptDcCupDcAmt0" value="0"> <input type="hidden" id="rsvgDcKrw0" value="0">        <input type="hidden" id="hpoinRsvgAmt0" value="257.0">    <input type="hidden" id="hpoinRsvgRate0" value="0.2">  <input type="hidden" id="simpRsvgAmt0" value="0.0">      <input type="hidden" id="simpRsvgRate0" value="0.0">    <input type="hidden" id="oldGoosSeq0" value="">  
        	<input type="hidden" id="orderMinQty0" value="1">
        		<div class="item_area">
        		<input type="hidden" name="cartprice" value="${cart.pprice*cart.cartstock}">
        		<input type="hidden" name="cartdisprice" value="${cart.pprice*(1-(cart.pdiscount/100))*cart.cartstock}">
        		<input type="hidden" name="cartdis" value="${cart.pprice*(cart.pdiscount/100)*cart.cartstock}">
        		<input type="hidden" name="cartstock" value="${cart.cartstock }">
        		<input type="hidden" name="pcode" value="${cart.pcode }"/>
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
                                    https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10073250016301
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
                                <button type="button" class="btnde_type1 large" onclick="Order(439727524);"><span class="font_14b">바로구매</span></button> 
                            </div>
                        </div>                                     
                    </div>                              
                </div>
            <hr class="hr_part">
                <!-- <input type="hidden" value="N" name="spordYn">
        <input type="hidden" value="N" name="hshareYn">
        <input type="hidden" id="stokQty1" value="0">
        <input type="hidden" id="goosUsd1" value="42.0">
        <input type="hidden" id="goosKrw1" value="52113">
        <input type="hidden" id="DcUsd1" value="12.600000381469727">
        <input type="hidden" id="settUsd1" value="29.399999618530273">
        <input type="hidden" id="settKrw1" value="36479">
        <input type="hidden" id="soldoutGoosQty1" value="1">
        <input type="hidden" id="goosKind1" value="1">
        <input type="hidden" id="pmptDcCupDcAmt1" value="0.0">
        <input type="hidden" id="finaPmptDcCupDcAmt1" value="0">                        
        <input type="hidden" id="rsvgDcKrw1" value="0"> <input type="hidden" id="hpoinRsvgAmt1" value="73.0"> <input type="hidden" id="hpoinRsvgRate1" value="0.2">    <input type="hidden" id="simpRsvgAmt1" value="73.0"> <input type="hidden" id="simpRsvgRate1" value="0.0">    <input type="hidden" id="oldGoosSeq1" value="">  
        <input type="hidden" id="orderMinQty1" value="1">             
        <input type="hidden" id="inetMbshGoosDcKrw1" value="15634">
        <input type="hidden" id="setGoosDcKrw1" value="0"> -->
        </c:forEach> 
        </div>
      </c:when>
       </c:choose>              
    

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

$(window).scrollTop(0);
var nmbshSmsAucaYn = false;
var isLogin = true;

$(document).ready(function(){

if(isLogin){
if($("#mbshPsptInfo").val() > 0){
    $("#chkPspt").val(1);
}
}else{
if($("#nmbshPsptInfo").val() > 0){
    $("#chkPspt").val(1);
}
}


$('#mailAddrCd').change(function() {
if($(this).val() == '') {
    return ;
}
var vTxt = ($(this).val() != '999') ? $(this).find('option:selected').text() : '';
$('#mailAddr2').val(vTxt);
});    


$("#ch_term00").change(function(){
$(".ch_term").prop("checked", $(this).prop("checked"));
uniqAgree();
});


$("#unqIdtInfoTermsPop").dialog({
autoOpen: false,
resizable: false,
dialogClass:"pop_type1",
width:804,
minHeight: 120,
maxHeight: 620,
modal: true
});


$("#psptExpiDt, #bymdDt").keyup(function() {
$(this).val(fnAutoHypenBymd($(this).val())); 
});


$('#psptNo, #mbshEngLstnm, #mbshEngFstnm').blur(function() {
$(this).val($(this).val().toUpperCase());
});


$("#psptExpiDt").datepicker({
showOn: "button",
buttonImage: "https://cdn.hddfs.com/front/images/KO/common/ic_calendar.png",
//buttonImageOnly: true,
dateFormat: "yy-mm-dd",
changeYear: true,
changeMonth: true,
showOtherMonths: true,
monthNamesShort: [ "1","2","3","4","5","6","7","8","9","10","11","12" ],
dayNamesMin: [ "","","","","","","" ],
yearRange: "+0:+30",
minDate: 0,
onSelect: function(d) {
    
    var cholDate = new Date(d);
      
    $.ajax({
        url: ctx_shop + '/or/order/mbshPsptMnge.json',
        method: "post",
        data: {cholDate : cholDate},
        async: true,
        dataType : 'json',
        success : function(data, textStatus, jqXHR) {
            
             var vInfo = data.info;
             $('.form_txt_comment').text(vInfo.day);
             $('.ui-widget-overlay.ui-front').remove();
             $('#pridRmn').val(vInfo.pridRmn);
             
        },
        error : function(jqXHR, textStatus, errorThrown) {
            alert('처리중 오류가 발생하였습니다.'); 
        }
    });
    
    $('.ui-widget-overlay.ui-front').remove();
},
onClose: function() {
    $('.ui-widget-overlay.ui-front').remove();
}
});

dayNamesMin: [ "S","M","T","W","T","F","S" ],

console.log(Date());
var d = new Date();

if(isLogin === false ){

$('#bymdDt').datepicker({
    showOn: "button",
    buttonImage: "https://cdn.hddfs.com/front/images/KO/common/ic_calendar.png",
    //buttonImageOnly: true,
    dateFormat: "yy-mm-dd",
    changeYear: true,
    changeMonth: true,
    showOtherMonths: true,
    monthNamesShort: [ "1","2","3","4","5","6","7","8","9","10","11","12" ],
    dayNamesMin: [ "","","","","","","" ],
    onSelect: function() {
        $('.ui-widget-overlay.ui-front').remove();
    },
    onClose: function() {
        $('.ui-widget-overlay.ui-front').remove();
    },
    yearRange : '1900:-14',
    defaultDate: new Date('1980', d.getMonth(), d.getDate())
}); 
}
});


function guidePspt(){
if($("#guidePspt").hasClass("on")){
   $("#guidePspt").removeClass("on");
}else{
  $("#guidePspt").addClass("on");
}
}


function openInfoAggr(mbshJoinTcndCd){

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/popTcndCont.json',
    method: "post",
    data: {mbshJoinTcndCd : mbshJoinTcndCd},
    async: false,
    dataType : 'html',
    success : function(data, textStatus, jqXHR) {
        $("#popTcndCont").html(data);
        $("div[aria-describedby='popTcndCont'] .ui-dialog-title").text($("#popTitle").val());
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
});
}



function inptMbshPwdPop(){

if (!checkVali()) {
    return;
}
$(".ui-dialog").not('.pop_type1').remove(); // 여권번호 수집동의 팝업 제외


var natiCd = $('#natiCd').val();
if(isLogin){
    natiCd = 'KOR';
}

if(!validationDataForPassport(natiCd)){
    if(!confirm($('#psptNo').val()+' 입력하신 여권번호로 주문을 진행하시겠습니까?\n국가별 여권번호 규칙과 다른 여권번호 입력시 주문하신 상품을 인도받지 못하실 수 있습니다.\n자세한 사항은 고객센터>FAQ를 참조해 주세요.')) return; // 입력하신 여권번호 $('#psptNo').val()를 저장하시겠습니까?
}


$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/inptMbshPwd.json',
    method: "post",
    data: {type : 'pspt'},
    async: false,
    dataType : 'html',
    success : function(data, textStatus, jqXHR) {
        $("#mbshPwdPop").html(data);
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
});
}


function btnConfirmPwd(){

if(isEmpty($('#mbshPwd').val())){
    $("#pwdErrormsg").text('비밀번호를 입력해주세요.');  
    $("#pwdErrormsg").show();
    $("#pwdSpan").addClass("error");
    return;
}

$.ajax({
    url: ctx_shop + '/or/order/chkMbshPwd.json',
    method: 'post',
    data: {mbshPwd : $('#mbshPwd').val()},
    async: true,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        var vResultCode = data.resultCode;
        var vMessage = data.message;
        var vInfo = data.info;
        
        if(vResultCode === 1){
            $("#pwdErrormsg").hide();
            $("#pwdSpan").removeClass("error");
            $(".pop_quantity_pwd").dialog("close");
            savPsptInfo();
         
        } else {
            $("#pwdErrormsg").text('비밀번호를 확인해주세요.');  
            $("#pwdErrormsg").show();
            $("#pwdSpan").addClass("error");
        }
    },
    error : function(jqXHR, textStatus, errorThrown) {
        $("#pwdErrormsg").text('비밀번호를 확인해주세요.');  
        $("#pwdErrormsg").show();
        $("#pwdSpan").addClass("error");
    }
});  
}

/* function savPsptInfo() {

var psptUrl = "";

if (!checkVali()) {
    return;
}

if(isLogin){
    psptUrl = ctx_shop + '/or/order/updateMbshPsptMnge.json'
}else{
    psptUrl = ctx_shop + '/or/order/saveNmbshPsptMnge.json'
}

$.ajax({
    url: psptUrl,
    method: 'post',
    data: $('#frmMbshPsptMnge').serialize(),
    async: false,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        
        var vResultCode = data.resultCode;
        var vMessage = data.message;
        var vInfo = data.info;
        
        if(vResultCode === 10 || vResultCode === 1){
            
            $("#chkPspt").val(0);
            
            if(isLogin){
                if(vResultCode === 1){
                     alert(vInfo.day); 
                }else{
                    alert(vMessage);
                }
            }else{
                if(vResultCode === 10){
                    alert(vMessage);
                }else {
                    alert('저장되었습니다.'); 
                }
            }   
            
            if(data.info.cartUrl !== "ORDER"){
                if(data.info.cartUrl === 'EXPI'){
                    getPsptExpl();
                }else{
                   goCartTab(data.info.cartUrl); 
                }
            }else if(data.info.cartUrl === 'ORDER'){
                getDpatExpl();                     
            } 
            
       }else{
           alert(data.message);
       } 
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
});
} */

function goCartTab(type) {
    
	var url = "";
	console.log("carttab");
    if(!psptMnge()){return false;} 
    if(!dpatMnge()){return false;} 

    $("#tabCart, #tabPspt, #tabDpat").removeClass("on");
    $("#TAB , #CART , .pay_btm").hide();
    
    if(type == "CART"){
    	location.href="/cart/cartlist?mid=jjjj";
        /* $(".pay_btm").show();
        $("#CART").show();
        $("#tabCart").addClass("on"); */
    }else if(type == "PSPT"){
    	location.href="/order/PassportInfo";
        /* $("#TAB").show();
        $("#tabPspt").addClass("on");
        url = "https://www.hddfs.com/shop/or/order/mbshPsptMnge.do"; */
    }else if(type == "DPAT"){
    	location.href="/order/DepartureInfo";
       /*  $("#TAB").show();
        $("#tabDpat").addClass("on");
        url = "https://www.hddfs.com/shop/or/order/addMbshDpatInfo.do"; */
    }
    
/*     if(type !== "CART"){
        $(".loadProgBar").css("display","block");
        $("#TAB").load(url);
    } */
}

function psptMnge(){
    var rsult = true; 
    var confirmMsg = "";
    
    if($("#chkPspt").val() > 0 ){
       
       var psptNo = $("#psptNo").val(); 
       var psptExpiDt = $("#psptExpiDt").val();
       var mbshEngLstnm = $("#mbshEngLstnm").val(); 
       var mbshEngFstnm = $("#mbshEngFstnm").val(); 
       
       if(isLogin){
           
           if($("#mbshPsptInfo").val() > 0){
               
               var oldPsptNo  = $("#oldPsptNo").val();
               var oldPsptExpiDt  = $("#oldPsptExpiDt").val();
           	var oldMbshEngLstnm  = $("#oldMbshEngLstnm").val();
               var oldMbshEngFstnm  = $("#oldMbshEngFstnm").val();
               
               if(mbshEngLstnm != oldMbshEngLstnm){
                   rsult = false;
               }else if(mbshEngFstnm != oldMbshEngFstnm){
                   rsult = false;
               }else if(psptNo != oldPsptNo){
                   rsult = false;
               }else if(psptExpiDt != oldPsptExpiDt){
                   rsult = false;
               }
               
               if(!rsult){
                   confirmMsg += '저장되지 않은 여권정보가 있습니다. 이동하시겠습니까?'; 
                   if (!confirm(confirmMsg)) {
                       $("#chkPspt").val(1);
                       rsult = false;
                   }else{
                       $("#chkPspt").val(0);
                       rsult = true;
                   }
               }
           }
           if(rsult){
               $("#chkPspt").val(0);
           }
           return rsult;       
       
       }else{
           
           if($("#nmbshPsptInfo").val() > 0){
           	
               var oldSexCd = $("#oldSexCd").val(); 
               var oldBymdDt = $("#oldBymdDt").val(); 
               var oldNatiCd = $("#oldNatiCd").val(); 
               var oldPsptNo = $("#oldPsptNo").val(); 
               var oldOrdrrNm = $("#oldOrdrrNm").val(); 
               var oldPsptExpiDt = $("#oldPsptExpiDt").val();
               var oldMbshEngLstnm = $("#oldMbshEngLstnm").val(); 
               var oldMbshEngFstnm = $("#oldMbshEngFstnm").val(); 
               
               var sexCd = $("#sexCd").val(); 
               var bymdDt = $("#bymdDt").val(); 
               var natiCd = $("#natiCd").val(); 
               var ordrrNm = $("#ordrrNm").val(); 
               
               if(ordrrNm  != oldOrdrrNm){
                   rsult = false;
               }else if(sexCd != oldSexCd){
                   rsult = false;
               }else if(bymdDt != oldBymdDt ){
                   rsult = false;
               }else if(natiCd != oldNatiCd){
                   rsult = false;
               }else if(mbshEngLstnm != oldMbshEngLstnm){
                   rsult = false;
               }else if(mbshEngFstnm != oldMbshEngFstnm){
                   rsult = false;
               }else if(psptNo != oldPsptNo){
                   rsult = false;
               }else if(psptExpiDt != oldPsptExpiDt){
                   rsult = false;
               }
               
               if(!rsult){
                   confirmMsg += '저장되지 않은 여권정보가 있습니다. 이동하시겠습니까?'; 
                   if (!confirm(confirmMsg)) {
                       $("#chkPspt").val(1);
                       rsult = false;
                   }else{
                       $("#chkPspt").val(0);
                       rsult = true;
                   }
               }
           }
           if(rsult){
              $("#chkPspt").val(0);
           }
           return rsult;
       }
       if(rsult){
          $("#chkPspt").val(0);
       }
       return rsult;
   }
   $("#chkPspt").val(0);
   return rsult;
}

function dpatMnge(){
    var rsult = true; 
    var confirmMsg = "";
    
    if($("#chkDpat").val() > 0 ){
       
       var openNm =  $("#openNm").val();
       var dpatDt =  $("#dpatDt").val();
       var dpatTmH = $("#dpatTmH").val();
       var dpatTmM = $("#dpatTmM").val();
       var viaAreaCd = $("#viaAreaCd").val();
       var ugntComuMophNo = $("#ugntComuMophNo").val();
       var orderDpatPlacCd = $("#orderDpatPlacCd").val();
       var drtaYn =  $("input[name='drtaYn']:checked").val(); 
       var ugntComuTelNatiCd = $("#ugntComuTelNatiCd").val();
       
       if(isLogin){
           
           if($("#mbshDpatInfo").val()  > 0){
               
           	var oldDrtaYn  = $("#oldDrtaYn").val();
               var oldOpenNm  = $("#oldOpenNm").val();
               var oldDpatDt  = $("#oldDpatDt").val();
               var oldDpatTmH  = $("#oldDpatTmH").val();
               var oldDpatTmM  = $("#oldDpatTmM").val();
               var oldViaAreaCd = $("#oldViaAreaCd").val();
               var oldUgntComuMophNo  = $("#oldUgntComuMophNo").val();
               var oldOrderDpatPlacCd  = $("#oldOrderDpatPlacCd").val();
               var oldUgntComuTelNatiCd  = $("#oldUgntComuTelNatiCd").val();
               
               if(orderDpatPlacCd != oldOrderDpatPlacCd){
                   rsult = false;
               }else if(openNm != oldOpenNm){
                   rsult = false;
               }else if(dpatDt != oldDpatDt){
                   rsult = false;
               }else if(dpatTmH != oldDpatTmH){
                   rsult = false;
               }else if(dpatTmM != oldDpatTmM){
                   result = false;
               }else if(drtaYn != oldDrtaYn){
                   result = false;
               }else if(viaAreaCd != oldViaAreaCd){
                   result = false;
               }else if(ugntComuTelNatiCd != oldUgntComuTelNatiCd){
                   result = false;
               }else if(ugntComuMophNo != oldUgntComuMophNo){
                   result = false;
               }
               
               if(!rsult){
                   confirmMsg += '변경된 출국정보가 있습니다. 이동하시겠습니까?';  
                   if (!confirm(confirmMsg)) {
                       $("#chkDpat").val(1);
                       rsult = false;
                   }else{
                       $("#chkDpat").val(0);
                       rsult = true;
                   }
               }
           }
           if(rsult){
              $("#chkDpat").val(0);
           }
           return rsult;
           
       }else{
           
           if($("#mbshDpatInfo").val() > 0){
               
           	var oldDrtaYn =  $("#oldDrtaYn").val();
               var oldOpenNm =  $("#oldOpenNm").val();
               var oldDpatDt =  $("#oldDpatDt").val();
               var oldDpatTmH = $("#oldDpatTmH").val();
               var oldDpatTmM = $("#oldDpatTmM").val();
               var oldViaAreaCd = $("#oldViaAreaCd").val();
               var oldOrderDpatPlacCd = $("#oldOrderDpatPlacCd").val();
               
               if(orderDpatPlacCd  != oldOrderDpatPlacCd){
                   rsult = false;
               }else if(openNm != oldOpenNm){
                   rsult = false;
               }else if(dpatDt != oldDpatDt ){
                   rsult = false;
               }else if(dpatTmH != oldDpatTmH){
                   rsult = false;
               }else if(dpatTmM != oldDpatTmM){
                   rsult = false;
               }else if(drtaYn != oldDrtaYn){
                   rsult = false;
               }else if(viaAreaCd != oldViaAreaCd){
                   rsult = false;
               }
               
               if(!rsult){
                   confirmMsg += '변경된 출국정보가 있습니다. 이동하시겠습니까?'; 
                   if(!confirm(confirmMsg)) {
                      $("#chkDpat").val(1);
                      rsult = false;
                   }else{
                      $("#chkDpat").val(0);
                      rsult = true;
                   }
               }
           }
           if(rsult){
              $("#chkDpat").val(0);
           }
           return rsult;
       }
       if(rsult){
          $("#chkDpat").val(0);
       }
       return rsult;
   }
   $("#chkDpat").val(0);
   return rsult;
}


function btnNmbshOrderSmsAuca() {

if (!isLogin && isEmpty($("select[name='telNatiCd']").val())) {
    alert('휴대폰 국가번호를 선택해주세요.');
    $("select[name='telNatiCd']").parent().find("span[role='combobox']").focus();
    return false;
} else if (!isLogin && $("select[name='telNatiCd']").val() == "82") {
    if (isEmpty($("input[name='mophNo']").val())) {
        alert('휴대폰 번호를 입력해주세요.');
        $("input[name='mophNo']").focus();
        return false;
    } 
} else if (!isLogin && $("select[name='telNatiCd']").val() != "82") {
    if (isEmpty($("input[name='mophNo']").val())) {
        alert('휴대폰 번호를 입력해주세요.');
        $("input[name='mophNo']").focus();
        return false;
    }
}

if (nmbshSmsAucaYn && $("#nmbshSmsconfirmNum").val() ==  $("select[name='telNatiCd']").val() + $("input[name='mophNo1']").val() + $("input[name='mophNo2']").val() + $("input[name='mophNo3']").val()) {
    alert('휴대폰 번호를 입력해주세요.'); 
    return false;
}

$(".ui-dialog").not('.pop_type1').remove(); // 여권번호 수집동의 팝업 제외

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/popSmsAuth.json',
    method: "post",
    data: {type : 'nmbshOrderSmsAuca' ,layerPopupId : 'fullscreen_sms' ,telNatiCd : $("select[name='telNatiCd']").val() , mophNo : $("input[name='mophNo']").val()},
    async: false,
    dataType : 'html',
    success : function(data, textStatus, jqXHR) {
        $(".pop_quantity").html(data);
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.'); 
    }
});
}


function callbackSetNmbshOrderSmsAuca(obj) {

$("select[name='telNatiCd']").val(obj['telNatiCd']);
if (obj['telNatiCd'] == "82") {
    $("input[name='mophNo']").val(obj['mophNo']);
    $("input[name='nmbshSmsconfirmNum']").val(obj['telNatiCd'] + obj['mophNo']);
} else {
    $("input[name='mophNo']").val(obj['mophNo']);
    $("input[name='nmbshSmsconfirmNum']").val(obj['telNatiCd'] + obj['mophNo']);
} 
nmbshSmsAucaYn = true;
}


function checkVali() {

var today = new Date();
var year = today.getFullYear();
var month = today.getMonth()+1;
var day = today.getDate();
if(month<10) month = "0" + month;
if(day<10) day = "0" + day;
today = year + '-' + month + '-' + day;


if (!isLogin && isEmpty($("input[name='ordrrNm']").val())) {
    alert('성명을 입력해주세요.');
    $("input[name='ordrrNm']").focus();
    return false;
}

if (!isLogin && isEmpty($("input[name='bymdDt']").val())) {
    alert('생년월일을 선택해주세요.');
    $("input[name='bymdDt']").focus();
    return false;
} else if (!isLogin && Number("20090112") < Number($("input[name='bymdDt']").val().replace(/-/gi, ""))) {
    alert('만14세 미만 미성년자는 구매할 수 없습니다.');
    $("input[name='bymdDt']").focus();
    return false;
}

if (!isLogin && isEmpty($("select[name='natiCd']").val())) {
    alert('국적을 선택해주세요.');
    $("input[name='natiCd']").focus();
    return false;
 }

if (isEmpty($("input[name='mbshEngLstnm']").val())) {
    alert('Last Name(성)을 입력해주세요.');
    $("input[name='mbshEngLstnm']").focus();
    $(".input_passport").trigger('click'); 
    return false;
}else if(fnIsNotValidNameBlank2($("input[name='mbshEngLstnm']").val())) {
    alert('Last Name(성)에 공백은 사용할수 없습니다.');
    $("input[name='mbshEngLstnm']").focus();
    return false;
}else  if(fnIsNotValidNameBlank1($("input[name='mbshEngLstnm']").val())) {
    alert('Last Name(성)의 맨앞, 맨뒤에 공백은 사용하실 수 없습니다.'); 
   $("input[name='mbshEngLstnm']").focus();
   return false;
}else if(!fnIsUpperAlphaBlank($("input[name='mbshEngLstnm']").val())) {
    alert('Last Name(성)에 영문 스펠링을 입력해주세요.'); 
    $("input[name='mbshEngLstnm']").focus();
    return false ;
}

if (isEmpty($("input[name='mbshEngFstnm']").val())) {
    alert('First Name(이름)을 입력해주세요.');
    $("input[name='mbshEngFstnm']").focus();
    return false;
}else if(fnIsNotValidNameBlank2($("input[name='mbshEngFstnm']").val())) {
    alert('First Name(이름)에 공백은 사용할수 없습니다.');
    $("input[name='mbshEngFstnm']").focus();
    return false;
}else  if(fnIsNotValidNameBlank1($("input[name='mbshEngFstnm']").val())) {
    alert('First Name(이름)의 맨앞, 맨뒤에 공백은 사용하실 수 없습니다.'); 
   $("input[name='mbshEngFstnm']").focus();
   return false;
}else if(!fnIsUpperAlphaBlank($("input[name='mbshEngFstnm']").val())) {
    alert('First Name(이름)에 영문 스펠링을 입력해주세요.'); 
    $("input[name='mbshEngFstnm']").focus();
    return false ;
}

if (isEmpty($("input[name='psptNo']").val())) {
    alert('여권번호를 입력해주세요.');
    $("input[name='psptNo']").focus();
    return false;
    
} else if(!fnIsPassport($("input[name='psptNo']").val())) {
    alert('여권번호는 영문대문자와 숫자만 입력가능합니다.');
    $("input[name='psptNo']").focus();
    return false;
    
}else if($("input[name='psptNo']").val().length < 5 || $("input[name='psptNo']").val().length > 12) {
    alert('여권번호는 최소 5자리~최대 12자리까지 입력가능합니다.');
    $("input[name='psptNo']").focus();
    return false;
}

if(isEmpty($("input[name='psptExpiDt']").val())) {
    alert('여권만료일을 입력해주세요.');
    $("input[name='psptExpiDt']").focus();
    return false;
}else if (today > $("input[name='psptExpiDt']").val()) {
    alert('여권정보 갱신이 필요합니다.');
    $("input[name='psptExpiDt']").focus();
    return false;
}
if(!isEmpty($("input[name='psptExpiDt']").val())) {
    if(!fnIsValidDate($("input[name='psptExpiDt']").val())) {
        alert('여권만료일 입력형식을 확인해주세요.'); // 만료일 입력형식을 확인해주세요.
        $("input[name='psptExpiDt']").focus();
        return false;
    }
}

if (!isLogin && isEmpty($("select[name='telNatiCd']").val())) {
      alert('휴대폰 국가번호를 선택해주세요.');
      $("input[name='telNatiCd']").focus();
      return false;
  } else if (!isLogin && $("select[name='telNatiCd']").val() == "82") {
      if (isEmpty($("input[name='mophNo']").val())) {
          alert('휴대폰 번호를 입력해주세요.');
          $("input[name='mophNo']").focus();
          return false;
      } 
 
      if(!nmbshSmsAucaYn)  {
          alert('SMS를 인증해주세요.');
          $("input[name='mophNo1']").focus();
          return false;
      }
  
      if(nmbshSmsAucaYn &&  $("input[name='nmbshSmsconfirmNum']").val() != $("select[name='telNatiCd']").val() + $("input[name='mophNo']").val()) {
          alert('휴대폰번호를 변경하였습니다. 다시 인증 받아주시기 바랍니다.');
          $("input[name='mophNo1']").focus();
          return false;
      } 
               
  } else if (!isLogin && $("select[name='telNatiCd']").val() != "82") {
      if (isEmpty($("input[name='mophNo']").val())) {
          alert('휴대폰 번호를 입력해주세요.');
          $("input[name='mophNo']").focus();
          return false;
      }
              
      if(!nmbshSmsAucaYn) {
          alert('SMS를 인증해주세요.');
          $("input[name='mophNo']").focus();
          return false;
      }
      if(nmbshSmsAucaYn &&  $("input[name='nmbshSmsconfirmNum']").val() != $("select[name='telNatiCd']").val() + $("input[name='mophNo']").val()) {
          alert('휴대폰번호를 변경하였습니다. 다시 인증 받아주시기 바랍니다.');
          $("input[name='mophNo']").focus();
          return false;
      }
} 

if (!isLogin && isEmpty($("input[name='mailAddr1']").val())) {
    alert('이메일주소를 입력해주세요.');
    $("input[name='mailAddr1']").focus();
    return false;
} else if (!isLogin && isEmpty($("input[name='mailAddr2']").val())) {
    alert('이메일주소를 입력해주세요.');
    $("input[name='mailAddr1']").focus();
    return false;
}

var vEmail = $('#mailAddr1').val() + '@' + $('#mailAddr2').val();
if (!isLogin && !fnIsEmail(vEmail)) {
    alert('이메일주소를 다시 확인하고 입력해주세요.');
    $('#mailAddr1').focus();
    return ;
}

if(isLogin == false){
   
   if($("#ch_term01").is(":checked") == false){
       alert('이용약관동의는 필수 항목입니다.'); 
       $("#ch_term01").focus();
       return false;
  }
  
  if($("#ch_term02").is(":checked") == false){
      alert('비회원개인정보수집 이용동의를 확인해주세요.'); 
       $("#ch_term02").focus();
       return false;
  }
  
  if($("#ch_term03").is(":checked") == false){
      alert('고유식별정보수집동의는 필수 항목입니다.'); 
      $("#ch_term03").focus();
      return false;
  }
}
if($('#psptRcvYn').val() != 'Y'){
    if($("#ch_term03").is(":checked") == false){
          alert('고유식별정보수집동의는 필수 항목입니다.'); 
          $("#ch_term03").focus();
          return false;
      }
}

return true;




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

});
</script>
<script>
/* function fn_checked(el){
console.log("체크버튼이다!");
console.log(el);
let cartpricetotal = 0; 
let cartdispricetotal = 0;
let cartdistotal = 0;
let cartcounttotal=0;
let flag=$(this).is(":checked");
if(flag==false){
	console.log("체크 상태");
	$(this).prop("checked",false);
	}else{
		console.log("체크가 안된 상태")
		$(el).prop("checked",true);
	}
$(".item_area").each(function(index, item){
	if( $(this).find("input[name='cartSeq']").is(":checked")){
		const cartprice=parseFloat($(this).find("input[name='cartprice']").val());
		const cartdisprice=parseFloat($(this).find("input[name='cartdisprice']").val());
		const cartdis=parseFloat($(this).find("input[name='cartdis']").val());
		const cartcount=parseInt($(this).find("input[name='goosQty']").val());
		console.log(cartprice);
		cartpricetotal+=cartprice;
		cartdispricetotal+=cartdisprice;
		cartdistotal+=cartdis;
		cartcounttotal+=cartcount;
	}
});
$(".totalGoosUsd").text("$"+priceComma(cartpricetotal.toFixed(2)));
$(".totalGoosKrw").text(priceComma((cartpricetotal*1267).toFixed(0))+"원");
$(".sale.totalDcUsd").text("$"+priceComma(cartdistotal.toFixed(2)));
$(".sale.totalDcKrw").text(priceComma((cartdistotal*1267).toFixed(0))+"원");
$(".sumGoosQty").text(cartcounttotal);
$(".payTotalSettUsd").text("$"+priceComma((cartpricetotal-cartdistotal).toFixed(2)));
$(".payTotalSettKrw").text(priceComma(((cartpricetotal*1267)-(cartdistotal*1267)).toFixed(0))+"원");


} */

/* let cartpricetotal = 0; 
let cartdispricetotal = 0;
let cartdistotal = 0;
let cartcounttotal=0;
$(".item_area").each(function(index, item){
	if( $(this).find("input[name='cartSeq']").is(":checked")){
		const cartprice=parseFloat($(this).find("input[name='cartprice']").val());
		const cartdisprice=parseFloat($(this).find("input[name='cartdisprice']").val());
		const cartdis=parseFloat($(this).find("input[name='cartdis']").val());
		const cartcount=parseInt($(this).find("input[name='goosQty']").val());
		console.log(cartprice);
		cartpricetotal+=cartprice;
		cartdispricetotal+=cartdisprice;
		cartdistotal+=cartdis;
		cartcounttotal+=cartcount;
	}
});
$(".totalGoosUsd").text("$"+priceComma(cartpricetotal.toFixed(2)));
$(".totalGoosKrw").text(priceComma((cartpricetotal*1267).toFixed(0))+"원");
$(".sale.totalDcUsd").text("$"+priceComma(cartdistotal.toFixed(2)));
$(".sale.totalDcKrw").text(priceComma((cartdistotal*1267).toFixed(0))+"원");
$(".sumGoosQty").text(cartcounttotal);
$(".payTotalSettUsd").text("$"+priceComma((cartpricetotal-cartdistotal).toFixed(2)));
$(".payTotalSettKrw").text(priceComma(((cartpricetotal*1267)-(cartdistotal*1267)).toFixed(0))+"원");  */
 
function fn_qtyAdd(el){
	console.log("ㄴㅇㄴㅇ");
	let cartstock=parseInt($(el).closest(".num_amount.cart_amount").find("input[name='goosQty']").val());
	let pcode=$(el).closest(".item_area").find("input[name='pcode']").val();
	cartstock++;
	$(el).closest(".num_amount.cart_amount").find("input[name='goosQty']").val(cartstock);
	updateCart(1,pcode);
	location.href="/cart/cartlist?mid=jjjj";
}

function fn_qtySubtraction(el){
	console.log("ㄴㅇㄴㅇ");
	let cartstock=parseInt($(el).closest(".num_amount.cart_amount").find("input[name='goosQty']").val());
	let pcode=$(el).closest(".item_area").find("input[name='pcode']").val();
	cartstock--;
	$(el).closest(".num_amount.cart_amount").find("input[name='goosQty']").val(cartstock);
	updateCart(-1,pcode);
	location.href="/cart/cartlist?mid=jjjj";
}


function updateCart(cartstock,pcode){
	
	console.log("카트 들어감!")
	const Data = {
			cartstock :cartstock,
			mid : "jjjj",
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

function deleteCart(el){
	let cartno=parseInt($(el).closest(".item_area").find("input[name='cartno']").val());
	var Data={
			cartno :cartno,
			mid :"jjjj"
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

function setOrderPrice(){
	//시작할 때 주문 가격 및 합계 구하기
	console.log("ㄹㄹㄹ")
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
	console.log(cartdistotal);
	/* ${cart.pprice*cart.cartstock} */
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
</script>
<div class="cont_right" style="height: 415.333px;">
   <div class="pay_table">
           <div class="pay_tit">예상주문금액</div>
           <div class="pay_list">
               <dl>
                   <dt>주문금액합계</dt> 
                   <dd>
                       <strong class="totalGoosUsd">$ 0</strong>
                       <span class="totalGoosKrw">183,638원</span>
                   </dd>
               </dl>
               <dl>
                   <dt>예상할인금액</dt>
                   <dd>
                       <strong class="sale totalDcUsd">$44.40</strong>
                       <span class="sale totalDcKrw">55,092원</span>
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
                       <strong class="payTotalSettUsd">$103.60</strong>
                       <span class="payTotalSettKrw">128,546원</span>
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
                          <button class="btnxl_type1 btnico btn_view_rv" onclick="maxDcAmtInfo();"><em class="ico_sale">적림금 혜택 엿보기 </em>
                                    <div class="info_reserve">적립금 혜택 엿보기</div><!--//2022-04-19 추가-->
                                   </button>
                                  <div class="tooltip" id="maxSvmtInfoPop" style="display: none;">
                                      <p class="ti">적립금 혜택 엿보기</p>
                                      <ul class="dl_price"></ul>
                                      <button class="close" onclick="closeMaxDcPrc();">닫기</button>
                                  </div>
                              </div>                            
                    <a href="javascript:void(0);" class="btnxl_type1" onclick="goOrder();">주문하기</a>
              </div>
           </div>
       </div>
</div> 
</div> 
      
</section>
<div class="totop" style="display: none;"><a href="#none">처음으로 이동</a></div></article>


<div id="changeSetGoosQtyList"></div>  <div id="layer_unit_pspt" class="layer_unit pop_o1" title="여권 정보 안내"></div>
<div id="layer_unit_dpat" class="layer_unit pop_o1" title="출국 정보 안내"></div>

<script type="text/javascript">

$(window).bind("pageshow", function (event) {
if (event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)) {
    location.href = 'https://www.hddfs.com/shop/or/order/listCart.do'
}
});

$(document).ready(function(){
if($("#cartCd").val() != "001"){
   $(".loadProgBar").css("display","none"); 
}
$(".select_items a").click(function(){
    $(".select_items").hide();
});
$(document).mouseup(function(e){
    if($(".select_items").has(e.target).length===0)
    $(".select_items").hide();
});
});

$(function(){
$(".btn_onoff").click(function(){
    if($(this).hasClass("on")){
        $(this).removeClass("on");
    } else {
        $(this).addClass("on");
    }
});

$(".tooltip").hide();
$(".btn_tooltip").click(function(){
    $(this).next(".tooltip").show();
});
$(".close").click(function(){
    $(this).parent(".tooltip").hide();
});
});

$(function(){
var product_slider = 4;
$(".product-module-swipera").each(function(index, element){
    var $this = $(this);
    $this.addClass("instance-swipwe-" + index);
    $this.siblings(".swiper-prev").addClass("instance-prev" + index)
    $this.siblings(".swiper-next").addClass("instance-next" + index)

    var swiper = new Swiper(".instance-swipwe-" + index, {
        slidesPerView: "auto",
        spaceBetween: 16,
        slidesPerGroup: 1,
        observer:true,
        observeParents:true,
        navigation: {
            nextEl: '.instance-next'+index,
            prevEl: '.instance-prev'+index
        }
    });

    if($(this).find('.swiper-slide').length <= product_slider){
        $(this).parent().find('.swiper-next, .swiper-prev').hide();
    }
});
});





</script>
</main>
<%@ include file="/WEB-INF/views/common/Footer.jsp"%>