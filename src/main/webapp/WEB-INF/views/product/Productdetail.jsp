<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/Header.jsp"%>
<body>
	<div id="wrap">
		<!-- header -->
		<meta name="google-site-verification" content="rYjJmYP3q9lxBYCTSa_Tg3h1N9l3yZjJGp0AFaKCZlM" />
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
<header id="header">
	<section class="box">
		<a href="javascript:" class="btn_gnb">Navigation Drawer</a>
	    <!-- <h1 onclick="goMainPage();" style="cursor: pointer;">HYUNDAI DEPARTMENT SHOP - DUTY FREE</h1> -->
	    <h1 onclick="goMainPage();" style="cursor: pointer;" ><img id = "mainLogo" src="https://cdn.hddfs.com/front/images/KO/common/logo.png?RS=192X40" alt="HYUNDAI DEPARTMENT SHOP - DUTY FREE"></h1>
	    <form name="searchHeader" id="searchHeader" method="get" onsubmit="return false;">
	    <fieldset class="searchfield" >
	    	<legend>통합검색</legend>
	        <div class="select_search">
	            <button class="tag_search" id="hashSrchCond">해시태그검색</button>
	            <button class="text_search" id="basicSrchCond">일반검색</button>
	            <div class="tooltip">해시태그로 검색하세요 :)</div>   <!-- 일반단어로 검색하세요 :) -->
	        </div>
	        
	        <div class="mainsearchinput">
		        <input type="search" class="text_search" name="searchTerm" id="basicSearchTerm" maxlength="" value="" placeholder="검색어를 입력해주세요" onkeypress="javascript:if(event.keyCode == 13) { searchHeaderAction();}" onmousedown="dq_setTextbox('1',event);" onfocusin="srchLayer();" onkeydown="dq_setTextbox('1',event);" autocomplete="off"/>
		        <input type="search" class="tag_search" name="searchTerm" id="hashSearchTerm" maxlength="" value="" placeholder="해시태그를 입력해주세요" onkeypress="javascript:if(event.keyCode == 13) { searchHeaderAction();}" onmousedown="dq_setTextbox('1',event);" onfocusin="srchLayer();" onkeydown="dq_setTextbox('1',event);" autocomplete="off"/>
		        <input type="hidden" id="movUrl" name="movUrl" value=""/>
		        <input type="hidden" id="rcntOffYn" name="rcntOffYn" value="" />	  <!-- 최근검색어 저장 사용 유무 -->
			    <input type="hidden" id="rcntWrdYn" name="rcntWrdYn" value="" />      <!-- 최근검색어 존재 유무 여부 -->
			    <input type="hidden" id="autoOffYn" name="autoOffYn" value="" />      <!-- 자동완성 사용 여부 -->
			    <input type="hidden" id="searchType" name="searchType" value="" />   <!-- 검색 타입 구분 -->
			    <input type="hidden" id="searchOrder" name="order" value="" />   		  <!-- 정렬 구분 -->
		    </div>
	        <button class="btn_search" onclick="searchHeaderAction();">검색</button>
	    </fieldset>
	    </form>
	    <!-- 검색 레이어 영역 START -->
    	<div class="advanced_search">
	<div class="tab-action theme_search" id="allSearchArea">
	    <ul class="tab_textmedium" id="searchTabBox" style="display:none">
	        <li id="rcntTab">
	            <a href="#advanced_search_01">최근 · 인기검색어</a>
	        </li>
	        <li id="brandTab">
	            <a href="#advanced_search_02">브랜드검색</a>
	        </li>
	    </ul>

	    <div class="adsearch_panel" id="searchLayerList">
	    	<div id="advanced_search_01" class="popular_search">
	    	
	    	</div>
	    	
	    	<div id="advanced_search_02" class="brand_search">
	            <div class="tab-action">
	                <ul class="tab_round">
	                    <li id="default_brand_tab">
	                        <a href="#advanced_search_brand_01">BRAND</a>
	                    </li>
	                    <li id="default_category_tab">
	                        <a href="#advanced_search_brand_02">CATEGORY</a>
	                    </li>
	                </ul>
	                <div id="advanced_search_brand_01">
	                    <div class="sort_wrap">
	                        <div class="tab-action">
	                            <ul class="sortbtn_wrap" id="brandSortBtn">
	                                <li><a href="#brand_sortbtn_01" onclick="switchBranTab('01');">가나다순</a></li>
	                                <li><a href="#brand_sortbtn_02" onclick="switchBranTab('02');">ABC순</a></li>
	                            </ul>
	                            <div id="brand_sortbtn_01" class="lang_sort on">
	                                <div class="brand_cate">
										<ul id="brandKrList">
											</ul>
		                            </div>
		                            
	                            </div>
	                            <div id="brand_sortbtn_02" class="lang_sort">
		                            <div class="brand_cate">
										<ul id="brandEnList">
											</ul>
		                            </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	                <div id="advanced_search_brand_02">
	                    <div class="sort_wrap">
	                        <div class="tab-action">
	                            <div id="brand_sortbtn_03" class="lang_sort on">
	                                <div class="brand_cate">
										<ul id="cateList">
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
	    	<a class="menu_login_join" href="javascript:" id="loginBtn" onclick="login('');">로그인</a>
	    			<a class="menu_login_join" href="https://www.hddfs.com/shop/mm/mbshJoin/join.do">회원가입</a>	
	    		<ul>
	            <li class="item_01">
	                <a href="https://www.hddfs.com/shop/or/order/listCart.do"><strong>장바<br>구니</strong><em id="rwingCartCnt" style="display: none"></em></a>
	            </li>
	            <li class="item_02">
	                <a href="https://www.hddfs.com/shop/mm/myOrder/listOrder.do"><strong>주문<br>조회</strong></a>
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
	            <li class="currency">
	                <a href="javascript:" class="currencyType "><strong>통화<br>설정</strong></a>
	                <div class="currencyInfo">
	                    <a href="javascript:" onclick="chgCurrencyInfo('KRW');" class="ko">KRW</a>
	                    <a href="javascript:" onclick="chgCurrencyInfo('CNY');" class="cn">CNY</a>
	                </div>
	            </li>
	            <li class="exchange_rate exchageRateTxt"></li>
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
	var lgcpBuyMbshGrpCd = '';
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
				                <a href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0004005" 
				                   onclick="wiseLogAggr('KR_PC_Common_HiddenMenu_6');">
				                    <span class="img">
				                        <img src="https://cdn.hddfs.com/files/dm/20221227/42ecb606_202212271804177860.png?sf=webp&RS=100x100" alt="[1월] 등급혜택" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=100x100';" style="width:100%;">
				                    </span>
				                    <p>등급별 혜택</p>
				                </a>
				            </div>
						<div class="swiper-slide">
				                <a href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003959" 
				                   onclick="wiseLogAggr('KR_PC_Common_HiddenMenu_7');">
				                    <span class="img">
				                        <img src="https://cdn.hddfs.com/files/dm/20221227/d061fda4_202212271805375340.png?sf=webp&RS=100x100" alt="[1월] 출석체크" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=100x100';" style="width:100%;">
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
						<a href="https://www.hddfs.com/shop/op/sale/saleShop.do" >
							세일</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/best/weekly.do" >
							베스트</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/event/op/evnt/evntShop.do" >
							혜택</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/event/op/spex/spexShop.do" >
							기획전</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/or/coupon/cupMain.do" >
							쿠폰</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/new/newShop.do" >
							신상품</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0002920" >
							H.COS Club</a>
					</li>
				<li>
						<a href="/shop/dm/thefrontrow.do" >
							THE FRONT ROW</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003628" >
							Club Travel</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/or/spord/main.do" >
							스페셜오더</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=642001" >
							■ MUSINSA DF ■</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=665301" >
							클린뷰티 전용관 THE C.LAB</a>
					</li>
				<li>
						<a href="https://www.hddfs.com/shop/op/weds/wedsShop.do" >
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
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=005601" rel="nosublink">
							<p>겔랑</p>
							<img src="https://cdn.hddfs.com/files/gd/20220214/8964829b_202202141654149430.jpg?sf=webp&RS=131X131" alt="겔랑" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=001801" rel="nosublink">
							<p>라프레리</p>
							<img src="https://cdn.hddfs.com/files/gd/20220204/864a76a0_202202041249213770.png?sf=webp&RS=131X131" alt="라프레리" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006301" rel="nosublink">
							<p>랑콤</p>
							<img src="https://cdn.hddfs.com/files/gd/20220504/c20154c6_202205041256272420.jpg?sf=webp&RS=131X131" alt="랑콤" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006801" rel="nosublink">
							<p>슈에무라 </p>
							<img src="https://cdn.hddfs.com/files/gd/20220504/59c9f78e_202205041254565010.jpg?sf=webp&RS=131X131" alt="슈에무라 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006701" rel="nosublink">
							<p>아틀리에 코롱 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/006701_3.jpg?sf=webp&RS=131X131" alt="아틀리에 코롱 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=007301" rel="nosublink">
							<p>키엘 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/007301_3.jpg?sf=webp&RS=131X131" alt="키엘 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=063001" rel="nosublink">
							<p>케라스타즈</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/063001_3.jpg?sf=webp&RS=131X131" alt="케라스타즈" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=053601" rel="nosublink">
							<p>버버리 뷰티</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/053601_3.jpg?sf=webp&RS=131X131" alt="버버리 뷰티" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=024101" rel="nosublink">
							<p>프라다 향수</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/024101_3.jpg?sf=webp&RS=131X131" alt="프라다 향수" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=063401" rel="nosublink">
							<p>구찌 뷰티</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/063401_3.jpg?sf=webp&RS=131X131" alt="구찌 뷰티" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=022901" rel="nosublink">
							<p>에스티 로더</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/022901_3.jpg?sf=webp&RS=131X131" alt="에스티 로더" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025701" rel="nosublink">
							<p>크리니크</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/025701_3.jpg?sf=webp&RS=131X131" alt="크리니크" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=013101" rel="nosublink">
							<p>골든구스</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/013101_3.jpg?sf=webp&RS=131X131" alt="골든구스" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025501" rel="nosublink">
							<p>조 말론 런던</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/025501_3.jpg?sf=webp&RS=131X131" alt="조 말론 런던" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=026901" rel="nosublink">
							<p>달팡</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/026901_3.jpg?sf=webp&RS=131X131" alt="달팡" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025401" rel="nosublink">
							<p>맥</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/025401_3.jpg?sf=webp&RS=131X131" alt="맥" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025301" rel="nosublink">
							<p>라 메르 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/025301_3.jpg?sf=webp&RS=131X131" alt="라 메르 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=027101" rel="nosublink">
							<p>톰포드 뷰티</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/027101_3.jpg?sf=webp&RS=131X131" alt="톰포드 뷰티" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=024901" rel="nosublink">
							<p>르 라보 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/024901_3.jpg?sf=webp&RS=131X131" alt="르 라보 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=026401" rel="nosublink">
							<p>오리진스 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/026401_3.jpg?sf=webp&RS=131X131" alt="오리진스 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=026701" rel="nosublink">
							<p>랩시리즈 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/026701_3.jpg?sf=webp&RS=131X131" alt="랩시리즈 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=028401" rel="nosublink">
							<p>프레데릭 말</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/028401_3.jpg?sf=webp&RS=131X131" alt="프레데릭 말" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=067001" rel="nosublink">
							<p>크리스찬 루부탱 뷰티</p>
							<img src="https://cdn.hddfs.com/files/gd/20220829/f179847d_202208291029194800.jpg?sf=webp&RS=131X131" alt="크리스찬 루부탱 뷰티" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=057001" rel="nosublink">
							<p>킬리안</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/057001_3.jpg?sf=webp&RS=131X131" alt="킬리안" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=004901" rel="nosublink">
							<p>포레오</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/004901_3.jpg?sf=webp&RS=131X131" alt="포레오" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=023901" rel="nosublink">
							<p>펜할리곤스</p>
							<img src="https://cdn.hddfs.com/files/gd/20211020/c9d90fa9_202110201126129160.jpg?sf=webp&RS=131X131" alt="펜할리곤스" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=601401" rel="nosublink">
							<p>정관장</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/601401_3.jpg?sf=webp&RS=131X131" alt="정관장" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=064301" rel="nosublink">
							<p>라티잔 퍼퓨머</p>
							<img src="https://cdn.hddfs.com/files/gd/20211116/58a8c781_202111161658026460.jpg?sf=webp&RS=131X131" alt="라티잔 퍼퓨머" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=021901" rel="nosublink">
							<p>구찌 타임피스 앤 주얼리</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/021901_3.jpg?sf=webp&RS=131X131" alt="구찌 타임피스 앤 주얼리" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=621700" rel="nosublink">
							<p>LG 생활건강</p>
							<img src="https://cdn.hddfs.com/files/gd/20211230/2770170e_202112301024035510.jpg?sf=webp&RS=131X131" alt="LG 생활건강" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=007101" rel="nosublink">
							<p>라로슈포제 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/007101_3.jpg?sf=webp&RS=131X131" alt="라로슈포제 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=622101" rel="nosublink">
							<p>설화수</p>
							<img src="https://cdn.hddfs.com/files/gd/20220622/c0e7428b_202206221414438690.jpg?sf=webp&RS=131X131" alt="설화수" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=007001" rel="nosublink">
							<p>비쉬 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/007001_3.jpg?sf=webp&RS=131X131" alt="비쉬 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
						</a>
					</li>
				<li>
						<a  href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=659901" rel="nosublink">
							<p>오에라</p>
							<img src="https://cdn.hddfs.com/files/gd/20220622/a84a5db1_202206221546194980.jpg?sf=webp&RS=131X131" alt="오에라" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=131X131';">
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
							<img src="https://cdn.hddfs.com/files/gd/20220919/fcc93058_202209191312028740.jpg?sf=webp&RS=84X84" alt="카비시" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=84X84';">
						</a>
					</li>
				<li class="interest006301">
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006301" rel="nosublink">
							<p>랑콤</p>
							<img src="https://cdn.hddfs.com/files/gd/20220504/c20154c6_202205041256272420.jpg?sf=webp&RS=84X84" alt="랑콤" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=84X84';">
						</a>
					</li>
				<li class="interest063001">
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=063001" rel="nosublink">
							<p>케라스타즈</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/063001_3.jpg?sf=webp&RS=84X84" alt="케라스타즈" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=84X84';">
						</a>
					</li>
				<li class="interest006701">
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006701" rel="nosublink">
							<p>아틀리에 코롱 </p>
							<img src="https://cdn.hddfs.com/files/gd/bran/006701_3.jpg?sf=webp&RS=84X84" alt="아틀리에 코롱 " onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=84X84';">
						</a>
					</li>
				<li class="interest063201">
						<a href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=063201" rel="nosublink">
							<p>모라츠</p>
							<img src="https://cdn.hddfs.com/files/gd/bran/063201_3.jpg?sf=webp&RS=84X84" alt="모라츠" onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?sf=webp&RS=84X84';">
						</a>
					</li>
				</ul>
        </li>
    </ul>
