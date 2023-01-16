<!-- 여권정보 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


groobeeListCart();

if($("#buyNowType").val() === "Y"){
    buyNowCart();
}else{
    $("#buyNow").val('');
    $("#buyNowSetGoosId").val('');
    setuSettAmt();
}

  
$("#cart_chk1").change(function(){ 
    
    if($(this).prop("checked")){
        $("#cart_chk1").prop("checked", true);
    }else{
        setTimeout(function() {
            $("#cart_chk1").prop("checked", false);
        }, 100);
    }
    
    $(".cartSeqs").prop("checked", $(this).prop("checked"));
    $(".branCartSeqs").prop("checked", $(this).prop("checked"));
    $(".chkSetCartSeq").prop("checked", $(this).prop("checked"));
    
    setuSettAmt();
});


});


function getPsptExpl(type){
var type   = typeof(type)  === "undefined" ? "" : type; 
var url = 'https://www.hddfs.com/shop/or/order/psptExpl.do?type='+type;
$("#layer_unit_pspt").load(url);
}


function getDpatExpl(){
var url = 'https://www.hddfs.com/shop/or/order/dpatExpl.do';
$("#layer_unit_dpat").load(url);
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


function listCartAlin() {
$(".loadProgBar").css("display","block");
cartReplace();
}


function rwingCartCnt(chkLength , type){
var cnt = 0;
   var text = "";

   if($("#rwingCartCnt").length != 0){
    
    if($("#oldsumGoosQty").length > 0){
        text = $("#oldsumGoosQty").val();
    }else{
        text = 0;
    }
    
    if(type === "srch"){
       cnt  = text;
    }else{
       cnt  = text == '' ? 1 : Number(text) - Number(chkLength);
    }
        
    var result =  cnt;
    if(result >= 99){
        result = "99+";
    }   
        
    if(result <=0 ){
        $("#rwingCartCnt").hide();
        $("#rwingCartCnt").text(0);
    }else{
        $("#rwingCartCnt").text(result).show();
    }
}
} 


function goCartTab(type) {

var url = "";

if(!psptMnge()){return false;} 
if(!dpatMnge()){return false;} 

$("#tabCart, #tabPspt, #tabDpat").removeClass("on");
$("#TAB , #CART , .pay_btm").hide();

if(type == "CART"){
    $(".pay_btm").show();
    $("#CART").show();
    $("#tabCart").addClass("on");
}else if(type == "PSPT"){
    $("#TAB").show();
    $("#tabPspt").addClass("on");
    url = "https://www.hddfs.com/shop/or/order/mbshPsptMnge.do";
}else if(type == "DPAT"){
    $("#TAB").show();
    $("#tabDpat").addClass("on");
    url = "https://www.hddfs.com/shop/or/order/addMbshDpatInfo.do";
}

if(type !== "CART"){
    $(".loadProgBar").css("display","block");
    $("#TAB").load(url);
}
}


function buyNowCart(){

$("#cart_chk1").prop("checked", true);
$(".cartSeqs").prop("checked", false);
$(".chkSetCartSeq").prop("checked", false );

if($("#cartCd").val() === '005'){
    if($("#branCartSeqs").length > 0){
       $(".branCartSeqs").prop("checked", false);
    }
}

var buyNowCartNos = [];
var buyNowOnlnGoosCdList = $("#buyNowOnlnGoosCdList").val().split(",");

$(".cartSeqs").each(function(i) {
    var index = $(this).attr("data-idx");
    var onlngooscd = $(this).attr("data-onlngooscd");
    
    $(buyNowOnlnGoosCdList).each(function(i){
         if(onlngooscd === buyNowOnlnGoosCdList[i]){
             $("#cart_ch"+index).prop("checked", true);
             buyNowCartNos.push($("#cart_ch"+index).val());
         }
    });
});    

$("#buyNow").val(buyNowCartNos);
setuSettAmt();

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/cartInfoValidate.json',
    method: "post",
    data: {},
    async: true,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        
        if (data.resultCode === 1) {
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
}


function buyNowOrder(cartSeq , cartSetId){

var buyNowcartSeq  = "";
var buyNowSetGoosId  = "";

if(isEmpty(cartSeq)){
    buyNowcartSeq = $("#buyNow").val();
}else{
    buyNowcartSeq = cartSeq;
}

if(isEmpty(cartSetId)){
    buyNowSetGoosId = $("#buyNowSetGoosId").val();
}else{
    buyNowSetGoosId = cartSetId;
}

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/checkOrderPsbCartGoos.json',
    method: "post",
    data: {checkedCartSeq : buyNowcartSeq , checkedCartSetId : buyNowSetGoosId},
    async: true,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        if(crew.ajaxValidate(data, false)){
            if(data.resultCode != 1) {
                
                if(data.adtAucaCount > 0){
                    if(isLogin){
                        setTimeout(function() {
                            openPopup('',"cartList",'','','','',buyNowcartSeq,buyNowSetGoosId);
                        },300);
                    }else{
                        alert('로그인 후 이용해주세요.');    
                        setTimeout(function() {
                            login();
                        },300);
                    }
                }else{
                    $("#main_loading_area").hide();
                    alert(data.message);
                    
                    if(data.dtlMessage === "CART" || data.dtlMessage === "DPAT" || data.dtlMessage === "PSPT" ){
                       goCartTab(data.dtlMessage);
                    }else if(data.dtlMessage === "CARTTAB"){
                       cartReplace();
                    }
                    return false;
                } 
            } else if(data.resultCode == 1){
                
                $("#buyNow").val('');
                $("#buyNowSetGoosId").val('');
                
                $(".loadProgBar").css("display","block");
                location.href = 'https://www.hddfs.com/shop/or/order/order.do';
            }
        } else {
            alert('처리중 오류가 발생하였습니다.');
        }
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
});
}


function goOrder(cartSeq , setGoosId , setIndex) {

$("#buyNow").val(cartSeq); 
$("#buyNowSetGoosId").val(setGoosId); 

var cartNos = [];
var orderCartSetGoosId = [];

if(!isEmpty(cartSeq)){
    $(".chkSetCartSeq").prop("checked", false );
    $("input[name='cartSeq']").each(function() {
        
        var checkedIdx = $(this).attr("data-idx");
        if(Number($(this).val()) === Number(cartSeq)){
           cartNos.push($(this).val());
           if($("#cart_ch"+checkedIdx).is(":checked") == false){
              $("#cart_ch"+checkedIdx).prop("checked", true);
           }
        }else{
               if($("#cart_ch"+checkedIdx).is(":checked") == true){
               $("#cart_ch"+checkedIdx).prop("checked", false);
            }
        }
    });
       setuSettAmt();     
}else{
    $("input[name='cartSeq']:checked").each(function() {
        cartNos.push($(this).val());
    });
}

if(!isEmpty(setGoosId)){
    $(".cartSeqs").prop("checked", false);
    $("input[name='chkSetCartSeq']").each(function() {
        var checkedIdx = $(this).attr("data-idx");
        
        if(Number($(this).attr("data-setGoosId")) === Number(setGoosId)){
            var checkedsetGoosId = $(this).attr("data-setGoosId");
            orderCartSetGoosId.push(checkedsetGoosId);
            
            if($("#set_cart_chk"+checkedIdx).is(":checked") == false){
               $("#set_cart_chk"+checkedIdx).prop("checked", true);
            }
        }else{
            if($("#set_cart_chk"+checkedIdx).is(":checked") == true){
               $("#set_cart_chk"+checkedIdx).prop("checked", false);
            }
        }
    });
    setuSettAmt();
}else{
    $("input[name='chkSetCartSeq']:checked").each(function() {
        var checkedIdx = $(this).attr("data-idx");
        var checkedsetGoosId = $(this).attr("data-setGoosId");
        orderCartSetGoosId.push(checkedsetGoosId);
    });
}

if($("#buyNow").val() === "" && $("#buyNowSetGoosId").val() == ""){
    if(orderCartSetGoosId.length  === 0 && cartNos.length === 0){
       alert('선택된 상품이 없습니다.');
       return false;
    }
}

if(Number($("#totalSettKrw").val()) >= 2100000000){
    alert('한 주문 건당 21억 초과 구매가 불가합니다. 구매수량을 수정해주세요.');
    return false;
}


$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/cartInfoValidate.json',
    method: "post",
    data: {},
    async: true,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        if (data.resultCode === 1) {
            
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
}


function goSelectedOrder(val){

if(Number($("#totalSettKrw").val()) >= 2100000000){
    alert('한 주문 건당 21억 초과 구매가 불가합니다. 구매수량을 수정해주세요.');
    return;
}

var cartNos = [];
var orderCartSetGoosId = [];

if(!isEmpty(val)){
    
    if(!isEmpty($("#buyNow").val()) || !isEmpty($("#buyNowSetGoosId").val())){
        cartNos.push($("#buyNow").val());
        orderCartSetGoosId.push($("#buyNowSetGoosId").val());
    }else{
         $("input[name='cartSeq']:checked").each(function() {
             cartNos.push($(this).val());
         });
         
         $("input[name='chkSetCartSeq']:checked").each(function() {
             var checkedIdx = $(this).attr("data-idx");
             var checkedsetGoosId = $(this).attr("data-setGoosId");
             orderCartSetGoosId.push(checkedsetGoosId);
         });
    }
    
}else{
    $("input[name='cartSeq']:checked").each(function() {
        cartNos.push($(this).val());
    });
    
    $("input[name='chkSetCartSeq']:checked").each(function() {
        var checkedIdx = $(this).attr("data-idx");
        var checkedsetGoosId = $(this).attr("data-setGoosId");
        orderCartSetGoosId.push(checkedsetGoosId);
    });
}

if(orderCartSetGoosId.length  === 0 && cartNos.length ===0){
    alert('선택된 상품이 없습니다.');
    return false;
}

console.log('--------------------------');
console.log(val);
console.log(cartNos.join(","));

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/checkOrderPsbCartGoos.json',
    method: "post",
    data: {checkedCartSeq : cartNos.join(",") , checkedCartSetId : orderCartSetGoosId.join(",") },
    async: true,
    dataType : 'json',
    beforeSend : function(){
        $("#main_loading_area").show();
    },
    success : function(data, textStatus, jqXHR) {
        if(crew.ajaxValidate(data, false)){
            if(data.resultCode != 1) {
               
                if(data.adtAucaCount > 0){
                    if(isLogin){
                        setTimeout(function() {
                            openPopup('',"cartList",'','','','','','');
                        },300);
                    }else{
                        alert('로그인 후 이용해주세요.');    
                        setTimeout(function() {
                            login();
                        },300);
                    }
                }else{
                    $("#main_loading_area").hide();
                    alert(data.message);
                    
                    if(data.dtlMessage === "CART" || data.dtlMessage === "DPAT" || data.dtlMessage === "PSPT" ){
                        goCartTab(data.dtlMessage);
                     }else if(data.dtlMessage === "CARTTAB"){
                        cartReplace();
                     }
                    return false;
                }
            } else if (data.resultCode == 1) {
               
                $("#buyNow").val('');
                $("#buyNowSetGoosId").val('');
                
                $("#main_loading_area").show();
                location.href = 'https://www.hddfs.com/shop/or/order/order.do'
            }
        } else {
            $("#main_loading_area").hide();
            alert('처리중 오류가 발생하였습니다.');
        }
    },
    complete : function (){
        $("#main_loading_area").hide();
    },
    error : function(jqXHR, textStatus, errorThrown) {
        $("#main_loading_area").hide();
        alert('처리중 오류가 발생하였습니다.');
    }
});
}


