<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>

<script type="text/javascript">
	console.log("토큰: "+"${_csrf.token}");
</script>
<body>
<script>
    // main_popup2
    $( function() {
        $(".main_popup2").dialog({
            dialogClass: "main_popup2_layer",
            width:560,
            autoOpen: false
        });
        
        $(".popup_close2").click(function(){
            $(".main_popup2").dialog("close");
        });
        
        $("#today_close2").click(function(){
        	// 쿠키 저장
            var date = new Date();
            date.setTime(date.getTime() + (1000 * 60 * 60 * 24));
            date.setHours(0);
            date.setMinutes(0);
            date.setSeconds(0);
            $.cookie("closePopEz", "Y", { expires: date, path : "/" });
            $(".main_popup2").dialog("close");
        });
        
        // 이지웰 로그인 팝업
        if(!isLogin && getCookie("closePopEz") != "Y" && getCookie("PTNR_CHL_GBN_KEY") == "00009902" 
        		&& getCookie("EZWEL_USER_KEY_SESSION") != null && location.href.indexOf("membershipSleepRelease") == -1){
        	if(location.href.indexOf("main") == -1){ // 메인이 아닐때 팝업 뜸
                $(".main_popup2").css("display","block");
                $(".main_popup2").dialog("open");
            }
        	else if(location.href.indexOf("main") != -1 && sessionStorage.getItem("selMainSwiperPos") != 0){//메인인 경우 인트로 아닐때 팝업뜸
        		$(".main_popup2").css("display","block");
                $(".main_popup2").dialog("open");
        	}
        }
        
        $(".intro_box").scroll(function(){
            if(!isLogin && getCookie("closePopEz") != "Y" && getCookie("PTNR_CHL_GBN_KEY") == "00009902" 
                    && getCookie("EZWEL_USER_KEY_SESSION") != null && location.href.indexOf("membershipSleepRelease") == -1
                    && sessionStorage.getItem("selMainSwiperPos") != 0){
                $(".main_popup2").css("display","block");
                $(".main_popup2").dialog("open");
            }
        });
    });

</script>
<!-- E: 2022-05-25 이지웰메인팝업 추가 -->  

<!-- S : 2023-01-04 추가 : Hmall 연동 팝업  -->
    <style type="text/css">
        /* popup */
        #hMallPop {width:480px; background-color:#fff; border-radius:10px;}
        .ui-widget-content[aria-describedby="hMallPop"] {background:none;}
        .ui-dialog.ui-widget.ui-widget-content.ui-corner-all.ui-front.ui-draggable[aria-describedby="hMallPop"] {border:none;}
        #hMallPop .pop-wrapper {position:relative; width:100%; padding:60px 70px 0; text-align:center;}
        #hMallPop .pop-header {}
        #hMallPop .pop-header h2::before {content:''; display:block; width:120px; height:18px; margin:0 auto 12px; background:url('https://cdn.hddfs.com/files/editor/20230105/62506f15_202301051037027090.png') 0 0 no-repeat;}
        #hMallPop .pop-header h2 {font-size:32px; font-weight:bold; line-height:1;}
        #hMallPop .pop-header strong {display:block; margin-top:35px; font-size:23px; line-height:1;}
        #hMallPop .pop-header strong span {color:#4e2bf4;}
        #hMallPop .pop-header strong + p {margin-top:22px; font-size:14px;}
        #hMallPop .pop-header p.box {width:90%; margin:25px auto 28px; line-height:70px; font-size:16px; font-weight:bold; background-color:#f7f7f9;}
        #hMallPop .pop-footer {padding-top:25px; border-top:1px solid #dcdcdc;}
        #hMallPop .pop-footer strong {display:block; font-size:15px;}
        #hMallPop .pop-footer p {margin-top:4px; font-size:14px;}
        #hMallPop .pop-btn__join {display:block; line-height:58px; margin:50px -70px 0; font-size:16px; color:#fff; background-color:#4e2bf4;}
        #hMallPop .pop-btn__close {position:absolute; top:18px; right:18px; width:28px; height:28px; font-size:0; text-indent:-9999px; overflow:hidden; background:url('https://cdn.hddfs.com/files/editor/20230105/49111f70_202301051107302560.png') center center no-repeat;}
    </style>
    
    <script>
  		//modal set
	    $("#hMallPop").dialog({
	        autoOpen: false,
	        resizable: false,
	        width: 480,
	        maxHeight: 630,
	        modal: true,
	        open: function() {
	                $('.ui-widget-overlay').bind('click', function() {
	                $('#hMallPop').dialog('close');
	            })
	        }
	    });
	    $('#hMallPop').prev(".ui-dialog-titlebar").hide();
	    
	    function modalClose(){
            $('#hMallPop').dialog('close');
        };
        
        function modalOpen(){
         	// Hmall 로그인 팝업 (나중에 공통으로 이동 후 조건 변경)
            if(!isLogin && getCookie("PTNR_CHL_GBN_KEY") == "00003107" && getCookie("hpointYn") == "Y"){	// Hmall 인입 + 로그인 X + H.Point 회원
            	if(location.href.indexOf("evntDetail") != -1){ 	// 이벤트 상세(기본형) 진입 시
            		$("#hMallPop").dialog("open");
                }
            }
        }
        setTimeout(modalOpen, 1500);
    </script><div tabindex="-1" role="dialog" class="ui-dialog ui-corner-all ui-widget ui-widget-content ui-front ui-draggable" aria-describedby="hMallPop" aria-labelledby="ui-id-1" style="display: none;"><div class="ui-dialog-titlebar ui-corner-all ui-widget-header ui-helper-clearfix ui-draggable-handle" style="display: none;"><span id="ui-id-1" class="ui-dialog-title">Hmall 연동 팝업</span><button type="button" class="ui-button ui-corner-all ui-widget ui-button-icon-only ui-dialog-titlebar-close" title="Close"><span class="ui-button-icon ui-icon ui-icon-closethick"></span><span class="ui-button-icon-space"> </span>Close</button></div><div id="hMallPop" class="ui-dialog-content ui-widget-content">
        <div class="pop-wrapper">
            <div class="pop-header">
                <h2>H.POINT 회원 안내</h2>
                <strong>현재 고객님은 <span>H.Point 회원</span>입니다.</strong>
                <p>H.Point 통합회원 정보로 간편하게<br>현대백화점면세점 회원가입이 가능합니다.<br>단, 가입 확인을 위해 아래의 정보가 조회됩니다.</p>
                <p class="box">이름, 생년월일, 휴대폰번호, CI</p>
            </div>
            <div class="pop-footer">
                <strong>현대백화점면세점에 가입하시겠습니까?</strong>
                <p>현대백화점면세점 가입 후 적립금 등 혜택 적용이 가능합니다.</p>
                <a href="https://www.hddfs.com/shop/mm/mbshJoin/join.do" class="pop-btn__join" title="회원가입하기">회원가입하기</a>
            </div>
            <a href="javascript:modalClose();" class="pop-btn__close" title="닫기">닫기</a>
        </div>
    </div></div>
<!-- E : 2023-01-04 추가 : Hmall 연동 팝업 -->

	<div id="wrap">
		<!-- header -->
		<meta name="google-site-verification" content="rYjJmYP3q9lxBYCTSa_Tg3h1N9l3yZjJGp0AFaKCZlM">
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-56VKRZT" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<script type="text/javascript">
	$(document).ready(function(){
		var currency = getCookie("currencyType");	
		/*$(".currencyType").html(currency);*/
		$(".currency").addClass(currency.toLowerCase());
		$(".currencyType").addClass(currency.toLowerCase());
		$(".currencyInfo > li").removeClass("is_selected");
		
		
		//loadGnbDispCtgJsonp(); //카테고리 JSON Data
		//오늘의 환율 조회
		$.ajax({
	        async       : true,
	        url        	   : "//www.hddfs.com/shop/cm/comm/lnbTodayExchr.json",
	        dataType   : "json",
	        type          : "POST",
	        success     : function(data, textStatus, jqXHR){
	            if(!crew.ajaxValidate(data)){ return; }
				var result = data.result;
				$(".exchageRateTxt").html("$1 = "+result.krw+" 원</em>");
				/* 
				if(getCookie("currencyNtnlCd") =="KR"){
					$(".exchageRateTxt").html("$1 = "+result.krw+" 원</em>");
				}else if(getCookie("currencyNtnlCd") =="CN"){
					$(".exchageRateTxt").html("$1 = "+result.cny.toFixed(2)+" 元</em>");
				}
				 */
	        },
	        error       : function(jqXHR, textStatus, errorThrown){
	            //console.log(jqXHR.status);
	        }
	    });
		
		$.ajax({
			async       : true,
	        url        	   : "//www.hddfs.com/shop/dm/mainLogo.json",
	        dataType   : "json",
	        type          : "POST",
	        success     : function(data, textStatus, jqXHR){
	            if(!crew.ajaxValidate(data)){ return; }
	            
					$("#mainLogo").attr("src","https://cdn.hddfs.com/files/"+data.mainLogo.dispEttList[0].dispEttDtlInfo.imgUrl);//+"?RS=192X40"
	        },
	        error       : function(jqXHR, textStatus, errorThrown){
	            //console.log(jqXHR.status);
	        }
	    });
		
	});
	
	//통화(화폐) 저장 
	function chgCurrencyInfo(type){
		//상품상세에서만 통화 변경 가능
		if(document.URL.indexOf('/gd/dtl/goos.do') > -1) {
			setCookie("currencyType",type);
		} else {
			setCookie("currencyType",type,1);		// 통화 정보 설정 쿠키(1일)
			setCookie("currencyNtnlCd",type.substring(0,2),1);		// 통화 국적
			alert("상품상세 화면에서만 통화변경을 확인하실 수 있습니다.");
		}
		window.location.reload();
	}
	
	$(window).load(function(){
		fnLnbCountInfo();
		orderStatusInfo();
		
	});
	
	
	function fnLnbCountInfo(){
        $.ajax({
            async       : true,
            url         : "//www.hddfs.com/shop/cm/comm/lnbInfo.json",
            dataType    : "json",
            type        : "POST",
            success     : function(data, textStatus, jqXHR){
                //if(!crew.ajaxValidate(data)){ return; }
                
                var result =  data.cartCnt;
            	if(result >= 99){
                    result = "99+";
                }
                
                if(data.cartCnt > 0){
                    $("#rwingCartCnt").html(result);
                    $("#rwingCartCnt").show();
                }else{
                    $("#rwingCartCnt").html("0");  //전체삭제시 장바구니 카운트가 초기화 되지 않아 장바구니 추가시 기존카운트에 추가됨.
                    $("#rwingCartCnt").hide();
                }
                
                
            },
            error       : function(jqXHR, textStatus, errorThrown){
                //console.log(jqXHR.status);
            }
        });    
    }
	
	
	
    function orderStatusInfo() {
    	if(isLogin){
            $.ajax({
                async       : true,
                url            : "//www.hddfs.com/shop/cm/comm/orderStatusInfo.json",
                dataType   : "json",
                type          : "POST",
                success     : function(data, textStatus, jqXHR){
                    if(!crew.ajaxValidate(data)){ return; }
                    
                    var result020 = typeof(data.orderStatInfo['020']) == "undefined" ? 0 : Number(data.orderStatInfo['020']);       //주문완료
                    var result030 = typeof(data.orderStatInfo['030']) == "undefined" ? 0 : Number(data.orderStatInfo['030']);       //상품준비중
                    var result040 = typeof(data.orderStatInfo['040']) == "undefined" ? 0 : Number(data.orderStatInfo['040']);       //상품이동중
                    var result050 = typeof(data.orderStatInfo['050']) == "undefined" ? 0 : Number(data.orderStatInfo['050']);       //인도대기
                    
                    var result = result020 + result030 + result040 +result050;

                    if(result >= 99){
                    	result = "99+";
                    }
                    $(".orderStatusTxt").html(result == null ? 0 : result);
                    
                    //관심 브랜드 처리
		            var interestList = data.interestBranList;
		            var interestListLength = $(".interestBranList > li").length;
		            if(interestList.length+interestListLength >20){
		            	for(var i=0; i< (interestList.length+interestListLength-20); i++){
		            		$(".interestBranList > li:last").remove();
		            	}
		            }

	            	var html="";
		            for(var i=0; i<interestList.length; i++){
		            	var onlnBranCd = interestList[i].onlnBranCd;
		            	if($(".interest"+onlnBranCd).length <1){
		            		html+="<li class=\"interest"+onlnBranCd+"\">";
		            		html+="<a rel=\"nosublink\" href=\"https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd="+onlnBranCd+"\">";
		            		html+="<p>"+interestList[i].branNm+"</p>";
		            		html+="<img src=\"https://cdn.hddfs.com/files/"+interestList[i].branReprImgUrl+"?sf=webp&RS=200x200\" alt=\"\" onerror=\"this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=200x200';\">";
		            		html+="</a>";
		            		html+="</li>";
		            	}
		            }
		            $(".interestBranList").prepend(html);
		            
		            if($(".interestBranList > li").length < 1){
		            	$(".interestBranList").parent().remove();
		            } 
                },
                error       : function(jqXHR, textStatus, errorThrown){
                    console.log(jqXHR.status);
                }
            }); 
        }else{
			if($(".interestBranList > li").length < 1){
            	$(".interestBranList").parent().remove();
            }
		}
    	 if($(".luxuryAreaList > li").length <1){						//럭셔리 없는 경우 항목삭제
 			$(".luxuryAreaList").parent().remove();
 		}
	}
	
	$(function(){
		$(".btn_gnb").on("click", function(){
			$("#gnb > ul > li").removeClass("open").css("display","");
			$("#gnb > ul > li > ul").css("display","none");
			$(".serviceMenu").parent().removeClass("open");
			$(".serviceMenu").parent().addClass("open");
			$(".serviceMenu").css("display","block");
			
			//카테고리 JSONP load
			if($(".serviceCtgList > li").length <1){
				loadCtgList();	
			}
		});
	});
	
	function goMainPage(){
		sessionStorage.setItem("selMainSwiperPos", 1); 
		location.href="https://www.hddfs.com/shop/dm/main.do";
	}
	
	
	// HDDFS 리뉴얼 프로젝트 [고영주] - 트래킹코드
	$(function() {
		// 햄버거 
		if("N" == "Y"){
			// 햄버거
			$(".btn_gnb").click(function(){ wiseLogAggr("KR_PC_GNB_Hamburger"); });
			// 검색버튼 
			$(".btn_search").click(function(){ wiseLogAggr("KR_PC_GNB_SearchIcon"); });		
			// 로그인
			$("#loginBtn").click(function(){ wiseLogAggr("KR_PC_GNB_Login"); });
			// 언어변경
			$("#ko_btn").click(function(){ wiseLogAggr("KR_PC_GNB_Language"); });	
			// 통화변경currencyInfo
			$(".currencyInfo>.ko").click(function(){ wiseLogAggr("KR_PC_GNB_Change_Currency"); });	
			$(".currencyInfo>.cn").click(function(){ wiseLogAggr("KR_PC_GNB_Change_Currency"); });	
		}
	});