</div><button class="gnb_close">닫기</button>
	    </nav>
	</header><!-- // header -->
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
													value="${product.pprice*1267}" pattern="#,#00" />원</p>
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
                    <dd class="wonPrice0" value=<c:out value="${product.pprice*1267}"/>><fmt:formatNumber
													value="${product.pprice*1267}" pattern="#,#00" /> <em>원</em></dd>
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
  
	//수량버튼 올렸을때! 3개면 안된다고 경고!
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
													<dd><fmt:formatNumber value="${product.pprice*1267}" pattern="#,#00" /> <em>원</em></dd></dl>
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
						<a href="" class="addcart" onclick="addCart();">장바구니</a>
                              <a href="javascript:addCarts('buy')" class="buynow">바로구매</a>
						  </div>
				<ul class="layercall">
				<li class="call_panel_b">
						<a href="javascript://" onclick=""><p>사은품</p><em>2</em></a>
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
<<<<<<< HEAD
	function evtGoosAddCart(type){
=======
	function evtGoos(type){
>>>>>>> 83e29f7c4c20456e1714a75e4741a10041a6a389
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
<<<<<<< HEAD
        	<a href="javascript:" onclick="evtGoosAddCart('');" class="addcart_btn">장바구니 담기</a>
=======
        	<a href="javascript:" onclick="addCart();" class="addcart_btn">장바구니 담기</a>
>>>>>>> 83e29f7c4c20456e1714a75e4741a10041a6a389
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
<<<<<<< HEAD
            	    $('.totalamount').html(html);
=======
            	    $('.').html(html);
>>>>>>> 83e29f7c4c20456e1714a75e4741a10041a6a389
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
<<<<<<< HEAD
      
    
    $('#addProduct').on('click', function(){
		let repre = repreFile.getAcceptedFiles();
		let another = anotherFiles.getAcceptedFiles();
		let Data = {
			"name" : $('#name').val(),
			"detail" : detail,
			"bigCategory" : $('#bigCategory').val(),
			"midCategory" : $('#midCategory').val(),
			"stock" : $('#totalCnt').val(),
			"price" : $('#totalWonSum').val()
		};
		if(!checkIt(otherData)){
			alert("입력되지 않은 정보가 있습니다!");
			return;
      	    	}
		formData.append("items", JSON.stringify(otherData));
		formData.append("repreFile", repre[0]);
		for(let i = 0; i < another.length; i++){
			formData.append("anotherFile" + i, another[i]);
    	    }
		$.ajax({
			type :"POST",
		    data : Data,
		    url : "/cart/insertCart",
		    success : function(data){
				const issf=data.split(':')[0];
				let param=confirm("선택하신 상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?");
				if(param=='true'){
					location.href="/cart/cartlist";
					/* location.href="/cart/cartlist?mid="+${member.mid}; */
    	}
				
				document.getElementById()
				
			},
			fail : function(){
				console.log("실패 ㅠ");
    }
		});
	});
=======
    
	function cartConsist(){
    	
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
    				let param=confirm("선택하신 상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?");
    				if(param=='true'){
    					location.href="/cart/cartlist";
    					/* location.href="/cart/cartlist?mid="+${member.mid}; */
        			}			
    			},
    			error : function(){
    				console.log("실패 ㅠ");
        		}
    		});
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
    				let param=confirm("선택하신 상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?");
    				if(param=='true'){
    					location.href="/cart/cartlist";
    					/* location.href="/cart/cartlist?mid="+${member.mid}; */
        			}			
    			},
    			error : function(){
    				console.log("실패 ㅠ");
        		}
    		});
    }