function registCnrGoos(onlnGoosCd, registIdx, obj) {

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/mergeCnrGoos.json',
    method: "post",
    data: {onlnGoosCd : onlnGoosCd},
    async: true,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        
        if(data.info.infoMap.mode == "insert") {
            $(obj).addClass("on");
            alert('관심상품으로 등록되었습니다.');
        }else if(data.info.infoMap.mode == "delete") {
            $(obj).removeClass("on");
        }
        
    },error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
}); 
}


function mergeCnrRetn(cartSeq,onlnGoosCd ,obj) {

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/mergeCnrRetn.json',
    method: 'POST',
    data: {cartSeq : cartSeq , onlnGoosCd : onlnGoosCd },
    async: true,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        
        if(data.info.retnYn === 'Y'){ 
             $(obj).addClass("on");
             alert('결제 후에도 상품이 장바구니에 계속 보관됩니다.');
        }else{
             $(obj).removeClass("on");
             alert('계속담아두기가 해제되었습니다.');
        }  
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
});
}


function deleteSelectedCart() {

var spordYn = false;
$("input[name='cartSeq']:checked").each(function() {
    if ($(this).parent().find("input[name='spordYn']").val() === "Y") {
        spordYn = true;
        return;
    }
});

var hshareYn = false;
$("input[name='cartSeq']:checked").each(function() {
    if ($(this).parent().find("input[name='hshareYn']").val() === "Y") {
        hshareYn = true;
        return;
    }
});        

var cartNos = [];
var totalGoosQty = 0;
$("input[name='cartSeq']:checked").each(function() {
    var index = $(this).attr("data-idx");
    
    totalGoosQty += Number($("#count"+index).val());
    cartNos.push($(this).val());
});

var orderCartSetGoosId = [];
$("input[name='chkSetCartSeq']:checked").each(function() {
    var checkedIdx = $(this).attr("data-idx");
    var checkedsetGoosId = $(this).attr("data-setGoosId");
    
    totalGoosQty += Number($("#totSetGoosQtyVal"+checkedIdx).val());
    orderCartSetGoosId.push(checkedsetGoosId);
});

if(cartNos.length === 0 && orderCartSetGoosId.length === 0 ){
    alert('선택된 상품이 없습니다.');
    return false;
}

var confirmMsg = "";
if (spordYn) { confirmMsg += '선택하신 상품 중에 스페셜오더 상품이 포함되어 있습니다.\n스페셜오더 상품을 삭제하면 스페셜오더를 재신청 하셔야 합니다.\n';
    
}

if (hshareYn) {confirmMsg += '선택하신 상품 중 H.Share상품의 경우 장바구니 삭제 시 구매 불가합니다.';} 

confirmMsg += '상품을 삭제하시겠습니까?'; 

if (!confirm(confirmMsg)) {
    return false;
}

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/deleteSelectedCart.json',
    method: "post",
    data: {checkedCartSeq : cartNos.join(",") , checkedCartSetId  : orderCartSetGoosId.join(",")},
    async: true,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        if(crew.ajaxValidate(data, false)){
            if(data.resultCode === 1) {
                
                alert('삭제되었습니다.');
                rwingCartCnt(totalGoosQty);
                cartReplace(); 
            } 
        } else {
            alert('처리중 오류가 발생하였습니다.');
        }
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
});
}


function deleteCart(cartSeq, spordYn , cartIdx  ,type, hshareYn) {

var cartGoosQty = 0;
var confirmMsg = "";

if(type ==="Y"){
    cartGoosQty = $("#soldoutGoosQty"+cartIdx).val();
}else{
    cartGoosQty = $("#goosQty"+cartIdx).val();
}

if (spordYn == "Y") {confirmMsg += '스페셜오더 상품을 삭제하면 스페셜오더를 재신청 하셔야 합니다.\n';
    
}
if (hshareYn == "Y") {confirmMsg += 'H.Share상품의 경우 장바구니 삭제 시 구매가 불가합니다.';}

confirmMsg += '상품을 삭제하시겠습니까?'; 

if (!confirm(confirmMsg)) {
    return false;
}

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/deleteCart.json',
    method: "post",
    data: {cartSeq : cartSeq , cartGoosQty : cartGoosQty},
    async: true,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        if(crew.ajaxValidate(data, false)){
            if(data.resultCode === 1) {
                
                alert('삭제되었습니다.');
                rwingCartCnt(cartGoosQty);
                cartReplace();
                
            }
        } else {
            alert('처리중 오류가 발생하였습니다.');
        }
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
});
}


function deleteSetCart(setGoosId){

var setGoosQty = 0;
var chkSetGoosId = setGoosId;

var cartNos = [];
var setCartIdNos = [];

$("input[name='setCartSeq']").each(function() {
    var index = $(this).attr("data-idx");
    var setgoosid = $(this).attr("data-setgoosid");
    
    if(chkSetGoosId === setgoosid){
        cartNos.push($(this).val());
        setCartIdNos.push(setgoosid);
        setGoosQty = $("#totSetGoosQtyVal"+index).val();
    }
});

if (!confirm("세트상품을 삭제하시겠습니까?")) { 
    return false;
}

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/deleteSelectedSetCart.json',
    method: "post",
    data: {checkedCartSeq : cartNos.join(",") , checkedCartSetId : setCartIdNos.join(",")},
    async: true,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        if(crew.ajaxValidate(data, false)){
            if(data.resultCode === 1) {
                
                alert('삭제되었습니다.');
                rwingCartCnt(setGoosQty);
                cartReplace();
            }
        } else {
            alert('처리중 오류가 발생하였습니다.');
        }
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
});
}


function deleteRostCart() {

var cartNos = [];
var totalGoosQty = 0;
$("input[name='rostCartSeq']").each(function() {
    var idx = $(this).attr("data-idx");
    totalGoosQty += Number($("#soldoutGoosQty"+idx).val());
    cartNos.push($(this).val());
});

var orderCartSetGoosId = [];
$("input[name='setSeqSoldout']").each(function() {
    var checkedIdx = $(this).attr("data-idx");
    var checkedsetGoosId = $(this).attr("data-setGoosId");
    totalGoosQty += Number($("#soldoutSetSetQty"+checkedIdx).val());
    orderCartSetGoosId.push(checkedsetGoosId);
});

if(cartNos.length === 0 && orderCartSetGoosId.length === 0 ){
     alert('품절된 상품이 없습니다.'); 
     return false;
}

if (!confirm('품절상품을 모두 삭제하시겠습니까?')) { 
    return false;
}

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/deleteSelectedCart.json',
    method: "post",
    data: {checkedCartSeq : cartNos.join(",") , checkedCartSetId : orderCartSetGoosId.join(",")},
    async: true,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        if(crew.ajaxValidate(data, false)){
            if(data.resultCode === 1) {
                alert('삭제되었습니다.');
                rwingCartCnt(totalGoosQty);
                cartReplace();
            }
        } else {
            alert('처리중 오류가 발생하였습니다.');
        }
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
});
}


var isRun = false;
function changeGoosQty(cartSeq, idx , type ,obj, setGoosYn) {

if(isRun == true){
    return;
}
isRun = true;

var goosQty = "";
var oldQty = Number($("#goosQty"+ idx).val());
var oldGoosQty = Number($("#goosQty"+ idx).val());
var orderMinQty = Number($('#orderMinQty'+ idx).val()); 

if(type === 'c'){
    goosQty = Number($(obj).val());
}else{
    goosQty = Number($(obj).parent().parent().find("input[name='goosQty']").val());
}

if(type === 'p'){ 
    
    if(goosQty == 50000) {
        alert('최대 구매가능 수량은 50000개 입니다.'); 
        $("#count"+ idx).val(oldQty);
        isRun = false;
        return false;
    }
    
    goosQty = Number(1);
    oldQty =  Number(oldQty)+1;
    
    if(oldQty > orderMinQty){
        $("#minGoosQty"+ idx).attr("disabled" ,false);
    }

}else if(type === 'm'){
    
    if( goosQty > 1 ) {
        oldQty = Number(oldQty)-1;
        goosQty = Number(1);
    }
    if(orderMinQty >= oldQty ){
        $("#minGoosQty"+ idx).attr("disabled" ,true);
    }

}else if(type === 'c'){ 

    if(!qtyValidation(goosQty)){
        alert('수량을 확인해주세요.'); 
        $("#count"+idx).val(oldQty);
        isRun = false;
        return false;
    }
    
    if(goosQty > 50000) {
        alert('최대 구매가능 수량은 50000개 입니다.'); 
        $("#count"+ idx).val(oldQty);
        isRun = false;
        return false;
    }
}

if(type === 'c'){
    
    if(Number(goosQty) < Number(orderMinQty)){
         var rseult = confirm("최소 구매 수량은 %s 개 입니다. 구매수량을 변경하시겠습니까?".replace("%s", orderMinQty)); 
         if(rseult){
             goosQty = orderMinQty;
         }else{
             $("#count"+idx).val(oldQty);
             isRun = false;
             return false;
         }
    }
    
}else{
    
    if(orderMinQty > oldQty){
        var rseult = confirm("최소 구매 수량은 %s 개 입니다. 구매수량을 변경하시겠습니까?".replace("%s", orderMinQty)); 
        if(rseult){
            goosQty =  Number(orderMinQty - oldGoosQty);
        }else{
            $("#count"+idx).val(oldGoosQty);
            isRun = false;
            return false;
        }
    }
    
    if(oldQty <= 0){
        alert('수량을 확인해주세요.'); 
        $("#count"+idx).val(oldGoosQty);
        isRun = false;
        return false;
    }
}

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/updateCartGoosQty.json',
    method: "post",
    data: {cartSeq : cartSeq, updateGoosQty : goosQty , updateType : type},
    async: false,
    dataType : 'json',
    beforeSend : function(){
        $(".loadProgBar").css("display","block");
    },
    success : function(data, textStatus, jqXHR) {
            
        if(data.resultCode === 1) { 
            isRun = false;
            cartReplace("Y");            
        }else{
            isRun = false;
            alert(data.message);
            $("#count"+ idx).val(oldGoosQty);
        } 
    },
    complete : function (){
        $(".loadProgBar").css("display","none");
    },
    error : function(jqXHR, textStatus, errorThrown) {
        isRun = false;
        alert('처리중 오류가 발생하였습니다.'); 
    }
});
}