</script>
<header id="header" style="left: 0px;">
	<section class="box">
		<a href="javascript:" class="btn_gnb">Navigation Drawer</a>
	    <!-- <h1 onclick="goMainPage();" style="cursor: pointer;">HYUNDAI DEPARTMENT SHOP - DUTY FREE</h1> -->
	    <h1 onclick="goMainPage();" style="cursor: pointer;"><img id="mainLogo" src="https://cdn.hddfs.com/files/dm/20221226/7a9039c2_202212260925243420.png" alt="HYUNDAI DEPARTMENT SHOP - DUTY FREE"></h1>
	    <form name="searchHeader" id="searchHeader" method="get" onsubmit="return false;">
	    <fieldset class="searchfield">
	    	<legend>통합검색</legend>
	        <div class="select_search">
	            <button class="tag_search" id="hashSrchCond">해시태그검색</button>
	            <button class="text_search" id="basicSrchCond">일반검색</button>
	            <div class="tooltip">해시태그로 검색하세요 :)</div>   <!-- 일반단어로 검색하세요 :) -->
	        </div>
	        
	        <div class="mainsearchinput">
		        <input type="search" class="text_search" name="searchTerm" id="basicSearchTerm" maxlength="" value="" placeholder="현대단독 니치향수 브랜드, '리퀴드퍼퓸바'" onkeypress="javascript:if(event.keyCode == 13) { searchHeaderAction();}" onmousedown="dq_setTextbox('1',event);" onfocusin="srchLayer();" onkeydown="dq_setTextbox('1',event);" autocomplete="off">
		        <input type="search" class="tag_search" name="searchTerm" id="hashSearchTerm" maxlength="" value="" placeholder="해시태그를 입력해주세요" onkeypress="javascript:if(event.keyCode == 13) { searchHeaderAction();}" onmousedown="dq_setTextbox('1',event);" onfocusin="srchLayer();" onkeydown="dq_setTextbox('1',event);" autocomplete="off">
		        <input type="hidden" id="movUrl" name="movUrl" value="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=066701">
		        <input type="hidden" id="rcntOffYn" name="rcntOffYn" value="">	  <!-- 최근검색어 저장 사용 유무 -->
			    <input type="hidden" id="rcntWrdYn" name="rcntWrdYn" value="">      <!-- 최근검색어 존재 유무 여부 -->
			    <input type="hidden" id="autoOffYn" name="autoOffYn" value="Y">      <!-- 자동완성 사용 여부 -->
			    <input type="hidden" id="searchType" name="searchType" value="">   <!-- 검색 타입 구분 -->
			    <input type="hidden" id="searchOrder" name="order" value="">   		  <!-- 정렬 구분 -->
		    </div>
	        <button class="btn_search" onclick="searchHeaderAction();">검색</button>
	    </fieldset>
	    </form>
	    <!-- 검색 레이어 영역 START -->
    	<div class="advanced_search">
	<div class="tab-action theme_search" id="allSearchArea">
	    <ul class="tab_textmedium ui-tabs-nav ui-corner-all ui-helper-reset ui-helper-clearfix ui-widget-header" id="searchTabBox" style="display:none" role="tablist">
	        <li id="rcntTab" role="tab" tabindex="0" class="ui-tabs-tab ui-corner-top ui-state-default ui-tab ui-tabs-active ui-state-active" aria-controls="advanced_search_01" aria-labelledby="ui-id-3" aria-selected="true" aria-expanded="true">
	            <a href="#advanced_search_01" role="presentation" tabindex="-1" class="ui-tabs-anchor" id="ui-id-3">최근 · 인기검색어</a>
	        </li>
	        <li id="brandTab" role="tab" tabindex="-1" class="ui-tabs-tab ui-corner-top ui-state-default ui-tab" aria-controls="advanced_search_02" aria-labelledby="ui-id-4" aria-selected="false" aria-expanded="false">
	            <a href="#advanced_search_02" role="presentation" tabindex="-1" class="ui-tabs-anchor" id="ui-id-4">브랜드검색</a>
	        </li>
	    </ul>

	    <div class="adsearch_panel" id="searchLayerList">
	    	<div id="advanced_search_01" class="popular_search ui-tabs-panel ui-corner-bottom ui-widget-content" aria-labelledby="ui-id-3" role="tabpanel" aria-hidden="false">
	    	
	    	</div>
	    	
	    	<div id="advanced_search_02" class="brand_search ui-tabs-panel ui-corner-bottom ui-widget-content" aria-labelledby="ui-id-4" role="tabpanel" aria-hidden="true" style="display: none;">
	            <div class="tab-action">
	                <ul class="tab_round ui-tabs-nav ui-corner-all ui-helper-reset ui-helper-clearfix ui-widget-header" role="tablist">
	                    <li id="default_brand_tab" role="tab" tabindex="0" class="ui-tabs-tab ui-corner-top ui-state-default ui-tab ui-tabs-active ui-state-active" aria-controls="advanced_search_brand_01" aria-labelledby="ui-id-5" aria-selected="true" aria-expanded="true">
	                        <a href="#advanced_search_brand_01" role="presentation" tabindex="-1" class="ui-tabs-anchor" id="ui-id-5">BRAND</a>
	                    </li>
	                    <li id="default_category_tab" role="tab" tabindex="-1" class="ui-tabs-tab ui-corner-top ui-state-default ui-tab" aria-controls="advanced_search_brand_02" aria-labelledby="ui-id-6" aria-selected="false" aria-expanded="false">
	                        <a href="#advanced_search_brand_02" role="presentation" tabindex="-1" class="ui-tabs-anchor" id="ui-id-6">CATEGORY</a>
	                    </li>
	                </ul>
	                <div id="advanced_search_brand_01" aria-labelledby="ui-id-5" role="tabpanel" class="ui-tabs-panel ui-corner-bottom ui-widget-content" aria-hidden="false">
	                    <div class="sort_wrap">
	                        <div class="tab-action">
	                            <ul class="sortbtn_wrap ui-tabs-nav ui-corner-all ui-helper-reset ui-helper-clearfix ui-widget-header" id="brandSortBtn" role="tablist">
	                                <li role="tab" tabindex="0" class="ui-tabs-tab ui-corner-top ui-state-default ui-tab ui-tabs-active ui-state-active" aria-controls="brand_sortbtn_01" aria-labelledby="ui-id-7" aria-selected="true" aria-expanded="true"><a href="#brand_sortbtn_01" onclick="switchBranTab('01');" role="presentation" tabindex="-1" class="ui-tabs-anchor" id="ui-id-7">가나다순</a></li>
	                                <li role="tab" tabindex="-1" class="ui-tabs-tab ui-corner-top ui-state-default ui-tab" aria-controls="brand_sortbtn_02" aria-labelledby="ui-id-8" aria-selected="false" aria-expanded="false"><a href="#brand_sortbtn_02" onclick="switchBranTab('02');" role="presentation" tabindex="-1" class="ui-tabs-anchor" id="ui-id-8">ABC순</a></li>
	                            </ul>
	                            <div id="brand_sortbtn_01" class="lang_sort on ui-tabs-panel ui-corner-bottom ui-widget-content" aria-labelledby="ui-id-7" role="tabpanel" aria-hidden="false">
	                                <div class="brand_cate">
										<ul id="brandKrList">
											</ul>
		                            </div>
		                            
	                            </div>
	                            <div id="brand_sortbtn_02" class="lang_sort ui-tabs-panel ui-corner-bottom ui-widget-content" aria-labelledby="ui-id-8" role="tabpanel" aria-hidden="true" style="display: none;">
		                            <div class="brand_cate">
										<ul id="brandEnList">
											</ul>
		                            </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	                <div id="advanced_search_brand_02" aria-labelledby="ui-id-6" role="tabpanel" class="ui-tabs-panel ui-corner-bottom ui-widget-content" aria-hidden="true" style="display: none;">
	                    <div class="sort_wrap">
	                        <div class="tab-action">
	                            <div id="brand_sortbtn_03" class="lang_sort on">
	                                <div class="brand_cate">
										<ul id="cateList" role="tablist" class="ui-tabs-nav ui-corner-all ui-helper-reset ui-helper-clearfix ui-widget-header">
											</ul>
		                            </div>
	                            </div>
	                        </div>
	                        
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="search_autocomplete" id="autoList" style="display:none;">
	    <div class="none_autoword" id="no_autoComplete" style="display:none;">자동완성기능을 사용하고 있지 않습니다.</div>
	    <span class="switch autoword">
	    	<input type="checkbox" id="autoCompleteBtn" onclick="javascript:autoCompleteSwitch();">
	        <label for="autoCompleteBtn">
	            <span class="slider"></span>
	            <span>자동완성</span>
	        </label>
	    </span>
	</div>
	<a href="javascript:" class="search_close">닫기</a>
</div>

