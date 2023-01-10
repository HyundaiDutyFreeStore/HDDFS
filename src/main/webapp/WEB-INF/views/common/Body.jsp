<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<main id="container"> <script type="text/javascript">
	var lgcpBuyMbshGrpCd = '';
	var mbshGrpNm = '';
	var introType = "S";
	var introStyle = "";

	$(function() {
		$(".chkHashtag").click(function() {
			if ($(this).is(":checked")) {
				$(this).addClass("active");
			} else {
				$(this).removeClass("active");
			}
		});
		//새로 고침, 페이지 이동 시 선택 해시태그정보 저장
		window.onbeforeunload = function() {
			var chkHastagSeq = "";
			$(".chkHashtag").each(function() {
				if ($(this).hasClass("active")) {
					if (chkHastagSeq == "") {
						chkHastagSeq = $(this).data("seq");
					} else {
						chkHastagSeq += "," + $(this).data("seq");
					}
				}
			});
			if (chkHastagSeq != "") {
				sessionStorage.setItem("chkHastagSeq", chkHastagSeq);
			} else {
				sessionStorage.removeItem("chkHastagSeq");
			}
		}

		// 일반 검색창에 # 입력시 해시태그 검색창 전환
		$("#basicSearchTermIntro").on('keyup', function() {
			if ($("#basicSearchTermIntro").val() === "#") {
				$(".select #hashSrchCondIntro").trigger('click');
				$("#hashSearchTermIntro").focus();
			}
		});

		$(".select button").on("click", function() {
			$("#basicSearchTermIntro").val("").focus();
			$("#hashSearchTermIntro").val("").focus();
		});

	});

	$(window).scroll(function() {
		if ($(window).scrollTop() > 0) {
			if ($(".hashtagVideoArea").find("video").length > 0) {
				$(".hashtagVideoArea").find("video").each(function() {
					if ($(this).attr("preload") == "none") {
						$(this).attr("preload", "");
						$(this).attr("autoplay", true);
					}
				});
			}
		}
	});

	$(document)
			.ready(
					function() {
						var selMainSwiperPos = sessionStorage
								.getItem("selMainSwiperPos") == null ? 0
								: Number(sessionStorage
										.getItem("selMainSwiperPos"));
						//인트로/메인 위치에 따른 동영상 자동 플레이 처리
						if (selMainSwiperPos < 1) { // 인트로 페이지인 경우
							if ($(".introArea").find("video").length > 0) {
								$(".introArea").find("video").attr("preload",
										"");
								$(".introArea").find("video").attr("autoplay",
										true);
							}
						} else if (selMainSwiperPos == 1) { //메인
							if ($(".bannerSwiper").find("video").length > 0) {
								$(".bannerSwiper").find("video").attr(
										"preload", "");
								$(".bannerSwiper").find("video").attr(
										"autoplay", true);
							}
						}

						if (selMainSwiperPos > 0) {
							$(".intro_box").addClass("close").css(
									{
										overflow : "hidden",
										transform : "translateY(-"
												+ ($(window).height()) + "px)"
									});
							$("#wrap").css(
									{
										transform : "translateY(-"
												+ (($(window).height()))
												+ "px)"
									}).addClass("intro_close");
							$(".intro_box").css({
								transform : ""
							}).hide();
							$("#wrap").removeClass("intro_close").css({
								transform : ""
							});
							$("body").removeClass("intro_open");
							$("#intro").removeClass("open");
						}

						$("#header").addClass("header-underline-none");
						userLgcpBuyMbsh = typeof userLgcpBuyMbsh != "undefined" ? userLgcpBuyMbsh
								: "001";
						userLgcpBuyMbshDtl = typeof userLgcpBuyMbshDtl != "undefined" ? userLgcpBuyMbshDtl
								: "";
						userMbshNo = typeof userMbshNo != "undefined" ? userMbshNo
								: "";
						var tagName = "";

						if (introType == "S") {
							tagName = ".personalTag > span";
						} else {
							if (userLgcpBuyMbsh == "001") {
								tagName = ".personalTag > div";
							} else if (userLgcpBuyMbsh == "MG"
									|| userLgcpBuyMbsh == "SG") {
								tagName = ".personalTag > li";
							}
						}

						$(tagName)
								.each(
										function(idx) {
											var seq = $(this).data("seq");
											var target = $(this).data("target");
											if (target != "99") {
												if (target == "01") { //대상그룹
													userLgcpBuyMbsh = userLgcpBuyMbsh == '' ? '001'
															: userLgcpBuyMbsh;
													if ($(
															"#HashtagMbshGrp"
																	+ seq)
															.val()
															.indexOf(
																	userLgcpBuyMbsh) == -1) { // 로그인 유저 대상 그룹 확인
														$(this).remove(); //	대량구매그룹이 아닌 경우 삭제
														return true;
													} else {
														if ($(
																"#HashtagMbshGrpDtl"
																		+ seq)
																.val() != ""
																&& $(
																		"#HashtagMbshGrpDtl"
																				+ seq)
																		.val()
																		.indexOf(
																				userLgcpBuyMbshDtl) == -1) {
															$(this).remove(); // 대상그룹은 같으나  상세그룹이 다른 경우 삭제
															return true;
														}
													}
												} else if (target == "02") { //대상그룹 + 대상회원
													userLgcpBuyMbsh = userLgcpBuyMbsh == '' ? '001'
															: userLgcpBuyMbsh;
													if ($(
															"#HashtagMbshGrp"
																	+ seq)
															.val()
															.indexOf(
																	userLgcpBuyMbsh) == -1) {
														if ($(
																"#HashtagMbshNo"
																		+ seq)
																.val() != ""
																&& ($(
																		"#HashtagMbshNo"
																				+ seq)
																		.val()
																		.indexOf(
																				userMbshNo) != -1 && userMbshNo != "")) {
															// skip		(대상 그룹은 아니나 대상회원인 경우) 
														} else {
															$(this).remove(); // 대상 그룹이 아니며, 대상회원도 아닌 경우 삭제	 	
															return true;
														}
													} else {
														if ($(
																"#HashtagMbshGrpDtl"
																		+ seq)
																.val() != ""
																&& $(
																		"#HashtagMbshGrpDtl"
																				+ seq)
																		.val()
																		.indexOf(
																				userLgcpBuyMbshDtl) == -1) {
															if ($(
																	"#HashtagMbshNo"
																			+ seq)
																	.val() != ""
																	&& ($(
																			"#HashtagMbshNo"
																					+ seq)
																			.val()
																			.indexOf(
																					userMbshNo) != -1 && userMbshNo != "")) {
																// skip		(대상 그룹은 아니나 대상회원인 경우) 
															} else {
																$(this)
																		.remove(); // 대상그룹은 같으나  상세그룹이 다른 경우 삭제
																return true;
															}
														}
													}
												} else if (target == "03") {
													if ($(
															"#HashtagMbshNo"
																	+ seq)
															.val() != ""
															&& ($(
																	"#HashtagMbshNo"
																			+ seq)
																	.val()
																	.indexOf(
																			userMbshNo) < 0 || userMbshNo == "")) {
														$(this).remove(); // 대상회원이 아닌 경우
														return true;
													}
												}
											}
										});
						$(".personalTag").show();

						//첫번째 해시태그 펼친 상태
						$(".tip_balloon").fadeIn(3000).fadeOut(3000);

						//검색인트로 검색창 돋보기 버튼 클릭		
						$("#introSearchBtn").on(
								"click",
								function() {
									var url = $("#searchHeader").find(
											"[name=movUrl]").val();
									if (url != '') {
										location.href = url;
									} else {
										return;
									}
								});

						// 메인팝업 오픈 이벤트
						$(".main_bottom_pop").each(
								function() {
									var seq = $(this).data("seq");
									$(".today_close.chk").show();
									$("#btn_hidden_layer_" + seq).attr(
											"hiddenYn", "N");
								});

						$(".cup_area").each(
								function() {
									var cupAmt = $(this).find(".cupDcAmt")
											.val();
									if (cupAmt.length > 10) {
										$(this).find("#cup_amt").html(
												"<em>" + cupAmt + "</em>");
									}
								});
						$(".svmt_area").each(
								function() {
									var svmtAmt = $(this).find(".baseRsvgAmt")
											.val();
									if (svmtAmt.length > 10) {
										$(this).find("#svmt_amt").html(
												"<em>￦" + svmtAmt
														+ "</em><em>원</em>");
									}
								});

						$("#basicSearchTermIntro, #hashSearchTermIntro").on(
								'click', function() {
									srchLayerIntro();
								});

						// 검색 조건 클릭시 자동완성 타입 변경
						$(".select button").on('click', function() {
							changeSearchTextBox();
						});

						if ($(".hStyleGroup").length < 1
								&& $(".hStyleGroup").length < 1) {
							$(".noHashtagData").height("80px");
						}

						var chkHastagSeq = sessionStorage
								.getItem("chkHastagSeq");
						if (chkHastagSeq != null) {
							introStyle = "S";
							var chkHastagSeqSplit = chkHastagSeq.split(",");
							for (var i = 0; i < chkHastagSeqSplit.length; i++) {
								$("#chkHashtag" + chkHastagSeqSplit[i])
										.addClass("active");
							}

							$(".choiceHashtag > .choiceGroup").hide();
							$(".mainstyle_switch").show();
							$(".hyundaiStyleHashtag").hide();
							$(".choiceHashtag").show(); //선택 해시태그 노출
							$("#toggle_switch_btn").attr("class",
									"toggle_switch tagstyle");
							if ($("#lgcpBuyMbshGrpCd").val() == "MG"
									|| $("#lgcpBuyMbshGrpCd").val() == "SG") {
								$(".mainstyle_switch").hide();
							} else {
								$(".mainstyle_switch").show();
							}

							var firstFlag = 0;
							$("input[name='chkHashtag']")
									.each(
											function() {
												var chkHashtagSeq = $(this)
														.data("seq");
												if ($(this).hasClass("active")) {
													$(this).click();
													$(
															"#choiceHashTag"
																	+ chkHashtagSeq)
															.show();
													if (firstFlag === 0) {
														$(
																"#choiceHashTag"
																		+ chkHashtagSeq)
																.addClass(
																		"open");
														$(
																"#choiceHashTag"
																		+ chkHashtagSeq
																		+ " > .tab-action")
																.show();
													}
													firstFlag++;
												} else {
													$(
															"#choiceHashTag"
																	+ chkHashtagSeq)
															.hide();
												}

											});
							sessionStorage.removeItem("chkHastagSeq");
						} else {
							introStyle = "H";
							$(".choiceHashtag").hide();
							$(".hyundaiStyleHashtag").show(); //현대스타일 해시태그 노출
							$("#toggle_switch_btn").attr("class",
									"toggle_switch hdstyle");
							if ($("#introType").val() == 'S') {
								$(".mainstyle_switch").hide();
							} else {
								if ($("#lgcpBuyMbshGrpCd").val() == "MG"
										|| $("#lgcpBuyMbshGrpCd").val() == "SG") {
									$(".mainstyle_switch").hide();
								} else {
									$(".mainstyle_switch").show();
								}
							}
							$(".hyundaiStyleHashtag > section").removeClass(
									"open");
							$(".hyundaiStyleHashtag > section").first().find(
									".tab-action").hide();
							$(".hyundaiStyleHashtag > section > .tab-action")
									.first().parent().addClass("open");
							$(".hyundaiStyleHashtag > section > .tab-action")
									.first().show();
						}
						luckyDealMake(); // 럭키딜 AJAX
						timeSaleMake(); // 타임세일 AJAX
						hShareListMake(); // H.Share AJAX

						if (sessionStorage.getItem("selMainSwiperPos") === "1") {
							commOpenLayer('Y', 'N');
						}

						mainAdultReload(); // 메인 html 굽는 작업 후에 성인인증 상태값 로직

					});

	// 메인 html 굽는 작업 후에 성인인증 상태값 로직
	function mainAdultReload() {

		if (isLogin) {
			$
					.ajax({
						url : ctx_shop + "/cm/comm/mainAdultYn.json",
						async : true,
						dataType : "json",
						type : "POST",
						success : function(data, textStatus, jqXHR) {

							if (data.mainAdultYn == "Y") {
								// 메인해시태그모듈 > 상품탭
								$
										.each(
												$(".goosList"),
												function(i, el) {

													if ($(this).attr(
															"data-adult") == "Y") {
														$(this).removeAttr(
																"data-adult");
														$(this).removeAttr(
																"adult");
														goosCd = $(this).attr(
																"data-gooscd");
														minBuyQty = $(this)
																.attr(
																		"data-minbuyqty");
														$(this)
																.find('a')
																.attr(
																		'onclick',
																		'')
																.unbind('click');
														$(this)
																.find('a')
																.removeAttr(
																		"nohref");
														$(this)
																.find('a')
																.attr(
																		"href",
																		ctx_shop
																				+ "/gd/dtl/goos.do?onlnGoosCd="
																				+ goosCd);
														$(this)
																.find(
																		'.cartBtn')
																.attr(
																		"onclick",
																		'newAddCartMulti("'
																				+ goosCd
																				+ '", "'
																				+ minBuyQty
																				+ '", "", "", "order","N",event)');
														$(this)
																.find('.buyBtn')
																.attr(
																		"onclick",
																		'newAddCartMulti("'
																				+ goosCd
																				+ '", "'
																				+ minBuyQty
																				+ '", "", "", "order","Y",event)');
													}
												});

								// 메인해시태그모듈 > 세트할인탭
								$
										.each(
												$(".setGoosList"),
												function(i, el) {

													if ($(this).attr(
															"data-adult") == "Y") {
														$(this).removeAttr(
																"data-adult");
														goosCd = $(this).attr(
																"data-gooscd");
														$(this)
																.find('a')
																.attr(
																		'onclick',
																		'')
																.unbind('click');
														$(this)
																.find('a')
																.removeAttr(
																		"nohref");
														$(this)
																.find('a')
																.attr(
																		"href",
																		ctx_shop
																				+ "/gd/dtl/goos.do?onlnGoosCd="
																				+ goosCd);
													}
												});

							}
						}
					});
		}

		// 성인인증 후 페이지 리로드가 안되기 때문에 필요
		if ("N" == "Y") {

			$.each($(".goosList"), function(i, el) {

				if ($(this).attr("data-adult") == "Y") {
					$(this).removeAttr("data-adult");
					$(this).removeAttr("adult");
					goosCd = $(this).attr("data-gooscd");
					minBuyQty = $(this).attr("data-minbuyqty");
					$(this).find('a').attr('onclick', '').unbind('click');
					$(this).find('a').removeAttr("nohref");
					$(this).find('a').attr("href",
							ctx_shop + "/gd/dtl/goos.do?onlnGoosCd=" + goosCd);
					$(this).find('.cartBtn').attr(
							"onclick",
							'newAddCartMulti("' + goosCd + '", "' + minBuyQty
									+ '", "", "", "order","N",event)');
					$(this).find('.buyBtn').attr(
							"onclick",
							'newAddCartMulti("' + goosCd + '", "' + minBuyQty
									+ '", "", "", "order","Y",event)');
				}
			});

			$.each($(".setGoosList"), function(i, el) {

				if ($(this).attr("data-adult") == "Y") {
					$(this).removeAttr("data-adult");
					goosCd = $(this).attr("data-gooscd");
					$(this).find('a').attr('onclick', '').unbind('click');
					$(this).find('a').removeAttr("nohref");
					$(this).find('a').attr("href",
							ctx_shop + "/gd/dtl/goos.do?onlnGoosCd=" + goosCd);
				}
			});
		}
	}

	function changeMainStyle(type) {
		$(".hyundaiStyleHashtag , .choiceHashtag").hide(); //해시태그 영역 전체 숨김
		if (type == 'hdstyle') {
			//현대스타일로 볼께요.
			$(".hyundaiStyleHashtag").show(); //현대스타일 해시태그 노출
			$("#toggle_switch_btn").attr("class", "toggle_switch hdstyle");
			if ($("#introType").val() == 'S') {
				$(".mainstyle_switch").hide();
			} else {
				if (lgcpBuyMbshGrpCd == "MG" || lgcpBuyMbshGrpCd == "SG") {
					$(".mainstyle_switch").hide();
				} else {
					$(".mainstyle_switch").show();
				}
			}
			$(".hyundaiStyleHashtag > section").removeClass("open");
			$(".hyundaiStyleHashtag > section").first().find(".tab-action")
					.hide();
			$(".hyundaiStyleHashtag > section > .tab-action").first().parent()
					.addClass("open");
			$(".hyundaiStyleHashtag > section > .tab-action").first().show();
		} else {
			if (introStyle == 'S') {
				$(".mainstyle_switch").show();
				$(".choiceHashtag").show(); //선택 해시태그 노출	
				$("#toggle_switch_btn").attr("class", "toggle_switch tagstyle");
				if (lgcpBuyMbshGrpCd == "MG" || lgcpBuyMbshGrpCd == "SG") {
					$(".mainstyle_switch").hide();
				} else {
					$(".mainstyle_switch").show();
				}

				var firstFlag = 0;
				$("input[name='chkHashtag']").each(
						function() {
							var chkHashtagSeq = $(this).data("seq");
							if ($(this).hasClass("active")) {
								$("#choiceHashTag" + chkHashtagSeq).show();
								if (firstFlag === 0) {
									$("#choiceHashTag" + chkHashtagSeq)
											.addClass("open");
									$(
											"#choiceHashTag" + chkHashtagSeq
													+ " > .tab-action").show();
								}
								firstFlag++;
							} else {
								$("#choiceHashTag" + chkHashtagSeq).hide();
							}
						});
				if (firstFlag < 1) {
					//해시태그 선택 없는 경우 intro 이동
					$(".btn_gointro").trigger("click");
				}
			} else {
				//해시태그 선택 없는 경우 intro 이동
				$(".btn_gointro").trigger("click");
			}
		}
	}

	function openTab(hashtagSeq) {
		$(".show" + hashtagSeq).css('display', 'block');
	}

	function changeHashtagTab(obj, hashtagSeq) {
		$(".hashtagDtlInfo" + hashtagSeq).hide();
		$("#" + obj).show();
	}

	function moreHashtagItems(obj, hashtagSeq, hashSeq, dispAltiClsCd, optionCd) {
		$.ajax({
			async : true,
			url : ctx_curr + "/dm/main/hashtagInfo.json",
			dataType : "html",
			type : "POST",
			data : {
				"hashtagSeq" : hashSeq,
				"dispAltiClsCd" : dispAltiClsCd,
				"optionCd" : optionCd
			},
			success : function(data) {
				if (obj == 'Svmt' || obj == 'Brand' || obj == 'Cup') {
					$(".hashtag" + obj + "List" + hashtagSeq).append(data); //숨김영역 노출
				} else if (obj == "Goos") {
					$(".hashtag" + obj + "List" + hashtagSeq + " > ul ")
							.append(data); //숨김 상품 노출
				} else if (obj == "Dc") {
					$(".hashtag" + obj + "List" + hashtagSeq).append(data); //숨김 상품 노출
				} else if (obj == "SetGoos") {
					$(".hashtag" + obj + "List" + hashtagSeq).append(data); //숨김 상품 노출
				} else {
					$(".hashtag" + obj + "List" + hashtagSeq).append(data); //숨김 상품 노출
				}
				$(".hashtag" + obj + "More" + hashtagSeq).hide(); //더보기 숨김	
			},
			complete : function() {
			}

		});
	}

	//쿠폰 다운로드
	function issueMainCoupon(cupId) {
		// 로그인 체크
		if (!isLogin) {
			alert('로그인 후 이용 가능합니다.'); /*로그인 후 이용 가능합니다.*/
			login();
			return;
		}

		if (lgcpBuyMbshGrpCd == "MG" || mbshGrpNm == "MG") {
			alert('본 쿠폰은 현대백화점면세점 일반 회원만 다운로드 및 사용할 수 있습니다.'); /*본 쿠폰은 현대백화점면세점 일반 회원만 다운로드 및 사용할 수 있습니다*/
			return;
		}

		issueCoupon(cupId, function(data) {
			if (data.resultCode == 1) {
				alert('쿠폰이 다운로드 되었습니다.');
			} else {
				alert(data.message);
			}
		});
	}

	// 적립금 다운로드
	function issueSvmtForMain(svmtId, baseRsvgAmt) {

		issueSvmt(svmtId, baseRsvgAmt, function(data) {
			if (data.resultCode == 1) {
				alert('적립금이 다운로드 되었습니다.');
			} else {
				alert(data.message);
			}
		});
	}

	// 검색인트로 검색 submit
	function searchIntroAction() {
		//$(".advanced_search").removeClass("adsearch_open");

		//var basicKeyword = $("#searchHeader").find("[name=searchTerm]").attr('placeholder');

		// 검색어 미입력 시 삽입된 문구로 검색 혹은 지정된 url로 이동
		/* if ($("#basicSearchTermIntro").val() === "" && $("#hashSearchTermIntro").val() === "") {
		 var url = $("#searchHeader").find("[name=movUrl]").val();
		
		 if(url != ""){
		 location.href = url;
		 }else{
		 alert('검색어를 입력해주세요.');
		 }
		 }else{ */
		var result = '';
		$("#introMovUrl").attr('disabled', true);

		// 일반 검색 일때
		if (!$(".introsearcharea").hasClass('taginput')) {
			if ($("#basicSearchTermIntro").val() === "") {
				var url = $("#searchHeader").find("[name=movUrl]").val();

				if (url != "") {
					location.href = url;
				} else {
					alert('검색어를 입력해주세요.');
				}
			} else {
				$(".advanced_search").hide();
				result = checkSearchTerm($("#basicSearchTermIntro").val());
				$("#basicSearchTermIntro").val(result);
				$("#hashSearchTermIntro").val('');
				$("#basicSearchTermIntro").attr('disabled', false);
				$("#hashSearchTermIntro").attr('disabled', true);
				// 일반검색은 order값 제외
				$("#searchOrder").attr('disabled', true);
				// 검색 타입 구분
				$("#searchTypeIntro").val("basic");

				searchHeaderIntro.action = ctx_curr + "/sr/searchResult.do";
				searchHeaderIntro.submit();
			}
		} else {
			// 해시태그 검색 일때
			if ($("#hashSearchTermIntro").val() === "") {
				alert("검색어를 입력해주세요."); // 검색어를 입력해주세요 
			} else {
				$(".advanced_search").hide();
				result = checkSearchTerm($("#hashSearchTermIntro").val());
				$("#hashSearchTermIntro").val(result);
				$("#basicSearchTermIntro").val('');
				$("#basicSearchTermIntro").attr('disabled', true);
				$("#hashSearchTermIntro").attr('disabled', false);
				// 검색 타입 구분
				$("#searchTypeIntro").val("hash");

				searchHeaderIntro.action = ctx_curr + "/sr/hashSearchResult.do";
				searchHeaderIntro.submit();
			}
		}

		//}
	}

	// 검색어 목록 call json
	function srchLayerIntro() {
		// 검색어 있는 상태일때 자동완성 실행
		if ($("#basicSearchTermIntro").val().length > 0
				|| $("#hashSearchTermIntro").val().length > 0) {
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
				$("#advanced_search_intro").html(data.html);

				// 최근 검색어 존재 유무 세팅
				$("#rcntWrdYn").val(data.dqGoosSrch.rcntWrdYn);

				// 자동 저장 사용 유무를 쿠키에서 받아옴
				if (data.rcntOffYn != null) {
					$('input[name="rcntOffYn"]').val(data.rcntOffYn);
				} else {
					$('input[name="rcntOffYn"]').val('Y');
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

	function activeVideoArea(pos) {
		if (pos == 0) { // 인트로 페이지인 경우
			if ($(".introArea").find("video").length > 0
					&& $(".introArea").find("video").attr("preload") == "none") {
				$(".introArea").find("video").attr("preload", "");
				$(".introArea").find("video").attr("autoplay", true);
			}
		} else if (pos == 1) { //메인
			if ($(".bannerSwiper").find("video").length > 0) {
				$(".bannerSwiper").find("video").each(function() {
					if ($(this).attr("preload") == "none") {
						$(this).attr("preload", "");
						$(this).attr("autoplay", true);
					}
				});
			}
		}
	}

	function landingTarget(url, target) {
		if (target == "Y") {
			var blankTarget = window.open("about:blank");
			blankTarget.location.href = url;
		} else {
			location.href = url;
		}
	}

	// HDDFS 리뉴얼 프로젝트 [고영주] - 트래킹코드
	$(function() {
		// 메인 > 인트로버튼
		$(".btn_gointro").click(function() {
			wiseLogAggr("KR_PC_Main_Intro");
		});
	});
</script>

<div class="layer_unit pop_o8_adult" style="display: none">
	<div class="layer_popup">
		<div class="layer_cont">
			<p class="txt_ty1">성인인증 안내</p>
			<p class="text_ty2">
				본 상품은 성인인증 이후 이용이 가능합니다.<br> 성인인증 화면으로 이동하시겠습니까?
			</p>

			<ul class="btn_group">
				<li><a nohref class="btnde_type1 mid adultCancle">취소</a></li>
				<li><a nohref id="chkBtn" value=""
					class="btnde_type1 mid bg_black" onclick="adultAuthPop(this);"
					data-setid="" data-cartseq="" data-cartsetid=""
					data-notAdtGoodsCd="" data-notAdtQtyList="">확인</a></li>
				<input type="hidden" id="goodsCd" value="" />
				<input type="hidden" id="qty" value="" />
				<input type="hidden" id="adtBuyNow" value="" />
			</ul>
		</div>
	</div>
	<div class="event_type_close">닫기</div>
</div>
<div id="layer_popup_adult" class="pop_o9_adult" title="성인인증"
	style="display: none">
	<div class="adult_popup">
		<strong class="tit">본 상품정보는 '청소년에게 유해한 정보'를 <br>포함하고 있기에
			성인인증이 필요합니다.
		</strong>
		<ul>
			<li>본 정보 내용은 청소년 유해물건으로 청소년보호법의 규정에 의하여 만 19세 미만의 청소년이 이용할 수
				없습니다.</li>
		</ul>

		<strong class="box"> 이용을 원하시면 로그인 후 <br>성인인증을 진행해주시기
			바랍니다. <em>이 상품은 비회원 주문이 불가한 상품입니다.</em>
		</strong>
		<p>
			본인확인이 가능하지 않은 경우 <br>현대백화점면세점 고객센터로 연락주시기 바랍니다.
		</p>
		<a nohref id="hpAuth" value="" class="phonecertification_btn"
			data-goosCd="" data-qty="" data-buynow="" data-setid=""
			data-cartseq="" data-cartsetid="" data-notAdtGoodsCd=""
			data-notAdtQtyList=""> <span>휴대폰 인증</span>
		</a>

		<dl>
			<dt>유의사항</dt>
			<dd>휴대폰을 이용한 본인확인은 본인명의의 휴대전화로만 인증이 가능합니다.</dd>
		</dl>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {

		if (isLogin) {
			adultCallback();
		} else {
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
	$("#hpAuth").click(
			function() {
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

				openDRMOKWindow(type, goodsCd, qty, buynow, setGoosId, cartSeq,
						cartSetId, notAdtGoodsCd, notAdtQtyList);
			});

	$(".event_type_close").click(function() {
		$(this).parent().dialog("close");
	});

	$(".adultCancle").click(function() {
		$(this).closest(".pop_o8_adult").dialog("close");
	});

	/* 성인인증 팝업 */
	function openPopup(obj, type, goodsCd, qtyList, setGoosId, buyNow, cartSeq,
			cartSetId, notAdtGoodsCd, notAdtQtyList) {
		console.log('19세팝업 openPopup')
		console.log(goodsCd + '----' + qtyList);
		if (!isLogin) {
			login("", "", type, goodsCd, qtyList, setGoosId, buyNow,
					notAdtGoodsCd, notAdtQtyList);
			return false;
		}

		adultPopup(type, goodsCd, qtyList, buyNow, setGoosId, cartSeq,
				cartSetId, notAdtGoodsCd, notAdtQtyList);

	}

	function adultPopup(type, goodsCd, qtyList, buyNow, setGoosId, cartSeq,
			cartSetId, notAdtGoodsCd, notAdtQtyList) {

		console.log(type);
		console.log('19세팝업 adultPopup');
		console.log(goodsCd + '----' + qtyList);
		console.log(cartSeq);
		console.log(cartSetId);

		//$("#layer_default_adult").show();

		$(".pop_o8_adult").dialog({
			resizable : false,
			dialogClass : "event_type",
			width : 370,
			minHeight : 120,
			maxHeight : 600,
			modal : true
		});

		$("#chkBtn").attr("value", type);
		$("#chkBtn").closest('li').next().attr("value", goodsCd);
		$("#chkBtn").closest('li').next().next().attr("value", qtyList);
		$("#chkBtn").closest('li').next().next().next().attr("value", buyNow);
		$("#chkBtn").attr("data-setid", setGoosId);
		$("#chkBtn").attr("data-cartseq", cartSeq);
		$("#chkBtn").attr("data-cartsetId", cartSetId);
		$("#chkBtn").attr("data-notAdtGoodsCd", notAdtGoodsCd);
		$("#chkBtn").attr("data-notAdtQtyList", notAdtQtyList);
	}

	function adultAuthPop(obj) {

		console.log($(obj).attr('value'));

		$(".pop_o8_adult").dialog("close");

		$(".pop_o9_adult").dialog({
			//resizable: false,
			dialogClass : "pop_type1",
			width : 380,
			minHeight : 120,
			maxHeight : 600,
			modal : true
		});

		var goodsCd = $(obj).closest("li").next().attr("value");
		var qty = $(obj).closest("li").next().next().attr("value");
		var buyNow = $(obj).closest("li").next().next().next().attr("value");
		var setGoosId = $(obj).attr("data-setid");
		var cartSeq = $(obj).attr("data-cartseq");
		var cartSetId = $(obj).attr("data-cartsetId");
		var notAdtGoodsCd = $(obj).attr("data-notAdtGoodsCd");
		var notAdtQtyList = $(obj).attr("data-notAdtQtyList");

		$("#hpAuth").attr('value', $(obj).attr("value"));
		$("#hpAuth").attr('data-goosCd', goodsCd);
		$("#hpAuth").attr('data-qty', qty);
		$("#hpAuth").attr('data-buynow', buyNow);
		$("#hpAuth").attr('data-setid', setGoosId);
		$("#hpAuth").attr('data-cartseq', cartSeq);
		$("#hpAuth").attr('data-cartsetId', cartSetId);
		$("#hpAuth").attr('data-notAdtGoodsCd', notAdtGoodsCd);
		$("#hpAuth").attr('data-notAdtQtyList', notAdtQtyList);

	}

	function callback(obj) {
		console.log(obj);
		$(location).attr("href", obj);
	}

	function adultSuccessAlert() {

		setTimeout(function() {
			alert('정상적으로 처리되었습니다.'); // 정상적으로 처리되었습니다.
		}, 100);
	}

	function adultErrorAlert(obj) {

		setTimeout(function() {
			alert(obj);
		}, 100);
	}

	function closeAdultPopup() {
		$("#layer_popup_adult").dialog("close");
	}

	function removeAdult() {

		var goosCd = "";
		var minBuyQty = "";
		var url = "https://www.hddfs.com/shop";

		$.each($(".goosList"), function(i, el) {

			if ($(this).attr("data-adult") == "Y") {
				$(this).removeAttr("data-adult");
				$(this).removeAttr("adult");
				goosCd = $(this).attr("data-gooscd");
				minBuyQty = $(this).attr("data-minbuyqty");
				$(this).find('a').attr('onclick', '').unbind('click');
				$(this).find("a").attr("href",
						url + "/gd/dtl/goos.do?onlnGoosCd=" + goosCd);
				$(this).find('.cartBtn').attr(
						"onclick",
						'newAddCartMulti("' + goosCd + '", "' + minBuyQty
								+ '", "", "", "order","N",event)');
				$(this).find('.buyBtn').attr(
						"onclick",
						'newAddCartMulti("' + goosCd + '", "' + minBuyQty
								+ '", "", "", "order","Y",event)');
			}

		})

		$.each($(".goosLi"), function(i, el) {
			if ($(el).attr("data-adult") == "Y") {
				$(el).removeAttr("data-adult");
			}
		});
	}

	function openDRMOKWindow(type, goodsCd, qty, buynow, setGoosId, cartSeq,
			cartSetId, notAdtGoodsCd, notAdtQtyList) {

		/* 휴대폰 인증 관련 공지*/
		var url = "https://www.mobile-ok.com/popup/common/hscert.jsp";

		var DRMOK_window;

		var redirectUrl = "";
		if (type == "detail") {
			redirectUrl = "https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd="
					+ goodsCd;
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
		DRMOK_window = window
				.open(
						url
								+ '?cpid=hddfs&rtn_url=http://www.hddfs.com/shop/mm/mbshAuca/adultAuca.do?goosInfo='
								+ goosInfo
								+ '&req_info=CDXMVMF%2B9kTY8GcQ4HyN4fKEyvqaWejp1pUp6cTnuHUhEmjMQyFk3vhwsVjuEJNh83nq1FBXk9hqQpJdvel4QFB6irq5bmnv6lX%2F07OngQR3I9iWrsdttg25eJ4K7%2F8Sydgyhsar48xoxWqlBeJZV2wvvhRddG7LTMV%2BQ40KXccYYFlCS3mgHXranj%2F0AzXfj3YsIAw4jKgXn5NeTgl7Ymx518p15nwy6l56mj4%2Fn4aED5qiB145y8k4Q372aaV302O0HnnLeWj4epRCHF2fLMjZTDQic6cXw6R7f%2FfqHdNpKUiK2K9%2BbUkfNXuoLk3HDsccoshVvXwdx1Ca5qetLg%3D%3D',
						'DRMOKWindow',
						'width=425,height=550,scrollbars=no,toolbar=no,location=no,directories=no,status=no');
		DRMOK_window.focus();

		if (DRMOK_window == null) {
			alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n 화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
		}
	}

	function reload() {
		location.reload();
	}

	function adultCallback() {

		var adultType = getCookie("ADULT_TYPE");
		var goosCd = getCookie("ADULT_GOOSCD");
		var qtyList = getCookie("ADULT_QTY");
		var notAdtGoodsCd = getCookie("NOT_ADULT_GOOSCD");
		var notAdtQtyList = getCookie("NOT_ADULT_QTY");
		var setGoosId = getCookie("ADULT_SETID");
		var buyNow = getCookie("ADULT_BUYNOW");

		// 메인 로그인 시 성인인증여부 검증용
		var mainAdultYn = "N";

		if ("N" == "N") {

			$.ajax({
				url : ctx_curr + "/cm/comm/mainAdultYn.json",
				async : false,
				dataType : "json",
				type : "POST",
				success : function(data, textStatus, jqXHR) {

					if (data.mainAdultYn == "Y") {
						mainAdultYn = "Y";
					}
				}
			});
		}

		if (adultType == "cart") {

			if ("N" == "Y" || mainAdultYn == "Y") {
				newAddCartMulti(goosCd, qtyList, '', '', 'order', buyNow);
			} else {
				adultPopup(adultType, goosCd, qtyList, buyNow);
			}
			deleteCookie("ADULT_TYPE");
		} else if (adultType == "detail") {
			if ("N" == "Y" || mainAdultYn == "Y") {
				location.href = ctx_curr + "/gd/dtl/goos.do?onlnGoosCd="
						+ goosCd;
			} else {
				adultPopup(adultType, goosCd, qtyList, buyNow);
			}
			deleteCookie("ADULT_TYPE");
		} else if (adultType == "list") {
			if ("N" == "Y" || mainAdultYn == "Y") {
				newAddCartMulti(goosCd, qtyList, '', '', 'order', buyNow);
			} else {
				adultPopup(adultType, goosCd, qtyList, buyNow, '', '', '',
						notAdtGoodsCd, notAdtQtyList);
			}
			deleteCookie("ADULT_TYPE");
		} else if (adultType == "set") {
			if ("N" == "Y" || mainAdultYn == "Y") {
				/* newAddCartMulti(onlnGoosCdList.join(","), goosQtyList.join(","), '', '', 'insert', 'Y', setGoosId); */
				newAddSetCartMulti(goosCd, qtyList, setGoosId, ''); //세트 장바구니 호출
			} else {
				adultPopup(adultType, goosCd, qtyList, buyNow, setGoosId, '',
						'', notAdtGoodsCd, notAdtQtyList);
			}
			deleteCookie("ADULT_TYPE");
		} else if (adultType == "cartList") { //HDDFS 리뉴얼 프로젝트 [ 김인호 - 2021.06.17 ] - 장바구니
			if ("N" == "Y" || mainAdultYn == "Y") {
				//goSelectedOrder();
				location.href = ctx_curr + "/or/order/order.do";
			} else {
				adultPopup(adultType, goosCd, qtyList, buyNow, '', '');
			}
		} else if (adultType == "cartGoosCdDetail") {
			if ("N" == "Y" || mainAdultYn == "Y") {
				location.href = ctx_curr + "/gd/dtl/goos.do?onlnGoosCd="
						+ goosCd;
			} else {
				adultPopup(adultType, goosCd, '', '');
			}
		}
		deleteCookie("ADULT_GOOSCD");
		deleteCookie("ADULT_QTY");
		deleteCookie("ADULT_SETID");
		deleteCookie("ADULT_BUYNOW");
		deleteCookie("NOT_ADULT_GOOSCD");
		deleteCookie("NOT_ADULT_QTY");

	}
</script>
<input type="hidden" id="introType" value="S" /> <input type="hidden"
	id="lgcpBuyMbshGrpCd" value="001" />
<div class="btn_gointro">
	<a href="javascript:">INTRO</a>
</div>
<article class="keyvisual bannerSwiper ">
	<div class="keyvisual-swiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide" style="background: black;">
				<video
					src="https://cdn.hddfs.com/files/dm/20221207/1855745e_202212071124101230.mp4"
					onclick="landingTarget('https://www.hddfs.com/shop/dm/thefrontrowDetail.do?evntId=0003928&MG=KR_PC_Main_Hashtag401_Event_0003928','N');"
					preload="none" loop muted
					style="width: 750px; height: 750px; object-fit: cover;"></video>
				<img class="videoPlayImg" style="display: none;"
					src="https://cdn.hddfs.com/files/dm/20221207/f9115b5d_202212070853151630.jpg?RS=750X1110"
					alt="THE FRONT ROW"
					onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</div>
			<a
				href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=638101&MG=KR_PC_Main_Mainevent_1"
				class="swiper-slide" data-mainBnnrIdx="1" target="_self">
				<div class="text">
					<p>LACOSTE</p>
					<p>22FW SEASON OFF</p>
					<span>UP TO 30%</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221227/e69558a9_202212271538597920.jpg?RS=750X1110"
				alt="C_라코스테"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=651201&MG=KR_PC_Main_Mainevent_2"
				class="swiper-slide" data-mainBnnrIdx="2" target="_self">
				<div class="text">
					<p></p>
					<p></p>
					<span></span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221227/0026763a_202212271648452120.jpg?RS=750X1110"
				alt="C_코닥레트로"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/event/op/bnf/listBnf.do?MG=KR_PC_Main_Mainevent_3"
				class="swiper-slide" data-mainBnnrIdx="3" target="_self">
				<div class="text">
					<p>현백면</p>
					<p>1월의 혜택모음</p>
					<span>이달의 혜택 바로 확인하세요!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20230106/7d2b7d18_202301061601486240.jpg?RS=750X1110"
				alt="마_[판촉] 1월 혜택모음"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003925&MG=KR_PC_Main_Mainevent_4"
				class="swiper-slide" data-mainBnnrIdx="4" target="_self">
				<div class="text">
					<p>L&#039;oreal x 현대백화점면세점</p>
					<p>추가 적립금 혜택</p>
					<span></span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221218/81d8143d_202212180852297500.gif?RS=750X1110"
				alt="C_[수입1] 로레알 통합"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002766&MG=KR_PC_Main_Mainevent_5"
				class="swiper-slide" data-mainBnnrIdx="5" target="_self">
				<div class="text">
					<p></p>
					<p></p>
					<span></span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221020/b8cf5975_202210201734049540.gif?RS=750X1110"
				alt="C_화장품 기획전"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0004018&MG=KR_PC_Main_Mainevent_6"
				class="swiper-slide" data-mainBnnrIdx="6" target="_self">
				<div class="text">
					<p>설맞이</p>
					<p>100%당첨 혜택</p>
					<span>H.Point, 커피쿠폰, 플러스적립금, 랜덤 1종 받아가세요!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20230109/e8f1f714_202301091020172110.jpg?RS=750X1110"
				alt="마_[판촉] 설맞이 랜덤당첨"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0004017&MG=KR_PC_Main_Mainevent_7"
				class="swiper-slide" data-mainBnnrIdx="7" target="_self">
				<div class="text">
					<p>스페셜 혜택</p>
					<p>데일리 플러스적립금</p>
					<span>플러스적립금 추가로 받아가세요 ~! </span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20230105/228eaa3c_202301050845233190.jpg?RS=750X1110"
				alt="마_[판촉]스페셜 적립금"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003945&MG=KR_PC_Main_Mainevent_8"
				class="swiper-slide" data-mainBnnrIdx="8" target="_self">
				<div class="text">
					<p>하나카드로 결제시</p>
					<p>최대 10% 청구할인!</p>
					<span>최대 20만원 혜택 받으세요!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221229/192cb9a5_202212291558112560.jpg?RS=750X1110"
				alt="마_[결제] 1월 하나카드 청구할인"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0004014&MG=KR_PC_Main_Mainevent_9"
				class="swiper-slide" data-mainBnnrIdx="9" target="_self">
				<div class="text">
					<p>H.Point + H.Point Pay</p>
					<p>2023년 신년 혜택</p>
					<span>최대 39만원 제휴적립금 + 8% 포인트 증정!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20230103/4c277bf8_202301031415076900.jpg?RS=750X1110"
				alt="마_[제휴] H.Point&Pay 신년혜택"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002749&MG=KR_PC_Main_Mainevent_10"
				class="swiper-slide" data-mainBnnrIdx="10" target="_self">
				<div class="text">
					<p></p>
					<p></p>
					<span></span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221018/a0240ba8_202210181114099570.gif?RS=750X1110"
				alt="C_니트"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003893&MG=KR_PC_Main_Mainevent_11"
				class="swiper-slide" data-mainBnnrIdx="11" target="_self">
				<div class="text">
					<p>Warm Wishes</p>
					<p>플러스적립금 혜택!</p>
					<span>데일리 이벤트플러스적립금 </span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221125/e28c1960_202211251544441870.jpg?RS=750X1110"
				alt="마_[판촉] 11~2월 전관행사"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002784&MG=KR_PC_Main_Mainevent_12"
				class="swiper-slide" data-mainBnnrIdx="12" target="_self">
				<div class="text">
					<p></p>
					<p></p>
					<span></span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221202/38db396d_202212021447382580.gif?RS=750X1110"
				alt="C_국산CP 퍼스널컬러 메이크업 기획전"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003959&MG=KR_PC_Main_Mainevent_13"
				class="swiper-slide" data-mainBnnrIdx="13" target="_self">
				<div class="text">
					<p>출석체크하고</p>
					<p>적립금+경품혜택 받자!</p>
					<span>최대 2만원, H.Point, 커피쿠폰 추첨 증정!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221227/c6b95125_202212271808470350.jpg?RS=750X1110"
				alt="마_[판촉] 1월 출석체크"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003951&MG=KR_PC_Main_Mainevent_14"
				class="swiper-slide" data-mainBnnrIdx="14" target="_self">
				<div class="text">
					<p>PAYCO로 결제하고</p>
					<p>2% 추가 포인트 받자!</p>
					<span>생애 첫 혜택 4,000P + 2% 적립 혜택 받으세요!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221229/e794e25e_202212291544000740.jpg?RS=750X1110"
				alt="마_[결제] 23년 페이코 2% 포인트적립"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a> <a
				href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002713&MG=KR_PC_Main_Mainevent_15"
				class="swiper-slide" data-mainBnnrIdx="15" target="_self">
				<div class="text">
					<p>구매 사은 행사</p>
					<p>TOUS</p>
					<span>구매하면 에코백, 브러쉬 세트 증정까지!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20220818/4951ae9b_202208181321570770.jpg?RS=750X1110"
				alt="TOUS 구매사은 행사"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';">
			</a>
		</div>
		<div class="controller">
			<div class="swiper-prev"></div>
			<div class="swiper-pagination"></div>
			<div class="swiper-next"></div>
			<div class="swiper-play">play</div>
			<div class="swiper-pause">stop</div>
			<div class="swiper-more">더보기</div>
		</div>
	</div>
</article>
<article id="main">

	<section class="brandbanner">
		<div class="box">
			<div class="brandbanner-swiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<a
							href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003965"
							target="_self"> <span class="img"> <img
								data-srcset="https://cdn.hddfs.com/files/dm/20221209/912b1e19_202212091106524870.jpg?RS=160X160"
								data-src="https://cdn.hddfs.com/files/dm/20221209/912b1e19_202212091106524870.jpg?RS=160X160"
								src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160"
								alt="" class="swiper-lazy">
						</span>
							<p>♥500만원 적립금 받으러가기!♥</p>
						</a>
					</div>
					<div class="swiper-slide">
						<a
							href="https://www.hddfs.com/shop/dm/specialMain.do?spclMenuSeq=30"
							target="_self"> <span class="img"> <img
								data-srcset="https://cdn.hddfs.com/files/dm/20221215/2b06e601_202212151646166650.jpg?RS=160X160"
								data-src="https://cdn.hddfs.com/files/dm/20221215/2b06e601_202212151646166650.jpg?RS=160X160"
								src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160"
								alt="" class="swiper-lazy">
						</span>
							<p>라 메르 기적의 크림, 크렘 드 라 메르</p>
						</a>
					</div>
					<div class="swiper-slide">
						<a
							href="https://www.hddfs.com/shop/dm/specialMain.do?spclMenuSeq=24"
							target="_self"> <span class="img"> <img
								data-srcset="https://cdn.hddfs.com/files/dm/20221209/bbd0cabd_202212091044133210.jpg?RS=160X160"
								data-src="https://cdn.hddfs.com/files/dm/20221209/bbd0cabd_202212091044133210.jpg?RS=160X160"
								src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160"
								alt="" class="swiper-lazy">
						</span>
							<p>[MAC] 감각적인 패키징을 입고 출동한 #칠리스크루</p>
						</a>
					</div>
					<div class="swiper-slide">
						<a
							href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002793"
							target="_self"> <span class="img"> <img
								data-srcset="https://cdn.hddfs.com/files/dm/20221206/9f08563e_202212061017212640.jpg?RS=160X160"
								data-src="https://cdn.hddfs.com/files/dm/20221206/9f08563e_202212061017212640.jpg?RS=160X160"
								src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160"
								alt="" class="swiper-lazy">
						</span>
							<p>겨울철 면역력 걱정 끝! 건강식품 제안전</p>
						</a>
					</div>
					<div class="swiper-slide">
						<a
							href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002613"
							target="_self"> <span class="img"> <img
								data-srcset="https://cdn.hddfs.com/files/dm/20220519/98f83fa4_202205191046117880.jpg?RS=160X160"
								data-src="https://cdn.hddfs.com/files/dm/20220519/98f83fa4_202205191046117880.jpg?RS=160X160"
								src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160"
								alt="" class="swiper-lazy">
						</span>
							<p>H.COS FACE 가상 메이크업 체험</p>
						</a>
					</div>
					<div class="swiper-slide">
						<a
							href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002697"
							target="_self"> <span class="img"> <img
								data-srcset="https://cdn.hddfs.com/files/dm/20220803/5237efe7_202208031637392090.jpg?RS=160X160"
								data-src="https://cdn.hddfs.com/files/dm/20220803/5237efe7_202208031637392090.jpg?RS=160X160"
								src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160"
								alt="" class="swiper-lazy">
						</span>
							<p>H.ACC FACE 가상 피팅 체험</p>
						</a>
					</div>
					<div class="swiper-slide">
						<a
							href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002743"
							target="_self"> <span class="img"> <img
								data-srcset="https://cdn.hddfs.com/files/dm/20221006/ad73ffbf_202210061455597640.jpg?RS=160X160"
								data-src="https://cdn.hddfs.com/files/dm/20221006/ad73ffbf_202210061455597640.jpg?RS=160X160"
								src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160"
								alt="" class="swiper-lazy">
						</span>
							<p>H.GOLF</p>
						</a>
					</div>
					<div class="swiper-slide">
						<a href="https://www.instagram.com/hddfs.official/" target="_self">
							<span class="img"> <img
								data-srcset="https://cdn.hddfs.com/files/dm/20220520/b6e68502_202205201438061770.jpg?RS=160X160"
								data-src="https://cdn.hddfs.com/files/dm/20220520/b6e68502_202205201438061770.jpg?RS=160X160"
								src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=160X160"
								alt="" class="swiper-lazy">
						</span>
							<p>#인스타그램</p>
						</a>
					</div>
				</div>
			</div>
			<div class="swiper-next"></div>
			<div class="swiper-prev"></div>
		</div>
	</section>
	<section class="luckyDealMenu"></section>
	<section class="timeSaleMenu"></section>
	<section class="hShareMenu"></section>
	<section class="mainstyle_switch">
		<div class="toggle_switch hdstyle" id="toggle_switch_btn">
			<a href="javascript:" class="hdstyle"
				onclick="changeMainStyle('hdstyle'); wiseLogAggr('KR_PC_Main_Hyundai'); ">현대스타일</a>
			<a href="javascript:" class="tagstyle"
				onclick="changeMainStyle('tagstyle');wiseLogAggr('KR_PC_Main_SelectTag'); ">선택한
				해시태그</a>
			<p>bg</p>
		</div>
	</section>


	<div class="hyundaiStyleHashtag">
		<section class="hashtag hStyleGroup">
			<div class="title">
				<h3>
					<a class="hash-link-desc type-accordion" title=""
						href="/shop/dm/thefrontrow.do" target="_self"># THEFRONTROW</a>
				</h3>
				<img
					data-src="https://cdn.hddfs.com/files/dm/20221026/0333178f_202210260941015490.jpg?RS=1080X160"
					src="https://cdn.hddfs.com/front/images/KO/common/noimg_transparent.png?RS=1080X160"
					alt="THEFRONTROW" class="noImg lazy" /> <a href="javascript:"
					onclick="openTab('H401');" class="btn">OPEN</a>
			</div>
			<div class="tab-action">
				<ul class="tab_round">
					<li class="tab_item "><a href="#H4013398_004"
						onclick="changeHashtagTab('H4013398_004', '4013398')"> 이벤트</a></li>
				</ul>
				<div class="hashtagDtlInfo4013398" id="H4013398_001" class="show401">
				</div>
				<div class="hashtagDtlInfo4013398" id="H4013398_002" class="show401"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4013398" id="H4013398_003" class="show401"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4013398" id="H4013398_004" class="show401"
					style="display: none;">
					<div class="pro_banner">
						<div
							class="product_module img_banner img_banner_h-auto hashtagEvntList4013398">
							<div class="product_itme">
								<a
									href="https://www.hddfs.com/shop/dm/thefrontrowDetail.do?evntId=0003928&MG=KR_PC_Main_Hashtag401_Event_0003928">
									<dl>
										<dt>ANOTHER WAY ; 또 다른 나</dt>
									</dl> <img
									src="https://cdn.hddfs.com/files/dm/20221207/f9115b5d_202212070853151630.jpg?RS=750X400"
									alt="ANOTHER WAY ; 또 다른 나">
								</a>
							</div>
							<div class="product_itme">
								<a
									href="https://www.hddfs.com/shop/dm/thefrontrowDetail.do?evntId=0003927&MG=KR_PC_Main_Hashtag401_Event_0003927">
									<dl>
										<dt>우리의 서울</dt>
									</dl> <img
									src="https://cdn.hddfs.com/files/dm/20221206/4cc1c58e_202212061058155720.jpg?RS=750X400"
									alt="우리의 서울">
								</a>
							</div>
						</div>
						<a href="javascript:"
							onclick="moreHashtagItems('Evnt', '4013398', '401','004','');"
							class="more hashtagEvntMore4013398">더보기</a>
					</div>
				</div>
				<div class="hashtagDtlInfo4013398" id="H4013398_005" class="show401"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4013398" id="H4013398_006" class="show401"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4013398" id="H4013398_007" class="show401"
					style="display: none;">
					<div class="pro_banner">
						<div class="swiper_box text_banner product_module">
							<div class="product-module-swiper">
								<div class="swiper-wrapper"></div>
							</div>
							<div class="swiper-prev"></div>
							<div class="swiper-next"></div>
						</div>
					</div>
				</div>
				<div class="hashtagDtlInfo4013398" id="H4013398_008" class="show401"
					style="display: none;">
					<div class="pro_banner">
						<div class="product_module coupon hashtagCupList4013398"></div>
					</div>
				</div>
				<div class="hashtagDtlInfo4013398" id="H4013398_009" class="show401"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4013398" id="H4013398_010" class="show401"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4013398" id="H4013398_011" class="show401"
					style="display: none;"></div>
			</div>
		</section>
		<section class="hashtag hStyleGroup">
			<div class="title">
				<h3>
					<a class="hash-link-desc type-accordion" title=""
						href="javascript:;" onclick="goSearhpageData('명절선물');"
						target="_self"># 명절선물</a>
				</h3>
				<img
					data-src="https://cdn.hddfs.com/files/dm/20221227/beaf96de_202212271312090340.jpg?RS=1080X160"
					src="https://cdn.hddfs.com/front/images/KO/common/noimg_transparent.png?RS=1080X160"
					alt="명절선물" class="noImg lazy" /> <a href="javascript:"
					onclick="openTab('H494');" class="btn">OPEN</a>
			</div>
			<div class="tab-action">
				<ul class="tab_round">
					<li class="tab_item is_selected"><a href="#H4944421_001"
						onclick="changeHashtagTab('H4944421_001', '4944421')"> 상품</a></li>
					<li class="tab_item "><a href="#H4944421_002"
						onclick="changeHashtagTab('H4944421_002', '4944421')"> 브랜드</a></li>
				</ul>
				<div class="hashtagDtlInfo4944421" id="H4944421_001" class="show494">
					<div class="pro_banner hashtagGoosList4944421">
						<ul class="product_module">
							<li data-gooscd="56221250054401" data-minbuyqty="1"
								class="product_itme goosList 56221250054401"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=56221250054401&MG=KR_PC_Main_Hashtag494_Product_56221250054401">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/6221/20211012/9eea7b27.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/6221/20211012/9eea7b27.jpg?RS=172X172"
											alt="설화수 자음 에센셜 6종"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('56221250054401', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('56221250054401', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">설화수</p>
										<p class="tx_ex goosNm">설화수 자음 에센셜 6종</p>
										<p class="price1" style="height: 19px;"></p>
										<p class="price2">
											<strong data-price="83.0">$83</strong> <span
												data-price="105434.0">105,434<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span><span>사은품</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="56221250063201" data-minbuyqty="1"
								class="product_itme goosList 56221250063201"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=56221250063201&MG=KR_PC_Main_Hashtag494_Product_56221250063201">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/6221/20220308/7c4047f6.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/6221/20220308/7c4047f6.jpg?RS=172X172"
											alt="설화수 윤조에센스 60ml 듀오 세트"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('56221250063201', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('56221250063201', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">설화수</p>
										<p class="tx_ex goosNm">설화수 윤조에센스 60ml 듀오 세트</p>
										<p class="price1" style="height: 19px;"></p>
										<p class="price2">
											<strong data-price="123.0">$123</strong> <span
												data-price="156246.0">156,246<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span><span>사은품</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="56221250049901" data-minbuyqty="1"
								class="product_itme goosList 56221250049901"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=56221250049901&MG=KR_PC_Main_Hashtag494_Product_56221250049901">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/6221/20230105/7fefb401.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/6221/20230105/7fefb401.jpg?RS=172X172"
											alt="설화수 진설크림 60ml"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('56221250049901', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('56221250049901', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">설화수</p>
										<p class="tx_ex goosNm">설화수 진설크림 60ml</p>
										<p class="price1" style="height: 19px;"></p>
										<p class="price2">
											<strong data-price="306.0">$306</strong> <span
												data-price="388711.0">388,711<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span><span>사은품</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="56440250000801" data-minbuyqty="1"
								class="product_itme goosList 56440250000801"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=56440250000801&MG=KR_PC_Main_Hashtag494_Product_56440250000801">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/6440/20200604/346a2ace.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/6440/20200604/346a2ace.jpg?RS=172X172"
											alt=" 가히 링클바운스 멀티밤 9g  "
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('56440250000801', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('56440250000801', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">가히</p>
										<p class="tx_ex goosNm">가히 링클바운스 멀티밤 9g</p>
										<p class="price1" style="height: 19px;">
											<del>$29</del>
											<strong>5%</strong>
										</p>
										<p class="price2">
											<strong data-price="27.55">$27.55</strong> <span
												data-price="34996.0">34,996<em>원</em></span>
										</p>
										<div class="por_icons"></div>
									</div>
							</a></li>
						</ul>
						<a href="javascript:"
							onclick="moreHashtagItems('Goos', '4944421', '494','001','');"
							class="more hashtagGoosMore4944421">더보기</a>
					</div>
				</div>
				<div class="hashtagDtlInfo4944421" id="H4944421_002" class="show494"
					style="display: none;">
					<div class="pro_banner">
						<div class="swiper_box module_circle product_module">
							<div class="product-module-swiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=622101&MG=KR_PC_Main_Hashtag494_Brand_622101">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/20220622/c0e7428b_202206221414438690.jpg?RS=215X215"
												alt="설화수"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/20220622/c0e7428b_202206221414438690.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>설화수</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=644001&MG=KR_PC_Main_Hashtag494_Brand_644001">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/644001_3.jpg?RS=215X215"
												alt="가히"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/644001_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>가히</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=006301&MG=KR_PC_Main_Hashtag494_Brand_006301">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/20220504/c20154c6_202205041256272420.jpg?RS=215X215"
												alt="랑콤"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/20220504/c20154c6_202205041256272420.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>랑콤</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025701&MG=KR_PC_Main_Hashtag494_Brand_025701">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/025701_3.jpg?RS=215X215"
												alt="크리니크"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/025701_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>크리니크</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025301&MG=KR_PC_Main_Hashtag494_Brand_025301">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/025301_3.jpg?RS=215X215"
												alt="라 메르 "
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/025301_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>라 메르 </em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=601401&MG=KR_PC_Main_Hashtag494_Brand_601401">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/601401_3.jpg?RS=215X215"
												alt="정관장"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/601401_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>정관장</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=047101&MG=KR_PC_Main_Hashtag494_Brand_047101">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/047101_3.jpg?RS=215X215"
												alt="오쏘몰"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/047101_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>오쏘몰</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=628602&MG=KR_PC_Main_Hashtag494_Brand_628602">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/628602_3.jpg?RS=215X215"
												alt="엑토"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/628602_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>엑토</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=036101&MG=KR_PC_Main_Hashtag494_Brand_036101">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/036101_3.jpg?RS=215X215"
												alt="몽블랑"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/036101_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>몽블랑</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=022501&MG=KR_PC_Main_Hashtag494_Brand_022501">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/20211215/1ebaffd8_202112150850262840.jpg?RS=215X215"
												alt="멀버리"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/20211215/1ebaffd8_202112150850262840.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>멀버리</em>
										</a>
									</div>
								</div>
							</div>
							<div class="swiper-prev"></div>
							<div class="swiper-next"></div>
						</div>
					</div>
				</div>
				<div class="hashtagDtlInfo4944421" id="H4944421_003" class="show494"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4944421" id="H4944421_004" class="show494"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4944421" id="H4944421_005" class="show494"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4944421" id="H4944421_006" class="show494"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4944421" id="H4944421_007" class="show494"
					style="display: none;">
					<div class="pro_banner">
						<div class="swiper_box text_banner product_module">
							<div class="product-module-swiper">
								<div class="swiper-wrapper"></div>
							</div>
							<div class="swiper-prev"></div>
							<div class="swiper-next"></div>
						</div>
					</div>
				</div>
				<div class="hashtagDtlInfo4944421" id="H4944421_008" class="show494"
					style="display: none;">
					<div class="pro_banner">
						<div class="product_module coupon hashtagCupList4944421"></div>
					</div>
				</div>
				<div class="hashtagDtlInfo4944421" id="H4944421_009" class="show494"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4944421" id="H4944421_010" class="show494"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4944421" id="H4944421_011" class="show494"
					style="display: none;"></div>
			</div>
		</section>
		<section class="hashtag hStyleGroup">
			<div class="title">
				<h3>
					<a class="hash-link-desc type-accordion" title=""
						href="javascript:;" onclick="goSearhpageData('NEWYEAR');"
						target="_self"># NEWYEAR</a>
				</h3>
				<img
					data-src="https://cdn.hddfs.com/files/dm/20230105/3af573de_202301051122408560.jpg?RS=1080X160"
					src="https://cdn.hddfs.com/front/images/KO/common/noimg_transparent.png?RS=1080X160"
					alt="NEWYEAR" class="noImg lazy" /> <a href="javascript:"
					onclick="openTab('H504');" class="btn">OPEN</a>
			</div>
			<div class="tab-action">
				<ul class="tab_round">
					<li class="tab_item is_selected"><a href="#H5044550_001"
						onclick="changeHashtagTab('H5044550_001', '5044550')"> 상품</a></li>
					<li class="tab_item "><a href="#H5044550_002"
						onclick="changeHashtagTab('H5044550_002', '5044550')"> 브랜드</a></li>
				</ul>
				<div class="hashtagDtlInfo5044550" id="H5044550_001" class="show504">
					<div class="pro_banner hashtagGoosList5044550">
						<ul class="product_module">
							<li data-gooscd="10329450138101" data-minbuyqty="1"
								class="product_itme goosList 10329450138101"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10329450138101&MG=KR_PC_Main_Hashtag504_Product_10329450138101">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/0329/20191114/67ba55e8.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/0329/20191114/67ba55e8.jpg?RS=172X172"
											alt="[Korea Limited Edition] 24K 골드 펜던트/참 - 복주머니 12간지 토끼띠 (23935)"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('10329450138101', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('10329450138101', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">주대복</p>
										<p class="tx_ex goosNm">[Korea Limited Edition] 24K 골드
											펜던트/참 - 복주머니 12간지 토끼띠 (23935)</p>
										<p class="price1" style="height: 19px;">
											<del>$182</del>
											<strong>5%</strong>
										</p>
										<p class="price2">
											<strong data-price="172.9">$172.9</strong> <span
												data-price="219634.0">219,634<em>원</em></span>
										</p>
										<div class="por_icons"></div>
									</div>
							</a></li>
							<li data-gooscd="56527660005601" data-minbuyqty="1"
								class="product_itme goosList 56527660005601"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=56527660005601&MG=KR_PC_Main_Hashtag504_Product_56527660005601">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/6527/20210831/70190e18.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/6527/20210831/70190e18.jpg?RS=172X172"
											alt="지갑 속 아트갤러리 카드형 골드 : 토끼"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1 bg_red btn_none_border"
													onclick="javascript:noStoc('56527660005601',event)">재입고알림</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">한국조폐공사</p>
										<p class="tx_ex goosNm">지갑 속 아트갤러리 카드형 골드 : 토끼</p>
										<p class="price1" style="height: 19px;">
											<del>$250</del>
											<strong>3%</strong>
										</p>
										<p class="price2">
											<strong data-price="242.5">$242.5</strong> <span
												data-price="308047.0">308,047<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>사은품</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="10073250017001" data-minbuyqty="1"
								class="product_itme goosList 10073250017001"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10073250017001&MG=KR_PC_Main_Hashtag504_Product_10073250017001">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/0073/20221206/be8e36b6.png?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/0073/20221206/be8e36b6.png?RS=172X172"
											alt="키엘 토끼의 해 리미티드 에디션 세트 2023"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('10073250017001', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('10073250017001', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">키엘</p>
										<p class="tx_ex goosNm">키엘 토끼의 해 리미티드 에디션 세트 2023</p>
										<p class="price1" style="height: 19px;"></p>
										<p class="price2">
											<strong data-price="253.0">$253</strong> <span
												data-price="321385.0">321,385<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="10257250016401" data-minbuyqty="1"
								class="product_itme goosList 10257250016401"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10257250016401&MG=KR_PC_Main_Hashtag504_Product_10257250016401">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/0257/20221124/2aebf9bb.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/0257/20221124/2aebf9bb.jpg?RS=172X172"
											alt="새해 한정판 드라마티컬리 디퍼런트 모이스춰라이징 젤 125ml"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('10257250016401', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('10257250016401', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">크리니크</p>
										<p class="tx_ex goosNm">새해 한정판 드라마티컬리 디퍼런트 모이스춰라이징 젤 125ml</p>
										<p class="price1" style="height: 19px;">
											<del>$37</del>
											<strong>30%</strong>
										</p>
										<p class="price2">
											<strong data-price="25.9">$25.9</strong> <span
												data-price="32900.0">32,900<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
						</ul>
						<a href="javascript:"
							onclick="moreHashtagItems('Goos', '5044550', '504','001','');"
							class="more hashtagGoosMore5044550">더보기</a>
					</div>
				</div>
				<div class="hashtagDtlInfo5044550" id="H5044550_002" class="show504"
					style="display: none;">
					<div class="pro_banner">
						<div class="swiper_box module_circle product_module">
							<div class="product-module-swiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025701&MG=KR_PC_Main_Hashtag504_Brand_025701">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/025701_3.jpg?RS=215X215"
												alt="크리니크"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/025701_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>크리니크</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=032901&MG=KR_PC_Main_Hashtag504_Brand_032901">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/032901_3.jpg?RS=215X215"
												alt="주대복"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/032901_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>주대복</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=652701&MG=KR_PC_Main_Hashtag504_Brand_652701">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/20211019/f793ce90_202110191324345450.jpg?RS=215X215"
												alt="한국조폐공사"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/20211019/f793ce90_202110191324345450.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>한국조폐공사</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=622101&MG=KR_PC_Main_Hashtag504_Brand_622101">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/20220622/c0e7428b_202206221414438690.jpg?RS=215X215"
												alt="설화수"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/20220622/c0e7428b_202206221414438690.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>설화수</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=622901&MG=KR_PC_Main_Hashtag504_Brand_622901">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/622901_3.jpg?RS=215X215"
												alt="밍크엘레팡"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/622901_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>밍크엘레팡</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=007301&MG=KR_PC_Main_Hashtag504_Brand_007301">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/007301_3.jpg?RS=215X215"
												alt="키엘 "
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/007301_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>키엘 </em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=005801&MG=KR_PC_Main_Hashtag504_Brand_005801">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/005801_3.jpg?RS=215X215"
												alt="록시땅"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/005801_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>록시땅</em>
										</a>
									</div>
								</div>
							</div>
							<div class="swiper-prev"></div>
							<div class="swiper-next"></div>
						</div>
					</div>
				</div>
				<div class="hashtagDtlInfo5044550" id="H5044550_003" class="show504"
					style="display: none;"></div>
				<div class="hashtagDtlInfo5044550" id="H5044550_004" class="show504"
					style="display: none;"></div>
				<div class="hashtagDtlInfo5044550" id="H5044550_005" class="show504"
					style="display: none;"></div>
				<div class="hashtagDtlInfo5044550" id="H5044550_006" class="show504"
					style="display: none;"></div>
				<div class="hashtagDtlInfo5044550" id="H5044550_007" class="show504"
					style="display: none;">
					<div class="pro_banner">
						<div class="swiper_box text_banner product_module">
							<div class="product-module-swiper">
								<div class="swiper-wrapper"></div>
							</div>
							<div class="swiper-prev"></div>
							<div class="swiper-next"></div>
						</div>
					</div>
				</div>
				<div class="hashtagDtlInfo5044550" id="H5044550_008" class="show504"
					style="display: none;">
					<div class="pro_banner">
						<div class="product_module coupon hashtagCupList5044550"></div>
					</div>
				</div>
				<div class="hashtagDtlInfo5044550" id="H5044550_009" class="show504"
					style="display: none;"></div>
				<div class="hashtagDtlInfo5044550" id="H5044550_010" class="show504"
					style="display: none;"></div>
				<div class="hashtagDtlInfo5044550" id="H5044550_011" class="show504"
					style="display: none;"></div>
			</div>
		</section>
		<section class="hashtag hStyleGroup">
			<div class="title">
				<h3>
					<a class="hash-link-desc type-accordion" title=""
						href="javascript:;" onclick="goSearhpageData('신규입점브랜드');"
						target="_self"># 신규입점브랜드</a>
				</h3>
				<img
					data-src="https://cdn.hddfs.com/files/dm/20221128/ea0acb23_202211280903430240.jpg?RS=1080X160"
					src="https://cdn.hddfs.com/front/images/KO/common/noimg_transparent.png?RS=1080X160"
					alt="신규입점브랜드" class="noImg lazy" /> <a href="javascript:"
					onclick="openTab('H352');" class="btn">OPEN</a>
			</div>
			<div class="tab-action">
				<ul class="tab_round">
					<li class="tab_item is_selected"><a href="#H3522506_001"
						onclick="changeHashtagTab('H3522506_001', '3522506')"> 상품</a></li>
					<li class="tab_item "><a href="#H3522506_002"
						onclick="changeHashtagTab('H3522506_002', '3522506')"> 브랜드</a></li>
				</ul>
				<div class="hashtagDtlInfo3522506" id="H3522506_001" class="show352">
					<div class="pro_banner hashtagGoosList3522506">
						<ul class="product_module">
							<li data-gooscd="10682300000301" data-minbuyqty="1"
								class="product_itme goosList 10682300000301"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10682300000301&MG=KR_PC_Main_Hashtag352_Product_10682300000301">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/0682/20221110/12a488d3.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/0682/20221110/12a488d3.jpg?RS=172X172"
											alt="엔젤리스 페어 오드 뜨왈렛 30mL"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('10682300000301', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('10682300000301', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">니콜라이</p>
										<p class="tx_ex goosNm">엔젤리스 페어 오드 뜨왈렛 30mL</p>
										<p class="price1" style="height: 19px;">
											<del>$57</del>
											<strong>30%</strong>
										</p>
										<p class="price2">
											<strong data-price="39.9">$39.9</strong> <span
												data-price="50684.0">50,684<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="10682300000101" data-minbuyqty="1"
								class="product_itme goosList 10682300000101"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10682300000101&MG=KR_PC_Main_Hashtag352_Product_10682300000101">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/0682/20221110/b8716e26.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/0682/20221110/b8716e26.jpg?RS=172X172"
											alt="뿌드르드 머스크 인텐스 100mL"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('10682300000101', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('10682300000101', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">니콜라이</p>
										<p class="tx_ex goosNm">뿌드르드 머스크 인텐스 100mL</p>
										<p class="price1" style="height: 19px;">
											<del>$172</del>
											<strong>30%</strong>
										</p>
										<p class="price2">
											<strong data-price="120.4">$120.4</strong> <span
												data-price="152944.0">152,944<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="10682300000201" data-minbuyqty="1"
								class="product_itme goosList 10682300000201"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10682300000201&MG=KR_PC_Main_Hashtag352_Product_10682300000201">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/0682/20221110/a4816d52.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/0682/20221110/a4816d52.jpg?RS=172X172"
											alt="라 노스텔지 오프레쉬 30mL"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('10682300000201', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('10682300000201', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">니콜라이</p>
										<p class="tx_ex goosNm">라 노스텔지 오프레쉬 30mL</p>
										<p class="price1" style="height: 19px;">
											<del>$52</del>
											<strong>30%</strong>
										</p>
										<p class="price2">
											<strong data-price="36.4">$36.4</strong> <span
												data-price="46238.0">46,238<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="10682300000501" data-minbuyqty="1"
								class="product_itme goosList 10682300000501"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10682300000501&MG=KR_PC_Main_Hashtag352_Product_10682300000501">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/0682/20221110/aba4da41.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/0682/20221110/aba4da41.jpg?RS=172X172"
											alt="라 노스텔지 오프레쉬 100mL"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('10682300000501', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('10682300000501', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">니콜라이</p>
										<p class="tx_ex goosNm">라 노스텔지 오프레쉬 100mL</p>
										<p class="price1" style="height: 19px;">
											<del>$123</del>
											<strong>30%</strong>
										</p>
										<p class="price2">
											<strong data-price="86.1">$86.1</strong> <span
												data-price="109372.0">109,372<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
						</ul>
						<a href="javascript:"
							onclick="moreHashtagItems('Goos', '3522506', '352','001','');"
							class="more hashtagGoosMore3522506">더보기</a>
					</div>
				</div>
				<div class="hashtagDtlInfo3522506" id="H3522506_002" class="show352"
					style="display: none;">
					<div class="pro_banner">
						<div class="swiper_box module_circle product_module">
							<div class="product-module-swiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=068201&MG=KR_PC_Main_Hashtag352_Brand_068201">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/20221109/ba003cdb_202211091037388050.jpg?RS=215X215"
												alt="니콜라이"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/20221109/ba003cdb_202211091037388050.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>니콜라이</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=068001&MG=KR_PC_Main_Hashtag352_Brand_068001">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/20221109/594cdd68_202211091036080040.jpg?RS=215X215"
												alt="라보라토리오 올파티보"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/20221109/594cdd68_202211091036080040.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>라보라토리오 올파티보</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=068301&MG=KR_PC_Main_Hashtag352_Brand_068301">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/20221109/9f8d318d_202211091038494660.jpg?RS=215X215"
												alt="르 쿠방"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/20221109/9f8d318d_202211091038494660.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>르 쿠방</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=066401&MG=KR_PC_Main_Hashtag352_Brand_066401">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/20220721/e2584eaf_202207211616435050.jpg?RS=215X215"
												alt="크리스티나"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/20220721/e2584eaf_202207211616435050.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>크리스티나</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=066301&MG=KR_PC_Main_Hashtag352_Brand_066301">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/20220721/1453c3bc_202207211611157750.jpg?RS=215X215"
												alt="네오스트라타"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/20220721/1453c3bc_202207211611157750.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>네오스트라타</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=066201&MG=KR_PC_Main_Hashtag352_Brand_066201">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/20220719/d49684f4_202207190903026290.jpg?RS=215X215"
												alt="이븐스위스"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/20220719/d49684f4_202207190903026290.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>이븐스위스</em>
										</a>
									</div>
								</div>
							</div>
							<div class="swiper-prev"></div>
							<div class="swiper-next"></div>
						</div>
					</div>
				</div>
				<div class="hashtagDtlInfo3522506" id="H3522506_003" class="show352"
					style="display: none;"></div>
				<div class="hashtagDtlInfo3522506" id="H3522506_004" class="show352"
					style="display: none;"></div>
				<div class="hashtagDtlInfo3522506" id="H3522506_005" class="show352"
					style="display: none;"></div>
				<div class="hashtagDtlInfo3522506" id="H3522506_006" class="show352"
					style="display: none;"></div>
				<div class="hashtagDtlInfo3522506" id="H3522506_007" class="show352"
					style="display: none;">
					<div class="pro_banner">
						<div class="swiper_box text_banner product_module">
							<div class="product-module-swiper">
								<div class="swiper-wrapper"></div>
							</div>
							<div class="swiper-prev"></div>
							<div class="swiper-next"></div>
						</div>
					</div>
				</div>
				<div class="hashtagDtlInfo3522506" id="H3522506_008" class="show352"
					style="display: none;">
					<div class="pro_banner">
						<div class="product_module coupon hashtagCupList3522506"></div>
					</div>
				</div>
				<div class="hashtagDtlInfo3522506" id="H3522506_009" class="show352"
					style="display: none;"></div>
				<div class="hashtagDtlInfo3522506" id="H3522506_010" class="show352"
					style="display: none;"></div>
				<div class="hashtagDtlInfo3522506" id="H3522506_011" class="show352"
					style="display: none;"></div>
			</div>
		</section>
		<section class="hashtag hStyleGroup">
			<div class="title">
				<h3>
					<a class="hash-link-desc type-accordion" title=""
						href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=026901"
						target="_self"># 달팡구매사은이벤트</a>
				</h3>
				<img
					data-src="https://cdn.hddfs.com/files/dm/20221125/7c4c262a_202211251628023960.jpg?RS=1080X160"
					src="https://cdn.hddfs.com/front/images/KO/common/noimg_transparent.png?RS=1080X160"
					alt="달팡구매사은이벤트" class="noImg lazy" /> <a href="javascript:"
					onclick="openTab('H439');" class="btn">OPEN</a>
			</div>
			<div class="tab-action">
				<ul class="tab_round">
					<li class="tab_item is_selected"><a href="#H4393927_001"
						onclick="changeHashtagTab('H4393927_001', '4393927')"> 상품</a></li>
					<li class="tab_item "><a href="#H4393927_002"
						onclick="changeHashtagTab('H4393927_002', '4393927')"> 브랜드</a></li>
				</ul>
				<div class="hashtagDtlInfo4393927" id="H4393927_001" class="show439">
					<div class="pro_banner hashtagGoosList4393927">
						<ul class="product_module">
							<li data-gooscd="10269250001501" data-minbuyqty="1"
								class="product_itme goosList 10269250001501"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10269250001501&MG=KR_PC_Main_Hashtag439_Product_10269250001501">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/0269/20190401/7f7be205.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/0269/20190401/7f7be205.jpg?RS=172X172"
											alt="니아울리 아로마틱 케어 "
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1 bg_red btn_none_border"
													onclick="javascript:noStoc('10269250001501',event)">재입고알림</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">달팡</p>
										<p class="tx_ex goosNm">니아울리 아로마틱 케어</p>
										<p class="price1" style="height: 19px;"></p>
										<p class="price2">
											<strong data-price="69.0">$69</strong> <span
												data-price="87650.0">87,650<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="10269250001201" data-minbuyqty="1"
								class="product_itme goosList 10269250001201"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10269250001201&MG=KR_PC_Main_Hashtag439_Product_10269250001201">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/0269/20190402/1964cdcf.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/0269/20190402/1964cdcf.jpg?RS=172X172"
											alt="뤼미에르 에쌍시엘 일루미네이팅 오일 세럼"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1 bg_red btn_none_border"
													onclick="javascript:noStoc('10269250001201',event)">재입고알림</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">달팡</p>
										<p class="tx_ex goosNm">뤼미에르 에쌍시엘 일루미네이팅 오일 세럼</p>
										<p class="price1" style="height: 19px;"></p>
										<p class="price2">
											<strong data-price="62.0">$62</strong> <span
												data-price="78758.0">78,758<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="10269250004701" data-minbuyqty="1"
								class="product_itme goosList 10269250004701"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10269250004701&MG=KR_PC_Main_Hashtag439_Product_10269250004701">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/0269/20190403/47a7c77c.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/0269/20190403/47a7c77c.jpg?RS=172X172"
											alt="아로마틱 리뉴잉 밤 "
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1 bg_red btn_none_border"
													onclick="javascript:noStoc('10269250004701',event)">재입고알림</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">달팡</p>
										<p class="tx_ex goosNm">아로마틱 리뉴잉 밤</p>
										<p class="price1" style="height: 19px;"></p>
										<p class="price2">
											<strong data-price="69.0">$69</strong> <span
												data-price="87650.0">87,650<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="10269250007201" data-minbuyqty="1"
								class="product_itme goosList 10269250007201"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10269250007201&MG=KR_PC_Main_Hashtag439_Product_10269250007201">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/0269/20211124/86a891b1.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/0269/20211124/86a891b1.jpg?RS=172X172"
											alt="아이디얼 리소스 리뉴잉 프로-비타민 C&E 오일 컨센트레이트 "
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('10269250007201', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('10269250007201', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">달팡</p>
										<p class="tx_ex goosNm">아이디얼 리소스 리뉴잉 프로-비타민 C&amp;E 오일
											컨센트레이트</p>
										<p class="price1" style="height: 19px;"></p>
										<p class="price2">
											<strong data-price="101.0">$101</strong> <span
												data-price="128300.0">128,300<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
						</ul>
						<a href="javascript:"
							onclick="moreHashtagItems('Goos', '4393927', '439','001','');"
							class="more hashtagGoosMore4393927">더보기</a>
					</div>
				</div>
				<div class="hashtagDtlInfo4393927" id="H4393927_002" class="show439"
					style="display: none;">
					<div class="pro_banner">
						<div class="swiper_box module_circle product_module">
							<div class="product-module-swiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=026901&MG=KR_PC_Main_Hashtag439_Brand_026901">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/026901_3.jpg?RS=215X215"
												alt="달팡"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/026901_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>달팡</em>
										</a>
									</div>
								</div>
							</div>
							<div class="swiper-prev"></div>
							<div class="swiper-next"></div>
						</div>
					</div>
				</div>
				<div class="hashtagDtlInfo4393927" id="H4393927_003" class="show439"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4393927" id="H4393927_004" class="show439"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4393927" id="H4393927_005" class="show439"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4393927" id="H4393927_006" class="show439"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4393927" id="H4393927_007" class="show439"
					style="display: none;">
					<div class="pro_banner">
						<div class="swiper_box text_banner product_module">
							<div class="product-module-swiper">
								<div class="swiper-wrapper"></div>
							</div>
							<div class="swiper-prev"></div>
							<div class="swiper-next"></div>
						</div>
					</div>
				</div>
				<div class="hashtagDtlInfo4393927" id="H4393927_008" class="show439"
					style="display: none;">
					<div class="pro_banner">
						<div class="product_module coupon hashtagCupList4393927"></div>
					</div>
				</div>
				<div class="hashtagDtlInfo4393927" id="H4393927_009" class="show439"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4393927" id="H4393927_010" class="show439"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4393927" id="H4393927_011" class="show439"
					style="display: none;"></div>
			</div>
		</section>
		<section class="hashtag hStyleGroup">
			<div class="title">
				<h3>
					<a class="hash-link-desc type-accordion" title=""
						href="javascript:;" onclick="goSearhpageData('추운겨울따뜻하게');"
						target="_self"># 추운겨울따뜻하게</a>
				</h3>
				<img
					data-src="https://cdn.hddfs.com/files/dm/20221202/19aae18b_202212021043535050.jpg?RS=1080X160"
					src="https://cdn.hddfs.com/front/images/KO/common/noimg_transparent.png?RS=1080X160"
					alt="추운겨울따뜻하게" class="noImg lazy" /> <a href="javascript:"
					onclick="openTab('H442');" class="btn">OPEN</a>
			</div>
			<div class="tab-action">
				<ul class="tab_round">
					<li class="tab_item is_selected"><a href="#H4424032_001"
						onclick="changeHashtagTab('H4424032_001', '4424032')"> 상품</a></li>
					<li class="tab_item "><a href="#H4424032_002"
						onclick="changeHashtagTab('H4424032_002', '4424032')"> 브랜드</a></li>
				</ul>
				<div class="hashtagDtlInfo4424032" id="H4424032_001" class="show442">
					<div class="pro_banner hashtagGoosList4424032">
						<ul class="product_module">
							<li data-gooscd="56031680005701" data-minbuyqty="1"
								class="product_itme goosList 56031680005701"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=56031680005701&MG=KR_PC_Main_Hashtag442_Product_56031680005701">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/6031/20220128/6d501ced.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/6031/20220128/6d501ced.jpg?RS=172X172"
											alt="마망컵 보온병 505ML BEIGE"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('56031680005701', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('56031680005701', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">락앤락</p>
										<p class="tx_ex goosNm">마망컵 보온병 505ML BEIGE</p>
										<p class="price1" style="height: 19px;">
											<del>$20</del>
											<strong>30%</strong>
										</p>
										<p class="price2">
											<strong data-price="14.0">$14</strong> <span
												data-price="17784.0">17,784<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="56031680010901" data-minbuyqty="1"
								class="product_itme goosList 56031680010901"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=56031680010901&MG=KR_PC_Main_Hashtag442_Product_56031680010901">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/6031/20220127/9cdb6537.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/6031/20220127/9cdb6537.jpg?RS=172X172"
											alt="슬림 핏 원터치 텀블러400ML IVORY"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('56031680010901', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('56031680010901', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">락앤락</p>
										<p class="tx_ex goosNm">슬림 핏 원터치 텀블러400ML IVORY</p>
										<p class="price1" style="height: 19px;">
											<del>$17</del>
											<strong>30%</strong>
										</p>
										<p class="price2">
											<strong data-price="11.9">$11.9</strong> <span
												data-price="15116.0">15,116<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="56031680009201" data-minbuyqty="1"
								class="product_itme goosList 56031680009201"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=56031680009201&MG=KR_PC_Main_Hashtag442_Product_56031680009201">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/6031/20220204/93bc55fc.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/6031/20220204/93bc55fc.jpg?RS=172X172"
											alt="메트로 푸드자 300ML IVORY"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('56031680009201', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('56031680009201', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">락앤락</p>
										<p class="tx_ex goosNm">메트로 푸드자 300ML IVORY</p>
										<p class="price1" style="height: 19px;">
											<del>$33</del>
											<strong>30%</strong>
										</p>
										<p class="price2">
											<strong data-price="23.1">$23.1</strong> <span
												data-price="29343.0">29,343<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
							<li data-gooscd="56031680006601" data-minbuyqty="1"
								class="product_itme goosList 56031680006601"><a
								href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=56031680006601&MG=KR_PC_Main_Hashtag442_Product_56031680006601">
									<div class="img_w">
										<img
											data-src="https://cdn.hddfs.com/files/goos/6031/20220128/eecd425a.jpg?RS=172X172"
											src="https://cdn.hddfs.com/files/goos/6031/20220128/eecd425a.jpg?RS=172X172"
											alt="메트로 머그 475M WHITE"
											onerror="this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=172X172';"
											class="lazy">
										<div class="on_btn" style="z-index: 9999;">
											<div class="on_btn_group">
												<button class="btn_inner1" onclick="goLogin(event);">로그인</button>
											</div>
											<div class="on_btn_group">
												<button class="btn_inner1 bg_black cartBtn"
													onclick="goCart('56031680006601', '1', '', '', 'order','N',event);">장바구니</button>
												<button class="btn_inner1 bg_black buyBtn"
													onclick="goCart('56031680006601', '1', '', '', 'order','Y',event);">바로구매</button>
											</div>
										</div>
									</div>
									<div class="pro_i">
										<p class="ti_brand">락앤락</p>
										<p class="tx_ex goosNm">메트로 머그 475M WHITE</p>
										<p class="price1" style="height: 19px;">
											<del>$24</del>
											<strong>30%</strong>
										</p>
										<p class="price2">
											<strong data-price="16.8">$16.8</strong> <span
												data-price="21341.0">21,341<em>원</em></span>
										</p>
										<div class="por_icons">
											<span>세일</span>
										</div>
									</div>
							</a></li>
						</ul>
						<a href="javascript:"
							onclick="moreHashtagItems('Goos', '4424032', '442','001','');"
							class="more hashtagGoosMore4424032">더보기</a>
					</div>
				</div>
				<div class="hashtagDtlInfo4424032" id="H4424032_002" class="show442"
					style="display: none;">
					<div class="pro_banner">
						<div class="swiper_box module_circle product_module">
							<div class="product-module-swiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=603103&MG=KR_PC_Main_Hashtag442_Brand_603103">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/20220203/505e80ed_202202031439042450.jpg?RS=215X215"
												alt="락앤락"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/20220203/505e80ed_202202031439042450.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>락앤락</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=617701&MG=KR_PC_Main_Hashtag442_Brand_617701">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/617701_3.jpg?RS=215X215"
												alt="세컨스킨"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/617701_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>세컨스킨</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=638101&MG=KR_PC_Main_Hashtag442_Brand_638101">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/20220513/8c6ec4d2_202205131542590000.jpg?RS=215X215"
												alt="라코스테(의류)"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/20220513/8c6ec4d2_202205131542590000.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>라코스테(의류)</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=628801&MG=KR_PC_Main_Hashtag442_Brand_628801">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/628801_3.jpg?RS=215X215"
												alt="캉골(의류)"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/628801_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>캉골(의류)</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=048701&MG=KR_PC_Main_Hashtag442_Brand_048701">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/048701_3.jpg?RS=215X215"
												alt="딥티크"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/048701_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>딥티크</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=062201&MG=KR_PC_Main_Hashtag442_Brand_062201">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/062201_3.jpg?RS=215X215"
												alt="메종 마르지엘라"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/062201_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>메종 마르지엘라</em>
										</a>
									</div>
									<div class="swiper-slide product_itme">
										<a
											href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=025501&MG=KR_PC_Main_Hashtag442_Brand_025501">
											<span class="img"> <img
												data-srcset="https://cdn.hddfs.com/files/gd/bran/025501_3.jpg?RS=215X215"
												alt="조 말론 런던"
												src="https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=215X215"
												data-src="https://cdn.hddfs.com/files/gd/bran/025501_3.jpg?RS=215X215"
												class="swiper-lazy" />
										</span> <em>조 말론 런던</em>
										</a>
									</div>
								</div>
							</div>
							<div class="swiper-prev"></div>
							<div class="swiper-next"></div>
						</div>
					</div>
				</div>
				<div class="hashtagDtlInfo4424032" id="H4424032_003" class="show442"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4424032" id="H4424032_004" class="show442"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4424032" id="H4424032_005" class="show442"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4424032" id="H4424032_006" class="show442"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4424032" id="H4424032_007" class="show442"
					style="display: none;">
					<div class="pro_banner">
						<div class="swiper_box text_banner product_module">
							<div class="product-module-swiper">
								<div class="swiper-wrapper"></div>
							</div>
							<div class="swiper-prev"></div>
							<div class="swiper-next"></div>
						</div>
					</div>
				</div>
				<div class="hashtagDtlInfo4424032" id="H4424032_008" class="show442"
					style="display: none;">
					<div class="pro_banner">
						<div class="product_module coupon hashtagCupList4424032"></div>
					</div>
				</div>
				<div class="hashtagDtlInfo4424032" id="H4424032_009" class="show442"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4424032" id="H4424032_010" class="show442"
					style="display: none;"></div>
				<div class="hashtagDtlInfo4424032" id="H4424032_011" class="show442"
					style="display: none;"></div>
			</div>
		</section>
	</div>
	<div class="choiceHashtag">
		<section class="hashtag choiceGroup" id="choiceHashTag503"
			data-seq="503">
			<div class="title">
				<h3>
					<a class="hash-link-desc type-accordion" title=""
						href="https://www.hddfs.com/event/op/bnf/listBnf.do?evntId=0004013"
						target="_self"># 1월_혜택모음</a>
				</h3>
			</div>
			<div class="tab-action">
				<ul class="tab_round">
				</ul>
			</div>
		</section>
		<section class="hashtag choiceGroup" id="choiceHashTag504"
			data-seq="504">
			<div class="title">
				<h3>
					<a class="hash-link-desc type-accordion" title=""
						href="javascript:;" onclick="goSearhpageData('NEWYEAR');"
						target="_self"># NEWYEAR</a>
				</h3>
			</div>
			<div class="tab-action">
				<ul class="tab_round">
				</ul>
			</div>
		</section>
		<section class="hashtag choiceGroup" id="choiceHashTag494"
			data-seq="494">
			<div class="title">
				<h3>
					<a class="hash-link-desc type-accordion" title=""
						href="javascript:;" onclick="goSearhpageData('명절선물');"
						target="_self"># 명절선물</a>
				</h3>
			</div>
			<div class="tab-action">
				<ul class="tab_round">
				</ul>
			</div>
		</section>
		<section class="hashtag choiceGroup" id="choiceHashTag442"
			data-seq="442">
			<div class="title">
				<h3>
					<a class="hash-link-desc type-accordion" title=""
						href="javascript:;" onclick="goSearhpageData('추운겨울따뜻하게');"
						target="_self"># 추운겨울따뜻하게</a>
				</h3>
			</div>
			<div class="tab-action">
				<ul class="tab_round">
				</ul>
			</div>
		</section>
		<section class="hashtag choiceGroup" id="choiceHashTag441"
			data-seq="441">
			<div class="title">
				<h3>
					<a class="hash-link-desc type-accordion" title=""
						href="https://www.hddfs.com/shop/gd/dtl/goos.do?onlnGoosCd=10471820000501"
						target="_self"># 오쏘몰_이뮨_입고</a>
				</h3>
			</div>
			<div class="tab-action">
				<ul class="tab_round">
				</ul>
			</div>
		</section>
		<section class="hashtag choiceGroup" id="choiceHashTag473"
			data-seq="473">
			<div class="title">
				<h3>
					<a class="hash-link-desc type-accordion" title=""
						href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002793"
						target="_self"># 면역력_걱정끝</a>
				</h3>
			</div>
			<div class="tab-action">
				<ul class="tab_round">
				</ul>
			</div>
		</section>
	</div>
	<div class="noHashtagData"></div>
</article>


<div class="popevent_box">
	<div class="p_box">
		<div>
			<a href="javascript:"
				style="width: 640px; height: 640px; background: black;"
				class="p_item"> <video
					src="https://cdn.hddfs.com/files/dm/20221207/1855745e_202212071124101230.mp4"
					preload="none" class="video-js vjs-big-play-centered"
					style="width: 640px; height: 640px;"
					poster="https://cdn.hddfs.com/files/dm/20221207/f9115b5d_202212070853151630.jpg"
					controls muted></video>
			</a> <a
				href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=638101"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p>LACOSTE</p>
					<p>22FW SEASON OFF</p>
					<span>UP TO 30%</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221227/e69558a9_202212271538597920.jpg?RS=750X1110"
				alt="C_라코스테"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a
				href="https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=651201"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p></p>
					<p></p>
					<span></span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221227/0026763a_202212271648452120.jpg?RS=750X1110"
				alt="C_코닥레트로"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a href="https://www.hddfs.com/event/op/bnf/listBnf.do"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p>현백면</p>
					<p>1월의 혜택모음</p>
					<span>이달의 혜택 바로 확인하세요!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20230106/7d2b7d18_202301061601486240.jpg?RS=750X1110"
				alt="마_[판촉] 1월 혜택모음"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003925"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p>L&#039;oreal x 현대백화점면세점</p>
					<p>추가 적립금 혜택</p>
					<span></span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221218/81d8143d_202212180852297500.gif?RS=750X1110"
				alt="C_[수입1] 로레알 통합"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a
				href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002766"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p></p>
					<p></p>
					<span></span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221020/b8cf5975_202210201734049540.gif?RS=750X1110"
				alt="C_화장품 기획전"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0004018"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p>설맞이</p>
					<p>100%당첨 혜택</p>
					<span>H.Point, 커피쿠폰, 플러스적립금, 랜덤 1종 받아가세요!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20230109/e8f1f714_202301091020172110.jpg?RS=750X1110"
				alt="마_[판촉] 설맞이 랜덤당첨"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0004017"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p>스페셜 혜택</p>
					<p>데일리 플러스적립금</p>
					<span>플러스적립금 추가로 받아가세요 ~! </span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20230105/228eaa3c_202301050845233190.jpg?RS=750X1110"
				alt="마_[판촉]스페셜 적립금"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003945"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p>하나카드로 결제시</p>
					<p>최대 10% 청구할인!</p>
					<span>최대 20만원 혜택 받으세요!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221229/192cb9a5_202212291558112560.jpg?RS=750X1110"
				alt="마_[결제] 1월 하나카드 청구할인"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0004014"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p>H.Point + H.Point Pay</p>
					<p>2023년 신년 혜택</p>
					<span>최대 39만원 제휴적립금 + 8% 포인트 증정!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20230103/4c277bf8_202301031415076900.jpg?RS=750X1110"
				alt="마_[제휴] H.Point&Pay 신년혜택"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a
				href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002749"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p></p>
					<p></p>
					<span></span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221018/a0240ba8_202210181114099570.gif?RS=750X1110"
				alt="C_니트"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003893"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p>Warm Wishes</p>
					<p>플러스적립금 혜택!</p>
					<span>데일리 이벤트플러스적립금 </span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221125/e28c1960_202211251544441870.jpg?RS=750X1110"
				alt="마_[판촉] 11~2월 전관행사"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a
				href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002784"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p></p>
					<p></p>
					<span></span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221202/38db396d_202212021447382580.gif?RS=750X1110"
				alt="C_국산CP 퍼스널컬러 메이크업 기획전"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003959"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p>출석체크하고</p>
					<p>적립금+경품혜택 받자!</p>
					<span>최대 2만원, H.Point, 커피쿠폰 추첨 증정!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221227/c6b95125_202212271808470350.jpg?RS=750X1110"
				alt="마_[판촉] 1월 출석체크"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a
				href="https://www.hddfs.com/event/op/evnt/evntDetail.do?evntId=0003951"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p>PAYCO로 결제하고</p>
					<p>2% 추가 포인트 받자!</p>
					<span>생애 첫 혜택 4,000P + 2% 적립 혜택 받으세요!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20221229/e794e25e_202212291544000740.jpg?RS=750X1110"
				alt="마_[결제] 23년 페이코 2% 포인트적립"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a> <a
				href="https://www.hddfs.com/event/op/spex/dtlSpex.do?spexId=0002713"
				style="width: 640px; height: 640px;" class="p_item" target="_self">
				<div class="text">
					<p>구매 사은 행사</p>
					<p>TOUS</p>
					<span>구매하면 에코백, 브러쉬 세트 증정까지!</span>
				</div> <img
				src="https://cdn.hddfs.com/files/dm/20220818/4951ae9b_202208181321570770.jpg?RS=750X1110"
				alt="TOUS 구매사은 행사"
				onerror="this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=750X1110';" />
			</a>
		</div>
		<p class="popevent_close">닫기</p>
	</div>
	<div class="ui-widget-overlay ui-front"></div>
</div>
</main>
<script type="text/javascript">
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
</script>