var setIsRun = false;
function changeSetBassGoosQty(setCartId , type , obj , setIdx) {

if(setIsRun == true){
    return;
}

setIsRun = true;

var oldQty = Number($("#baseSetGoosQty"+setIdx).val()); 
var goosQty = Number($(obj).parent().parent().find("input[name='setGoosNumberQty']").val());

if(type === 'p'){ 
   goosQty = Number(1);
   oldQty = Number(oldQty)+1;
   
   if(oldQty > 0){
       $("#setMinGoosQty"+setIdx).attr("disabled" ,false);
   }
   
}else if(type === 'm'){ 
   
   goosQty = Number(1);
   oldQty = Number(oldQty)-1;
   
   if(oldQty === 0){
       $("#setMinGoosQty"+setIdx).attr("disabled" ,true);
       alert('수량을 확인해주세요.'); 
       $("#setCount"+setIdx).val(oldQty);
       setIsRun = false;
       return false;
   }
   
}else if(type === 'c'){
   
   goosQty = Number($(obj).val());

   if(!qtyValidation(goosQty)){
       alert('수량을 확인해주세요.'); 
       $("#setCount"+setIdx).val(oldQty);
       setIsRun = false;
       return false;
   }
}

$.ajax({
   url: 'https://www.hddfs.com/shop/or/order/baseSetUpdateCartGoosQty.json',
   method: "post",
   data: {setGoosId : setCartId , updateGoosQty : goosQty , updateType : type},
   async: false,
   dataType : 'json',
   success : function(data, textStatus, jqXHR) {
           
       if(data.resultCode === 1) {
           setIsRun = false;
           cartReplace(); 
       }else{
           setIsRun = false;
           alert(data.message);
           $("#count"+ setIdx).val(oldQty);
       }                
   },
   error : function(jqXHR, textStatus, errorThrown) {
       setIsRun = false;
       alert('처리중 오류가 발생하였습니다.');
   }
}); 
}



function optionUpdateGoos(cartSeq) {
if($("#select_items"+cartSeq).attr('class') === 'select_items open'){
    $("#select_items"+cartSeq).removeClass("open");
    $("#select_items"+cartSeq).hide();
}else{
    $("#select_items"+cartSeq).addClass("open");
    $("#select_items"+cartSeq).show();
}
}


function changeOnlnGoosCd(bndlCartSeq , onlnGoosCd , cartIdx ,bndlIdx, cartGoosCd ){

var goosMinQty = 0;
var goosQty = $("#count"+cartIdx).val();
var bndlOrderMinQty =  Number($("#bndlOrderMinQty"+cartIdx+"_"+bndlIdx).val());
var oldOnlnGoosCd = $("#cart_ch"+cartIdx).attr("data-onlnGoosCd");


if(typeof(goosQty)  === "undefined"){
    goosQty = Number($("#soldoutGoosQty"+cartIdx).val());
}

if(onlnGoosCd === cartGoosCd){
    alert('동일 상품이 선택되었습니다. 이미 장바구니에 담겨있으므로 변경이 불가합니다.'); 
    return false;
}

if(bndlOrderMinQty > Number(goosQty)){
    var rseult = confirm("최소 구매 수량은 %s 개 입니다. 구매수량을 변경하시겠습니까?".replace("%s", bndlOrderMinQty)); 

    if(rseult){
        goosMinQty = bndlOrderMinQty;
    }else{
        return false;
    }
}

var eachYn = false;
$("input[name='cartSeq']").each(function() {
    if(onlnGoosCd == $(this).attr("data-onlnGoosCd")){
         alert('동일 상품이 선택되었습니다. 이미 장바구니에 담겨있으므로 변경이 불가합니다.'); 
         eachYn = true;
         return false;
    }
});

if(eachYn){
    return false;
}

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/updateCartOnlnGoosCd.json',
    method: "post",
    data: {cartSeq : bndlCartSeq, onlnGoosCd : onlnGoosCd , goosQty : goosMinQty , updateGoosQty : goosQty , oldOnlnGoosCd : oldOnlnGoosCd},
    async: false,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        if(data.resultCode === 1) {
            alert('변경되었습니다.');
            cartReplace("Y");
        }else{
            alert(data.message);
        } 
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
});
}


function changeSetGoosQty(setGoosSeq , setOnlnBranCd) {
$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/changeSetGoosQtyList.json',
    method: "post",
    data: {setGoosId : setGoosSeq , onlnBranCd : setOnlnBranCd},
    async: false,
    dataType : 'html',
    success : function(data, textStatus, jqXHR) {
        $("#changeSetGoosQtyList").html(data);
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
});
}
 

