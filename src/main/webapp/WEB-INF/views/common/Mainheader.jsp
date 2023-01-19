<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<sec:authorize access="hasRole('ROLE_MEMBER')">
                <sec:authentication property="principal.username" var="mid"/>
</sec:authorize>
<header id="header">
	<!-- 시큐리티 -->
	<script>
	 const csrfHeaderName = "${_csrf.headerName}";
	 const csrfTokenValue = "${_csrf.token}";
	</script>
	
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	<section class="box">
		<a href="javascript:" class="btn_gnb">Navigation Drawer</a>
		<!-- <h1 onclick="goMainPage();" style="cursor: pointer;">HYUNDAI DEPARTMENT SHOP - DUTY FREE</h1> -->
		<h1 style="cursor: pointer;">
			<img id="mainLogo"
				src="https://cdn.hddfs.com/front/images/KO/common/logo.png?RS=192X40"
				alt="HYUNDAI DEPARTMENT SHOP - DUTY FREE"
				onclick="location.href='/'">
		</h1>
		<!-- ########################### 검색창 ###################################### -->
		<form name="searchHeader" id="searchHeader" method="get"
			action="/product/search">
			<fieldset class="searchfield">
				<legend>통합검색</legend>

				<div class="mainsearchinput">
					<input type="search" class="text_search" name="keyword"
						id="basicSearchTerm" maxlength="" value=""
						placeholder="검색어를 입력해주세요" />
				</div>
				<button class="btn_search" onclick="searchHeaderAction();">검색</button>
			</fieldset>
		</form>
		<!-- 검색 레이어 영역 START -->
		<div class="advanced_search">
			<div class="tab-action theme_search" id="allSearchArea">
				<ul class="tab_textmedium" id="searchTabBox" style="display: none">
					<li id="rcntTab"><a href="#advanced_search_01">최근 · 인기검색어</a>
					</li>
					<li id="brandTab"><a href="#advanced_search_02">브랜드검색</a></li>
				</ul>

				<div class="adsearch_panel" id="searchLayerList">
					<div id="advanced_search_01" class="popular_search"></div>

					<div id="advanced_search_02" class="brand_search">
						<div class="tab-action">
							<ul class="tab_round">
								<li id="default_brand_tab"><a
									href="#advanced_search_brand_01">BRAND</a></li>
								<li id="default_category_tab"><a
									href="#advanced_search_brand_02">CATEGORY</a></li>
							</ul>
							<div id="advanced_search_brand_01">
								<div class="sort_wrap">
									<div class="tab-action">
										<ul class="sortbtn_wrap" id="brandSortBtn">
											<li><a href="#brand_sortbtn_01"
												onclick="switchBranTab('01');">가나다순</a></li>
											<li><a href="#brand_sortbtn_02"
												onclick="switchBranTab('02');">ABC순</a></li>
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
			<div class="search_autocomplete" id="autoList" style="display: none;">
				<div class="none_autoword" id="no_autoComplete"
					style="display: none;">자동완성기능을 사용하고 있지 않습니다.</div>
				<span class="switch autoword"> <input type="checkbox"
					id="autoCompleteBtn" onclick="javascript:autoCompleteSwitch();">
					<label for="autoCompleteBtn"> <span class="slider"></span>
						<span>자동완성</span>
				</label>
				</span>
			</div>
			<a href="javascript:" class="search_close">닫기</a>
		</div>

		<script
			src="https://cdn.hddfs.com/front/js/KO/diquest/dqAutoComplete.js"></script>
		<script type="text/javascript">