<script src="https://cdn.hddfs.com/front/js/KO/diquest/dqAutoComplete.js"></script>	
<script type="text/javascript">	

	
	$(function(){
		
		// 검색결과에 따라 검색창 변환
		changeSearchArea();
		
		if($("#autoOffYn").val() == "" || $("#autoOffYn").val() == null){
			$("#autoOffYn").val('Y');
		}
		
		// 일반 검색창에 # 입력시 해시태그 검색창 전환
		$("#basicSearchTerm").on('keyup', function(){
			if($("#basicSearchTerm").val() === "#"){
				$(".select_search #hashSrchCond").trigger('click');
				//changeSearchTextBox();
				//console.log("dq_autoSearchType : " + dq_autoSearchType);
				$("#hashSearchTerm").focus();
			}
		});
		
		// 검색 조건 클릭시 자동완성 타입 변경
		$(".select_search button").on('click', function(){
			changeSearchTextBox();
		});
		
		// 검색창 클릭시 검색 레이어 호출
		$("#basicSearchTerm, #hashSearchTerm").on('click', function(){
			if( ($("#brandKrList > li").length <1) || ($("#brandEnList > li").length <1)){
				loadBranIcKrList();
			} 
			if($("#brandTab").attr('tabindex') == '0'){
				wiseLogAggr("KR_PC_Common_BrandSearch");
			}else{
				wiseLogAggr("KR_PC_Common_SearchKeyword");
			}
			srchLayer();
		});
		
		$("#default_category_tab > a").click(function(){
			//카테고리 로드
			loadCtgList();
		});
		
		$("#brandTab").on('click', function(){
			wiseLogAggr("KR_PC_Common_BrandSearch");
			$(".tab_round #default_brand_tab a").trigger('click');
		});
		
		$("#rcntTab").on('click', function(){
			wiseLogAggr("KR_PC_Common_SearchKeyword");
		});
		
		$("#default_brand_tab a").on('click', function(){
			wiseLogAggr("KR_PC_Common_BrandSearch_Brand");
		});
		
		$("#default_category_tab a").on('click', function(){
			wiseLogAggr("KR_PC_Common_BrandSearch_Category");
		});
		
	});
	
	function branAction(branCd){
		$(location).attr('href', ctx_curr+"/dm/bran/brand.do?onlnBranCd="+branCd);
		
 	}
	
	//브랜드 ㄱㄴㄷ > ABC 변경시
	function switchBranTab(type){
		if(type =="02"){
			//ABC 순 조회
			loadBranIcEnList();
		}
		$("#brand_sortbtn_"+type+" > div > ul > li > button").removeClass("on");
		$("#brand_sortbtn_"+type+" > div > ul > li:eq(0) > button").addClass("on");
		$("#brand_sortbtn_"+type+" > div > ul > li > .branTabResult").removeClass("on");		
		$("#brand_sortbtn_"+type+" > div > ul > li:eq(0) > .branTabResult").addClass("on");
	}
	
	// 초성 선택시 동작
	function chgBranTab($this,type){
		if(!$($this).hasClass("disabled")){
			if(type ==1){		//국문
				$("#brandKrList > li").each(function(){
					var dataGroup = $(this).data("group-pos");
					if($('[data-group="bran'+dataGroup+'"]:checked').length < 1){
						$(this).find("button").removeClass("on");
					}
				});
			}else{
				$("#brandEnList > li").each(function(){
					var dataGroup = $(this).data("group-pos");
					if($('[data-group="bran'+dataGroup+'"]:checked').length < 1){
						$(this).find("button").removeClass("on");
					}
				});
			} 
			$(".branTabResult").removeClass("on");
			$($this).addClass("on");
			$($this).parent().find("div").addClass("on");
		}
	}
	
	// 카테고리 선택시 동작
	function chgCateTab($this){
		if(!$($this).hasClass("disabled")){
			$("#cateList > li").each(function(){
				var dataGroup = $(this).data("group-pos");
				if($('[data-group="cate'+dataGroup+'"]:checked').length < 1){
					$(this).find("button").removeClass("on");
				}
			});
			$(".cateTabResult").removeClass("on");
			$($this).addClass("on");
			$($this).parent().find("div").addClass("on");
		}
	}
	
	// 검색어 목록 call json
  	function srchLayer(){
		// 검색어 있는 상태일때 자동완성 실행
		if($("#basicSearchTerm").val().length > 0 || $("#hashSearchTerm").val().length > 0){
			dq_reqSearch();
		}
		
		// 검색 타입 구분
		var searchType = $("#searchType").val();
		
		$.ajax({
		    async       : true,
		    url         : ctx_curr + "/sr/searchLayer.json",
		    dataType    : "json",
		    type        : "POST",
		    data        : { searchType : searchType },
		    success     : function(data, textStatus, jqXHR){
		        if(!crew.ajaxValidate(data)){ return; }
		        // 검색어 목록 추가
		        //$("#searchLayerList").append(data.html);
		        $("#advanced_search_01").html(data.html);
		        
		        // 최근 검색어 존재 유무 세팅
	        	$("#rcntWrdYn").val(data.dqGoosSrch.rcntWrdYn);
				
		        // 자동 저장 사용 유무를 쿠키에서 받아옴
		        if(data.rcntOffYn != null){
		        	$("#rcntOffYn").val(data.rcntOffYn);
		        }else{
		        	$("#rcntOffYn").val('Y');
		        }
		        
		     	// 정렬값를 쿠키에서 받아옴
		        if(data.order != null){
		        	$("#searchOrder").val(data.order);
		        }else{
		        	$("#searchOrder").val('random');
		        }
	        	// 초기 자동저장 세팅 
	        	setAutoSave();
		     	
		    	 // 자동완성 기능 사용여부 
				if($("#autoOffYn").val() == 'N'){
					dq_acOff();
				}else{
					dq_acArrow();
				}
		    },
		    error       : function(jqXHR, textStatus, errorThrown){
		        //console.log(jqXHR.status);
		    }
		});
	}
	
    // 검색 레이어 띄울때 자동저장 상태 세팅
	function setAutoSave() {
		if(dq_autoSearchType == "basic"){
			dq_searchTextbox = document.getElementById("basicSearchTerm");
			if(showType == 'intro'){
				dq_searchTextbox = document.getElementById("basicSearchTermIntro");
			}
		} else {
			dq_searchTextbox = document.getElementById("hashSearchTerm");
			if(showType == 'intro'){
				dq_searchTextbox = document.getElementById("hashSearchTermIntro");
			}
		}
		
    	if ($("#rcntOffYn").val() === 'Y') {
    		//console.log("자동저장 체크됨  : " + $("#rcntOffYn").val());
    		$('input[id="autoSaveBtn"]').attr('checked', true);
    		$("#rcntKeyword").show();
    		$("#deleteAll").show();
    		$(".words_list #noRcnt").hide();
    		
    		// 사용하지만 최근 검색어가 없을때 
    	 	if ($("#rcntWrdYn").val() === 'N') {
    	 		//$("#rcntKeyword").hide();
    	 		$("#deleteAll").hide();
    	 		$(".words_list #noRcnt").show();
    	 		$("#noRcnt").text('최근 검색어가 없습니다.');
    	 	}
    	} else {
    		//console.log("자동저장 체크헤제됨  : " + $("#rcntOffYn").val());
    		$('input[id="autoSaveBtn"]').attr('checked', false);
    		$(".words_list #noRcnt").show();
    		$("#noRcnt").text('자동저장 기능 미사용 중입니다.');
    		$("#rcntKeyword").hide();
    		$("#deleteAll").hide();
    	}
	}
	
	
	// 해시태그 결과 페이지인 경우 검색창 전환
	function changeSearchArea(){
		if($("#resultSearchType").val() == "hash"){
	 		dq_autoSearchType = "hash";
	 		$(".searchfield .select_search").addClass("tag");
			$(".mainsearchinput").addClass("tag");
			$(".searchfield .tooltip").text("일반단어로 검색하세요 :)")
			$("#basicSearchTerm").val('');
			//console.log("해시태그 결과 페이지 확인 : " + dq_autoSearchType);
		} else {
	 		dq_autoSearchType = "basic";
	 		$(".searchfield .select_search").removeClass("tag");
			$(".mainsearchinput").removeClass("tag");
			$(".searchfield .tooltip").text("해시태그로 검색하세요 :)")
			$("#hashSearchTerm").val('');
			//console.log("일반 결과 페이지 확인 : " + dq_autoSearchType);
		}
	}
	
	
    // HDDFS 리뉴얼 프로젝트 [이승훈-2021.04.16] - 자동완성 기능 추가
    // 자동완성 on/off
	function autoCompleteSwitch(){
	    
    	if ($("#autoOffYn").val() === 'Y') {
	        dq_acOff();
//   		console.log("자동완성 미사용 전환  : " + $("#autoOffYn").val());
    		
    	} else {
    		dq_acArrow();
//    		console.log("자동완성 사용 전환  : " + $("#autoOffYn").val());
    	}
	}
	
	// 자동 저장 on/off
    function autoSaveSwitch() {
    	
    	// 사용 -> 미사용으로 전환
    	if ($("#rcntOffYn").val() === 'Y') {
    		$("#rcntOffYn").val('N');
    		$("#rcntKeyword").hide();
    		$("#deleteAll").hide();
    		$(".words_list #noRcnt").show();
    		$("#noRcnt").text('자동저장 기능 미사용 중입니다.');
//    		console.log("자동저장 미사용으로 전환 : " + $("#rcntOffYn").val());
        // 미사용 -> 사용으로 전환   
    	} else {
    		$("#rcntOffYn").val('Y');
    		$(".words_list #noRcnt").hide();
    		$("#rcntKeyword").show();
    		$("#deleteAll").show();
//    		console.log("자동저장 사용으로 전환 : " + $("#rcntOffYn").val());
       		
    		// 사용하지만 최근 검색어가 없을때 
    	 	if ($("#rcntWrdYn").val() === 'N') {
    	 		$("#rcntKeyword").hide();
    	 		$("#deleteAll").hide();
    	 		$(".words_list #noRcnt").show();
    	 		$("#noRcnt").text('최근 검색어가 없습니다.');
    	 	}
    	}
    	
    	autoSaveActionBySaveCookie();	
    	
    	
    }
	
    // 쿠키 사용 (자동저장 유무 값 유지용도)
	function autoSaveActionBySaveCookie() {
	    
		var rcntOffYn = $("#rcntOffYn").val();
		
	    $.ajax({
	        async       : true,
	        url         : ctx_curr+"/sr/srchWrdSave.json",
	        dataType    : "json",
	        type        : "POST",
	        cache       : false,
	        data        : {"rcntOffYn" : rcntOffYn},
	        success     : function(data, textStatus, jqXHR){
	            if(!crew.ajaxValidate(data)){ return; }
	        },
	        error       : function(jqXHR, textStatus, errorThrown){
	            //console.log(jqXHR.status);
	        }
	    });
	} 	

	// 최근 검색어 삭제
	function delSrchWrd(srchWrd, hashTagYn){
	
		//console.log("삭제된 검색어 srchWrd : " + srchWrd);
		
		var searchType = "";
		if(hashTagYn == 'Y'){
			searchType = "hash"
		}else if(hashTagYn == 'all'){
			searchType = "all"
		}else {
			searchType = "basic"
		}
		
		//console.log(searchType);
		
		if (srchWrd === null || srchWrd === undefined) {
			srchWrd = "";
		}
		
	    var html = "";
	    
	    /* 최근검색어 삭제요청 */
	    $.ajax({
	        async       : true,
	        url         : ctx_curr+"/sr/delSrchWrd.json",
	        dataType    : "json",
	        type        : "POST",
	        cache       : false,
	        data        : {
	        				"srchWrd" : srchWrd, 
	        				"searchType" : searchType 
	        	  		  },
	        
	        success     : function(data, textStatus, jqXHR){
	            if(!crew.ajaxValidate(data)){ return; }
	            
		           	if(data.recentList.length > 0){
		            	$.each(data.recentList,function(key){
		                    var list = data.recentList[key];
		                    
		                    if(list.srchClsCd == "001"){
		                    	html += "<li><a href=\""+ctx_curr+"/sr/searchResult.do?searchTerm="+ encodeURIComponent(list.srchWrd) + "&searchType="+encodeURIComponent("basic")+"\">"+list.srchWrd+"</a><button type=\"button\" class=\"ic_x deleteOne\" onclick=\"javascript:delSrchWrd('"+list.srchWrd+"', 'N');\">X</button></li>";
		                    }else{
		                    	html += "<li><a href=\""+ctx_curr+"/sr/hashSearchResult.do?searchTerm="+ encodeURIComponent(list.srchWrd) +"&searchType="+encodeURIComponent("hash")+"\">#"+list.srchWrd+"</a><button type=\"button\" class=\"ic_x deleteOne\" onclick=\"javascript:delSrchWrd('"+list.srchWrd+"', 'Y');\">X</button></li>";
		                    }
		                });
		            	$("#rcntKeyword").html(html);
		            }else{
		            	$("#rcntKeyword").empty();
		            	$("#noRcnt").show();
		            	$("#noRcnt").text('최근 검색어가 없습니다.');
		            	$("#deleteAll").hide();
		            }
		            
		           	// 최근 검색어가 있을때
		            if(data.dqGoosSrch.rcntWrdYn == 'Y'){
		            	$("#rcntWrdYn").val('Y');
		            	$("#rcntKeyword").show();
		                $("#noRcnt").hide();
		            // 최근 검색어가 없을때
		            }else{
		            	$("#rcntWrdYn").val('N');
		            	$("#rcntKeyword").hide();
		            	$("#noRcnt").show();
		            	$("#noRcnt").text('최근 검색어가 없습니다.');
		            }
	            
	        },
	        error       : function(jqXHR, textStatus, errorThrown){
	            //console.log(jqXHR.status);
	        }
	    });
	}
	
	
	// 검색어 체크
	function checkSearchTerm(searchTerm){
		var ke = dqc_trimSpace(searchTerm);

		while(ke.indexOf("\\") != -1)
			ke = ke.replace("\\", "");

		while(ke.indexOf("\'") != -1)
			ke = ke.replace("\'", "");
		
		return ke;		
	}
	
	// form submit
    function searchHeaderAction(){
    	wiseLogAggr("KR_PC_GNB_SearchIcon");
    	//$(".advanced_search").removeClass("adsearch_open");

		// 검색어 미입력 시 삽입된 문구로 검색 혹은 지정된 url로 이동
		/* if ($("#basicSearchTerm").val() === "" && $("#hashSearchTerm").val() === "") {
			var url = $("#searchHeader").find("[name=movUrl]").val();
		    
			if(url != ""){
				location.href = url;
		    }else{
		    	alert("검색어를 입력해주세요."); // 검색어를 입력해주세요 
		    }
		}else{ */
			var result = '';
			$("#movUrl").attr('disabled', true);
		
	     	// 일반 검색 일때
	     	if (!$(".mainsearchinput").hasClass('tag')){
	     		if ($("#basicSearchTerm").val() === "") {
	    			var url = $("#searchHeader").find("[name=movUrl]").val();
	    		    
	    			if(url != ""){
	    				location.href = url;
	    		    }else{
	    		    	alert("검색어를 입력해주세요."); // 검색어를 입력해주세요 
	    		    }
	     		}else{
	     			$(".advanced_search").hide();
	     			
		     		result = checkSearchTerm($("#basicSearchTerm").val());
		     		$("#basicSearchTerm").val(result);
		     		$("#hashSearchTerm").val('');
		     		$("#basicSearchTerm").attr('disabled', false);
		    		$("#hashSearchTerm").attr('disabled', true);
		    		// 일반검색은 order값 제외
		    		$("#searchOrder").attr('disabled', true); 
		    		// 검색 타입 구분
		    		$("#searchType").val("basic");
		    		
		    		searchHeader.action = ctx_curr+"/sr/searchResult.do";
		    		searchHeader.submit();
	     		}
	    	} else {
	    	// 해시태그 검색 일때
	    		if ($("#hashSearchTerm").val() === "") {
    		    	alert("검색어를 입력해주세요."); // 검색어를 입력해주세요 
	     		}else{
	     			$(".advanced_search").hide();
	     			
		    		result = checkSearchTerm($("#hashSearchTerm").val());
		     		$("#hashSearchTerm").val(result);
		     		$("#basicSearchTerm").val('');
		     		$("#basicSearchTerm").attr('disabled', true);
		    		$("#hashSearchTerm").attr('disabled', false);
		    		// 검색 타입 구분
		    		$("#searchType").val("hash");
		    		
		    		searchHeader.action = ctx_curr+"/sr/hashSearchResult.do";
		    		searchHeader.submit();
	     		}
	    	}
	    	
		//}
		
	    $(".adsearch_dim").hide();
		
    }
</script><!-- 검색 레이어 영역 END-->
	    <div class="default_menu">
	    	<a class="menu_login_join" href="javascript:" id="logoutBtn" onclick="logout();">로그아웃</a>
	    		<ul>
	            <li class="item_01">
	                <a href="https://www.hddfs.com/shop/or/order/listCart.do"><strong>장바<br>구니</strong><em id="rwingCartCnt" style="">6</em></a>
	            </li>
	            <li class="item_02">
	                <a href="https://www.hddfs.com/shop/mm/myOrder/listOrder.do"><strong>주문<br>조회</strong><em class="orderStatusTxt">0</em></a>
	            </li>
	            <li class="item_03">
	                <a rel="nosublink" href="https://www.hddfs.com/shop/mm/myOrder/listOrder.do"><strong>마이<br>현대</strong></a>
	            </li>
	            <li class="item_04">
	                <a href="https://www.hddfs.com/shop/om/consmComm/main.do"><strong>고객<br>센터</strong></a>
	            </li>
	            <li class="item_05">
	                <a href="https://www.hddfs.com/store/kr/dm/main.do" target="_blank"><strong>공식<br>사이트</strong></a>
	            </li>
	            <li class="language ko">
	                <a href="javascript:" class="ko"><strong>언어<br>설정</strong></a>
	                <div>
	                    <a href="javascript:" id="ko_btn" onclick="goMainPage();" class="ko">한국어</a>
	                    <a href="https://cn.hd-dfs.com/shop/dm/main.do" class="cn">简体中文</a>
	                    <a href="https://en.hddfs.com/shop/dm/main.do" class="en">English</a>
	                </div>
	            </li>
	            <li class="currency krw">
	                <a href="javascript:" class="currencyType  krw"><strong>통화<br>설정</strong></a>
	                <div class="currencyInfo">
	                    <a href="javascript:" onclick="chgCurrencyInfo('KRW');" class="ko">KRW</a>
	                    <a href="javascript:" onclick="chgCurrencyInfo('CNY');" class="cn">CNY</a>
	                </div>
	            </li>
	            <li class="exchange_rate exchageRateTxt">$1 = 1231.4 원</li>
	        </ul>
	    </div>
	    <!-- 히든메뉴 START -->
	    <script type="text/javascript">