function changeAbnoSetGoosQty(abnoSetIdx , essnYn ,abnoSetType ,obj) {

var abnoSetTotalGoosUsd = 0; 
var abnoSetTotalSettUsd = 0; 
var abnoSetGoosId = $("#abnoSetGoosId").val();
var goosChoiClsCd = $("#goosChoiClsCd").val(); 
var abnoSetEssnYn = $("#abnoSetEssnYn"+abnoSetIdx).val();
var abnoOnlnGoosCd = $("#abnoOnlnGoosCd"+abnoSetIdx).val();
var abnoSetoldQty = Number($("#abnoGoosQty"+abnoSetIdx).val());
var abnoSetGoosQty = Number($("#abnoSetGoosQty"+abnoSetIdx).val());
var abnoOrderMinQty = Number($("#abnoOrderMinQty"+abnoSetIdx).val()); 
var abnoTotalGoosUsd = $("#abnoTotalGoosUsd").text();
var abnoTotalSettUsd = $("#abnoTotalSettUsd").text();
var abnoTotalSettKrw = $("#abnoTotalSettKrw").text();

var goosQty = Number($(obj).parent().parent().find("input[name='abnoSetGoosQty']").val());

if(abnoSetType === 'p'){
    
    goosQty = Number(goosQty)+1;
    
    if(abnoOrderMinQty > goosQty){
        var rseult = confirm("최소 구매 수량은 %s 개 입니다. 구매수량을 변경하시겠습니까?".replace("%s", abnoOrderMinQty)); 
        
        if(rseult){
            goosQty = abnoOrderMinQty;
        }else{
            goosQty = abnoSetoldQty;
        }
    }
    
    if(abnoSetEssnYn === 'Y'){
        if(goosQty >= abnoSetGoosQty){
            $("#abnoSetMinGoosQty"+abnoSetIdx).attr("disabled" ,false);
            $("#abnoSetMinGoosQty"+ abnoSetIdx).css("cursor" ,'pointer');
        }
    }else if(goosQty > abnoOrderMinQty){
        $("#abnoSetMinGoosQty"+ abnoSetIdx).attr("disabled" ,false);
        $("#abnoSetMinGoosQty"+ abnoSetIdx).css("cursor" ,'pointer');
    }
    
    abnoSetTotalGoosUsd = Number($("#abnoSetTotalGoosUsd").val()) + Number($("#abnoSetGoosShopPric"+abnoSetIdx).val()); 
    abnoSetTotalSettUsd = Number($("#abnoSetTotalSettUsd").val()) + Number($("#abnoSetGoosSettUsdc"+abnoSetIdx).val());
    
}else if(abnoSetType === 'm'){ 
    
    goosQty = Number(goosQty)-1;
    
    if(goosQty <= 0){
        $("#abnoSetMinGoosQty"+ abnoSetIdx).attr("disabled" ,true);
        $("#abnoSetMinGoosQty"+ abnoSetIdx).css("cursor" ,'default');
    }else if(abnoOrderMinQty >= goosQty ){
        $("#abnoSetMinGoosQty"+ abnoSetIdx).attr("disabled" ,true);
        $("#abnoSetMinGoosQty"+ abnoSetIdx).css("cursor" ,'default');
    }
    
    if(abnoSetEssnYn === 'Y'){
        if(goosChoiClsCd === '001'){
            if(abnoSetGoosQty > goosQty ){
                goosQty = abnoSetoldQty;
                alert("필수 상품은 %s 개 이상 구매가 가능합니다.".replace("%s", abnoSetGoosQty)); 
            }
        }
    }else{
        if(goosQty === 0){ 
            $("#abnoSetMinGoosQty"+ abnoSetIdx).attr("disabled" ,true);
            $("#abnoSetMinGoosQty"+ abnoSetIdx).css("cursor" ,'default');
        }
    }
    abnoSetTotalGoosUsd = Number($("#abnoSetTotalGoosUsd").val()) - Number($("#abnoSetGoosShopPric"+abnoSetIdx).val());
    abnoSetTotalSettUsd = Number($("#abnoSetTotalSettUsd").val()) - Number($("#abnoSetGoosSettUsdc"+abnoSetIdx).val());
    
}else if(abnoSetType === 'c'){ 

    if(Number(goosQty) < Number(abnoOrderMinQty) && goosQty > 0){ 
        
        var rseult = confirm("최소 구매 수량은 %s 개 입니다. 구매수량을 변경하시겠습니까?".replace("%s", abnoOrderMinQty)); 
        
        if(rseult){
            goosQty = abnoOrderMinQty;
        }else{
            goosQty = abnoSetoldQty;
        }
    }
    
    if(abnoSetEssnYn === 'Y'){
        if(goosChoiClsCd === '001'){
            if(abnoSetGoosQty > goosQty ){
                goosQty = abnoSetoldQty;
                alert("필수 상품은 %s 개 이상 구매가 가능합니다.".replace("%s", abnoSetGoosQty)); 
            }
        }
    }else{
        if(goosQty === "0"){
            $("#abnoSetMinGoosQty"+ abnoSetIdx).attr("disabled" ,true);
            $("#abnoSetMinGoosQty"+ abnoSetIdx).css("cursor" ,'default');
            abnoSetTotalGoosUsd = Number($("#abnoSetTotalGoosUsd").val()) - Number(Number($("#abnoSetGoosShopPric"+abnoSetIdx).val()) * Number(abnoSetoldQty)) ;
            abnoSetTotalSettUsd = Number($("#abnoSetTotalSettUsd").val()) - Number(Number($("#abnoSetGoosSettUsdc"+abnoSetIdx).val()) * Number(abnoSetoldQty)) ;
        }
    }
}

var abnoSetEssnGoosQtyVal = 0; 
var abnoTotalSetGoosQtyVal = 0;

var checkOnlnGoosCd = [];
var checkedSetGoosQty = [];

$("input[name='abnoSetGoosQty']").each(function() {
    var idx = $(this).attr("data-idx");
    var abnoSetEssnYn = $(this).attr("data-abnoSetEssnYn");

    if(abnoSetIdx !== idx){ 
        if(abnoSetEssnYn === 'Y'){
            abnoSetEssnGoosQtyVal += Number($("#abnoCount"+idx).val());
        }
        checkedSetGoosQty.push($("#abnoCount"+idx).val()); 
        checkOnlnGoosCd.push($("#abnoOnlnGoosCd"+idx).val()); 
        abnoTotalSetGoosQtyVal += Number($("#abnoCount"+idx).val());
    }
});

if(goosChoiClsCd === '002'  &&  essnYn === 'Y'){
    if(abnoSetGoosQty > Number(goosQty) + Number(abnoSetEssnGoosQtyVal) ){
       goosQty = abnoSetoldQty;
       alert("필수 상품은 %s 개 이상 구매가 가능합니다.".replace("%s", abnoSetGoosQty)); 
   }
}

checkedSetGoosQty.push(goosQty); 
checkOnlnGoosCd.push($("#abnoOnlnGoosCd"+abnoSetIdx).val()); 
abnoTotalSetGoosQtyVal = Number(abnoTotalSetGoosQtyVal) + Number(goosQty);  

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/getChangeAbnoSetGoosQty.json',
    method: "post",
    data: {abnoTotalSetGoosQty : abnoTotalSetGoosQtyVal, setGoosId : abnoSetGoosId ,checkedSetGoosQty : checkedSetGoosQty.join(",")  , checkOnlnGoosCd : checkOnlnGoosCd.join(",")},
    async: false,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {

        var vResultCode = data.resultCode;
        var vInfo = data.info;
        
        if(vResultCode == 0 ){ 
             alert('처리중 오류가 발생하였습니다.'); 
        }else{
            
             if(Number(goosQty) <= Number(abnoOrderMinQty)){
                $("#abnoSetMinGoosQty"+ abnoSetIdx).attr("disabled" ,true);
                $("#abnoSetMinGoosQty"+ abnoSetIdx).css("cursor" ,'default');
             }else{
                $("#abnoSetMinGoosQty"+ abnoSetIdx).attr("disabled" ,false);
                $("#abnoSetMinGoosQty"+ abnoSetIdx).css("cursor" ,'pointer');
             }

             $("#abnoTotalSetGoosQty").val(abnoTotalSetGoosQtyVal);  
             $("#abnoSetEssnGoosQty").val(abnoSetEssnGoosQtyVal);      
             
             $("#abnoCount"+abnoSetIdx).val(goosQty); 
             $("#abnoChangeGoosQty"+abnoSetIdx).val(goosQty); 
             
             $("#abnoTotalGoosQty").text(abnoTotalSetGoosQtyVal);  
             $("#abnoTotalDcRate").text("(적용할인율 "+vInfo.dcRate+" %)");  
             
             $("#abnoSetTotalGoosUsd").val(vInfo.abnoTotalGoosUsd);  
             $("#abnoTotalGoosUsd").text("$" + comma(vInfo.abnoTotalGoosUsd.toFixed(2)) );  
             
             $("#abnoSetTotalSettUsd").val(vInfo.abnoTotalSettUsd);  
             $("#abnoTotalSettUsd").text("$" + comma(vInfo.abnoTotalSettUsd.toFixed(2)) );   
             
             $("#abnoSetTotalSettKrw").val(vInfo.abnoTotalSettKrw);  
             $("#abnoTotalSettKrw").text("("+comma(Number(vInfo.abnoTotalSettKrw).toFixed(0))+"원)"); 
        }
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.'); 
    }
});
}


function abnoSetGoosQty() {

var exit = false;

var abnoSetGoosQty = 0; 
var abnoChangeGoosQty = 0; 
var abnoSetOnlnGoosCd = 0;

var checkedSetGoosQty = [];
var checkSetEssnGoosQty = [];
var checkedSetOnlnGoosCd = [];

var abnoSetGoosId = $("#abnoSetGoosId").val();
var essnGoosQty = Number($("#essnGoosQty").val());
var totalBuyQty = Number($("#totalBuyQty").val());
var abnoSetEssnGoosQty = Number($("#abnoSetEssnGoosQty").val());
var abnoTotalSetGoosQty =  Number($("#abnoTotalSetGoosQty").val());


$("input[name='abnoChangeGoosQty']").each(function() {
    var idx = $(this).attr("data-idx");
    var abnoSetEssnYn = $(this).attr("data-abnoSetEssnYn");

    var onlnGoosCd =  $("#abnoOnlnGoosCd"+idx).val();
    var goosQty =  Number($("#abnoChangeGoosQty"+idx).val());
    var orderMinQty =  Number($("#abnoOrderMinQty"+idx).val());
    
    if(abnoSetEssnYn === 'Y'){
        checkSetEssnGoosQty.push(goosQty);
    }
    
    if(goosQty < orderMinQty  && goosQty > 0 ){
        alert("최소구매수량이 변경되었습니다."); 
        exit = true;
    }
    checkedSetGoosQty.push(goosQty);
    checkedSetOnlnGoosCd.push(onlnGoosCd);
});

if(exit){
   return false;
}

var totalCheckedSetEssnGoosQty = 0;
for(var j =0; j< checkSetEssnGoosQty.length; j++){
    totalCheckedSetEssnGoosQty += Number(checkSetEssnGoosQty[j]);
}

if(totalCheckedSetEssnGoosQty < essnGoosQty){
    alert("필수 상품은 %s 개 이상 구매가 가능합니다.".replace("%s", essnGoosQty)); 
    return false;
}

var totalCheckedSetGoosQty = 0;
for(var i =0; i< checkedSetGoosQty.length; i++){
    totalCheckedSetGoosQty += Number(checkedSetGoosQty[i]);
}

if(totalCheckedSetGoosQty < totalBuyQty){
    alert("세트 상품은 총 %s 개 이상 구매가 가능합니다.".replace("%s", totalBuyQty)); 
    return false;
}

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/abnoSetUpdateCartGoosQty.json',
    method: "post",
    data: {setGoosId : abnoSetGoosId ,   checkedSetGoosQty : checkedSetGoosQty.join(",") , checkedSetOnlnGoosCd : checkedSetOnlnGoosCd.join(",")},
    async: false,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        if(data.resultCode == 1) {
            $(".ui-front").remove();
            $(".pop_quantity").remove();
            cartReplace();
        }else{
            alert(data.message);
        }    
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
});    
}


function branAllchk (obj){

var branNm =  $(obj).attr("data-branNm");

$(".cartSeqs").each(function() {
    var index = $(this).attr("data-idx");
    var tempname = $(this).attr("data-branNm");
    
    if(branNm == tempname){
        
        if($('#cart_ch'+index).is(":checked") ){
            
            if($("#brand_tit"+index).is(":checked")){
                
                var brandNm = $("#brand_tit"+index).attr("data-branNm");
                
                $(".cartSeqs").each(function() {
                    var cartIndex = $(this).attr("data-idx");
                    var cartBrandNm = $(this).attr("data-branNm");
                    
                    if(brandNm == cartBrandNm){
                        $('#cart_ch'+cartIndex).prop("checked", true);
                    }
                });
                
            }else{
                
                var brandNm = $("#brand_tit"+index).attr("data-branNm");
                
                $(".cartSeqs").each(function() {
                    var cartIndex = $(this).attr("data-idx");
                    var cartBrandNm = $(this).attr("data-branNm");
                    
                    if(brandNm == cartBrandNm){
                        $('#cart_ch'+cartIndex).prop("checked", false);
                    }
                });
            }
            
        }else{
            
           if($("#brand_tit"+index).is(":checked")){
               
               var brandNm = $("#brand_tit"+index).attr("data-branNm");
               
               $(".cartSeqs").each(function() {
                   var cartIndex = $(this).attr("data-idx");
                   var cartBrandNm = $(this).attr("data-branNm");
                   
                   if(brandNm == cartBrandNm){
                       $('#cart_ch'+cartIndex).prop("checked", true);
                   }
               });
               
           }else{
               
               var brandNm = $("#brand_tit"+index).attr("data-branNm");
               
               $(".cartSeqs").each(function() {
                   var cartIndex = $(this).attr("data-idx");
                   var cartBrandNm = $(this).attr("data-branNm");
                   
                   if(brandNm == cartBrandNm){
                       $('#cart_ch'+cartIndex).prop("checked", false);
                   }
               });
           }
        }
    }
    setuSettAmt();
   
});    
}