>>>>>>> 83e29f7c4c20456e1714a75e4741a10041a6a389
    
    
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
                    <a href="http://www.ftc.go.kr/www/bizCommView.do?key=232&apv_perm_no=2018322016230202228&pageUnit=10&searchCnd=wrkr_no&searchKrwd=8508800325&pageIndex=1" target="_blank">사업자정보확인</a>
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
                <a href="https://www.facebook.com/HDDFS.official/" target="_blank"  class="facebook">facebook</a>
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
<div id="seller_information" title="판매자별 사업자 정보" style="display:none;">
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
</div></div>
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
                <li><a nohref class="btnde_type1 mid adultCancle">취소</a></li>
                <li><a nohref id="chkBtn" value="" class="btnde_type1 mid bg_black" onclick="adultAuthPop(this);" data-setid="" data-cartseq="" data-cartsetid="" data-notAdtGoodsCd="" data-notAdtQtyList="">확인</a></li>
                <input type="hidden" id="goodsCd" value=""/>
                <input type="hidden" id="qty" value=""/>
                <input type="hidden" id="adtBuyNow" value=""/>
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
        <a nohref id="hpAuth" value="" class="phonecertification_btn" data-goosCd="" data-qty="" data-buynow="" data-setid="" data-cartseq="" data-cartsetid="" data-notAdtGoodsCd="" data-notAdtQtyList="">
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
    DRMOK_window = window.open(url+'?cpid=hddfs&rtn_url=http://www.hddfs.com/shop/mm/mbshAuca/adultAuca.do?goosInfo='+goosInfo+'&req_info=FjYe3bJKqz2REMTtKPdpKuSbabmfboZQBtqPtMnPxk%2FaPFPSvbJaHTFV1%2BgojR5UrU8oVLshZNrqsajVGZ5EmLJAroJaMNAj%2FeuerPhH8pnHqhyArMwYU2zEGSdy28f8JLxKKaeCzhnWxaANJkOdN2iw1oXZLfbpdcTZ6ef2BeGfJ%2FilC4Nrn1TCo4l4e0PuyX0Szzi0zt55PNUkwxDlrWBNDSA7%2Fx%2FLmLWtYXSO1u25GjeNnBgigA9tOz7SQvfwbHU8tFMaMnvBI889jkpzhml6DNCK2w7vpKqbxhjUVBPEkg9dr5Rm0SGmdXljNkWwmyT3zkBkmzTCP4vnfoyKvw%3D%3D', 'DRMOKWindow', 'width=425,height=550,scrollbars=no,toolbar=no,location=no,directories=no,status=no' );
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
</body>
</html>