function commOpenLayer(cookieChkYn, hiddenYn){
	$.ajax({
	    async       : true,
	    url         : ctx_curr + "/dm/main/popInfo.json",
	    dataType    : "json",
	    type        : "POST",
	    success     : function(popInfo, textStatus, jqXHR){
	    	var data = popInfo.resPop;
	    	var html = "";
	    	for(var i=0; i < data.popSeqList.length; i++){
    			html+="<div class=\"main_popup\" id=\"main_bottom_pop"+data.popSeqList[i].popSeq+"\" data-seq=\""+data.popSeqList[i].popSeq+"\">";
	    		var addClass = "";
	    		var addStyle= "";
	    		if(data.popSeqList[i].popTmplCd == '001'){
	    			addClass="popswiper-container";
	    		}else{
	    			addClass="html_wrap";
	    			addStyle= "style='width:560px; height: 368px;'";
	    		}
	    		html+="<div class=\""+addClass+"\" "+addStyle+">";
	    		if(data.popSeqList[i].popTmplCd == '001'){
	    			html+="<ul class=\"swiper-wrapper mainPopList\">";
	    			for(var j=0; j < data.dataList.length; j++){
	    				if(data.popSeqList[i].popSeq == data.dataList[j].popSeq){
	    					html += "<li class=\"swiper-slide\">";
	    					var link = data.dataList[j].linkUrl != null ? data.dataList[j].linkUrl : "javascript:";		
	    					
	    					var wiseLog = "";
	    					if(link != "javascript:") {
	    						if(link.indexOf("?") != -1) {
	    							wiseLog = "&MG=KR_PC_Main_Popup"+data.popSeqList[i].popSeq+"_"+data.dataList[j].popDtlSeq;
	    						} else {
	    							wiseLog = "?MG=KR_PC_Main_Popup"+data.popSeqList[i].popSeq+"_"+data.dataList[j].popDtlSeq;
	    						}
	    					}
	    					
	    					if(data.dataList[j].shrtVdoUrl != null){
	    						html += "<video preload=\"none\" muted loop class='video-js'  style='width:560px; height:368px; object-fit:cover; background-color: black;'>";
	    						html += "<source src=\"https://cdn.hddfs.com/files/"+data.dataList[j].shrtVdoUrl+"\" type=\"video/mp4\">";
	    						html += "<strong>Your browser does not support the video tag.</strong>";
	    						html += "</video>";
	    					}else{
	    						var mainTitl = data.dataList[j].mainTitl != null ? data.dataList[j].mainTitl : "";
	    						var subTitl = data.dataList[j].subTitl != null ? data.dataList[j].subTitl : "";
	    						var bnnrWrd = data.dataList[j].bnnrWrd != null ? data.dataList[j].bnnrWrd : "";
	    						
	    						html += "<a href=\""+link+wiseLog+"\"  class='item_wrap'>";
	    						html += "<div class='pop_txt'>";
	    						html += "<strong class='cate'>"+mainTitl+"</strong>";
	    						html += "<p>"+subTitl+"</p>";
	    						html += "<p>"+bnnrWrd+"</p>";
	    						html += "</div>";
	    						html += "<img src=\"https://cdn.hddfs.com/files/"+data.dataList[j].imgUrl+"?sf=webp&RS=750X494\" alt=\""+data.dataList[j].popNm+"\">";
	    						html += "</a>";
	    					}
	    					html += "</li>";
	    				}	
	    			}
	    			html+="</ul>";
	    			html+="<div class=\"swiper_control\" id=\"mainPop_"+data.popSeqList[i].popSeq+"\">";
	    			html+="<div class=\"swiper-pagination\"></div>";
	    			html+="<div class=\"swiper-prev\"></div>";
	    			html+="<div class=\"swiper-next\"></div>";
	    			html+="</div>";
	    		}else{
	    			html += data.popSeqList[i].htmlCont;
	    		}
	    		html+="</div>";
	    		html+="<div class=\"close_section\">";
	    		html+="<span class=\"today_close chk\">";
	    		html+="<input type=\"checkbox\" class=\"today_close\" id=\"btn_hidden_layer_"+data.popSeqList[i].popSeq+"\" onclick=\"saveMainLayerCookie("+data.popSeqList[i].popSeq+");\" hiddenYn=\"N\" />";
	    		html+="<label for=\"btn_hidden_layer_"+data.popSeqList[i].popSeq+"\" style=\"cursor: pointer;\">오늘 하루 보지 않기</label>";
	    		html+="</span>";
	    		html+="<span class=\"popup_close\"  data-seq=\""+data.popSeqList[i].popSeq+"\" onclick=\"closeMainLayer("+data.popSeqList[i].popSeq+");\">닫기</span>";
	    		html+="</div>";
	    		html+="</div>";	
    		}
	    	
	    	$(".mainPopWrap").html(html); 
	    	callMainPopSwiper();
	    	
	    	if(hiddenYn == "Y"){
	    	    $(".hidden_menu").removeClass("open");
	    		$(".item").slideUp(200);
	    	}
	    	
	    	if($(".main_popup").length > 0){
		    	$('.modal_wrap').addClass('active');	//팝업 띄우기
	    	}
	    	
	    	if(cookieChkYn == "Y"){
	    		// 메인팝업
	    		$(".main_popup").each(function(){
	    			var seq = $(this).data("seq");
	    			$(".today_close.chk").show();
	    			$("#btn_hidden_layer_"+seq).attr("hiddenYn", "N");
	    			if(getCookie("closePop" + seq) == "Y"){	// 팝업 오픈
	    				$("#main_bottom_pop"+seq).remove();
	    				if($(".main_popup").length <1){
	    					$('.modal_wrap').removeClass('active');
	    				}
	    			}
	    		});
	    	}else{
	    		// 메인팝업 오픈
	    		$(".main_popup").each(function(){
	    			var seq = $(this).data("seq");
	    			$(".today_close.chk").hide();
	    			$("#btn_hidden_layer_"+seq).attr("hiddenYn", "Y");	    			
	    		});
	    	}
	    	
	    	if(hiddenYn == "Y"){
	    		$(".ui-resizable").css("position", "fixed")
	    	}
	    	
    		$(".main_popup").each(function(){
    			var seq = $(this).data("seq");
    			if($("#main_bottom_pop"+seq).find("li").length == 1){
    				$("#mainPop_"+seq).hide();
    			}
    		});
    		
    		$(".mainPopList > li").find("video").attr("preload","");
    		$(".mainPopList > li").find("video").attr("autoplay",true);
	    }
	});
}


//쿠폰 다운로드
function issueHiddenCoupon(cupId){
	var lgcpBuyMbshGrpCd = '001';
	var mbshGrpNm = '';
	
    // 로그인 체크
    if ( !isLogin ) {
    	alert('로그인 후 이용 가능합니다.');	/*로그인 후 이용 가능합니다.*/
        login();
        return;
    }
    
    if(lgcpBuyMbshGrpCd == "MG" || mbshGrpNm == "MG"){
    	alert('본 쿠폰은 현대백화점면세점 일반 회원만 다운로드 및 사용할 수 있습니다.');	/*본 쿠폰은 현대백화점면세점 일반 회원만 다운로드 및 사용할 수 있습니다.*/
        return;
    }

    issueCoupon(cupId,function(data){
        if ( data.resultCode == 1 ) {
        	alert('쿠폰이 다운로드 되었습니다.');	/*쿠폰이 다운로드 되었습니다.*/
        } 
        else {
            alert(data.message);
        }
    });
}


// 적립금 다운로드
function issueHiddenSvmt(svmtId, baseRsvgAmt){
	issueSvmt(svmtId, baseRsvgAmt , function(data){
        if ( data.resultCode == 1 ) {
        	alert('적립금이 다운로드 되었습니다.');	/*적립금이 다운로드 되었습니다.*/
        } 
        else {
            alert(data.message);
        }
    });
}

// 이벤트 혜택받기
function getHiddenMenuEvntBnef(evntId){
    addEvnt(evntId);
}
</script>

<div class="hidden_menu">
	<a href="javascript:wiseLogAggr('KR_PC_Common_HiddenMenuIcon');" class="btn">히든메뉴</a>
	<div class="item">
	    <div class="swiper-container">
	        <div class="swiper-wrapper">
	            <div class="swiper-slide mainPopBtn">
		                <a href="javascript:wiseLogAggr('KR_PC_Common_HiddenMenu_1');" onclick="javascript:commOpenLayer('N', 'Y');">
		                    <span class="img fix">
		                        <img src="https://cdn.hddfs.com/front/images/KO/common/icon_hidden_01.png" alt="메인팝업">
		                    </span>
		                    <p>메인팝업</p>
		                </a>
		            </div>
	            <div class="swiper-slide">
		                <a href="https://www.hddfs.com/event/op/bnf/listBnf.do?MG=KR_PC_Common_HiddenMenu_2">
		                    <span class="img fix">
		                        <img src="https://cdn.hddfs.com/front/images/KO/common/icon_hidden_02.png" alt="월별혜택안내">
		                    </span>
		                    <p>월별혜택안내</p>
		                </a>
		            </div>
	            <div class="swiper-slide">
				                <a href="javascript:wiseLogAggr('KR_PC_Common_HiddenMenu_3');" onclick="issueHiddenSvmt('008899', 5000000);">
				                    <span class="img fix">
				                        <img src="https://cdn.hddfs.com/front/images/KO/common/icon_hidden_03.png" alt="적립금 500만원">
				                    </span>
				                    <p>적립금 500만원</p>
				                </a>
				            </div>
						<div class="swiper-slide">		
				                <a href="javascript:wiseLogAggr('KR_PC_Common_HiddenMenu_4');" onclick="getHiddenMenuEvntBnef('0003893')">
				                    <span class="img fix">
				                        <img src="https://cdn.hddfs.com/front/images/KO/common/icon_hidden_event.png" alt="데일리적립금">
				                    </span>
				                    <p>데일리적립금</p>
				                </a>
				            </div>
						<div class="swiper-slide">		
				                <a href="javascript:wiseLogAggr('KR_PC_Common_HiddenMenu_5');" onclick="getHiddenMenuEvntBnef('0004017')">
				                    <span class="img fix">
				                        <img src="https://cdn.hddfs.com/front/images/KO/common/icon_hidden_event.png" alt="스페셜 추가적립금">
				                    </span>
				                    <p>스페셜 추가적립금</p>
				                </a>
				            </div>
						<div class="swiper-slide">
				                <a href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0004005" onclick="wiseLogAggr('KR_PC_Common_HiddenMenu_6');">
				                    <span class="img">
				                        <img src="https://cdn.hddfs.com/files/dm/20221227/42ecb606_202212271804177860.png?sf=webp&amp;RS=100x100" alt="[1월] 등급혜택" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=100x100';" style="width:100%;">
				                    </span>
				                    <p>등급별 혜택</p>
				                </a>
				            </div>
						<div class="swiper-slide">
				                <a href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003959" onclick="wiseLogAggr('KR_PC_Common_HiddenMenu_7');">
				                    <span class="img">
				                        <img src="https://cdn.hddfs.com/files/dm/20221227/d061fda4_202212271805375340.png?sf=webp&amp;RS=100x100" alt="[1월] 출석체크" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=100x100';" style="width:100%;">
				                    </span>
				                    <p>출석체크</p>
				                </a>
				            </div>
						</div>
		</div>
        <div class="controller">
            <button class="btn-up" value="up"></button>
            <button class="btn-down" value="down"></button>
        </div>
	</div>