function branAllDel(bran) {

var cartNos = [];
var branNm =  bran;
var confirmMsg = "";

var chkLength = 0; 
var notChkLength = 0; 
var totalGoosQty = 0;

$(".cartSeqs").each(function() {
    var index = $(this).attr("data-idx");
    var cartSeq = $(this).attr("data-cartSeq");
    var tempname = $(this).attr("data-branNm"); 
    
    if(branNm == tempname){
    
        if($('#cart_ch'+index).is(":checked")){
            cartNos.push(cartSeq);
            chkLength = $('#cart_ch'+index).length;
            totalGoosQty += $("#count"+index).val();
        }else{
            cartNos.push(cartSeq);
            notChkLength = $('#cart_ch'+index).length;
            totalGoosQty += $("#count"+index).val();
        }
    }
}); 


if(notChkLength > 0 ) {
    confirmMsg += '미선택된 상품이 있습니다. 브랜드 전체 상품을 삭제하시겠습니까?';  
}else if(notChkLength === 0 && chkLength === 0) {
    alert('선택된 상품이 없습니다.');
    return false;
}else{
    confirmMsg += '브랜드를 삭제하시겠습니까?';  
}
if (!confirm(confirmMsg)) {
    return false;
}

$.ajax({
    url: 'https://www.hddfs.com/shop/or/order/deleteSelectedbranAllCart.json',
    method: "post",
    data: {checkedCartSeq : cartNos.join(",")},
    async: true,
    dataType : 'json',
    success : function(data, textStatus, jqXHR) {
        
        if(crew.ajaxValidate(data, false)){
            if(data.resultCode == 1) {
                rwingCartCnt(totalGoosQty);
                alert('삭제되었습니다.');
                cartReplace();
            }
        } else {
            alert('처리중 오류가 발생하였습니다.');
        }
    },
    error : function(jqXHR, textStatus, errorThrown) {
        alert('처리중 오류가 발생하였습니다.');
    }
});    
}