$(function() {

				// 검색결과에 따라 검색창 변환
				changeSearchArea();

				if ($("#autoOffYn").val() == ""
						|| $("#autoOffYn").val() == null) {
					$("#autoOffYn").val('Y');
				}

				// 일반 검색창에 # 입력시 해시태그 검색창 전환
				$("#basicSearchTerm").on('keyup', function() {
					if ($("#basicSearchTerm").val() === "#") {
						$(".select_search #hashSrchCond").trigger('click');
						//changeSearchTextBox();
						//console.log("dq_autoSearchType : " + dq_autoSearchType);
						$("#hashSearchTerm").focus();
					}
				});

				// 검색 조건 클릭시 자동완성 타입 변경
				$(".select_search button").on('click', function() {
					changeSearchTextBox();
				});

				// 검색창 클릭시 검색 레이어 호출
				$("#basicSearchTerm, #hashSearchTerm").on(
						'click',
						function() {
							if (($("#brandKrList > li").length < 1)
									|| ($("#brandEnList > li").length < 1)) {
								loadBranIcKrList();
							}
							if ($("#brandTab").attr('tabindex') == '0') {
								wiseLogAggr("KR_PC_Common_BrandSearch");
							} else {
								wiseLogAggr("KR_PC_Common_SearchKeyword");
							}
							srchLayer();
						});

				$("#default_category_tab > a").click(function() {
					//카테고리 로드
					loadCtgList();
				});

				$("#brandTab").on('click', function() {
					wiseLogAggr("KR_PC_Common_BrandSearch");
					$(".tab_round #default_brand_tab a").trigger('click');
				});

				$("#rcntTab").on('click', function() {
					wiseLogAggr("KR_PC_Common_SearchKeyword");
				});

				$("#default_brand_tab a").on('click', function() {
					wiseLogAggr("KR_PC_Common_BrandSearch_Brand");
				});

				$("#default_category_tab a").on('click', function() {
					wiseLogAggr("KR_PC_Common_BrandSearch_Category");
				});

			});

			function branAction(branCd) {
				$(location).attr('href',
						ctx_curr + "/dm/bran/brand.do?onlnBranCd=" + branCd);

			}

			//브랜드 ㄱㄴㄷ > ABC 변경시
			function switchBranTab(type) {
				if (type == "02") {
					//ABC 순 조회
					loadBranIcEnList();
				}
				$("#brand_sortbtn_" + type + " > div > ul > li > button")
						.removeClass("on");
				$("#brand_sortbtn_" + type + " > div > ul > li:eq(0) > button")
						.addClass("on");
				$(
						"#brand_sortbtn_" + type
								+ " > div > ul > li > .branTabResult")
						.removeClass("on");
				$(
						"#brand_sortbtn_" + type
								+ " > div > ul > li:eq(0) > .branTabResult")
						.addClass("on");
			}

			// 초성 선택시 동작
			function chgBranTab($this, type) {
				if (!$($this).hasClass("disabled")) {
					if (type == 1) { //국문
						$("#brandKrList > li").each(
								function() {
									var dataGroup = $(this).data("group-pos");
									if ($('[data-group="bran' + dataGroup
											+ '"]:checked').length < 1) {
										$(this).find("button")
												.removeClass("on");
									}
								});
					} else {
						$("#brandEnList > li").each(
								function() {
									var dataGroup = $(this).data("group-pos");
									if ($('[data-group="bran' + dataGroup
											+ '"]:checked').length < 1) {
										$(this).find("button")
												.removeClass("on");
									}
								});
					}
					$(".branTabResult").removeClass("on");
					$($this).addClass("on");
					$($this).parent().find("div").addClass("on");
				}
			}

			// 카테고리 선택시 동작
			function chgCateTab($this) {
				if (!$($this).hasClass("disabled")) {
					$("#cateList > li").each(
							function() {
								var dataGroup = $(this).data("group-pos");
								if ($('[data-group="cate' + dataGroup
										+ '"]:checked').length < 1) {
									$(this).find("button").removeClass("on");
								}
							});
					$(".cateTabResult").removeClass("on");
					$($this).addClass("on");
					$($this).parent().find("div").addClass("on");
				}
			} 

			// 검색어 목록 call json
			function srchLayer() {
				// 검색어 있는 상태일때 자동완성 실행
				if ($("#basicSearchTerm").val().length > 0
						|| $("#hashSearchTerm").val().length > 0) {
					dq_reqSearch();
				}

				// 검색 타입 구분
				var searchType = $("#searchType").val();

				$.ajax({
					async : true,
					url : ctx_curr + "/sr/searchLayer.json",
					dataType : "json",
					type : "POST",
					data : {
						searchType : searchType
					},
					success : function(data, textStatus, jqXHR) {
						if (!crew.ajaxValidate(data)) {
							return;
						}
						// 검색어 목록 추가
						//$("#searchLayerList").append(data.html);
						$("#advanced_search_01").html(data.html);

						// 최근 검색어 존재 유무 세팅
						$("#rcntWrdYn").val(data.dqGoosSrch.rcntWrdYn);

						// 자동 저장 사용 유무를 쿠키에서 받아옴
						if (data.rcntOffYn != null) {
							$("#rcntOffYn").val(data.rcntOffYn);
						} else {
							$("#rcntOffYn").val('Y');
						}

						// 정렬값를 쿠키에서 받아옴
						if (data.order != null) {
							$("#searchOrder").val(data.order);
						} else {
							$("#searchOrder").val('random');
						}
						// 초기 자동저장 세팅 
						setAutoSave();

						// 자동완성 기능 사용여부 
						if ($("#autoOffYn").val() == 'N') {
							dq_acOff();
						} else {
							dq_acArrow();
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						//console.log(jqXHR.status);
					}
				});
			}

			// 검색 레이어 띄울때 자동저장 상태 세팅
			function setAutoSave() {
				if (dq_autoSearchType == "basic") {
					dq_searchTextbox = document
							.getElementById("basicSearchTerm");
					if (showType == 'intro') {
						dq_searchTextbox = document
								.getElementById("basicSearchTermIntro");
					}
				} else {
					dq_searchTextbox = document
							.getElementById("hashSearchTerm");
					if (showType == 'intro') {
						dq_searchTextbox = document
								.getElementById("hashSearchTermIntro");
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
			function changeSearchArea() {
				if ($("#resultSearchType").val() == "hash") {
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
			function autoCompleteSwitch() {

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
					async : true,
					url : ctx_curr + "/sr/srchWrdSave.json",
					dataType : "json",
					type : "POST",
					cache : false,
					data : {
						"rcntOffYn" : rcntOffYn
					},
					success : function(data, textStatus, jqXHR) {
						if (!crew.ajaxValidate(data)) {
							return;
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						//console.log(jqXHR.status);
					}
				});
			}

			// 최근 검색어 삭제
			function delSrchWrd(srchWrd, hashTagYn) {

				//console.log("삭제된 검색어 srchWrd : " + srchWrd);

				var searchType = "";
				if (hashTagYn == 'Y') {
					searchType = "hash"
				} else if (hashTagYn == 'all') {
					searchType = "all"
				} else {
					searchType = "basic"
				}

				//console.log(searchType);

				if (srchWrd === null || srchWrd === undefined) {
					srchWrd = "";
				}

				var html = "";

				
						/* 최근검색어 삭제요청 */
				/* $
						.ajax({
							async : true,
							url : ctx_curr + "/sr/delSrchWrd.json",
							dataType : "json",
							type : "POST",
							cache : false,
							data : {
								"srchWrd" : srchWrd,
								"searchType" : searchType
							},

							success : function(data, textStatus, jqXHR) {
								if (!crew.ajaxValidate(data)) {
									return;
								}

								if (data.recentList.length > 0) {
									$
											.each(
													data.recentList,
													function(key) {
														var list = data.recentList[key];

														if (list.srchClsCd == "001") {
															html += "<li><a href=\""
																	+ ctx_curr
																	+ "/sr/searchResult.do?searchTerm="
																	+ encodeURIComponent(list.srchWrd)
																	+ "&searchType="
																	+ encodeURIComponent("basic")
																	+ "\">"
																	+ list.srchWrd
																	+ "</a><button type=\"button\" class=\"ic_x deleteOne\" onclick=\"javascript:delSrchWrd('"
																	+ list.srchWrd
																	+ "', 'N');\">X</button></li>";
														} else {
															html += "<li><a href=\""
																	+ ctx_curr
																	+ "/sr/hashSearchResult.do?searchTerm="
																	+ encodeURIComponent(list.srchWrd)
																	+ "&searchType="
																	+ encodeURIComponent("hash")
																	+ "\">#"
																	+ list.srchWrd
																	+ "</a><button type=\"button\" class=\"ic_x deleteOne\" onclick=\"javascript:delSrchWrd('"
																	+ list.srchWrd
																	+ "', 'Y');\">X</button></li>";
														}
													});
									$("#rcntKeyword").html(html);
								} else {
									$("#rcntKeyword").empty();
									$("#noRcnt").show();
									$("#noRcnt").text('최근 검색어가 없습니다.');
									$("#deleteAll").hide();
								}

								// 최근 검색어가 있을때
								if (data.dqGoosSrch.rcntWrdYn == 'Y') {
									$("#rcntWrdYn").val('Y');
									$("#rcntKeyword").show();
									$("#noRcnt").hide();
									// 최근 검색어가 없을때
								} else {
									$("#rcntWrdYn").val('N');
									$("#rcntKeyword").hide();
									$("#noRcnt").show();
									$("#noRcnt").text('최근 검색어가 없습니다.');
								}

							},
							error : function(jqXHR, textStatus, errorThrown) {
								//console.log(jqXHR.status);
							}
						});
			} 

			// 검색어 체크
			function checkSearchTerm(searchTerm) {
				var ke = dqc_trimSpace(searchTerm);

				while (ke.indexOf("\\") != -1)
					ke = ke.replace("\\", "");

				while (ke.indexOf("\'") != -1)
					ke = ke.replace("\'", "");

				return ke;
			} 
			
			*/

			 //########################## 검색form제출 ################################
			function searchHeaderAction() {
				searchHeader.submit();
			} 
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
				if (!$(".mainsearchinput").hasClass('tag')) {
					if ($("#basicSearchTerm").val() === "") {
						var url = $("#searchHeader").find("[name=movUrl]")
								.val();

						if (url != "") {
							location.href = url;
						} else {
							alert("검색어를 입력해주세요."); // 검색어를 입력해주세요 
						}
					} else {
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

						searchHeader.action = ctx_curr + "/sr/searchResult.do";
						searchHeader.submit();
					}
				} else {
					// 해시태그 검색 일때
					if ($("#hashSearchTerm").val() === "") {
						alert("검색어를 입력해주세요."); // 검색어를 입력해주세요 
					} else {
						$(".advanced_search").hide();

						result = checkSearchTerm($("#hashSearchTerm").val());
						$("#hashSearchTerm").val(result);
						$("#basicSearchTerm").val('');
						$("#basicSearchTerm").attr('disabled', true);
						$("#hashSearchTerm").attr('disabled', false);
						// 검색 타입 구분
						$("#searchType").val("hash");

						searchHeader.action = ctx_curr
								+ "/sr/hashSearchResult.do";
						searchHeader.submit();
					}
				}

				//}

				$(".adsearch_dim").hide();

			}
			
			 /* gnb_area 로그아웃 버튼 작동 */
		    $("#gnb_logout_button").click(function(){
		        alert("버튼 작동");
		    });
			
		</script>
		<!-- 검색 레이어 영역 END-->
		<script>
		function gologout() {
	    	alert('눌림');
            document.getElementById('form_logout').submit();
         }
		</script>
		<div class="default_menu">
			<%-- <c:if test="${member == null }">
				<a class="menu_login_join" id="loginBtn" href="../join/login/">로그인</a>
				<a id="menu_login_join" class="menu_login_join"
					href="../join/termsAgree/">회원가입</a>
			</c:if>
			<c:if test="${member != null }">
				<a class="menu_login_join" id="logoutBtn" href="/join/logout.do">로그아웃</a>
			</c:if> --%>

			<!-- 시큐리티적용 로그인/로그아웃 -->
			<sec:authorize access="isAnonymous()">
				<a class="menu_login_join" href="/join/login"
					onclick="GA_Event('공통','헤더_메뉴','로그인')"> 로그인 <!-- 로그인 -->
				</a>
				<a class="menu_login_join" id="menu_login_join"
					href="/join/termsAgree/">회원가입</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<form id="form_logout" action="/join/logout" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
				<a class="menu_login_join" href="javascript:void(0)"
					onclick="gologout()"> 로그아웃</a>
			</sec:authorize>

			<ul>
				<li class="item_01"><a
					href="/cart/cartlist?align='늦게담은순'&mid=${mid}"><strong>장바<br>구니
					</strong><em id="rwingCartCnt" style="display: none"></em></a></li>
				<li class="item_02"><a
					href="https://www.hddfs.com/shop/mm/myOrder/listOrder.do"><strong>주문<br>조회
					</strong></a></li>
				<li class="item_03"><a rel="nosublink" href="/join/Mypage/"><strong>마이<br>현대
					</strong></a></li>
				<li class="item_04"><a
					href="https://www.hddfs.com/shop/om/consmComm/main.do?MG=KR_PC_GNB_CS"><strong>고객<br>센터
					</strong></a></li>
				<li class="item_05"><a
					href="https://www.hddfs.com/store/kr/dm/main.do?MG=KR_PC_GNB_HDDFS"
					target="_blank"><strong>공식<br>사이트
					</strong></a></li>
				<li class="language ko"><a href="javascript:" class="ko"><strong>언어<br>설정
					</strong></a>
					<div>
						<a href="javascript:" id="ko_btn" onclick="goMainPage();"
							class="ko">한국어</a> <a
							href="https://cn.hd-dfs.com/shop/dm/main.do?MG=KR_PC_GNB_Language"
							class="cn">简体中文</a> <a
							href="https://en.hddfs.com/shop/dm/main.do?MG=KR_PC_GNB_Language"
							class="en">English</a>
					</div></li>
				<li class="currency"><a href="javascript:"
					class="currencyType "><strong>통화<br>설정
					</strong></a>
					<div class="currencyInfo">
						<a href="javascript:" onclick="chgCurrencyInfo('KRW');" class="ko">KRW</a>
						<a href="javascript:" onclick="chgCurrencyInfo('CNY');" class="cn">CNY</a>
					</div></li>
				<li class="exchange_rate exchageRateTxt"></li>
			</ul>
		</div>
		<!-- 히든메뉴 START -->
		<script type="text/javascript">
			function commOpenLayer(cookieChkYn, hiddenYn) {
				$
						.ajax({
							async : true,
							url : ctx_curr + "/dm/main/popInfo.json",
							dataType : "json",
							type : "POST",
							success : function(popInfo, textStatus, jqXHR) {
								var data = popInfo.resPop;
								var html = "";
								for (var i = 0; i < data.popSeqList.length; i++) {
									html += "<div class=\"main_popup\" id=\"main_bottom_pop"+data.popSeqList[i].popSeq+"\" data-seq=\""+data.popSeqList[i].popSeq+"\">";
									var addClass = "";
									var addStyle = "";
									if (data.popSeqList[i].popTmplCd == '001') {
										addClass = "popswiper-container";
									} else {
										addClass = "html_wrap";
										addStyle = "style='width:560px; height: 368px;'";
									}
									html += "<div class=\""+addClass+"\" "+addStyle+">";
									if (data.popSeqList[i].popTmplCd == '001') {
										html += "<ul class=\"swiper-wrapper mainPopList\">";
										for (var j = 0; j < data.dataList.length; j++) {
											if (data.popSeqList[i].popSeq == data.dataList[j].popSeq) {
												html += "<li class=\"swiper-slide\">";
												var link = data.dataList[j].linkUrl != null ? data.dataList[j].linkUrl
														: "javascript:";

												var wiseLog = "";
												if (link != "javascript:") {
													if (link.indexOf("?") != -1) {
														wiseLog = "&MG=KR_PC_Main_Popup"
																+ data.popSeqList[i].popSeq
																+ "_"
																+ data.dataList[j].popDtlSeq;
													} else {
														wiseLog = "?MG=KR_PC_Main_Popup"
																+ data.popSeqList[i].popSeq
																+ "_"
																+ data.dataList[j].popDtlSeq;
													}
												}

												if (data.dataList[j].shrtVdoUrl != null) {
													html += "<video preload=\"none\" muted loop class='video-js'  style='width:560px; height:368px; object-fit:cover; background-color: black;'>";
													html += "<source src=\"https://cdn.hddfs.com/files/"+data.dataList[j].shrtVdoUrl+"\" type=\"video/mp4\">";
													html += "<strong>Your browser does not support the video tag.</strong>";
													html += "</video>";
												} else {
													var mainTitl = data.dataList[j].mainTitl != null ? data.dataList[j].mainTitl
															: "";
													var subTitl = data.dataList[j].subTitl != null ? data.dataList[j].subTitl
															: "";
													var bnnrWrd = data.dataList[j].bnnrWrd != null ? data.dataList[j].bnnrWrd
															: "";

													html += "<a href=\""+link+wiseLog+"\"  class='item_wrap'>";
													html += "<div class='pop_txt'>";
													html += "<strong class='cate'>"
															+ mainTitl
															+ "</strong>";
													html += "<p>" + subTitl
															+ "</p>";
													html += "<p>" + bnnrWrd
															+ "</p>";
													html += "</div>";
													html += "<img src=\"https://cdn.hddfs.com/files/"
															+ data.dataList[j].imgUrl
															+ "?RS=750X494\" alt=\""
															+ data.dataList[j].popNm
															+ "\">";
													html += "</a>";
												}
												html += "</li>";
											}
										}
										html += "</ul>";
										html += "<div class=\"swiper_control\" id=\"mainPop_"+data.popSeqList[i].popSeq+"\">";
										html += "<div class=\"swiper-pagination\"></div>";
										html += "<div class=\"swiper-prev\"></div>";
										html += "<div class=\"swiper-next\"></div>";
										html += "</div>";
									} else {
										html += data.popSeqList[i].htmlCont;
									}
									html += "</div>";
									html += "<div class=\"close_section\">";
									html += "<span class=\"today_close chk\">";
									html += "<input type=\"checkbox\" class=\"today_close\" id=\"btn_hidden_layer_"
											+ data.popSeqList[i].popSeq
											+ "\" onclick=\"saveMainLayerCookie("
											+ data.popSeqList[i].popSeq
											+ ");\" hiddenYn=\"N\" />";
									html += "<label for=\"btn_hidden_layer_"+data.popSeqList[i].popSeq+"\" style=\"cursor: pointer;\">오늘 하루 보지 않기</label>";
									html += "</span>";
									html += "<span class=\"popup_close\"  data-seq=\""
											+ data.popSeqList[i].popSeq
											+ "\" onclick=\"closeMainLayer("
											+ data.popSeqList[i].popSeq
											+ ");\">닫기</span>";
									html += "</div>";
									html += "</div>";
								}

								$(".mainPopWrap").html(html);
								callMainPopSwiper();

								if (hiddenYn == "Y") {
									$(".hidden_menu").removeClass("open");
									$(".item").slideUp(200);
								}

								if ($(".main_popup").length > 0) {
									$('.modal_wrap').addClass('active'); //팝업 띄우기
								}

								if (cookieChkYn == "Y") {
									// 메인팝업
									$(".main_popup")
											.each(
													function() {
														var seq = $(this).data(
																"seq");
														$(".today_close.chk")
																.show();
														$(
																"#btn_hidden_layer_"
																		+ seq)
																.attr(
																		"hiddenYn",
																		"N");
														if (getCookie("closePop"
																+ seq) == "Y") { // 팝업 오픈
															$(
																	"#main_bottom_pop"
																			+ seq)
																	.remove();
															if ($(".main_popup").length < 1) {
																$('.modal_wrap')
																		.removeClass(
																				'active');
															}
														}
													});
								} else {
									// 메인팝업 오픈
									$(".main_popup").each(
											function() {
												var seq = $(this).data("seq");
												$(".today_close.chk").hide();
												$("#btn_hidden_layer_" + seq)
														.attr("hiddenYn", "Y");
											});
								}

								if (hiddenYn == "Y") {
									$(".ui-resizable").css("position", "fixed")
								}

								$(".main_popup").each(
										function() {
											var seq = $(this).data("seq");
											if ($("#main_bottom_pop" + seq)
													.find("li").length == 1) {
												$("#mainPop_" + seq).hide();
											}
										});

								$(".mainPopList > li").find("video").attr(
										"preload", "");
								$(".mainPopList > li").find("video").attr(
										"autoplay", true);
							}
						});
			}


			// 적립금 다운로드
			function issueHiddenSvmt(svmtId, baseRsvgAmt) {
				issueSvmt(svmtId, baseRsvgAmt, function(data) {
					if (data.resultCode == 1) {
						alert('적립금이 다운로드 되었습니다.'); /*적립금이 다운로드 되었습니다.*/
					} else {
						alert(data.message);
					}
				});
			}
		</script>

		<div class="hidden_menu">
			<a href="javascript:wiseLogAggr('KR_PC_Common_HiddenMenuIcon');"
				class="btn">히든메뉴</a>
			<div class="item">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide mainPopBtn">
							<a href="javascript:wiseLogAggr('KR_PC_Common_HiddenMenu_1');"
								onclick="javascript:commOpenLayer('N', 'Y');"> <span
								class="img fix"> <img
									src="https://cdn.hddfs.com/front/images/KO/common/icon_hidden_01.png"
									alt="메인팝업">
							</span>
								<p>메인팝업</p>
							</a>
						</div>
						<div class="swiper-slide">
							<a
								href="https://www.hddfs.com/event/op/bnf/listBnf.do?MG=KR_PC_Common_HiddenMenu_2">
								<span class="img fix"> <img
									src="https://cdn.hddfs.com/front/images/KO/common/icon_hidden_02.png"
									alt="월별혜택안내">
							</span>
								<p>월별혜택안내</p>
							</a>
						</div>
						<div class="swiper-slide">
							<a href="javascript:wiseLogAggr('KR_PC_Common_HiddenMenu_3');"
								onclick="issueHiddenSvmt('008899', 5000000);"> <span
								class="img fix"> <img
									src="https://cdn.hddfs.com/front/images/KO/common/icon_hidden_03.png"
									alt="적립금 500만원">
							</span>
								<p>적립금 500만원</p>
							</a>
						</div>
						<div class="swiper-slide">
							<a href="javascript:wiseLogAggr('KR_PC_Common_HiddenMenu_4');"
								onclick="getHiddenMenuEvntBnef('0003893')"> <span
								class="img fix"> <img
									src="https://cdn.hddfs.com/front/images/KO/common/icon_hidden_event.png"
									alt="데일리적립금">
							</span>
								<p>데일리적립금</p>
							</a>
						</div>
						<div class="swiper-slide">
							<a href="javascript:wiseLogAggr('KR_PC_Common_HiddenMenu_5');"
								onclick="getHiddenMenuEvntBnef('0004017')"> <span
								class="img fix"> <img
									src="https://cdn.hddfs.com/front/images/KO/common/icon_hidden_event.png"
									alt="스페셜 추가적립금">
							</span>
								<p>스페셜 추가적립금</p>
							</a>
						</div>
						<div class="swiper-slide">
							<a
								href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0004005"
								onclick="wiseLogAggr('KR_PC_Common_HiddenMenu_6');"> <span
								class="img"> <img
									src="https://cdn.hddfs.com/files/dm/20221227/42ecb606_202212271804177860.png?RS=100x100"
									alt="[1월] 등급혜택"
									onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=100x100';"
									style="width: 100%;">
							</span>
								<p>등급별 혜택</p>
							</a>
						</div>
						<div class="swiper-slide">
							<a
								href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003959"
								onclick="wiseLogAggr('KR_PC_Common_HiddenMenu_7');"> <span
								class="img"> <img
									src="https://cdn.hddfs.com/files/dm/20221227/d061fda4_202212271805375340.png?RS=100x100"
									alt="[1월] 출석체크"
									onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=100x100';"
									style="width: 100%;">
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
		</div>
		<!-- 히든메뉴 END -->
	</section>
	<nav class="navication">
		<ul class="quick_link">
			<li class="ql_03"><a
				href="https://www.hddfs.com/shop/mm/myOrder/listOrder.do"
				rel="nosublink">주문내역</a></li>
			<li class="ql_01"><a
				href="https://www.hddfs.com/shop/om/consmGuide/useNotice.do"
				rel="nosublink">주문<br>가능시간
			</a></li>
			<li class="ql_04"><a
				href="https://www.hddfs.com/shop/mm/myInfo/listMbshDpatInfo.do"
				rel="nosublink">출국정보</a></li>
			<li class="ql_02"><a
				href="https://www.hddfs.com/shop/mm/myInfo/inptMbshPwd.do?type=pspt"
				rel="nosublink">여권정보</a></li>
		</ul>
		<div id="gnb">
			<h2>Global Navigation Bar</h2>
			<ul class="depth_01">
				<li><strong>전체서비스</strong>
					<ul class="depth_02 serviceMenu">
						<li><a href="/product/productlist"> 세일</a></li>
						<li><a href="https://www.hddfs.com/shop/dm/best/weekly.do">
								베스트</a></li>
						<li><a href="https://www.hddfs.com/event/op/evnt/evntShop.do">
								혜택</a></li>
						<li><a href="https://www.hddfs.com/event/op/spex/spexShop.do">
								기획전</a></li>
						<li><a href="https://www.hddfs.com/shop/or/coupon/cupMain.do">
								쿠폰</a></li>
						<li><a href="https://www.hddfs.com/shop/dm/new/newShop.do">
								신상품</a></li>
						<li><a
							href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0002920">
								H.COS Club</a></li>
						<li><a href="/shop/dm/thefrontrow.do"> THE FRONT ROW</a></li>
						<li><a
							href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003628">
								Club Travel</a></li>
						<li><a href="https://www.hddfs.com/shop/or/spord/main.do">
								스페셜오더</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=642001">
								■ MUSINSA DF ■</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=665301">
								클린뷰티 전용관 THE C.LAB</a></li>
						<li><a href="https://www.hddfs.com/shop/op/weds/wedsShop.do">
								웨딩샵</a></li>
					</ul></li>
				<li><strong>카테고리</strong>
					<ul class="depth_02 serviceCtgList"></ul></li>

				<li data-ctgid="ctg0001" class="open"><strong>스킨케어</strong>
					<ul class="depth_03" style="display: block;">
						<li><a rel="nosublink"
							href="/product/list?clarge=스킨케어&cmedium=&csmall=">스킨케어 전체보기</a></li>
						<li><a rel="nosublink"
							href="/product/list?clarge=스킨케어&cmedium=기초케어&csmall=">기초케어</a></li>
						<li><a rel="nosublink"
							href="/product/list?clarge=스킨케어&cmedium=선케어&csmall=">선케어</a></li>
						<li><a rel="nosublink"
							href="/product/list?clarge=스킨케어&cmedium=클렌징&csmall=">클렌징</a></li>
						<li><a rel="nosublink"
							href="/product/list?clarge=스킨케어&cmedium=마스크팩&csmall=">마스크팩</a></li>
						<li><a rel="nosublink"
							href="/product/list?clarge=스킨케어&cmedium=유아동&csmall=">유아동</a></li>
						<li><a rel="nosublink"
							href="/product/list?clarge=스킨케어&cmedium=남성용&csmall=">남성용</a></li>
						<li><a rel="nosublink"
							href="/product/list?clarge=스킨케어&cmedium=미용기기/도구&csmall=">미용기기/도구</a></li>
					</ul></li>


				<li><strong>공식스토어</strong>
					<ul class="depth_02 gnb_luxury luxuryAreaList">
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=005601"
							rel="nosublink">
								<p>겔랑</p> <img
								src="https://cdn.hddfs.com/files/gd/20220214/8964829b_202202141654149430.jpg?RS=131X131"
								alt="겔랑"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=001801"
							rel="nosublink">
								<p>라프레리</p> <img
								src="https://cdn.hddfs.com/files/gd/20220204/864a76a0_202202041249213770.png?RS=131X131"
								alt="라프레리"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006301"
							rel="nosublink">
								<p>랑콤</p> <img
								src="https://cdn.hddfs.com/files/gd/20220504/c20154c6_202205041256272420.jpg?RS=131X131"
								alt="랑콤"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006801"
							rel="nosublink">
								<p>슈에무라</p> <img
								src="https://cdn.hddfs.com/files/gd/20220504/59c9f78e_202205041254565010.jpg?RS=131X131"
								alt="슈에무라 "
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006701"
							rel="nosublink">
								<p>아틀리에 코롱</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/006701_3.jpg?RS=131X131"
								alt="아틀리에 코롱 "
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=007301"
							rel="nosublink">
								<p>키엘</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/007301_3.jpg?RS=131X131"
								alt="키엘 "
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=063001"
							rel="nosublink">
								<p>케라스타즈</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/063001_3.jpg?RS=131X131"
								alt="케라스타즈"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=053601"
							rel="nosublink">
								<p>버버리 뷰티</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/053601_3.jpg?RS=131X131"
								alt="버버리 뷰티"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=024101"
							rel="nosublink">
								<p>프라다 향수</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/024101_3.jpg?RS=131X131"
								alt="프라다 향수"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=063401"
							rel="nosublink">
								<p>구찌 뷰티</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/063401_3.jpg?RS=131X131"
								alt="구찌 뷰티"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=022901"
							rel="nosublink">
								<p>에스티 로더</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/022901_3.jpg?RS=131X131"
								alt="에스티 로더"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025701"
							rel="nosublink">
								<p>크리니크</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/025701_3.jpg?RS=131X131"
								alt="크리니크"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=013101"
							rel="nosublink">
								<p>골든구스</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/013101_3.jpg?RS=131X131"
								alt="골든구스"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025501"
							rel="nosublink">
								<p>조 말론 런던</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/025501_3.jpg?RS=131X131"
								alt="조 말론 런던"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=026901"
							rel="nosublink">
								<p>달팡</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/026901_3.jpg?RS=131X131"
								alt="달팡"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025401"
							rel="nosublink">
								<p>맥</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/025401_3.jpg?RS=131X131"
								alt="맥"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025301"
							rel="nosublink">
								<p>라 메르</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/025301_3.jpg?RS=131X131"
								alt="라 메르 "
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=027101"
							rel="nosublink">
								<p>톰포드 뷰티</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/027101_3.jpg?RS=131X131"
								alt="톰포드 뷰티"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=024901"
							rel="nosublink">
								<p>르 라보</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/024901_3.jpg?RS=131X131"
								alt="르 라보 "
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=026401"
							rel="nosublink">
								<p>오리진스</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/026401_3.jpg?RS=131X131"
								alt="오리진스 "
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=026701"
							rel="nosublink">
								<p>랩시리즈</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/026701_3.jpg?RS=131X131"
								alt="랩시리즈 "
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=028401"
							rel="nosublink">
								<p>프레데릭 말</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/028401_3.jpg?RS=131X131"
								alt="프레데릭 말"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=067001"
							rel="nosublink">
								<p>크리스찬 루부탱 뷰티</p> <img
								src="https://cdn.hddfs.com/files/gd/20220829/f179847d_202208291029194800.jpg?RS=131X131"
								alt="크리스찬 루부탱 뷰티"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=057001"
							rel="nosublink">
								<p>킬리안</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/057001_3.jpg?RS=131X131"
								alt="킬리안"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=004901"
							rel="nosublink">
								<p>포레오</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/004901_3.jpg?RS=131X131"
								alt="포레오"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=023901"
							rel="nosublink">
								<p>펜할리곤스</p> <img
								src="https://cdn.hddfs.com/files/gd/20211020/c9d90fa9_202110201126129160.jpg?RS=131X131"
								alt="펜할리곤스"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=601401"
							rel="nosublink">
								<p>정관장</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/601401_3.jpg?RS=131X131"
								alt="정관장"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=064301"
							rel="nosublink">
								<p>라티잔 퍼퓨머</p> <img
								src="https://cdn.hddfs.com/files/gd/20211116/58a8c781_202111161658026460.jpg?RS=131X131"
								alt="라티잔 퍼퓨머"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=021901"
							rel="nosublink">
								<p>구찌 타임피스 앤 주얼리</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/021901_3.jpg?RS=131X131"
								alt="구찌 타임피스 앤 주얼리"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=621700"
							rel="nosublink">
								<p>LG 생활건강</p> <img
								src="https://cdn.hddfs.com/files/gd/20211230/2770170e_202112301024035510.jpg?RS=131X131"
								alt="LG 생활건강"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=007101"
							rel="nosublink">
								<p>라로슈포제</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/007101_3.jpg?RS=131X131"
								alt="라로슈포제 "
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=622101"
							rel="nosublink">
								<p>설화수</p> <img
								src="https://cdn.hddfs.com/files/gd/20220622/c0e7428b_202206221414438690.jpg?RS=131X131"
								alt="설화수"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=007001"
							rel="nosublink">
								<p>비쉬</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/007001_3.jpg?RS=131X131"
								alt="비쉬 "
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
						<li><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=659901"
							rel="nosublink">
								<p>오에라</p> <img
								src="https://cdn.hddfs.com/files/gd/20220622/a84a5db1_202206221546194980.jpg?RS=131X131"
								alt="오에라"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=131X131';">
						</a></li>
					</ul></li>
				<li><strong>행사중인 브랜드</strong>
					<ul class="depth_02 gnb_brand interestBranList">
						<li class="interest663801"><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=663801"
							rel="nosublink">
								<p>카비시</p> <img
								src="https://cdn.hddfs.com/files/gd/20220919/fcc93058_202209191312028740.jpg?RS=84X84"
								alt="카비시"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=84X84';">
						</a></li>
						<li class="interest006301"><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006301"
							rel="nosublink">
								<p>랑콤</p> <img
								src="https://cdn.hddfs.com/files/gd/20220504/c20154c6_202205041256272420.jpg?RS=84X84"
								alt="랑콤"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=84X84';">
						</a></li>
						<li class="interest063001"><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=063001"
							rel="nosublink">
								<p>케라스타즈</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/063001_3.jpg?RS=84X84"
								alt="케라스타즈"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=84X84';">
						</a></li>
						<li class="interest006701"><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006701"
							rel="nosublink">
								<p>아틀리에 코롱</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/006701_3.jpg?RS=84X84"
								alt="아틀리에 코롱 "
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=84X84';">
						</a></li>
						<li class="interest063201"><a
							href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=063201"
							rel="nosublink">
								<p>모라츠</p> <img
								src="https://cdn.hddfs.com/files/gd/bran/063201_3.jpg?RS=84X84"
								alt="모라츠"
								onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=84X84';">
						</a></li>
					</ul></li>
			</ul>
		</div>
		<button class="gnb_close">닫기</button>
	</nav>
</header>