</div><!-- 히든메뉴 END -->
	    </section>
	    <nav class="navication">
	        <ul class="quick_link">
	            <li class="ql_03"><a href="https://www.hddfs.com/shop/mm/myOrder/listOrder.do" rel="nosublink">주문내역</a></li>
	            <li class="ql_01"><a href="https://www.hddfs.com/shop/om/consmGuide/useNotice.do" rel="nosublink">주문<br>가능시간</a></li>
	            <li class="ql_04"><a href="https://www.hddfs.com/shop/mm/myInfo/listMbshDpatInfo.do" rel="nosublink">출국정보</a></li>
	            <li class="ql_02"><a href="https://www.hddfs.com/shop/mm/myInfo/inptMbshPwd.do?type=pspt" rel="nosublink">여권정보</a></li>
	        </ul>
	        <div id="gnb">
    <h2>Global Navigation Bar</h2>
    <ul class="depth_01">
        <li>
            <strong>전체서비스</strong>
            <ul class="depth_02 serviceMenu">
            	<li>
						<a href="https://www.hddfs.com/shop/op/sale/saleShop.do">
							세일</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/best/weekly.do">
							베스트</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/event/op/evnt/evntShop.do">
							혜택</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/event/op/spex/spexShop.do">
							기획전</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/or/coupon/cupMain.do">
							쿠폰</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/new/newShop.do">
							신상품</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0002920">
							H.COS Club</a>
					</li>
				<li>
						<a href="/shop/dm/thefrontrow.do">
							THE FRONT ROW</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003628">
							Club Travel</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/or/spord/main.do">
							스페셜오더</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/specialMain.do?spclMenuSeq=4&amp;MG=KR_PC_Main_Mainevent_6">
							❤[온·클·세]온라인 클리어런스 세일❤</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=642001">
							■ MUSINSA DF ■</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=665301">
							클린뷰티 전용관 THE C.LAB</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/op/weds/wedsShop.do">
							웨딩샵</a>
					</li>
				</ul>
        </li>
        <li>
            <strong>카테고리</strong>
            <ul class="depth_02 serviceCtgList"></ul>
        </li>
        <li>
            <strong>공식스토어</strong>
            <ul class="depth_02 gnb_luxury luxuryAreaList">
            	<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=005601" rel="nosublink">
							<p>겔랑</p>
							<img src="https://cdn.hddfs.com/files/gd/20220214/8964829b_202202141654149430.jpg?sf=webp&amp;RS=131X131" alt="겔랑" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=001801" rel="nosublink">
							<p>라프레리</p>
							<img src="https://cdn.hddfs.com/files/gd/20220204/864a76a0_202202041249213770.png?sf=webp&amp;RS=131X131" alt="라프레리" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006301" rel="nosublink">
							<p>랑콤</p>
							<img src="https://cdn.hddfs.com/files/gd/20220504/c20154c6_202205041256272420.jpg?sf=webp&amp;RS=131X131" alt="랑콤" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006801" rel="nosublink">
							<p>슈에무라 </p>
							<img src="https://cdn.hddfs.com/files/gd/20220504/59c9f78e_202205041254565010.jpg?sf=webp&amp;RS=131X131" alt="슈에무라 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006701" rel="nosublink">
							<p>아틀리에 코롱 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/006701_3.jpg?sf=webp&amp;RS=131X131" alt="아틀리에 코롱 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=007301" rel="nosublink">
							<p>키엘 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/007301_3.jpg?sf=webp&amp;RS=131X131" alt="키엘 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=063001" rel="nosublink">
							<p>케라스타즈</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/063001_3.jpg?sf=webp&amp;RS=131X131" alt="케라스타즈" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=053601" rel="nosublink">
							<p>버버리 뷰티</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/053601_3.jpg?sf=webp&amp;RS=131X131" alt="버버리 뷰티" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=024101" rel="nosublink">
							<p>프라다 향수</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/024101_3.jpg?sf=webp&amp;RS=131X131" alt="프라다 향수" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=063401" rel="nosublink">
							<p>구찌 뷰티</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/063401_3.jpg?sf=webp&amp;RS=131X131" alt="구찌 뷰티" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=022901" rel="nosublink">
							<p>에스티 로더</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/022901_3.jpg?sf=webp&amp;RS=131X131" alt="에스티 로더" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025701" rel="nosublink">
							<p>크리니크</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/025701_3.jpg?sf=webp&amp;RS=131X131" alt="크리니크" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=013101" rel="nosublink">
							<p>골든구스</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/013101_3.jpg?sf=webp&amp;RS=131X131" alt="골든구스" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025501" rel="nosublink">
							<p>조 말론 런던</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/025501_3.jpg?sf=webp&amp;RS=131X131" alt="조 말론 런던" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=026901" rel="nosublink">
							<p>달팡</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/026901_3.jpg?sf=webp&amp;RS=131X131" alt="달팡" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025401" rel="nosublink">
							<p>맥</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/025401_3.jpg?sf=webp&amp;RS=131X131" alt="맥" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025301" rel="nosublink">
							<p>라 메르 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/025301_3.jpg?sf=webp&amp;RS=131X131" alt="라 메르 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=027101" rel="nosublink">
							<p>톰포드 뷰티</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/027101_3.jpg?sf=webp&amp;RS=131X131" alt="톰포드 뷰티" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=024901" rel="nosublink">
							<p>르 라보 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/024901_3.jpg?sf=webp&amp;RS=131X131" alt="르 라보 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=026401" rel="nosublink">
							<p>오리진스 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/026401_3.jpg?sf=webp&amp;RS=131X131" alt="오리진스 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=026701" rel="nosublink">
							<p>랩시리즈 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/026701_3.jpg?sf=webp&amp;RS=131X131" alt="랩시리즈 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=028401" rel="nosublink">
							<p>프레데릭 말</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/028401_3.jpg?sf=webp&amp;RS=131X131" alt="프레데릭 말" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=067001" rel="nosublink">
							<p>크리스찬 루부탱 뷰티</p>
							<img src="https://cdn.hddfs.com/files/gd/20220829/f179847d_202208291029194800.jpg?sf=webp&amp;RS=131X131" alt="크리스찬 루부탱 뷰티" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=057001" rel="nosublink">
							<p>킬리안</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/057001_3.jpg?sf=webp&amp;RS=131X131" alt="킬리안" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=004901" rel="nosublink">
							<p>포레오</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/004901_3.jpg?sf=webp&amp;RS=131X131" alt="포레오" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=023901" rel="nosublink">
							<p>펜할리곤스</p>
							<img src="https://cdn.hddfs.com/files/gd/20211020/c9d90fa9_202110201126129160.jpg?sf=webp&amp;RS=131X131" alt="펜할리곤스" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=601401" rel="nosublink">
							<p>정관장</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/601401_3.jpg?sf=webp&amp;RS=131X131" alt="정관장" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=064301" rel="nosublink">
							<p>라티잔 퍼퓨머</p>
							<img src="https://cdn.hddfs.com/files/gd/20211116/58a8c781_202111161658026460.jpg?sf=webp&amp;RS=131X131" alt="라티잔 퍼퓨머" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=021901" rel="nosublink">
							<p>구찌 타임피스 앤 주얼리</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/021901_3.jpg?sf=webp&amp;RS=131X131" alt="구찌 타임피스 앤 주얼리" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=621700" rel="nosublink">
							<p>LG 생활건강</p>
							<img src="https://cdn.hddfs.com/files/gd/20211230/2770170e_202112301024035510.jpg?sf=webp&amp;RS=131X131" alt="LG 생활건강" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=007101" rel="nosublink">
							<p>라로슈포제 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/007101_3.jpg?sf=webp&amp;RS=131X131" alt="라로슈포제 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=622101" rel="nosublink">
							<p>설화수</p>
							<img src="https://cdn.hddfs.com/files/gd/20220622/c0e7428b_202206221414438690.jpg?sf=webp&amp;RS=131X131" alt="설화수" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=007001" rel="nosublink">
							<p>비쉬 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/007001_3.jpg?sf=webp&amp;RS=131X131" alt="비쉬 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=659901" rel="nosublink">
							<p>오에라</p>
							<img src="https://cdn.hddfs.com/files/gd/20220622/a84a5db1_202206221546194980.jpg?sf=webp&amp;RS=131X131" alt="오에라" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=131X131';">
						</a>
					</li>
				</ul>
        </li>
       	<li>
            <strong>행사중인 브랜드</strong>
            <ul class="depth_02 gnb_brand interestBranList">
            	<li class="interest663801">
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=663801" rel="nosublink">
							<p>카비시</p>
							<img src="https://cdn.hddfs.com/files/gd/20220919/fcc93058_202209191312028740.jpg?sf=webp&amp;RS=84X84" alt="카비시" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=84X84';">
						</a>
					</li>
				<li class="interest006301">
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006301" rel="nosublink">
							<p>랑콤</p>
							<img src="https://cdn.hddfs.com/files/gd/20220504/c20154c6_202205041256272420.jpg?sf=webp&amp;RS=84X84" alt="랑콤" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=84X84';">
						</a>
					</li>
				<li class="interest063001">
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=063001" rel="nosublink">
							<p>케라스타즈</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/063001_3.jpg?sf=webp&amp;RS=84X84" alt="케라스타즈" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=84X84';">
						</a>
					</li>
				<li class="interest006701">
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006701" rel="nosublink">
							<p>아틀리에 코롱 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/006701_3.jpg?sf=webp&amp;RS=84X84" alt="아틀리에 코롱 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=84X84';">
						</a>
					</li>
				<li class="interest063201">
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=063201" rel="nosublink">
							<p>모라츠</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/063201_3.jpg?sf=webp&amp;RS=84X84" alt="모라츠" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=84X84';">
						</a>
					</li>
				<li class="interest014601">
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=014601" rel="nosublink">
							<p>모스키노</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/014601_3.jpg?sf=webp&amp;RS=84X84" alt="모스키노" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&amp;RS=84X84';">
						</a>
					</li>
				</ul>
        </li>
    </ul>
</div><button class="gnb_close" style="display: none;">닫기</button>
	    </nav>
	</header><!-- // header -->
	    <!-- container -->
		<main id="container">
			<script type="text/javascript">
var lgcpBuyMbshGrpCd = '001';
var mbshGrpNm = '';
$(document).ready(function(){
    
	var offset = $("#dnldCup").offset();
	$('html').animate({scrollTop : offset.top - 600}, 0);
});
//지류쿠폰등록
function issuePptpCoupon(){
  
  var pptpCupNo = $("#pptpCupNo").val();
  if($.trim(pptpCupNo) == ""){
      alert("쿠폰 번호를 입력하세요."); /*쿠폰 번호를 입력하세요.*/
      $("#pptpCupNo").focus();
      return;
  }else{
      issuePptpCup(pptpCupNo,function(data){
          if ( data.resultCode == 1 ) {
              alert('쿠폰이 등록 되었습니다.'); /*쿠폰이 등록 되었습니다.*/
              window.location.reload();
          }
          else {
              alert('쿠폰 등록 대상이 아닙니다.'); /*쿠폰 등록 대상이 아닙니다.*/
          }
      });
  }
}

//쿠폰 개별 다운로드
function issueOneCoupon(cupId){
	if(lgcpBuyMbshGrpCd == "MG" || mbshGrpNm == "MG"){
        alert('본 혜택은 현대백화점면세점 일반회원만 다운로드 및 사용이 가능합니다.'); //본 혜택은 현대백화점면세점 일반회원만 다운 및 사용이 가능 합니다.
        return;
    }
	
    var psbVal = $('#cup_'+cupId).attr("issuPsbYn"); 
    
    $.ajax({
        async       : true,
        url         : ctx_curr + "/or/coupon/issueCoupon.json",
        dataType    : "json",
        type        : "POST",
        data        : {
            cupId:cupId
        },
        success     : function(data, textStatus, jqXHR){
            //if(!crew.ajaxValidate(data)){ return; } 
            if ( data.resultCode == 1 ) {
            	alert("쿠폰이 다운로드 되었습니다."); // 쿠폰이 다운로드 되었습니다. 
                window.location.reload();
            }else{ 
            	if(data.message == null){
            		alert('다운로드 받을 수 있는 쿠폰이 없습니다.'); // 
             	}else{ 
             		alert(data.message);// 쿠폰 단건  다운로드 실패 시, 그 이유     	
           		} 
            }
        },
        error       : function(jqXHR, textStatus, errorThrown){

        }
    });
     
}
  

// 쿠폰 전체 다운로드
function issueAllCoupon(){
	var cupCnt = '0';
	if(cupCnt == '0' ){
		alert('다운로드 받을 수 있는 쿠폰이 없습니다.'); /* 다운로드 받을 수 있는 쿠폰이 없습니다.*/ 
        return;	
	}
	if(lgcpBuyMbshGrpCd == "MG" || mbshGrpNm == "MG"){
		alert('본 혜택은 현대백화점면세점 일반회원만 다운로드 및 사용이 가능합니다.'); /* 본 혜택은 현대백화점면세점 일반회원만 다운 및 사용이 가능합니다.  */
        return;
    }
	
    var cupIds  = new Array();
    $('.product_list ul li[issuPsbYn=Y]').each(function(i,cup){
        cupIds.push($(this).attr('cupId'));
    });
    
    if ( cupIds.length == 0 ) {
    	alert('다운로드 받을 수 있는 쿠폰이 없습니다.'); // 다운로드 받을 수 있는 쿠폰이 없습니다. 
        return;
    } 
     
    
    issueMultiCoupon(cupIds,function(datas){
        var succCnt     = 0;
        var failCnt     = 0;
        $(cupIds).each(function(i,cupId){
            
            if ( datas[cupId].resultCode == '1' ) {
                succCnt+=1;
            }
            else {
                failCnt+=1;
            }
        });
        
        if(succCnt == cupCnt) {
        	alert('총 %s개 쿠폰이 다운로드 되었습니다.'.replace("%s", succCnt ) ); //  총  %%s개 쿠폰이 다운로드 되었습니다.
            window.location.reload();
        }else if (succCnt == 0) { 
        	alert('다운로드 받을 수 있는 쿠폰이 없습니다.'); /* 다운로드 받을 수 있는 쿠폰이 없습니다. */
        }else {
        	alert('총 %s개 쿠폰이 다운로드 되었습니다.'.replace("%s", succCnt )); // 총  %%s개 쿠폰이 다운로드 되었습니다.          
        	window.location.reload();
        }
        
    }); 
    
}


function fn_downPsCpList(){
	$(location).attr("href","https://www.hddfs.com/shop/mm/myBnf/dnldCup.do");
}

function fn_couponList(){
	$(location).attr("href","https://www.hddfs.com/shop/mm/myBnf/listCup.do");
}
function fn_branList(){
	$(location).attr("href","https://www.hddfs.com/shop/mm/myBnf/branCup.do");
} 