function setuSettAmt(idx , flag){


var totalSettUsd = 0;
var totalSettKrw = 0;

var sumGoosQty = 0;
var sumGoosKind = 0;

var totalGoosUsd = 0;
var totalGoosKrw = 0;


var totalDcUsd = 0;
var totalDcKrw = 0;

var sumPmptDcCupDcAmt = 0;
var sumFinaPmptDcCupDcAmt = 0;
var totalInetMbshGoosDcKrw = 0;
var totalSetGoosDcKrw = 0;


var totalRsvgDcKrw =0; 
 
var totalHpoinRsvgAmt =0;

 
var totalSimpRsvgAmt =0;


var totalRsvg =0;


var setTotalGoosUsd = 0;
var setTotalGoosKrw = 0;

var setTotalSettUsd = 0;
var setTotalSettKrw = 0;

var setTotalDcUsd = 0;
var setTotalDcKrw = 0;


var setSumGoosQty = 0;   
var setTotalSettUsd  = 0;
var setTotalSettKrw  = 0;

var hpoinRsvgRate = 0;


if(typeof(idx) == "undefined"){
    
    
    var cartTotlength = 0;
    var cartSetCh = $(".chkSetCartSeq").length;
    var cartCh = $(".cartSeqs").length;
    
    
    var chkTotlength = 0;
    var chkCartSetCh = $('input:checkbox[name=chkSetCartSeq]:checked').length;
    var chkCartCh = $('input:checkbox[name=cartSeq]:checked').length;
    
    cartTotlength = Number(cartSetCh) + Number(cartCh);
    chkTotlength = Number(chkCartSetCh) + Number(chkCartCh);
    
    if(cartTotlength === chkTotlength){
        if($("#cart_chk1").is(":checked") == false){
           $("#cart_chk1").prop("checked", true);
        }
    }else{
        if($("#cart_chk1").is(":checked") == true){
            $("#cart_chk1").prop("checked", false);
        }
    }

    
    $("input[name='cartSeq']:checked").each(function() {
        
        var checkedIdx = $(this).attr("data-idx");
       
        totalSettUsd += Number($("#settUsd"+checkedIdx).val());
        totalSettKrw += Number($("#settKrw"+checkedIdx).val());
        totalDcUsd += Number($("#DcUsd"+checkedIdx).val());
        totalDcKrw += Number($("#DcKrw"+checkedIdx).val());
        totalGoosUsd += Number($("#goosUsd"+checkedIdx).val());
        totalGoosKrw += Number($("#goosKrw"+checkedIdx).val());
        sumGoosQty +=  Number($("#goosQty"+checkedIdx).val());
        sumFinaPmptDcCupDcAmt += Number($("#finaPmptDcCupDcAmt"+checkedIdx).val());
        totalInetMbshGoosDcKrw += Number($("#inetMbshGoosDcKrw"+checkedIdx).val());
        totalSetGoosDcKrw += Number($("#setGoosDcKrw"+checkedIdx).val());
        totalRsvgDcKrw += Number($("#rsvgDcKrw"+checkedIdx).val());
        totalHpoinRsvgAmt += Number($("#hpoinRsvgAmt"+checkedIdx).val());
        totalSimpRsvgAmt += Number($("#simpRsvgAmt"+checkedIdx).val());
        hpoinRsvgRate = Number($("#hpoinRsvgRate"+checkedIdx).val());
    });
    
    
    $("input[name='chkSetCartSeq']:checked").each(function() {
        
        var checkedIdx = $(this).attr("data-idx");
        
        sumGoosQty +=  Number($("#totSetGoosQtyVal"+checkedIdx).val()); 
        totalGoosUsd += Number($("#setTotalGoosUsd"+checkedIdx).val()); 
        totalGoosKrw += Number($("#setTotalGoosKrw"+checkedIdx).val());
        totalSettUsd += Number($("#setTotalSettUsd"+checkedIdx).val());
        totalSettKrw += Number($("#setTotalSettKrw"+checkedIdx).val());
        totalDcUsd += Number($("#setTotalDcUsd"+checkedIdx).val());
        totalDcKrw += Number($("#setTotalDcKrw"+checkedIdx).val());
        totalRsvgDcKrw += Number($("#setTotalRsvgDcKrw"+checkedIdx).val());
        totalHpoinRsvgAmt += Number($("#setHpoinRsvgAmt"+checkedIdx).val());
        totalSimpRsvgAmt += Number($("#setSimpRsvgAmt"+checkedIdx).val());
        hpoinRsvgRate =  Number($("#allTotalHpoinRsvgRate").val());
    });
    
}else{
    
    var allChk = "";
    
    if($("#cart_ch"+idx).is(":checked") == false){
        allChk = "Y";
    }else if($("#set_cart_chk"+idx).is(":checked") == false){
        allChk = "Y";
    }else{
        allChk = "N";
    }
    
    if($("#cart_chk1").is(":checked") == true){
        if(allChk === "Y"){
            $("#cart_chk1").prop("checked", false);
        }
    }
    
    var cartTotlength = 0;
    var cartCh = $(".cartSeqs").length;
    var cartSetCh = $(".chkSetCartSeq").length;
    
    var chkTotlength = 0;
    var chkCartCh = $('input:checkbox[name=cartSeq]:checked').length;
    var chkCartSetCh = $('input:checkbox[name=chkSetCartSeq]:checked').length;
    
    cartTotlength = Number(cartSetCh) + Number(cartCh);
    chkTotlength = Number(chkCartSetCh) + Number(chkCartCh);
    
    if(cartTotlength === chkTotlength){
        if($("#cart_chk1").is(":checked") == false){
           $("#cart_chk1").prop("checked", true);
        }
    }
    
    var baranAllChk = 0;
    var baranAllChkArry = []; 
    
    var baranChk = 0;
    var baranChkArry = []; 
    
    var chkLength = 0;
    
    var baranTempName = "";
    var chkBaranTempName = "";
    
    var baranAllArry = [];
    
    
    if($("#cartCd").val() === "005"){
        
           $("input[name='cartSeq']").each(function(idx) {
            
            var index = $(this).attr("data-idx");
            chkBaranTempName = $(this).attr("data-branNm");
            
            baranAllArry.push(chkBaranTempName);
            
            if(chkBaranTempName != baranTempName){
                
                if(baranAllChk > 0){
                    baranAllChkArry.push(baranAllChk);
                }
                
                if(chkLength > 0){
                    baranChkArry.push(baranChk);
                }
                
                baranAllChk = 0;
                baranChk = 0;
            }
                
            baranTempName = chkBaranTempName;
            
            if(chkBaranTempName == baranTempName){
                
                chkLength = Number(chkLength)+1;
                baranAllChk = Number(baranAllChk) +1; 
                
                if($(this).is(":checked") == true){
                    baranChk = Number(baranChk) +1; 
                }else{
                    baranChk = Number(baranChk);
                }
            }
            
            if($("input[name='cartSeq']").length == baranAllArry.length){
                baranAllChkArry.push(baranAllChk);
                baranChkArry.push(baranChk);
            } 
        });
           
        for(var i =0; i< baranAllChkArry.length; i++){
            if(baranAllChkArry[i].toString() != baranChkArry[i].toString()){
                $(".branCartSeqs").each(function() {
                    var brandidx =  $(this).attr("data-brandidx");
                    if(i == brandidx){
                        if($(this).is(":checked") == true){
                           $(this).prop("checked", false);
                        }       
                    }
                });
            }else{
                $(".branCartSeqs").each(function() {
                    var brandidx =  $(this).attr("data-brandidx");
                    
                    if(i == brandidx){
                        if($(this).is(":checked") == false){
                           $(this).prop("checked", true);
                        }       
                    }
                });
            }
        }
    }
    
    if(flag === "cartGoos"){
        
        if($("#cart_ch"+idx).is(":checked") == true){
            totalSettUsd = Number($("#totalSettUsd").val()) + Number($("#settUsd"+idx).val());
            totalSettKrw = Number($("#totalSettKrw").val()) + Number($("#settKrw"+idx).val());
            totalDcUsd = Number($("#totalDcUsd").val()) + Number($("#DcUsd"+idx).val());
            totalDcKrw = Number($("#totalDcKrw").val()) + Number($("#DcKrw"+idx).val());
            totalGoosUsd = Number($("#totalGoosUsd").val()) + Number($("#goosUsd"+idx).val());
            totalGoosKrw = Number($("#totalGoosKrw").val()) + Number($("#goosKrw"+idx).val());
            sumGoosQty =   Number($("#sumGoosQty").val()) + Number($("#goosQty"+idx).val());
            sumFinaPmptDcCupDcAmt = Number($("#sumFinaPmptDcCupDcAmt").val()) + Number($("#finaPmptDcCupDcAmt"+idx).val());
            totalInetMbshGoosDcKrw = Number($("#totalInetMbshGoosDcKrw").val()) + Number($("#inetMbshGoosDcKrw"+idx).val());
            totalSetGoosDcKrw = Number($("#totalSetGoosDcKrw").val()) + Number($("#setGoosDcKrw"+idx).val());
            totalRsvgDcKrw = Number($("#totalRsvgDcKrw").val()) + Number($("#rsvgDcKrw"+idx).val());
            totalHpoinRsvgAmt = Number($("#totalHpoinRsvgAmt").val()) + Number($("#hpoinRsvgAmt"+idx).val());
            totalSimpRsvgAmt = Number($("#totalSimpRsvgAmt").val()) + Number($("#simpRsvgAmt"+idx).val());
            hpoinRsvgRate = Number($("#hpoinRsvgRate"+idx).val());

        }else{ 
            totalSettUsd = Number($("#totalSettUsd").val()) - Number($("#settUsd"+idx).val());
            totalSettKrw = Number($("#totalSettKrw").val()) - Number($("#settKrw"+idx).val());
            totalDcUsd = Number($("#totalDcUsd").val()) - Number($("#DcUsd"+idx).val());
            totalDcKrw = Number($("#totalDcKrw").val()) - Number($("#DcKrw"+idx).val());
            totalGoosUsd = Number($("#totalGoosUsd").val()) - Number($("#goosUsd"+idx).val());
            totalGoosKrw = Number($("#totalGoosKrw").val()) - Number($("#goosKrw"+idx).val());
            sumGoosQty = Number($("#sumGoosQty").val()) - Number($("#goosQty"+idx).val());
            sumFinaPmptDcCupDcAmt = Number($("#sumFinaPmptDcCupDcAmt").val()) - Number($("#finaPmptDcCupDcAmt"+idx).val());
            totalInetMbshGoosDcKrw = Number($("#totalInetMbshGoosDcKrw").val()) - Number($("#inetMbshGoosDcKrw"+idx).val());
            totalSetGoosDcKrw = Number($("#totalSetGoosDcKrw").val()) - Number($("#setGoosDcKrw"+idx).val());
            totalRsvgDcKrw = Number($("#totalRsvgDcKrw").val()) - Number($("#rsvgDcKrw"+idx).val());
            totalHpoinRsvgAmt = Number($("#totalHpoinRsvgAmt").val()) - Number($("#hpoinRsvgAmt"+idx).val());
            totalSimpRsvgAmt = Number($("#totalSimpRsvgAmt").val()) - Number($("#simpRsvgAmt"+idx).val());
            hpoinRsvgRate =  0;
        
        }
        
    }else if(flag === "setGoos"){

       
       if($("#set_cart_chk"+idx).is(":checked") == true){
           
           sumGoosQty =  Number($("#sumGoosQty").val()) + Number($("#totSetGoosQtyVal"+idx).val()); 
           totalGoosUsd = Number($("#totalGoosUsd").val()) + Number($("#setTotalGoosUsd"+idx).val()); 
           totalGoosKrw = Number($("#totalGoosKrw").val()) + Number($("#setTotalGoosKrw"+idx).val());
           totalSettUsd = Number($("#totalSettUsd").val()) + Number($("#setTotalSettUsd"+idx).val());
           totalSettKrw = Number($("#totalSettKrw").val()) + Number($("#setTotalSettKrw"+idx).val());
           totalDcUsd = Number($("#totalDcUsd").val()) + Number($("#setTotalDcUsd"+idx).val());
           totalDcKrw = Number($("#totalDcKrw").val()) + Number($("#setTotalDcKrw"+idx).val());
           totalRsvgDcKrw = Number($("#totalRsvgDcKrw").val()) + Number($("#setTotalRsvgDcKrw"+idx).val());
           totalHpoinRsvgAmt = Number($("#totalHpoinRsvgAmt").val()) + Number($("#setHpoinRsvgAmt"+idx).val());
           totalSimpRsvgAmt = Number($("#totalSimpRsvgAmt").val()) + Number($("#setSimpRsvgAmt"+idx).val());
           hpoinRsvgRate =  Number($("#allTotalHpoinRsvgRate").val());
               
       }else{
           
           sumGoosQty =  Number($("#sumGoosQty").val()) - Number($("#totSetGoosQtyVal"+idx).val());
           totalGoosUsd = Number($("#totalGoosUsd").val()) - Number($("#setTotalGoosUsd"+idx).val());  
           totalGoosKrw = Number($("#totalGoosKrw").val()) - Number($("#setTotalGoosKrw"+idx).val());
           totalSettUsd = Number($("#totalSettUsd").val()) - Number($("#setTotalSettUsd"+idx).val()); 
           totalSettKrw = Number($("#totalSettKrw").val()) - Number($("#setTotalSettKrw"+idx).val()); 
           totalDcUsd = Number($("#totalDcUsd").val()) - Number($("#setTotalDcUsd"+idx).val()); 
           totalDcKrw = Number($("#totalDcKrw").val()) - Number($("#setTotalDcKrw"+idx).val()); 
           totalRsvgDcKrw = Number($("#totalRsvgDcKrw").val()) - Number($("#setTotalRsvgDcKrw"+idx).val()); 
           totalHpoinRsvgAmt = Number($("#totalHpoinRsvgAmt").val()) - Number($("#setHpoinRsvgAmt"+idx).val()); 
           totalSimpRsvgAmt = Number($("#totalSimpRsvgAmt").val()) - Number($("#setSimpRsvgAmt"+idx).val());
           hpoinRsvgRate =  0;
           
       } 
    }
}

if(totalRsvgDcKrw =='0' && totalSettKrw =='0' ){
    totalRsvg = 0;
}else{
    totalRsvg = (totalRsvgDcKrw / totalGoosKrw)*100;
}


if(totalRsvgDcKrw >= 0){
    $("#totalRsvgDcKrwDl").show();
}else{
    $("#totalRsvgDcKrwDl").hide();
}


$("#totalRsvgDcKrw").val(totalRsvgDcKrw); 
$(".totalRsvgDcKrw").text(comma(totalRsvgDcKrw.toFixed(0)) + '원');
$(".totalRsvg").text(""+ comma(totalRsvg.toFixed(1)) +"%");


$("#totalHpoinRsvgAmt").val(totalHpoinRsvgAmt); 
$(".totalHpoinRsvgAmt").text(comma(totalHpoinRsvgAmt.toFixed(0)) + "P"); 
$(".totalhpoinRsvgRat").text(""+ comma(hpoinRsvgRate.toFixed(1)) +"%");


$("#totalSimpRsvgAmt").val(totalSimpRsvgAmt);
$(".totalSimpRsvgAmt").text(comma(totalSimpRsvgAmt.toFixed(0)) + "P"); 


$("#totalDcUsd").val(totalDcUsd);
$("#totalDcKrw").val(totalDcKrw);
$(".totalDcUsd").text("$" + comma(totalDcUsd.toFixed(2)));
$(".totalDcKrw").text(comma(Math.floor(totalDcKrw)) + '원');


$("#totalGoosUsd").val(totalGoosUsd);
$("#totalGoosKrw").val(totalGoosKrw);

$(".totalGoosUsd").text("$" + comma(totalGoosUsd.toFixed(2)) );
$(".totalGoosKrw").text(comma(Math.floor(totalGoosKrw)) + '원');


var totalExptSettAmtUsd = 0;
var totalExptSettAmtKrw = 0;
var totalExptSettGoosQty = 0;


var notTotalExptSettAmtUsd = 0;
var notTotalExptSettAmtKrw = 0;
var notTotalExptSettGoosQty = 0;

if($("#rost_cart_chk1").is(":checked")){
    
     notTotalExptSettAmtUsd = $("#notTotalExptSettAmtUsd").val(); 
     notTotalExptSettAmtKrw = $("#notTotalExptSettAmtKrw").val();
     notTotalExptSettGoosQty = $("#notTotalExptSettGoosQty").val();
     
     var rostTotalExptSettAmtUsd =  Number(totalSettUsd) + Number(notTotalExptSettAmtUsd);
     var rostTotalExptSettAmtKrw =  Number(totalSettKrw) + Number(notTotalExptSettAmtKrw);
     var rostTotalExptSettGoosQty =  Number(sumGoosQty) + Number(notTotalExptSettGoosQty);
     
     totalExptSettAmtUsd = rostTotalExptSettAmtUsd;
     totalExptSettAmtKrw = rostTotalExptSettAmtKrw;
     totalExptSettGoosQty = rostTotalExptSettGoosQty;
    
}else{
    
  $("#notTotalExptSettAmtUsd").val(notTotalExptSettAmtUsd);
  $("#notTotalExptSettAmtKrw").val(notTotalExptSettAmtKrw);
  $("#notTotalExptSettGoosQty").val(notTotalExptSettGoosQty);
  
  totalExptSettAmtUsd = totalSettUsd;
  totalExptSettAmtKrw = totalSettKrw;
  totalExptSettGoosQty = sumGoosQty;
}

if(totalExptSettAmtUsd <= 0){
    totalExptSettAmtUsd = 0;
}

$("#totalExptSettAmtUsd").val(totalSettUsd);
$("#totalExptSettAmtKrw").val(totalSettKrw);
$("#totalExptSettGoosQty").val(sumGoosQty);

$("#totalSettUsd").val(totalSettUsd); 
$("#totalSettKrw").val(totalSettKrw); 
$("#sumGoosQty").val(sumGoosQty);     

if(first <= 0){
    $("#oldsumGoosQty").val(sumGoosQty);     
}
first = 1;

$(".sumGoosQty").text(comma(totalExptSettGoosQty)); 
$(".payTotalSettUsd").text("$" + comma(totalExptSettAmtUsd.toFixed(2)) );  
$(".payTotalSettKrw").text(comma(Math.floor(totalSettKrw)) + '원');
}


function setRostUSettAmt(){


var totalSettUsd = 0;
var totalSettKrw = 0;


var sumGoosQty = 0;
var sumGoosKind = 0;


var totalGoosUsd = 0;
var totalGoosKrw = 0;


var totalDcUsd = 0;
var totalDcKrw = 0;

var sumPmptDcCupDcAmt = 0;
var totalSetGoosDcKrw = 0;
var sumFinaPmptDcCupDcAmt = 0;
var totalInetMbshGoosDcKrw = 0;

var totalRsvgDcKrw =0; 
var totalHpoinRsvgAmt =0;
var totalHpoinRsvgAmt =0;


var totalRsvg =0;

if($("#rost_cart_chk1").is(":checked")){
    
    $("input[name='cartSeq_Soldout']:not(:checked)").each(function() {
        
        var checkedIdx = $(this).attr("data-idx");
        
        totalSettUsd += Number($("#settUsd"+checkedIdx).val());
        totalSettKrw += Number($("#settKrw"+checkedIdx).val());
        totalDcUsd += Number($("#DcUsd"+checkedIdx).val());
        totalDcKrw += Number($("#DcKrw"+checkedIdx).val());
        totalGoosUsd += Number($("#goosUsd"+checkedIdx).val());
        totalGoosKrw += Number($("#goosKrw"+checkedIdx).val());
        sumGoosQty +=  Number($("#soldoutGoosQty"+checkedIdx).val());
        sumGoosKind += Number($("#goosKind"+checkedIdx).val());
        sumFinaPmptDcCupDcAmt += Number($("#finaPmptDcCupDcAmt"+checkedIdx).val());
        totalInetMbshGoosDcKrw += Number($("#inetMbshGoosDcKrw"+checkedIdx).val());
        totalSetGoosDcKrw += Number($("#setGoosDcKrw"+checkedIdx).val());
        totalRsvgDcKrw += Number($("#rsvgDcKrw"+checkedIdx).val());
        totalHpoinRsvgAmt += Number($("#hpoinRsvgAmt"+checkedIdx).val());
        totalSimpRsvgAmt += Number($("#simpRsvgAmt"+checkedIdx).val());
        
    });
    
    $("input[name='setSeqSoldout']:not(:checked)").each(function(){
        
        var setCheckedIdx = $(this).attr("data-idx");
        
        sumGoosQty +=  Number($("#soldoutSetSetQty"+setCheckedIdx).val()); 
        totalSettUsd += Number($("#soldoutSetTotalSettUsd"+setCheckedIdx).val());
        totalSettKrw += Number($("#soldoutSetTotalSettKrw"+setCheckedIdx).val());
        totalDcUsd += Number($("#soldoutSetTotalDcUsd"+setCheckedIdx).val());
        totalDcKrw += Number($("#soldoutSetTotalDcKrw"+setCheckedIdx).val());
        totalGoosUsd += Number($("#soldoutSetTotalGoosUsd"+setCheckedIdx).val());
        totalGoosKrw += Number($("#soldoutSetTotalGoosKrw"+setCheckedIdx).val());
        totalRsvgDcKrw += Number($("#soldoutSetTotalRsvgDcKrw"+setCheckedIdx).val());
        totalHpoinRsvgAmt += Number($("#soldoutSetHpoinRsvgAmt"+setCheckedIdx).val());
        totalSimpRsvgAmt += Number($("#soldoutSetSimpRsvgAmt"+setCheckedIdx).val());
        
    });
    
    $("input[name='chkSetCartSeq']").each(function(){
        
        var setCheckedIdx = $(this).attr("data-idx");
        
        totalSettUsd += Number($("#abnoSetTotalSettUsd"+setCheckedIdx).val());
        totalSettKrw += Number($("#abnoSetTotalSettKrw"+setCheckedIdx).val());
    });
}

if(totalRsvgDcKrw =='0' && totalSettKrw =='0' ){
    totalRsvg = 0;
}else{
    totalRsvg = (totalRsvgDcKrw / totalSettKrw)*100;
}

var chkTotalExptSettAmtUsd = 0;
var chkTotalExptSettAmtKrw = 0;
var chkTotalExptSettGoosQty = 0;

var totalExptSettAmtUsd = 0;
var totalExptSettAmtKrw = 0;
var totalExptSettGoosQty = 0;

var setResult = false;

$("#allTotalSetSettUsd").val(0);
$("#allTotalSetSettKrw").val(0);
$("#allTotalSetGoosQty").val(0);

if( $("#totalExptSettAmtUsd").val() == 0 && $("#allTotalSetSettUsd").val() > 0 ){ 
    
    chkTotalExptSettAmtUsd =   Number($("#allTotalSetSettUsd").val());
    chkTotalExptSettAmtKrw =   Number($("#allTotalSetSettKrw").val());
    chkTotalExptSettGoosQty =  Number($("#allTotalSetGoosQty").val());
    setResult = true;
    
}else if($("#totalExptSettAmtUsd").val() > 0 &&  $("#allTotalSetSettUsd").val()> 0){
   
   chkTotalExptSettAmtUsd =  Number($("#totalExptSettAmtUsd").val()) +  Number($("#allTotalSetSettUsd").val());
   chkTotalExptSettAmtKrw =  Number($("#totalExptSettAmtKrw").val()) +  Number($("#allTotalSetSettKrw").val());
   chkTotalExptSettGoosQty = Number($("#totalExptSettGoosQty").val()) + Number($("#allTotalSetGoosQty").val());
   setResult = true;
   
}else if($("#totalExptSettAmtUsd").val() > 0 &&  $("#allTotalSetSettUsd").length == 0 ){
   
   chkTotalExptSettAmtUsd = $("#totalExptSettAmtUsd").val();
   chkTotalExptSettAmtKrw = $("#totalExptSettAmtKrw").val();
   chkTotalExptSettGoosQty = $("#totalExptSettGoosQty").val();
   
}else if($("#totalExptSettAmtUsd").val() > 0 &&  $("#allTotalSetSettUsd").val() == 0 ){
   
   chkTotalExptSettAmtUsd = $("#totalExptSettAmtUsd").val();
   chkTotalExptSettAmtKrw = $("#totalExptSettAmtKrw").val();
   chkTotalExptSettGoosQty = $("#totalExptSettGoosQty").val();
}

if(setResult){
   
   $("#totalExptSettAmtUsd").val(Number($("#totalExptSettAmtUsd").val()) +  Number($("#allTotalSetSettUsd").val()));
   $("#totalExptSettAmtKrw").val(Number($("#totalExptSettAmtKrw").val()) +  Number($("#allTotalSetSettKrw").val()));
   $("#totalExptSettGoosQty").val(Number($("#totalExptSettGoosQty").val()) +  Number($("#allTotalSetGoosQty").val()));
}

if($("#rost_cart_chk1").is(":checked")){ 
   if(chkTotalExptSettAmtUsd > 0 && chkTotalExptSettAmtKrw > 0){
       totalExptSettAmtUsd =  Number(chkTotalExptSettAmtUsd) + Number(totalSettUsd);
       totalExptSettAmtKrw =  Number(chkTotalExptSettAmtKrw) + Number(totalSettKrw);  
       totalExptSettGoosQty =  Number(chkTotalExptSettGoosQty) + Number(sumGoosQty);  
   }else{
       totalExptSettAmtUsd = totalSettUsd;
       totalExptSettAmtKrw = totalSettKrw;   
       totalExptSettGoosQty = sumGoosQty;   
   }
}else{
   if(chkTotalExptSettAmtUsd > 0 && chkTotalExptSettAmtKrw > 0){
       totalExptSettAmtUsd =  Number(chkTotalExptSettAmtUsd) + Number(totalSettUsd);
       totalExptSettAmtKrw =  Number(chkTotalExptSettAmtKrw) + Number(totalSettKrw);  
       totalExptSettGoosQty =  Number(chkTotalExptSettGoosQty) + Number(sumGoosQty);  
   }else{
       totalExptSettAmtUsd =  totalSettUsd;
       totalExptSettAmtKrw =  totalSettKrw;
       totalExptSettGoosQty = sumGoosQty;  
   }           
}

$("#notTotalExptSettAmtUsd").val(totalSettUsd);
$("#notTotalExptSettAmtKrw").val(totalSettKrw);
$("#notTotalExptSettGoosQty").val(sumGoosQty);

$(".sumGoosQty").text(comma(totalExptSettGoosQty)); 
$(".payTotalSettUsd").text("$" + comma(totalExptSettAmtUsd.toFixed(2)) );  
$(".payTotalSettKrw").text(comma(totalExptSettAmtKrw.toFixed(0))+ '원'); 
}


function cartReplace(scrollMoveYn){


$("#selfReplaceCartCd").val($("#cartCd").val());
if(scrollMoveYn == "Y") {
    $("#selfReplaceScrollMove").val($(window).scrollTop());
} else {
    $("#selfReplaceScrollMove").val(0);
}
$("#selfReplace").submit();
}



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

    console.log("listCart");
    
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

    console.log("listCart");
    
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

    console.log("listCart");
    
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

<form id="selfReplace" action="https://www.hddfs.com/shop/or/order/listCart.do" method="post">
<input id="selfReplaceCartCd" type="hidden" name="cartCd" value="">
<input id="selfReplaceScrollMove" type="hidden" name="scrollMove" value="">
</form>

<article id="content">
<section class="cart_wrap">
<input type="hidden" id="checkedCartSeq" value=""> <input type="hidden" id="checkedCartSetId" value=""> <input type="hidden" id="buyNow" value=""><input type="hidden" id="buyNowSetGoosId" value=""><input type="hidden" id="chkPspt" value="0"> <input type="hidden" id="chkDpat" value="0"> <input type="hidden" id="buyNowType" value=""> <input type="hidden" id="buyNowOnlnGoosCdList" value=""> <input type="hidden" id="adtAucaYn" value="N"> <ul class="title_tab">
<li><a href="javascript:void(0);" onclick="goCartTab(&quot;CART&quot;);" class="" id="tabCart">장바구니</a></li>
<li><a href="javascript:void(0);" onclick="goCartTab(&quot;PSPT&quot;);" class="on" id="tabPspt">여권정보</a></li>
<li><a href="javascript:void(0);" onclick="goCartTab(&quot;DPAT&quot;);" class="" id="tabDpat">출국정보</a></li>
<li>주문결제</li>
</ul>
<div class="cart_contens">
<div class="cont_left" id="CART" style="display: none;">
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
    <span class="chk nolabel">
        <input type="checkbox" name="" id="cart_chk1" checked="checked">
        <label for="cart_chk1">선택</label>
    </span>
    <div class="cartdel_btn">
        <a href="javascript:void(0);" onclick="deleteSelectedCart();">선택삭제</a>
        <a href="javascript:void(0);" onclick="deleteRostCart();">품절삭제</a>
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
<div class="cart_list">
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
        <input type="hidden" id="orderMinQty0" value="1"> <div class="item_area">
                    <div class="item_chk">
                        <span class="chk nolabel">
                            <input type="checkbox" name="cartSeq" id="cart_ch0" value="439727524" onclick="setuSettAmt('0','cartGoos');" class="cartSeqs" data-onlngooscd="10073250016301" data-idx="0" checked="">
                            <label for="cart_ch0">선택</label>
                        </span>
                        <div class="btn_area">
                            <button class="btn_onoff btn_pin" onclick="mergeCnrRetn('439727524','10073250016301',this)">핀</button>
                                    <input type="hidden" id="btn_pin0" value="N">
                                        <button class="btn_onoff btn_like" onclick="registCnrGoos('10073250016301', '0' ,this);">좋아요</button>
                                    <button class="btn_onoff btn_del" onclick="deleteCart(439727524, 'N', '0','','N');">삭제</button>
                                </div>
                    </div>
                    <div class="item_cont type_de">
                        <div class="item_info_wrap">
                                <a href="
                                    https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10073250016301
                                ">
                                <div class="item_img">
                                    <img src="https://cdn.hddfs.com/files/goos/0073/20220422/70852e7b.png?sf=webp&amp;RS=148x148" alt="키엘 클리어리 코렉티브 다크 스팟 솔루션 115ML" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img252.jpg';">
                                        </div>
                                <div class="por_icons">
                                    <span class="pr_sale">세일</span><!-- #156. 선주호. 상품 3시간전, 5시간전 아이콘 삭제 및 조건검색항목 삭제