</script> 
<main id="container">
            <div class="location_all"><article class="location">
                <section class="box">
                    <a nohref="" onclick="goUrl('/dm/main.do');" class="home">홈</a>
                    <div>
                    	<span>마이현대</span>
                    </div>
                    <div>
                    	<span>쿠폰 내역</span>
                    </div>
                </section>
            </article></div>
            <article class="top_fullbg">
    <h2 class="page_tit">쿠폰 내역</h2>    
    <div class="myhd_firinfo" style="height: 120px;">
			<div class="myinfo">
				<p class="name">
					<strong> 박진수</strong> <em>님</em>
				</p>
				
				<p class="passinfo">
                        <span>sda121*****</span> 
                        <span>2023-01-18</span></p>
                 
			</div>
			<div class="mypresent" style="height: 120px;">
				<dl style="height: 110px;">
					<a href="https://www.hddfs.com/shop/mm/myBnf/listSvmt.do">
						<dt>적립금</dt>
						<dd id="svmtAmt">
							<strong>767</strong>원
						</dd>
					</a>
				</dl>
				<dl style="height: 110px;">
					<a href="/member/Mypage_coupon">
						<dt>쿠폰</dt>
						<dd>
							<strong>0</strong>장
						</dd>
					</a>
				</dl>
				<dl style="height: 110px;"><dt>H.Point</dt><dd><a nohref="" id="btnHeaderUmbSwitcJoin1">통합회원 전환</a></dd></dl>
				<dl style="height: 110px;">
					<dt>오프라인 선불카드</dt>
					<dd>
						<a class="link_txt_point ty_s" onclick="location.href='//www.hddfs.com/shop/mm/myInfo/inptMbshPwd.do?type=pspt';">여권정보
							등록</a>
					</dd>
				</dl>
				<dl style="height: 110px;">
					<dt>구매금액</dt>
					<dd id="setTotBuyAmtNtnl">
						<strong>$ 93.95</strong>
					</dd>
				</dl>
			</div>
		</div>
</article>    
<script type="text/javascript">

$(document).ready(function(evt){
    getSvmtAmtAble();
    fnGetOffSptmCard();
    
    
    getTotBuyAmtNtnl();
    
    $('#hpointAmt').parent().html("<dt>H.Point</dt><dd><a nohref id='btnHeaderUmbSwitcJoin1'>통합회원 전환</a></dd>");
    $('#btnHeaderUmbSwitcJoin1').click(function() {
        popOpen(ctx_curr + '/mm/myInfo/umbMbshJoinNtcPop.do', 'chgUmbMbshPop', 450, 500);
    });
    
    $(".btn_view").click(function(){
        $(this).toggleClass("plus");
        $(".mymenu").toggleClass("plus");
    });
    
});

$(function(){
	
    $('#btnHeaderPsptChg').click(function() {
        location.href = ctx_curr + '/mm/myInfo/inptMbshPwd.do?type=pspt';
    });

    
    $('#btnHeaderUmbSwitcJoin1,#btnHeaderUmbSwitcJoin2,#btnHeaderUmbSwitcJoin3').click(function() {
        popOpen(ctx_curr + '/mm/myInfo/umbMbshJoinNtcPop.do', 'chgUmbMbshPop', 450, 500);
    });
});

function fnGetOcrnPntAmt(){
	$.ajax({
        async       : true,
        url         : ctx_curr + '/or/order/getMemberSimpRsvg.json',
        dataType    : 'json',
        type        : 'POST',
        success     : function(data, textStatus, jqXHR){
            if(!crew.ajaxValidate(data)){ return; }
            

            if(data.redirect != null){
            	if(data.redirect.ocrnPnt != null){
            		$('#hpointAmt').html('<strong>'+ comma(data.redirect.ocrnPnt) +'</strong>P');
            	}
            }else{
            	$('#hpointAmt').parent().html("<dt>H.Point</dt><dd><a nohref id='btnHeaderUmbSwitcJoin1'>통합회원 전환</a></dd>");
            	$('#btnHeaderUmbSwitcJoin1').click(function() {
                    popOpen(ctx_curr + '/mm/myInfo/umbMbshJoinNtcPop.do', 'chgUmbMbshPop', 450, 500);
                });
            }

        },
        error       : function(jqXHR, textStatus, errorThrown){
        }
    });
}


function fnGetOffSptmCard(){
    $.ajax({
        async       : true,
        url         : ctx_curr + '/mm/myBnf/offSptmCard.json',
        dataType    : 'json',
        type        : 'POST',
        success     : function(data, textStatus, jqXHR){
        	if(!crew.ajaxValidate(data)){ return; }
        	if(data.offSptmCardListInfoAmt != null && data.offSptmCardListInfoAmt != 0 && data.offSptmCardListInfoAmt != '0'){
        		$('#setOffSptmCard').html('<strong>'+ comma(data.offSptmCardListInfoAmt) +'</strong>원');
        	}
        },
        error       : function(jqXHR, textStatus, errorThrown){
        }
    });
}


function fnGetHpointAmt(){
    $.ajax({
        async       : true,
        url         : ctx_curr + '/mm/myInfo/getHpointAmt.json',
        dataType    : 'json',
        type        : 'POST',
        success     : function(data, textStatus, jqXHR){
            if(!crew.ajaxValidate(data)){ return; }
            $('#hpointAmt').html('<strong>'+ comma(data.hpointAmt) +'</strong>P');
        },
        error       : function(jqXHR, textStatus, errorThrown){
        }
    });
}


function fnGetHpointPlsAmt(){
    $.ajax({
        async       : true,
        url         : ctx_curr + '/mm/myInfo/getHpointAmt.json',
        dataType    : 'json',
        type        : 'POST',
        success     : function(data, textStatus, jqXHR){
            if(!crew.ajaxValidate(data)){ return; }
            $('#hpointPlsAmt').html('<strong>'+comma(data.hpointAmt)+' </strong>P');
        },
        error       : function(jqXHR, textStatus, errorThrown){
        }
    });
}


function getSvmtAmtAble(){
    $.ajax({
        async       : true,
        url         : ctx_curr + "/mm/myInfo/getSvmtAmtAble.json",
        dataType    : "json",
        type        : "POST",
        success     : function(data, textStatus, jqXHR){
        	var vInfo = data.info;
            if(!crew.ajaxValidate(data)){ return; }
            $("#svmtAmt").html('<strong>'+comma(vInfo.data.svmtAmt)+'</strong>원');
        },
        error       : function(jqXHR, textStatus, errorThrown){
        }
    });
}

function getTotBuyAmtNtnl(){
    $.ajax({
        async       : true,
        url         : ctx_curr + '/mm/my/getTotBuyAmtNtnl.json',
        dataType    : "json",
        type        : "POST",
        success     : function(data, textStatus, jqXHR){
            var vInfo = data.info;
            var totBuyAmtNtnl=vInfo.data.totBuyAmtNtnl;
            var nextLvluBuyAmtNtnl=vInfo.data.nextLvluBuyAmtNtnl;
            
            $('#setTotBuyAmtNtnl').html('<strong>＄' + comma(Math.round(totBuyAmtNtnl * 100)/100) +'</strong>');
            
            
            if(totBuyAmtNtnl > nextLvluBuyAmtNtnl){
                $('#setRestPrice').html('<strong>＄0</strong>');
            }else{
                $('#setRestPrice').html('<strong>＄'+ comma(Math.round((nextLvluBuyAmtNtnl-totBuyAmtNtnl) * 100)/100) +'</strong>');    
            }
            
            var percentValue = 0;
            if((totBuyAmtNtnl / nextLvluBuyAmtNtnl *100) > 100 ){
                percentValue = 100;
            }else{
                percentValue = totBuyAmtNtnl/nextLvluBuyAmtNtnl * 100;
            }
                 
        },
        error : function(jqXHR, textStatus, errorThrown) {
        }
    });
}

function goUrl(url){
    location.href = ctx_shop + url;
}


function liMyChgPwd(){
	
    var vAucaType = 'GENE'; 
    if(vAucaType == 'INTG') { 
        
        alert('고객님은 H.Point통합회원이십니다. H.Point통합회원의 경우 비밀번호변경은 통합멤버십 사이트에서 가능합니다.');
        popup = window.open(gUmbMbshUrl + '/cu/mem/showCustInfo.shd', 'umbIndexPop', "width=800, height=920");
        
        
    } else { 
            location.href = ctx_shop + '/mm/myInfo/inptMbshPwd.do?type=pwd';
    }
}


function goHPointPay(umbMbshId){
    if(umbMbshId != '') { // 통합회원: H.Point Pay 이동
        goUrl('/mm/myOrder/listHPointPay.do');
    } else { // 일반회원: 통합회원 전환 창 이동
        popOpen(ctx_curr + '/mm/myInfo/umbMbshJoinNtcPop.do', 'chgUmbMbshPop', 450, 500);
    }
}



$(function(){
	$('.myinfo .name strong').each(function () {
		if (this.offsetHeight < this.scrollHeight ){
			$(this).addClass('ellipsised');
		} else {
			$(this).removeClass('ellipsised');
		}
	});
});
</script><article id="content">
   <section class="myhd_content">
        <div class="myhd_dashbord">
            <div class="dashbord_1">
                <dl class="dashbord_ti">
                    <dt>사용 가능 쿠폰
                        <div class="square_tooltip ">
                            <a nohref="" class="btn btn_tooltip">도움말</a>
                            <div class="tooltip type02">
                                <p class="ti">사용가능 쿠폰</p>
                                <p>고객님이 보다 저렴하게 구매하실 수 있도록 제공해드리는 혜택입니다.</p>
                                <ul class="dot_list small xsm">
                                    <li>정액쿠폰 : 구매 시 정해진 금액 할인</li>
                                    <li>정률쿠폰 : 구매 시 상품 가격에 일정 비율 할인</li>
                                </ul>
                                <button class="close">닫기</button>
                            </div>
                        </div>
                    </dt>
                    <dd class="normal">0<span>장</span></dd>
                </dl> 
                <div class="dashbord_details">
                	</div> 
            </div>
        </div>
        
        <dl class="coupon_regist">
            <dt>지류 쿠폰 등록
                <div class="square_tooltip">
                    <a nohref="" class="btn btn_tooltip">도움말</a>
                    <div class="tooltip type02">
                        <p class="ti">지류 쿠폰 등록</p>
                        <p>오프라인 매장 또는 제휴처에서 발급받은 쿠폰 교환 난수번호를 입력하시면 주문시 사용가능한 쿠폰으로 등록됩니다.</p>
                        <button class="close">닫기</button>
                    </div>
                </div>
            </dt>
            <dd>
            	<span class="input_de large"> 
	                <input type="text" id="pptpCupNo" name="pptpCupNo" placeholder="쿠폰 번호 입력" onkeypress="if(event.keyCode==13){issuePptpCoupon();}"><button class="btnde_type1 large" onclick="issuePptpCoupon();"><strong>등록</strong></button>
                </span> 
            </dd>
        </dl> 
        
        <div class="tab-style mt40">
            <ul class="tab_1depth_3">
                <li id="listCup" onclick="fn_couponList();">
                    <a nohref="">쿠폰 내역</a>
                </li>
                <li id="dnldCup" class="ui-tabs-active">
                    <a nohref="">다운로드 가능 쿠폰</a>
                </li>
                </ul>
        </div>
        
        <div class="download_coupon">
        	<div class="sorting_wrap myhd myhd2">
                <span class="txt_total">
					총<strong> 0</strong>개
				</span> 
                <div class="sort_r">
                    <a href="javascript:issueAllCoupon();" class="btnde_type12 small bg_black">전체 다운로드</a>
                </div>
            </div> 
            <div class="product_list" id="dnldCup_list">
                <ul> 
                	<!-- <p class="emptydata">다운로드 가능한 쿠폰이 없습니다.</p>  -->
                	<li> 
		                    <span class="e_img">
		                    	<a href="/event/eventpage?mid=${mid }">
					                <img src="https://cdn.hddfs.com/files/op/20221229/f0b50770_202212290841234650.jpg?sf=webp&amp;RS=750X400&amp;CS=504X400" alt="새로운 1월의 혜택" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/files//images/KO/common/no_img250.jpg?sf=webp&amp;RS=750X400&amp;CS=504X400';">
		                    	</a>	  
		                    </span>
		                    <div class="evl_text">
		                        <dl>
		                        	<a href="https://www.hddfs.com/event/op/bnf/listBnf.do?evntId=0004013">
						                <dt>새로운 1월의 혜택</dt>
			                            <dd class="evl_mtxt">새해 선물 받아가세요!</dd>
			                            <dd class="evl_stxt">
			                            	2023-01-01
											~
											2023-02-28</dd>
		                            </a>
		                        </dl>
		                        <button class="btn_onoff btn_like evl_like" onclick="mergeMyEvnt('0004013', this);">
		                        	좋아요
		                        </button>
		                    </div>
		                </li>
                    </ul>                
            </div>
             
            </div> 
        <div class="attention_area">
			<p class="attention_tit">유의사항</p>
		        <ul class="attention_list">• 하나의 주문 건, 또는 하나의 상품에 하나의 쿠폰만 사용 가능합니다.<br>
• 결제 시 쿠폰을 적용하지 않으면 할인이 적용되지 않습니다.<br>
• 모든 쿠폰은 사용기간이 있으며, 기간이 지난 쿠폰은 사용이 불가능합니다.<br>
• 쿠폰은 장바구니에 담긴 상품들(쿠폰 사용가능 브랜드限)의 가격에 비례하여 배분적용 됩니다.<br>
• 취소/반품 시 쿠폰에 의해 할인된 금액을 제외한 실 결제 금액만 반환됩니다.<br>
• 30%이상 할인 상품, 균일가 상품, 일부 카테고리 상품과 일부 브랜드 상품은 쿠폰 사용이 제한됩니다.<br>
• 쿠폰 제외 상품은 상품쿠폰, 장바구니 쿠폰 모두 적용되지 않습니다.<br>
• 유효기간이 경과된 쿠폰은 내역에서 자동 삭제됩니다.</ul> 
		    </div>
		</section>