-->
</div>
                                <div class="item_title">
                                    <strong>키엘 </strong>
                                    <span>키엘 클리어리 코렉티브 다크 스팟 솔루션 115ML</span>  
                                </div>
                                <del>$148</del>
                                            <p class="pay">
                                                <strong>$103.6</strong>
                                                <span>128,546원</span>
                                            </p>                                                
                                            </a>
                            <div class="item_sel">
                                </div>
                        </div>
                        <div class="item_buy_wrap">
                            <div class="item_buy">
                                <div class="num_amount cart_amount">
                                    <input value="-" type="button" disabled="disabled" id="minGoosQty0" onclick="changeGoosQty(439727524,'0','m',this', false);">
                                            <input type="text" class="count" id="count0" value="1" min="0" name="goosQty" maxlength="5" onkeyup="isNumber(this);" onfocusout="changeGoosQty(439727524,'0','c',this, false);">                                          
                                        
                                        <input value="+" type="button" onclick="changeGoosQty(439727524,'0','p',this, false);">
                                            </div>
                                <button type="button" class="btnde_type1 large" onclick="goOrder(439727524);"><span class="font_14b">바로구매</span></button> 
                            </div>
                        </div>                                     
                    </div>                              
                </div>
            <hr class="hr_part">
                <input type="hidden" value="N" name="spordYn">
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
                <input type="hidden" id="setGoosDcKrw1" value="0">
            <div class="item_area">
            <div class="item_chk">
                <span class="chk nolabel">
                    <input type="checkbox" name="cartSeq_Soldout" id="cart_ch1" value="439727492" onclick="setuSettAmt('1','cartGoos');" class="cartSeqssoldout" data-idx="1" disabled="disabled">
                    <label for="cart_ch1">선택</label>
                </span>
                <div class="btn_area">
                    <button class="btn_del" onclick="deleteCart(439727492, 'N' ,'1' ,'Y','N');">삭제</button>
                        </div>
            </div>
            <div class="item_cont type_de">
                <div class="item_info_wrap soldout">
                    <a href="
                        https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10073250002901
                    ">                           
                    <div class="item_img">
                        <img src="https://cdn.hddfs.com/files/goos/0073/20221115/3333a006.jpg?sf=webp&amp;RS=148x148" alt="키엘 울트라 라이트 데일리 유브이 디팬스 썬스크린,키엘 선크림" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img252.jpg';">
                            </div>
                    <div class="por_icons">
                        <span class="pr_sale">세일</span><!-- #156. 선주호. 상품 3시간전, 5시간전 아이콘 삭제 및 조건검색항목 삭제

-->
</div>
                    <div class="item_title">
                        <strong>키엘 </strong>
                        <span>키엘 울트라 라이트 데일리 유브이 디팬스 썬스크린,키엘 선크림</span>
                    </div>
                    <del>$42</del>
                                    <p class="pay">
                                        <strong>$29.4</strong>
                                        <span>36,479원</span>
                                    </p>                                                
                                </a>
                    <div class="item_sel">
                        </div>                                  
                </div>
                <div class="item_buy_wrap">
                    <div class="item_buy">
                        <input type="hidden" name="rostCartSeq" data-idx="1" value="439727492">                                  
                        <button type="button" class="btnde_type1 large bg_cgrey" onclick="addAginRecpNtc('10073250002901')">재입고알림</button>
                    </div>
                </div>                                  
            </div>                          
        </div>                        
    <input type="hidden" value="N" name="spordYn">
        <input type="hidden" value="N" name="hshareYn">
        <input type="hidden" id="stokQty2" value="0">
        <input type="hidden" id="goosUsd2" value="320.0">
        <input type="hidden" id="goosKrw2" value="397056">
        <input type="hidden" id="DcUsd2" value="96.0">
        <input type="hidden" id="settUsd2" value="224.0">
        <input type="hidden" id="settKrw2" value="277939">
        <input type="hidden" id="soldoutGoosQty2" value="1">
        <input type="hidden" id="goosKind2" value="1">
        <input type="hidden" id="pmptDcCupDcAmt2" value="0.0">
        <input type="hidden" id="finaPmptDcCupDcAmt2" value="0">                        
        <input type="hidden" id="rsvgDcKrw2" value="0"> <input type="hidden" id="hpoinRsvgAmt2" value="556.0"> <input type="hidden" id="hpoinRsvgRate2" value="0.2">    <input type="hidden" id="simpRsvgAmt2" value="556.0"> <input type="hidden" id="simpRsvgRate2" value="0.0">    <input type="hidden" id="oldGoosSeq2" value="">  
        <input type="hidden" id="orderMinQty2" value="1"> 
                    
        <input type="hidden" id="inetMbshGoosDcKrw2" value="119117">
                <input type="hidden" id="setGoosDcKrw2" value="0">
            <div class="item_area">
            <div class="item_chk">
                <span class="chk nolabel">
                    <input type="checkbox" name="cartSeq_Soldout" id="cart_ch2" value="439709534" onclick="setuSettAmt('2','cartGoos');" class="cartSeqssoldout" data-idx="2" disabled="disabled">
                    <label for="cart_ch2">선택</label>
                </span>
                <div class="btn_area">
                    <button class="btn_del" onclick="deleteCart(439709534, 'N' ,'2' ,'Y','N');">삭제</button>
                        </div>
            </div>
            <div class="item_cont type_de">
                <div class="item_info_wrap soldout">
                    <a href="
                        https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10677190000801
                    ">                           
                    <div class="item_img">
                        <img src="https://cdn.hddfs.com/files/goos/0677/20220923/dcfbdf06.JPG?sf=webp&amp;RS=148x148" alt="지포어 우먼 엠지포엑스투 골프 크로스 트레이너 WHITE  6.5 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/no_img252.jpg';">
                            </div>
                    <div class="por_icons">
                        <span class="pr_sale">세일</span><!-- #156. 선주호. 상품 3시간전, 5시간전 아이콘 삭제 및 조건검색항목 삭제

-->
</div>
                    <div class="item_title">
                        <strong>지포어</strong>
                        <span>지포어 우먼 엠지포엑스투 골프 크로스 트레이너 WHITE  6.5 </span>
                    </div>
                    <del>$320</del>
                                    <p class="pay">
                                        <strong>$224</strong>
                                        <span>277,939원</span>
                                    </p>                                                
                                </a>
                    <div class="item_sel">
                        </div>                                  
                </div>
                <div class="item_buy_wrap">
                    <div class="item_buy">
                        <input type="hidden" name="rostCartSeq" data-idx="2" value="439709534">                                  
                        <button type="button" class="btnde_type1 large bg_cgrey" onclick="addAginRecpNtc('10677190000801')">재입고알림</button>
                    </div>
                </div>                                  
            </div>                          
        </div>                        
    </div>

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
<div class="cont_left" id="TAB" style="display: block;"><script type="text/javascript">

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

function savPsptInfo() {

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
<div class="passport_wrap">
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
</div>

<div id="mbshPwdPop"></div>
<div id="layer_popup" class="pop_quantity" title="SMS 인증"></div>  
<div id="popTcndCont" class="pop_tcndCont" title=""></div>


<script type="text/javascript">
$(document).ready(function(){
$(".loadProgBar").css("display","none");
});
</script>
</div> 
<div class="cont_right" style="height: 415.333px;">
   <div class="pay_table">
           <div class="pay_tit">예상주문금액</div>
           <div class="pay_list">
               <dl>
                   <dt>주문금액합계</dt> 
                   <dd>
                       <strong class="totalGoosUsd">$148.00</strong>
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
           <div class="pay_btm" style="display: none;">
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


function maxDcAmtInfo(){
    
var setGoosId = [];
var setGoooCd = [];
var setGoosQty = [];

$("input[name='chkSetCartSeq']:checked").each(function() {
    var checkedsetGoosId = $(this).attr("data-setGoosId");
    var checkedSetIdx = $(this).attr("data-idx");
    
    $("input[name='setGoosQtyVal']").each(function() {
        
        var index = $(this).attr("data-idx");
        var goosQty = 0; 
        var onlnGoosCd = 0; 
        if(checkedSetIdx === index){
            goosQty = $(this).attr("data-goosQty");
            onlnGoosCd = $(this).attr("data-setOnlnGoosCd");
            setGoosQty.push(goosQty);
            setGoooCd.push(onlnGoosCd);
        }
        
    });
});
    
var goosQtyList = [];
var onlineGoosCdList = [];
$("input[name='cartSeq']:checked").each(function() {
    var checkedIdx = $(this).attr("data-idx");
    var onlnGoosCd = $(this).attr("data-onlnGoosCd");
    var goosQty = $("#goosQty"+checkedIdx).val();
    
    onlineGoosCdList.push(onlnGoosCd);
    goosQtyList.push(goosQty);
});

goosQtyList = goosQtyList.join(",");
onlineGoosCdList = onlineGoosCdList.join(",");

setGoooCd = setGoooCd.join(",");
setGoosQty = setGoosQty.join(",");

getMaxDcPrc(onlineGoosCdList, goosQtyList, setGoooCd ,setGoosQty);
}


function goosDetail(goosCd){
setCookie('ADULT_GOOSCD', goosCd);
openPopup('','cartGoosCdDetail',goosCd,'','','','','');
}

</script>
</main>