<div class="totop" style="display: none; bottom: 192px;"><a href="#none">처음으로 이동</a></div></article>
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
<footer id="footer">
    <div class="policy">
        <div class="box">
            <div class="policy_menu">
                <a href="https://www.hddfs.com/store/kr/dm/main.do" target="_blank">현대백화점  DUTY FREE 소개</a>
                <a href="https://www.hddfs.com/shop/om/consmCont/stoPtnsQust.do">입점/제휴</a>
                <a href="https://www.hddfs.com/shop/om/consmCont/selectMbshJoinTcnd.do?mbshJoinTcndCd=001">이용약관</a>
                <a href="https://www.hddfs.com/shop/om/consmCont/selectMbshJoinTcnd.do?mbshJoinTcndCd=008">
                    <strong>개인정보처리방침</strong>
                </a>
                <a href="https://www.hddfs.com/shop/om/consmCont/selectMbshJoinTcnd.do?mbshJoinTcndCd=005">영상정보처리기기 운영 / 관리방침</a>
                <a href="javascript:" onclick="popEmailReject();">이메일무단수집거부</a>
            </div>
            <div class="family_site">
                <button>Family Site</button>
                <div class="list">
                    <p>쇼핑몰 사이트</p>
                    <ul>
                        <li><a href="http://www.hyundaihmall.com/" target="_blank">현대Hmall</a></li>
                        <li><a href="http://www.thehyundai.com/" target="_blank">더현대닷컴</a></li>
                        <li><a href="http://www.thehandsome.com/" target="_blank">더한섬</a></li>
                        <li><a href="http://mall.hyundailivart.co.kr/" target="_blank">현대리바트몰</a></li>
                        <li><a href="http://www.hyundairentalcare.co.kr/" target="_blank">현대렌탈케어</a></li>
                        <li><a href="http://www.hfashionmall.com/" target="_blank">H패션몰</a></li>
                        <li><a href="http://www.h-vrstation.com/" target="_blank">VR STATION</a></li>
                    </ul>
                    <p>관계사 사이트</p>
                    <ul>
                        <li><a href="http://www.ehyundai.com/newPortal/ir/main.do" target="_blank">현대백화점그룹</a></li>
                        <li><a href="https://www.ehyundai.com/newPortal/index.do" target="_blank">현대백화점</a></li>
                        <li><a href="https://www.hyundaihmall.com/" target="_blank">현대홈쇼핑</a></li>
                        <li><a href="https://hyundaigreenfood.com/" target="_blank">현대그린푸드</a></li>
                        <li><a href="http://www.hyundaicatering.co.kr/" target="_blank">현대캐터링시스템</a></li>
                        <li><a href="http://www.cnsfoodsystem.co.kr/" target="_blank">C&amp;S푸드시스템</a></li>
                        <li><a href="https://www.handsome.co.kr/ko/main.do" target="_blank">한섬</a></li>
                        <li><a href="https://www.hyundailivart.co.kr/" target="_blank">현대리바트</a></li>
                        <li><a href="http://www.hyundailnc.com/" target="_blank">현대L&amp;C</a></li>
                        <li><a href="http://home.hyundaidreamtour.com/" target="_blank">현대드림투어</a></li>
                        <li><a href="http://www.hyundairentalcare.co.kr/" target="_blank">현대렌탈케어</a></li>
                        <li><a href="https://www.hyundaifuturenet.co.kr/" target="_blank">현대퓨처넷</a></li>
                        <li><a href="http://www.everdigm.com/" target="_blank">에버다임</a></li>
                        <li><a href="http://www.hyundai-ite.com/" target="_blank">현대IT&amp;E</a></li>
                        <li><a href="http://www.hyundaibioland.co.kr/" target="_blank">현대바이오랜드</a></li>
                        <li><a href="https://www.ezwel.com/" target="_blank">현대이지웰</a></li>
                        <li><a href="https://sikdae.com" target="_blank">벤디스(식권대장)</a></li>
                        <li><a href="http://www.ehyundai.com/newPortal/sc/main/main.do" target="_blank">현대백화점그룹 사회복지재단</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="copy">
        <div class="copyright">
            <div class="logo">
                <span onclick="moveToMain();" style="cursor:pointer;">HYUNDAI DEPARTMENT SHOP - DUTY FREE</span>
                <strong>주식회사 현대백화점면세점</strong>
            </div>
            <ul>
                <li>
                    <span>대표이사 : 이재실</span>
                    <span>서울특별시 강남구 영동대로82길 19</span>
                    <span>사업자등록번호 : 850-88-00325</span>
                </li>
                <li>
                    <a href="http://www.ftc.go.kr/www/bizCommView.do?key=232&amp;apv_perm_no=2018322016230202228&amp;pageUnit=10&amp;searchCnd=wrkr_no&amp;searchKrwd=8508800325&amp;pageIndex=1" target="_blank">사업자정보확인</a>
                    <a href="javascript:" onclick="sellerInfo();">판매자별 사업자 정보</a>
                </li>
                <li>
                    <span>통신판매업신고 : 2018-서울강남-02228</span>
                    <span>개인정보보호책임자 : 반형철</span>
                    <span>호스팅사업자 : (주)현대백화점면세점</span>
                </li>
                <li>
                    <span>대표번호 : 1811-6688</span>
                    <span>대표메일 : hddfs_official@hddfs.com</span>
                </li>
            </ul>
            <p>COPYRIGHT © HYUNDAI DEPARTMENT STORE DUTY FREE. ALL RIGHTS RESERVED.</p>
            <div class="sns_link">
                <a href="https://www.facebook.com/HDDFS.official/" target="_blank" class="facebook">facebook</a>
                <a href="https://www.instagram.com/hddfs.official/" target="_blank" class="instagram">instagram</a>
            </div>
        </div>
        <div class="escrow">
            <strong>주식회사 케이에스넷 구매안전(에스크로) 서비스 가맹점</strong>
            <span>
                안전한 전자상거래를 위해 ㈜ 케이에스넷의 구매안전(에스크로) 서비스에 <br>
                가입하여, 구매안전(에스크로) 서비스를 제공하고 있습니다.
            </span>
            <p>주식회사 케이에스넷 금융감독원 결제대금예치업</p>
            <p>등록번호 : 02-006-00002</p>
            <a href="javascript:" onclick="popOpen('http://pgims.ksnet.co.kr/pg_infoc/src/dealinfo/pg_shop_info2.jsp?shop_id=2001106156', 'popEscrowNet', 750, 300);" class="btn_escrow">가입확인하기</a>
            <div class="list_prize">
	            <ul>
		            <li class="ismsp">
		                인증범위 : 현대백화점면세점 면세점 서비스 운영<br>유효기간 : 2022.11.27~2025.11.26
		            </li>
					<li class="award">
						<a href="http://www.i-award.or.kr/Smart/Assess/FinalCandidateView.aspx?REG_SEQNO=10902" target="_blank">스마트앱어워드 2021<br>디자인 이노베이션 대상</a>
					</li><!--//award-->
					<li class="first">
						<a href="https://fba.kcforum.co.kr/2023/winner.php" target="_blank">2023 대한민국 퍼스트브랜드 대상 <br>면세점 부문 2년 연속 1위</a>
					</li><!--//first-->
				</ul>
			</div><!-- //list_prize -->
        </div><!-- //escrow -->
    </div>
</footer>

<!-- 판매자별 사업자 정보 -->
</main></div>
	<!-- 공통 팝업 정의 START -->
	<style type="text/css">
/* 레이어 팝업 */
.swiper_control {position:relative}
.swiper_control .swiper-pagination {text-align:justify; bottom:30px; left:40px; font-size:15px; font-weight:600; color:#ffffff}
.swiper_control .swiper-pagination span.space { padding:0 3px; font-weight:400}
.swiper_control .swiper-pagination span.num_total {font-weight:400}
.popswiper-container .swiper-prev {background:url('https://cdn.hddfs.com/front/images/KO/common/icon_controller.png')0 -32px no-repeat; width:9px; height:13px; position:absolute; bottom:33px; left:94px; z-index:100}
.popswiper-container .swiper-next {background:url('https://cdn.hddfs.com/front/images/KO/common/icon_controller.png')-9px -32px no-repeat; width:9px; height:13px; position:absolute; bottom:33px; left:112px; z-index:100}

.ui-dialog.ui-widget.ui-widget-content.layer_newtype {background:#fff;border-radius:20px}
.ui-dialog.layer_newtype .ui-dialog-titlebar {display:none}
</style>

<script type="text/javascript">
  
// 팝업 닫기
function closeMainLayer(popSeq){
	$("#main_bottom_pop"+popSeq).remove();
	if($(".main_popup").length <1){
		$('.modal_wrap').removeClass('active');
	}
}

// 메인레이어팝업 오늘하루 보지않기 + 쿠키저장
function saveMainLayerCookie(popSeq){
	
	// 쿠키 저장
	if($("#btn_hidden_layer_"+popSeq).attr("hiddenYn") == 'N'){
		var date = new Date();
		date.setTime(date.getTime() + (1000 * 60 * 60 * 24));
		date.setHours(0);
		date.setMinutes(0);
		date.setSeconds(0);
		$.cookie("closePop" + popSeq, "Y", { expires: date, path : "/" });
		$("#main_bottom_pop"+popSeq).remove();
		if($(".main_popup").length <1){
			$('.modal_wrap').removeClass('active');
		}
	}
}

function callMainPopSwiper(){
	
	var mainpopupswiper = new Swiper('.popswiper-container', {
		slidesPerView: "auto",
		observer:true,
		observeParents:true,
		pagination:{
			el: '.swiper-pagination',
			type: 'custom',
			renderCustom: function (mainpopupswiper, current, total) {
				var customPaginationHtml = "";
				for(var i = 0; i < total; i++) {
				if(i == (current - 1)) {
					customPaginationHtml += '<span class="visual-pagination-customs visual-pagination-customs-active"></span>';
				}else{
					customPaginationHtml += '<span class="visual-pagination-customs"></span>';
				}
				}
				if(total < 10){
				total = "0" + total
				}
				if(current < 10){
				current = "0" + current
				}
				var fraction =  current + '<span class="space">/</span>'  + '<span class="num_total">'+total+'</span>';
				return  fraction;
			},
		},
		navigation: {
			nextEl: '.swiper-next',
			prevEl: '.swiper-prev',
		},
		autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        },
	});
}
</script>
<div class="modal_wrap mainPopWrap">
</div>  <!-- 공통 팝업 정의 ENd -->
	<div class="layer_unit pop_o8_adult" style="display:none">
    <div class="layer_popup">
        <div class="layer_cont">
            <p class="txt_ty1">성인인증 안내</p>
            <p class="text_ty2">
                본 상품은 성인인증 이후 이용이 가능합니다.<br>
                성인인증 화면으로 이동하시겠습니까?
            </p>
            
            <ul class="btn_group">
                <li><a nohref="" class="btnde_type1 mid adultCancle">취소</a></li>
                <li><a nohref="" id="chkBtn" value="" class="btnde_type1 mid bg_black" onclick="adultAuthPop(this);" data-setid="" data-cartseq="" data-cartsetid="" data-notadtgoodscd="" data-notadtqtylist="">확인</a></li>
                <input type="hidden" id="goodsCd" value="">
                <input type="hidden" id="qty" value="">
                <input type="hidden" id="adtBuyNow" value="">
            </ul>
        </div>
    </div>
    <div class="event_type_close">닫기</div>
</div>
<div id="layer_popup_adult" class="pop_o9_adult" title="성인인증" style="display:none">
    <div class="adult_popup">
        <strong class="tit">본 상품정보는 '청소년에게 유해한 정보'를 <br>포함하고 있기에 성인인증이 필요합니다.</strong>
        <ul>
            <li>본 정보 내용은 청소년 유해물건으로 청소년보호법의 규정에 의하여 만 19세 미만의 청소년이 이용할 수 없습니다.</li>
        </ul>

        <strong class="box">
            이용을 원하시면 로그인 후 <br>성인인증을 진행해주시기 바랍니다.
            <em>이 상품은 비회원 주문이 불가한 상품입니다.</em>
        </strong>
        <p>본인확인이 가능하지 않은 경우 <br>현대백화점면세점 고객센터로 연락주시기 바랍니다.</p>
        <a nohref="" id="hpAuth" value="" class="phonecertification_btn" data-gooscd="" data-qty="" data-buynow="" data-setid="" data-cartseq="" data-cartsetid="" data-notadtgoodscd="" data-notadtqtylist="">
            <span>휴대폰 인증</span>
        </a>

        <dl>
            <dt>유의사항</dt>
            <dd>휴대폰을 이용한 본인확인은 본인명의의 휴대전화로만 인증이 가능합니다.</dd>
        </dl>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
    
	if(isLogin){
    	adultCallback();
	}else{
		deleteCookie("ADULT_TYPE");
		deleteCookie("ADULT_GOOSCD");
	    deleteCookie("ADULT_QTY");
	    deleteCookie("NOT_ADULT_GOOSCD");
	    deleteCookie("NOT_ADULT_QTY");
	    deleteCookie("ADULT_SETID");
	    deleteCookie("ADULT_BUYNOW");
	}
	
	
    
})


/* 휴대폰 인증  */
$("#hpAuth").click(function(){
    var type = $(this).attr("value");
    var goodsCd = $(this).attr("data-goosCd");
    var qty = $(this).attr("data-qty");
    var buynow = $(this).attr("data-buynow");
    var setGoosId = $(this).attr("data-setid");
    var cartSeq = $(this).attr("data-cartseq");
    var cartSetId = $(this).attr("data-cartsetid");
    var notAdtGoodsCd = $(this).attr("data-notAdtGoodsCd");
    var notAdtQtyList = $(this).attr("data-notAdtQtyList");
    
    console.log(type);
    
    openDRMOKWindow(type,goodsCd,qty,buynow,setGoosId,cartSeq,cartSetId,notAdtGoodsCd , notAdtQtyList);
});

$(".event_type_close").click(function(){
    $(this).parent().dialog("close");
});

$(".adultCancle").click(function(){
	$(this).closest(".pop_o8_adult").dialog("close");
}); 

/* 성인인증 팝업 */
function openPopup(obj,type,goodsCd,qtyList,setGoosId , buyNow, cartSeq , cartSetId, notAdtGoodsCd , notAdtQtyList){
    console.log('19세팝업 openPopup')
    console.log(goodsCd + '----' + qtyList);
    if(!isLogin){
        login("","",type,goodsCd,qtyList,setGoosId ,buyNow,notAdtGoodsCd,notAdtQtyList); 
     return false;
    }   
    
    adultPopup(type,goodsCd,qtyList , buyNow,setGoosId , cartSeq , cartSetId,notAdtGoodsCd,notAdtQtyList);  
    
}

function adultPopup(type,goodsCd,qtyList, buyNow,setGoosId , cartSeq , cartSetId, notAdtGoodsCd , notAdtQtyList){
    
    console.log(type);
    console.log('19세팝업 adultPopup');
    console.log(goodsCd + '----' + qtyList);
    console.log(cartSeq);
    console.log(cartSetId);
    
    //$("#layer_default_adult").show();
    
    $(".pop_o8_adult").dialog({
        resizable: false,
        dialogClass:"event_type",
        width:370,
        minHeight: 120,
        maxHeight: 600,
        modal: true
    });
    
    $("#chkBtn").attr("value",type);
    $("#chkBtn").closest('li').next().attr("value",goodsCd);
    $("#chkBtn").closest('li').next().next().attr("value",qtyList);
    $("#chkBtn").closest('li').next().next().next().attr("value",buyNow);
    $("#chkBtn").attr("data-setid",setGoosId);
    $("#chkBtn").attr("data-cartseq",cartSeq);
    $("#chkBtn").attr("data-cartsetId",cartSetId);
    $("#chkBtn").attr("data-notAdtGoodsCd",notAdtGoodsCd);
    $("#chkBtn").attr("data-notAdtQtyList",notAdtQtyList);
}

function adultAuthPop(obj){
    
    console.log($(obj).attr('value'));
    
    $(".pop_o8_adult").dialog("close");
    
    $(".pop_o9_adult").dialog({
        //resizable: false,
        dialogClass: "pop_type1",
        width: 380,
        minHeight: 120,
        maxHeight: 600,
        modal: true
    });
    
    var goodsCd = $(obj).closest("li").next().attr("value");
    var qty = $(obj).closest("li").next().next().attr("value");
    var buyNow = $(obj).closest("li").next().next().next().attr("value");
    var setGoosId = $(obj).attr("data-setid");
    var cartSeq = $(obj).attr("data-cartseq");
    var cartSetId = $(obj).attr("data-cartsetId");
    var notAdtGoodsCd = $(obj).attr("data-notAdtGoodsCd");
    var notAdtQtyList = $(obj).attr("data-notAdtQtyList");
    
    
    $("#hpAuth").attr('value',$(obj).attr("value"));
    $("#hpAuth").attr('data-goosCd',goodsCd);
    $("#hpAuth").attr('data-qty',qty);
    $("#hpAuth").attr('data-buynow',buyNow);
    $("#hpAuth").attr('data-setid',setGoosId);
    $("#hpAuth").attr('data-cartseq',cartSeq);
    $("#hpAuth").attr('data-cartsetId',cartSetId);
    $("#hpAuth").attr('data-notAdtGoodsCd',notAdtGoodsCd);
	$("#hpAuth").attr('data-notAdtQtyList',notAdtQtyList);
    
    
    
} 

function callback(obj){
    console.log(obj);
    $(location).attr("href", obj);
}

function adultSuccessAlert(){
	
	setTimeout(function(){
		alert('정상적으로 처리되었습니다.');  // 정상적으로 처리되었습니다.
    }, 100);
}

function adultErrorAlert(obj){
	
	setTimeout(function(){
		alert(obj);
    }, 100);
}

function closeAdultPopup(){
	$("#layer_popup_adult").dialog("close");
}


function removeAdult(){
	
	var goosCd = "";
	var minBuyQty = "";
	var url = "https://www.hddfs.com/shop";
    
	$.each($(".goosList"),function(i,el){
        
        if($(this).attr("data-adult") == "Y"){
            $(this).removeAttr("data-adult");
            $(this).removeAttr("adult");
            goosCd = $(this).attr("data-gooscd");
			minBuyQty = $(this).attr("data-minbuyqty");
			$(this).find('a').attr('onclick', '').unbind('click');
			$(this).find("a").attr("href",url+"/gd/dtl/goos.do?onlnGoosCd="+goosCd);
			$(this).find('.cartBtn').attr("onclick",'newAddCartMulti("'+goosCd+'", "'+minBuyQty+'", "", "", "order","N",event)');
			$(this).find('.buyBtn').attr("onclick",'newAddCartMulti("'+goosCd+'", "'+minBuyQty+'", "", "", "order","Y",event)');
        }
        
    })
    
    $.each($(".goosLi"),function(i,el){
    	if($(el).attr("data-adult") == "Y"){
	    	$(el).removeAttr("data-adult");
        }
    });
}


function openDRMOKWindow(type,goodsCd,qty,buynow,setGoosId, cartSeq , cartSetId, notAdtGoodsCd , notAdtQtyList){
    
    /* 휴대폰 인증 관련 공지*/
    var url = "https://www.mobile-ok.com/popup/common/hscert.jsp";

    var DRMOK_window;
    
    var redirectUrl = "";
    if(type == "detail"){
        redirectUrl = "https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd="+goodsCd; 
    }
    
    var goosCdArr = new Array();
    goosCdArr = goodsCd.split(",");
    goosCdLength = goosCdArr.length;
    
    var notAdtGoosCdArr = new Array();
    notAdtGoosCdArr = notAdtGoodsCd.split(",");
    notAdtGoosCdLength = notAdtGoosCdArr.length;
    
    var goosInfo = new Array();
    goosInfo.push(type);
    goosInfo.push(buynow);
    goosInfo.push(setGoosId);
    goosInfo.push(cartSeq);
    goosInfo.push(cartSetId);
    goosInfo.push(goosCdLength);
    goosInfo.push(goodsCd);
    goosInfo.push(qty);
    goosInfo.push(notAdtGoosCdLength);
    goosInfo.push(notAdtGoodsCd);
    goosInfo.push(notAdtQtyList);
    
    
    
    window.name = 'sendJsp';
    DRMOK_window = window.open(url+'?cpid=hddfs&rtn_url=http://www.hddfs.com/shop/mm/mbshAuca/adultAuca.do?goosInfo='+goosInfo+'&req_info=Y0e2I4MUECtP29Uu610fHj6KEv4p0A%2FiXtsJs01jwTmK6rioSUDs71xVnzpb9jk%2FPza0LpCYkbDr59p8q4yngbVRhmCzKk%2FA%2BfhdwpdKV4tXJSQ2HQsjAxkrySGvhKollI4O7ANq8qtT8YDYEPVRLsRCkXn9DYrb3OpRkkNfuU9ZRgeqVufQPwoMgKolY5XQFZjWJj8ImDZZfVcebUQVlFA0LcWIEWZrGIzAO8NsiTgHT5BO96WMpcjkT%2FR3aFX0JctEgpixF%2B2jG%2BRIQojgp5hsGXtHyYzWx1GZSMrxAioqgR4PdUPzUsI%2FRYxEB8CobFtN%2BqeADoddpNyggp93WQ%3D%3D', 'DRMOKWindow', 'width=425,height=550,scrollbars=no,toolbar=no,location=no,directories=no,status=no' );
    DRMOK_window.focus();

    if(DRMOK_window == null){
        alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n 화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
    }
}

function reload(){
    location.reload();
}

function adultCallback(){
	
	var adultType = getCookie("ADULT_TYPE");
    var goosCd = getCookie("ADULT_GOOSCD");
    var qtyList = getCookie("ADULT_QTY");
    var notAdtGoodsCd = getCookie("NOT_ADULT_GOOSCD");
	var notAdtQtyList = getCookie("NOT_ADULT_QTY");
    var setGoosId = getCookie("ADULT_SETID");
    var buyNow = getCookie("ADULT_BUYNOW");
    
	// 메인 로그인 시 성인인증여부 검증용
    var mainAdultYn = "N";
	
	if("N" == "N") {
		
	    $.ajax({
			url : ctx_curr + "/cm/comm/mainAdultYn.json",
			async : false,
			dataType : "json",
			type : "POST",
			success : function(data, textStatus, jqXHR) {
				
				if(data.mainAdultYn == "Y") {
					mainAdultYn = "Y";
				}
			}
		});
	}
    
    if(adultType == "cart"){
        
        if("N" == "Y" || mainAdultYn == "Y"){
        	newAddCartMulti(goosCd, qtyList, '', '', 'order',buyNow);
        }else{
            adultPopup(adultType,goosCd,qtyList,buyNow);  
        }
        deleteCookie("ADULT_TYPE");
    }else if(adultType == "detail"){
        if("N" == "Y" || mainAdultYn == "Y"){
            location.href = ctx_curr + "/gd/dtl/goos.do?onlnGoosCd=" + goosCd;
        }else{
            adultPopup(adultType,goosCd,qtyList,buyNow); 
        }
        deleteCookie("ADULT_TYPE");
    }else if(adultType == "list"){
        if("N" == "Y" || mainAdultYn == "Y"){
            newAddCartMulti(goosCd, qtyList, '', '', 'order',buyNow);
        }else{
            adultPopup(adultType,goosCd,qtyList,buyNow,'','','',notAdtGoodsCd,notAdtQtyList); 
        }
        deleteCookie("ADULT_TYPE");
    }else if(adultType == "set"){
        if("N" == "Y" || mainAdultYn == "Y"){
            /* newAddCartMulti(onlnGoosCdList.join(","), goosQtyList.join(","), '', '', 'insert', 'Y', setGoosId); */
        	newAddSetCartMulti(goosCd, qtyList, setGoosId, '');		//세트 장바구니 호출
        }else{
            adultPopup(adultType,goosCd,qtyList,buyNow, setGoosId , '' , '' , notAdtGoodsCd,notAdtQtyList); 
        }
        deleteCookie("ADULT_TYPE");
    }else if(adultType == "cartList"){ //HDDFS 리뉴얼 프로젝트 [ 김인호 - 2021.06.17 ] - 장바구니
        if("N" == "Y" || mainAdultYn == "Y"){
        	//goSelectedOrder();
        	location.href = ctx_curr + "/or/order/order.do";
        }else{
        	adultPopup(adultType,goosCd,qtyList,buyNow , '' ,''); 
        }
    }else if(adultType == "cartGoosCdDetail"){
        if("N" == "Y" || mainAdultYn == "Y"){
            location.href = ctx_curr + "/gd/dtl/goos.do?onlnGoosCd=" + goosCd;
        }else{
            adultPopup(adultType,goosCd,'',''); 
        }
   }
    deleteCookie("ADULT_GOOSCD");
    deleteCookie("ADULT_QTY");
    deleteCookie("ADULT_SETID");
    deleteCookie("ADULT_BUYNOW");
    deleteCookie("NOT_ADULT_GOOSCD");
    deleteCookie("NOT_ADULT_QTY");
    
    
}




</script><div class="loading loadProgBar" style="display:none;">
		<div class="loading_img">
        	<img src="https://cdn.hddfs.com/front/images/KO/common/loading_apng.png" alt="">
		</div>
	</div>

<p class="gnb_dim"></p><div class="adsearch_dim"></div><div tabindex="-1" role="dialog" class="ui-dialog ui-corner-all ui-widget ui-widget-content ui-front ui-draggable" aria-describedby="seller_information" aria-labelledby="ui-id-2" style="height: auto; width: 400px; top: 758.5px; left: 856.5px; display: none;"><div class="ui-dialog-titlebar ui-corner-all ui-widget-header ui-helper-clearfix ui-draggable-handle"><span id="ui-id-2" class="ui-dialog-title">판매자별 사업자 정보</span><button type="button" class="ui-button ui-corner-all ui-widget ui-button-icon-only ui-dialog-titlebar-close" title="Close"><span class="ui-button-icon ui-icon ui-icon-closethick"></span><span class="ui-button-icon-space"> </span>Close</button></div><div id="seller_information" style="width: auto; min-height: 91px; max-height: 281px; height: auto;" class="ui-dialog-content ui-widget-content">
    <div class="layer_popup">
		<strong>(주)현대백화점면세점 무역센터점</strong>
		<dl>
        	<dt>대표이사 :&nbsp;</dt>
			<dt>이재실</dt>
		</dl>
       	<dl>
        	<dt>통신판매신고 :&nbsp;</dt>
            <dt>2018-서울강남-02228</dt>
		</dl>
		<dl>
        	<dt>사업자등록번호 :&nbsp;</dt>
        	<dt>850-88-00325</dt>
		</dl>
		<strong>(주)현대백화점면세점 동대문점</strong>
       	<dl>
        	<dt>대표이사 :&nbsp;</dt>
           	<dt>이재실</dt>
		</dl>
        <dl>
        	<dt>통신판매신고 :&nbsp;</dt>
           	<dt>2020-서울중구-0163</dt>
		</dl>
       	<dl>
        	<dt>사업자등록번호 :&nbsp;</dt>
            <dt>850-88-00325</dt>
		</dl>
	</div>
</div></div><div tabindex="-1" role="dialog" class="ui-dialog ui-corner-all ui-widget ui-widget-content ui-front main_popup2_layer ui-draggable ui-resizable" aria-describedby="ui-id-9" aria-labelledby="ui-id-10" style="display: none; position: fixed;"><div class="ui-dialog-titlebar ui-corner-all ui-widget-header ui-helper-clearfix ui-draggable-handle"><span id="ui-id-10" class="ui-dialog-title">&nbsp;</span><button type="button" class="ui-button ui-corner-all ui-widget ui-button-icon-only ui-dialog-titlebar-close" title="Close"><span class="ui-button-icon ui-icon ui-icon-closethick"></span><span class="ui-button-icon-space"> </span>Close</button></div><div class="main_popup2 ui-dialog-content ui-widget-content" id="ui-id-9" style="display: block;">
    <div class="pop_img">
        <a href="javascript:void(0);" onclick="login('')"> 
            <img src="https://cdn.hddfs.com/files/editor/20220504/6b3d071d_202205041549127060.jpg" alt="로그인 한번으로 즐기는 간편한 면세쇼핑">
        </a>
    </div>
    <div class="close_section2">
        <span class="today_close2 chk">
            <input type="checkbox" id="today_close2">
            <label for="today_close2">오늘하루보지 않기</label>
        </span>
        <span class="popup_close2">닫기</span>
    </div>
</div><div class="ui-resizable-handle ui-resizable-n" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-w" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-sw" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-ne" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-nw" style="z-index: 90;"></div></div><iframe id="groobeeBox" name="groobeeBox" style="display: none;"></iframe></body>
</html>