<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="hasRole('ROLE_MEMBER')">
	<sec:authentication property="principal.username" var="mid" />
</sec:authorize>
<!DOCTYPE html>
<html lang="ko">

<head>
<title>현대백화점인터넷면세점</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">
<meta name="title" content="현대백화점인터넷면세점">
<meta name="description"
	content="해외명품/화장품/시계/가방, 적립금/할인/쿠폰 등 다양한 혜택, 공동구매/가상착장(AR)서비스 제공">
<meta name="metaKeywords"
	content="현대면세점, 현대백화점인터넷면세점, 현대인터넷면세점, 현대백화점면세점, 현대면세, 인터넷현대면세점, 현대온라인면세점, 현대백화점온라인면세점, 현대백화점DUTYFREE,현대무역센터면세점, 현대무역센터점, 현대동대문면세점, 현대동대문점, 현대인천공항면세점, 현대인천공항점, 면세쇼핑몰, 인터넷면세점, 온라인면세점, 인천공항면세점, 인천공항면세, 공항면세, 공항면세점, 공항쇼핑, dutyfree, 면세할인, 면세점할인, 면세가격, 면세점할인방법, 면세추천, 면세선물, 면세점선물, 면세점선물추천, 현대면세점인도장, 면세점인도장, 면세점상품수령, 쇼핑, 쇼핑몰, 명품쇼핑, 해외여행, 인천공항, 출장, 출국, 신혼여행, 허니문, 여행선물, 선물인터넷면세점주문, 인터넷면세점주문가능시간, 출국3시간전, 출국전쇼핑, 출국전인터넷쇼핑, 쿠폰, 할인쿠폰, 면세쿠폰, 면세점쿠폰, 현대면세점쿠폰, 적립금, 면세점적립금, 면세적립금, 현대면세점적립금,화장품, 향수, 가방, 명품, 해외명품, 브랜드, 면세점주류, 면세점담배, 면세점홍삼, 면세점화장품, 면세점향수, 면세점명품, 면세점시계, 면세점가방, 명품가방, 면세점정품">
<meta property="og:title" content="현대백화점인터넷면세점">
<meta property="og:description"
	content="해외명품/화장품/시계/가방, 적립금/할인/쿠폰 등 다양한 혜택, 공동구매/가상착장(AR)서비스 제공">
<meta property="og:image"
	content="https://cdn.hddfs.com/front/images/KO/common/hddfs_og.png">
<meta property="groobee:member_id" content="">
<meta property="groobee:member_grade" content="">
<meta property="groobee:member_gender" content="">
<meta property="groobee:member_type" content="001">
<!-- <meta property="groobee:member_age" content=" ">  -->

<script
	src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/lottie.min.js?ver=18"></script>
<script
	src="https://cdn.hddfs.com/front/js/KO/swiper-bundle.min.js?ver=18"></script>
<script
	src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
<script
	src="https://cdn.hddfs.com/front/js/KO/jquery.lazyloadxt.min.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/main.ui.js?ver=18"></script>
<script src="https://cdn.hddfs.com/front/js/KO/ga4Common.js?ver=18"></script>
<link rel="shortcut icon"
	href="https://cdn.hddfs.com/front/images/KO/common/favicon_H.ico">
<link rel="stylesheet"
	href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
<link rel="stylesheet"
	href="https://cdn.hddfs.com/front/css/KO/swiper-bundle.min.css?ver=18">
<link rel="stylesheet"
	href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
<link rel="stylesheet"
	href="https://cdn.hddfs.com/front/css/KO/layout.css?ver=18">
<link rel="stylesheet"
	href="https://cdn.hddfs.com/front/css/KO/main.css?ver=18">
<link rel="stylesheet"
	href="https://cdn.hddfs.com/front/css/KO/member.css?ver=18">
<script language="javascript">
        // 현재 요청경로
        var ctx_curr = "//www.hddfs.com/shop";
        var ctx_shop = "https://www.hddfs.com/shop";
        var isLogin = false;
        var SERVER_IMAGE = "https://cdn.hddfs.com/front";
        var SERVER_IMAGE_MNG = "https://cdn.hddfs.com/files/";
        var SERVER_SCRIPT_JSON = "https://cdn.hddfs.com/files";
        var USER_AUTO_LOGOUT_TIME = 1800;
        var gUmbMbshUrl = "https://www.h-point.co.kr"; // 통합멤버쉽 주소
    </script>

<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/crew/crew.source.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/crew/form/form.source.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/crew/sns.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/jquery.cookie.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/common.js?ver=18"></script>

<!-- S: 다이퀘스트 스크립트 추가 -->
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/diquest/dqAutoCompleteCommon.js?ver=18">
    </script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/diquest/dqHeader.js?ver=18"></script>
<!-- E: 다이퀘스트 스크립트 추가 -->

<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/cloud-zoom.1.0.2.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/SsoAjax.js?ver=18"></script>
<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/SsoHttpRequest.js?ver=18"></script>

<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/makePCookie.js?ver=18"></script>


<script type="text/javascript"
	src="https://cdn.hddfs.com/front/js/KO/crew/hash.js?ver=18"></script>
<script>
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(document.referrer);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        var Naver_Previous_Query = getParameterByName('oquery');
    </script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-121444436-1"></script>
<script>
        window.dataLayer = window.dataLayer || [];


        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());
        gtag('set', {
            'dimension1': Naver_Previous_Query
        });
        gtag('config', 'UA-121444436-1', {
            'send_page_view': false
        });

        var gaMbshNo = "";
        var gaCustNo = "";

        if (isLogin) {
            if (gaCustNo == "") {
                dataLayer.push({
                    'dimension3': gaMbshNo
                });
            } else {
                dataLayer.push({
                    'dimension3': gaMbshNo,
                    'dimension4': gaCustNo
                });
            }
        }
    </script>

<!-- Google Tag Manager -->
<script async
	src="https://www.googletagmanager.com/gtm.js?id=GTM-56VKRZT"></script>
<script>
        window.dataLayer = window.dataLayer || [];

        var pageviewObj = new Object();
        var gaSiteNtnlCd = "KR"; // KR, CN, EN
        var gaSiteChlCd = "PC"; // PC, MO, AP

        pageviewObj.ep_visit_channelOption = gaSiteChlCd; // PC, MO, AP
        pageviewObj.ep_visit_siteOption = gaSiteNtnlCd; // KR, CN, EN

        dataLayer.push(pageviewObj);

        var gaStr = window.location.pathname;
        var gaPathName = gaStr.split('/');
        if (gaPathName[3] != "main.do") {
            (function (w, d, s, l, i) {
                w[l] = w[l] || [];
                w[l].push({
                    'gtm.start': new Date().getTime(),
                    event: 'gtm.js'
                });
                var f = d.getElementsByTagName(s)[0],
                    j = d.createElement(s),
                    dl = l != 'dataLayer' ? '&l=' + l : '';
                j.async = true;
                j.src =
                    'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
                f.parentNode.insertBefore(j, f);
            })(window, document, 'script', 'dataLayer', 'GTM-56VKRZT');
        }
    </script>
<!-- End Google Tag Manager -->

<!-- beusable Tracking Code -->
<script type="text/javascript">
        (function (w, d, a) {
            w.__beusablerumclient__ = {
                load: function (src) {
                    var b = d.createElement("script");
                    b.src = src;
                    b.async = true;
                    b.type = "text/javascript";
                    d.getElementsByTagName("head")[0].appendChild(b);
                }
            };
            w.__beusablerumclient__.load(a + "?url=" + encodeURIComponent(d.URL));
        })(window, document, "//rum.beusable.net/load/b220906e090106u517");
    </script>
<!-- End beusable Tracking Code -->

<!-- 네이버 연관채널 추가 2020.07.30 -->
<script type="application/ld+json">
        {
            "@context": "http://schema.org",
            "@type": "Person",
            "name": "현대백화점면세점",
            "url": "https://www.hddfs.com",
            "sameAs": [
                "https://www.facebook.com/HDDFS.official",
                "https://www.instagram.com/hddfs.official",
                "https://www.youtube.com/c/hddfs",
                "https://apps.apple.com/kr/app/id1436812610",
                "https://play.google.com/store/apps/details?id=com.ehyundai.HyunDaiDutyFreeShop"
            ]
        }
    </script>

<!-- S: 2022-10-19 그루비 스크립트 추가 -->
<script type="text/javascript">
        (function (a, i, u, e, o) {
            a[u] = a[u] || function () {
                (a[u].q = a[u].q || []).push(arguments)
            };
        })(window, document, "groobee");
        groobee("serviceKey", "5b7f34a1c92b489d8d7fe12d39f82e4b");
        groobee("siteType", "custom");
    </script>
<script charset="utf-8"
	src="//static.groobee.io/dist/g2/groobee.init.min.js"></script>
<!-- E: 2022-10-19 그루비 스크립트 추가 -->

<script>
        //통합멤버쉽 가입팝업
        function fnUmbJoinPop(joinType, ptnrChlCd, ptcoAlliPaonInf2) {
            var $form = $('<form></form>');
            $form.attr('action', gUmbMbshUrl + '/cu/member/start.nhd');
            $form.attr('method', 'post');
            $form.attr('target', 'umbJoinPop');
            $form.append('<input type="hidden" value="02" name="prtnrReqGb">');
            $form.append('<input type="hidden" value="D030" name="prtnrId">');
            $form.append('<input type="hidden" value="1201" name="chnnlId">');
            $form.append('<input type="hidden" value="PC" name="ptcoReqnMdaInf">');
            $form.append('<input type="hidden" value="' + joinType + '" name="ptcoReqnOnoflnGb">');
            $form.append('<input type="hidden" value="' + ptnrChlCd + '" name="ptcoAlliPaonInf1">');
            $form.append('<input type="hidden" value="' + ptcoAlliPaonInf2 + '" name="ptcoAlliPaonInf2">');
            $form.appendTo('body');

            popOpen('', 'umbJoinPop', 600, 800);
            $form.submit();
        }


        $(document).ready(function (evt) {

            // 회원 자동 로그아웃 타이머 구동(30분)
            if (isLogin) {
                setTimeout(logoutAuto, USER_AUTO_LOGOUT_TIME * 1000);
            }

            // 숫자입력만 허용
            $(".onlynum").keyup(onlynum);

            //HDDFS 리뉴얼 프로젝트 [ 김인호 - 2021.05.27 ] 숫자입력만 허용 
            $("input[type='number']").keyup(onlynum2);

            // lazy 적용
            if (typeof ($.fn.lazyload) == "function") {
                //$("img.lazy").trigger("appear");
                $("img.lazy").lazyload({
                    effect: "fadeIn",
                    threshold: 200,
                    placeholder: SERVER_IMAGE + '/images/KO/common/loading.gif'
                });
                $("img.lazy").removeClass("lazy");
            }


            //$.ajax 공통 설정
            $.ajaxSetup({
                complete: function (jqXHR, textStatus) {
                    if (typeof ($.fn.lazyload) == "function") {
                        $("img.lazy").lazyload({
                            effect: "fadeIn",
                            threshold: 200,
                            placeholder: SERVER_IMAGE + '/images/KO/common/loading.gif'
                        });
                        $("img.lazy").removeClass("lazy");
                    }
                }
            });
        });
    </script>

<!-- S: 2022-05-25 이지웰 메인팝업 추가 -->
<style>
.main_popup2 {
	display: none
}

.main_popup2:after {
	display: none !important;
}

.main_popup2 .pop_img {
	height: 368px;
	overflow: hidden;
}

.main_popup2 .pop_img, .main_popup2 .close_section2 {
	position: relative;
	z-index: 1;
}

.close_section2 {
	padding: 16px 20px 14px
}

.close_section2::after {
	display: block;
	content: '';
	clear: both
}

.today_close2 {
	display: block;
	float: left;
	font-size: 14px;
	color: #5c6677;
	line-height: 20px;
	position: relative
}

.today_close2.chk input[type='checkbox'] {
	display: none;
}

.today_close2.chk input[type='checkbox']+label {
	padding-left: 0;
}

.today_close2.chk input[type='checkbox']+label:before {
	display: none;
}

.popup_close2 {
	display: block;
	cursor: pointer;
	float: right;
	font-size: 14px;
	color: #1b1e23;
	line-height: 20px;
	font-weight: 600
}

.ui-dialog.ui-widget.ui-widget-content.main_popup2_layer {
	position: fixed !important;
	background: #fff;
	border-radius: 20px
}

.ui-dialog.main_popup2_layer .ui-dialog-titlebar {
	display: none
}

.main_popup2_layer {
	width: 560px !important;
	height: 422px !important;
	background-color: #fff;
	position: absolute !important;
	top: 50% !important;
	left: 50% !important;
	transform: translate(-50%, -50%) !important;
}
</style>

<div class="main_popup2">
	<div class="pop_img">
		<a href="javascript:void(0);" onclick="login('')"> <img
			src="https://cdn.hddfs.com/files/editor/20220504/6b3d071d_202205041549127060.jpg"
			alt="로그인 한번으로 즐기는 간편한 면세쇼핑">
		</a>
	</div>
	<div class="close_section2">
		<span class="today_close2 chk"> <input type="checkbox"
			id="today_close2"> <label for="today_close2">오늘하루보지
				않기</label>
		</span> <span class="popup_close2">닫기</span>
	</div>
</div>
<script>
        // main_popup2
        $(function () {
            $(".main_popup2").dialog({
                dialogClass: "main_popup2_layer",
                width: 560,
                autoOpen: false
            });

            $(".popup_close2").click(function () {
                $(".main_popup2").dialog("close");
            });

            $("#today_close2").click(function () {
                // 쿠키 저장
                var date = new Date();
                date.setTime(date.getTime() + (1000 * 60 * 60 * 24));
                date.setHours(0);
                date.setMinutes(0);
                date.setSeconds(0);
                $.cookie("closePopEz", "Y", {
                    expires: date,
                    path: "/"
                });
                $(".main_popup2").dialog("close");
            });

            // 이지웰 로그인 팝업
            if (!isLogin && getCookie("closePopEz") != "Y" && getCookie("PTNR_CHL_GBN_KEY") == "00009902" &&
                getCookie("EZWEL_USER_KEY_SESSION") != null && location.href.indexOf(
                    "membershipSleepRelease") == -1) {
                if (location.href.indexOf("main") == -1) { // 메인이 아닐때 팝업 뜸
                    $(".main_popup2").css("display", "block");
                    $(".main_popup2").dialog("open");
                } else if (location.href.indexOf("main") != -1 && sessionStorage.getItem("selMainSwiperPos") !=
                    0) { //메인인 경우 인트로 아닐때 팝업뜸
                    $(".main_popup2").css("display", "block");
                    $(".main_popup2").dialog("open");
                }
            }

            $(".intro_box").scroll(function () {
                if (!isLogin && getCookie("closePopEz") != "Y" && getCookie("PTNR_CHL_GBN_KEY") ==
                    "00009902" &&
                    getCookie("EZWEL_USER_KEY_SESSION") != null && location.href.indexOf(
                        "membershipSleepRelease") == -1 &&
                    sessionStorage.getItem("selMainSwiperPos") != 0) {
                    $(".main_popup2").css("display", "block");
                    $(".main_popup2").dialog("open");
                }
            });
        });
    </script>
<!-- E: 2022-05-25 이지웰메인팝업 추가 -->
<script type="text/javascript">
        $(document).ready(function () {
            gfnSsoReqHttp(fnSsoAuthCallback); // SSO 인증처리
        });

        function fnSsoAuthCallback(data) {
            // 자동로그인
            if (data.succYn == 'Y' && !isLogin && $.cookie("ssoLogin") != "Y") {
                $.cookie("ssoLogin", "Y"); // 1번만 실행

                $('#umbMbshNo', '#frmIntgLgin').val(data.mcustNo);

                var vData = $('#frmIntgLgin').serialize();
                vData += '&autoLoginYn=Y';

                fnLogin('INTG', vData);
            }
        }
    </script>
</head>

<body>
	<!-- <form id="frmIntgLgin" name="frmIntgLgin" method="post" action="">
        <input type="hidden" name="aucaType" value="INTG" /> <input type="hidden" name="authType" value="INTG" /> <input
            type="hidden" id="umbMbshNo" name="umbMbshNo" value="" />
    </form> -->
	<script type="text/javascript">
        //해시태그 검색 결과 landing
        function goSearhpageData(hashtag) {
            location.href = "https://www.hddfs.com/shop/sr/hashSearchResult.do?searchTerm=" +
                hashtag + "&searchType=hash";
        }

        // HDDFS 리뉴얼 프로젝트 [고영주] - 트래킹코드
        $(function () {
            // 검색인트로 > Home	
            $("#s_gohome").click(function () {
                wiseLogAggr("KR_PC_Intro_SearchIntro_Home");
            });

            // 검색인트로 > 검색버튼
            $("#srchBtn").click(function () {
                wiseLogAggr("KR_PC_Intro_SearchIntro_SearchIcon");
            });

            // 해시태그인트로 > Home	
            $("#h_gohome").click(function () {
                wiseLogAggr("KR_PC_Intro_HashtagIntro_Home");
            });

            // 해시태그인트로 > 해시태그(체크박스)
            $("input[name=chkHashtag]").on("click", function () {
                var wiseSeq = $(this).attr("data-seq");
                wiseLogAggr("KR_PC_Intro_HashtagIntro_Hashtag_" + wiseSeq);
            });

            // 해시태그인트로 > 현대스타일 버튼
            $(".hStyleBtn").click(function () {
                wiseLogAggr("KR_PC_Intro_HashtagIntro_Hyundai");
            });

            // 해시태그인트로 > 선택한 #해시태그 버튼
            $(".choiceBtn").click(function () {
                wiseLogAggr("KR_PC_Intro_HashtagIntro_SelectTag");
            });
        });
    </script>

	<div id="wrap">
		<meta name="google-site-verification"
			content="rYjJmYP3q9lxBYCTSa_Tg3h1N9l3yZjJGp0AFaKCZlM" />
		<!-- Google Tag Manager (noscript) -->
		<noscript>
			<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-56VKRZT"
				height="0" width="0" style="display: none; visibility: hidden"></iframe>
		</noscript>
		<!-- End Google Tag Manager (noscript) -->

		<script type="text/javascript">
            $(document)
                .ready(
                    function () {
                        var currency = getCookie("currencyType");
                        /*$(".currencyType").html(currency);*/
                        $(".currency").addClass(currency.toLowerCase());
                        $(".currencyType").addClass(
                            currency.toLowerCase());
                        $(".currencyInfo > li").removeClass(
                            "is_selected");

                        //loadGnbDispCtgJsonp(); //카테고리 JSON Data
                        //오늘의 환율 조회
                        $
                            .ajax({
                                async: true,
                                url: "//www.hddfs.com/shop/cm/comm/lnbTodayExchr.json",
                                dataType: "json",
                                type: "POST",
                                success: function (data,
                                    textStatus, jqXHR) {
                                    if (!crew.ajaxValidate(data)) {
                                        return;
                                    }
                                    var result = data.result;
                                    $(".exchageRateTxt").html(
                                        "$1 = " + result.krw +
                                        " 원</em>");
                                    /* 
                                    if(getCookie("currencyNtnlCd") =="KR"){
                                    	$(".exchageRateTxt").html("$1 = "+result.krw+" 원</em>");
                                    }else if(getCookie("currencyNtnlCd") =="CN"){
                                    	$(".exchageRateTxt").html("$1 = "+result.cny.toFixed(2)+" 元</em>");
                                    }
                                     */
                                },
                                error: function (jqXHR, textStatus,
                                    errorThrown) {
                                    //console.log(jqXHR.status);
                                }
                            });

                        $
                            .ajax({
                                async: true,
                                url: "//www.hddfs.com/shop/dm/mainLogo.json",
                                dataType: "json",
                                type: "POST",
                                success: function (data,
                                    textStatus, jqXHR) {
                                    if (!crew.ajaxValidate(data)) {
                                        return;
                                    }

                                    $("#mainLogo")
                                        .attr(
                                            "src",
                                            "https://cdn.hddfs.com/files/" +
                                            data.mainLogo.dispEttList[0].dispEttDtlInfo.imgUrl); //+"?RS=192X40"
                                },
                                error: function (jqXHR, textStatus,
                                    errorThrown) {
                                    //console.log(jqXHR.status);
                                }
                            });

                    });

            //통화(화폐) 저장 
            function chgCurrencyInfo(type) {
                //상품상세에서만 통화 변경 가능
                if (document.URL.indexOf('/gd/dtl/goos.do') > -1) {
                    setCookie("currencyType", type);
                } else {
                    setCookie("currencyType", type, 1); // 통화 정보 설정 쿠키(1일)
                    setCookie("currencyNtnlCd", type.substring(0, 2), 1); // 통화 국적
                    alert("상품상세 화면에서만 통화변경을 확인하실 수 있습니다.");
                }
                window.location.reload();
            }

            $(window).load(function () {
                fnLnbCountInfo();
                orderStatusInfo();

            });

            function fnLnbCountInfo() {
                $.ajax({
                    async: true,
                    url: "//www.hddfs.com/shop/cm/comm/lnbInfo.json",
                    dataType: "json",
                    type: "POST",
                    success: function (data, textStatus, jqXHR) {
                        //if(!crew.ajaxValidate(data)){ return; }

                        var result = data.cartCnt;
                        if (result >= 99) {
                            result = "99+";
                        }

                        if (data.cartCnt > 0) {
                            $("#rwingCartCnt").html(result);
                            $("#rwingCartCnt").show();
                        } else {
                            $("#rwingCartCnt").html("0"); //전체삭제시 장바구니 카운트가 초기화 되지 않아 장바구니 추가시 기존카운트에 추가됨.
                            $("#rwingCartCnt").hide();
                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //console.log(jqXHR.status);
                    }
                });
            }

            function orderStatusInfo() {
                if (isLogin) {
                    $
                        .ajax({
                            async: true,
                            url: "//www.hddfs.com/shop/cm/comm/orderStatusInfo.json",
                            dataType: "json",
                            type: "POST",
                            success: function (data, textStatus, jqXHR) {
                                if (!crew.ajaxValidate(data)) {
                                    return;
                                }

                                var result020 = typeof (data.orderStatInfo['020']) == "undefined" ? 0 :
                                    Number(data.orderStatInfo['020']); //주문완료
                                var result030 = typeof (data.orderStatInfo['030']) == "undefined" ? 0 :
                                    Number(data.orderStatInfo['030']); //상품준비중
                                var result040 = typeof (data.orderStatInfo['040']) == "undefined" ? 0 :
                                    Number(data.orderStatInfo['040']); //상품이동중
                                var result050 = typeof (data.orderStatInfo['050']) == "undefined" ? 0 :
                                    Number(data.orderStatInfo['050']); //인도대기

                                var result = result020 + result030 +
                                    result040 + result050;

                                if (result >= 99) {
                                    result = "99+";
                                }
                                $(".orderStatusTxt").html(
                                    result == null ? 0 : result);

                                //관심 브랜드 처리
                                var interestList = data.interestBranList;
                                var interestListLength = $(".interestBranList > li").length;
                                if (interestList.length +
                                    interestListLength > 20) {
                                    for (var i = 0; i < (interestList.length +
                                            interestListLength - 20); i++) {
                                        $(".interestBranList > li:last")
                                            .remove();
                                    }
                                }

                                var html = "";
                                for (var i = 0; i < interestList.length; i++) {
                                    var onlnBranCd = interestList[i].onlnBranCd;
                                    if ($(".interest" + onlnBranCd).length < 1) {
                                        html += "<li class=\"interest" + onlnBranCd + "\">";
                                        html +=
                                            "<a rel=\"nosublink\" href=\"https://www.hddfs.com/shop/dm/bran/brand.do?onlnBranCd=" +
                                            onlnBranCd + "\">";
                                        html += "<p>" +
                                            interestList[i].branNm +
                                            "</p>";
                                        html += "<img src=\"https://cdn.hddfs.com/files/" +
                                            interestList[i].branReprImgUrl +
                                            "?RS=200x200\" alt=\"\" onerror=\"this.onerror=null; this.src='https://cdn.hddfs.com/front/images/KO/common/noimg.png?RS=200x200';\">";
                                        html += "</a>";
                                        html += "</li>";
                                    }
                                }
                                $(".interestBranList").prepend(html);

                                if ($(".interestBranList > li").length < 1) {
                                    $(".interestBranList").parent()
                                        .remove();
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(jqXHR.status);
                            }
                        });
                } else {
                    if ($(".interestBranList > li").length < 1) {
                        $(".interestBranList").parent().remove();
                    }
                }
                if ($(".luxuryAreaList > li").length < 1) { //럭셔리 없는 경우 항목삭제
                    $(".luxuryAreaList").parent().remove();
                }
            }

            $(function () {
                $(".btn_gnb").on("click", function () {
                    $("#gnb > ul > li").removeClass("open").css("display", "");
                    $("#gnb > ul > li > ul").css("display", "none");
                    $(".serviceMenu").parent().removeClass("open");
                    $(".serviceMenu").parent().addClass("open");
                    $(".serviceMenu").css("display", "block");

                    //카테고리 JSONP load
                    if ($(".serviceCtgList > li").length < 1) {
                        loadCtgList();
                    }
                });
            });

            function goMainPage() {
                sessionStorage.setItem("selMainSwiperPos", 1);
                location.href = "https://www.hddfs.com/shop/dm/main.do";
            }

            // HDDFS 리뉴얼 프로젝트 [고영주] - 트래킹코드
            $(function () {
                // 햄버거 
                if ("Y" == "Y") {
                    // 햄버거
                    $(".btn_gnb").click(function () {
                        wiseLogAggr("KR_PC_GNB_Hamburger");
                    });
                    // 검색버튼 
                    $(".btn_search").click(function () {
                        wiseLogAggr("KR_PC_GNB_SearchIcon");
                    });
                    // 로그인
                    $("#loginBtn").click(function () {
                        wiseLogAggr("KR_PC_GNB_Login");
                    });
                    // 언어변경
                    $("#ko_btn").click(function () {
                        wiseLogAggr("KR_PC_GNB_Language");
                    });
                    // 통화변경currencyInfo
                    $(".currencyInfo>.ko").click(function () {
                        wiseLogAggr("KR_PC_GNB_Change_Currency");
                    });
                    $(".currencyInfo>.cn").click(function () {
                        wiseLogAggr("KR_PC_GNB_Change_Currency");
                    });
                }
            });
        </script>






		<!-- main head-->


		<header id="header">

			<!-- 시큐리티 csrf-->
			<script>
	 		const csrfHeaderName = "${_csrf.headerName}";
	 		const csrfTokenValue = "${_csrf.token}";
			</script>
			<section class="box">
				<a href="javascript:" class="btn_gnb">Navigation Drawer</a>
				<!-- <h1 onclick="goMainPage();" style="cursor: pointer;">HYUNDAI DEPARTMENT SHOP - DUTY FREE</h1> -->
				<!-- <h1 onclick="goMainPage();" style="cursor: pointer;"> -->
				<h1 style="cursor: pointer;">
					<!-- 김가희 수정 - 메인로고 클릭시 홈으로 이동 -->
					<img id="mainLogo"
						src="https://cdn.hddfs.com/front/images/KO/common/logo.png?RS=192X40"
						alt="HYUNDAI DEPARTMENT SHOP - DUTY FREE"
						onclick="location.href='/'">
				</h1>
				<!--<form name="searchHeader" id="searchHeader" method="get" onsubmit="return false;">
                    -->
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
						<button class="btn_search" onclick="searchHeaderAction2();">검색</button>
					</fieldset>
				</form>
				<!-- <fieldset class="searchfield">
                        <legend>통합검색</legend>
                        <div class="select_search">
                            <button class="tag_search" id="hashSrchCond">해시태그검색</button>
                            <button class="text_search" id="basicSrchCond">일반검색</button>
                            <div class="tooltip">해시태그로 검색하세요 :)</div>
                            일반단어로 검색하세요 :)
                        </div>

                        <div class="mainsearchinput">
                            <input type="search" class="text_search" name="searchTerm" id="basicSearchTerm" maxlength=""
                                value="" placeholder="검색어를 입력해주세요"
                                onkeypress="javascript:if(event.keyCode == 13) { searchHeaderAction();}"
                                onmousedown="dq_setTextbox('1',event);" onfocusin="srchLayer();"
                                onkeydown="dq_setTextbox('1',event);" autocomplete="off" /> <input type="search"
                                class="tag_search" name="searchTerm" id="hashSearchTerm" maxlength="" value=""
                                placeholder="해시태그를 입력해주세요"
                                onkeypress="javascript:if(event.keyCode == 13) { searchHeaderAction();}"
                                onmousedown="dq_setTextbox('1',event);" onfocusin="srchLayer();"
                                onkeydown="dq_setTextbox('1',event);" autocomplete="off" /> <input type="hidden"
                                id="movUrl" name="movUrl" value="" /> <input type="hidden" id="rcntOffYn"
                                name="rcntOffYn" value="" />
                            최근검색어 저장 사용 유무
                            <input type="hidden" id="rcntWrdYn" name="rcntWrdYn" value="" />
                            최근검색어 존재 유무 여부
                            <input type="hidden" id="autoOffYn" name="autoOffYn" value="" />
                            자동완성 사용 여부
                            <input type="hidden" id="searchType" name="searchType" value="" />
                            검색 타입 구분
                            <input type="hidden" id="searchOrder" name="order" value="" />
                            정렬 구분
                        </div>
                        <button class="btn_search" onclick="searchHeaderAction();">검색</button>
                    </fieldset> -->
				</form>
				<!-- 검색 레이어 영역 START -->
				<div class="advanced_search">
					
					<div class="tab-action theme_search" id="allSearchArea">
						<ul class="tab_textmedium" id="searchTabBox" style="display: none">
							<li id="rcntTab"><a href="#advanced_search_01">최근 ·
									인기검색어</a></li>
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
					<div class="search_autocomplete" id="autoList"
						style="display: none;">
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
                    $(function () {

                        // 검색결과에 따라 검색창 변환
                        changeSearchArea();

                        if ($("#autoOffYn").val() == "" ||
                            $("#autoOffYn").val() == null) {
                            $("#autoOffYn").val('Y');
                        }

                        // 일반 검색창에 # 입력시 해시태그 검색창 전환
                        $("#basicSearchTerm").on('keyup', function () {
                            if ($("#basicSearchTerm").val() === "#") {
                                $(".select_search #hashSrchCond").trigger('click');
                                //changeSearchTextBox();
                                //console.log("dq_autoSearchType : " + dq_autoSearchType);
                                $("#hashSearchTerm").focus();
                            }
                        });

                        // 검색 조건 클릭시 자동완성 타입 변경
                        $(".select_search button").on('click', function () {
                            changeSearchTextBox();
                        });

                        // 검색창 클릭시 검색 레이어 호출
                        $("#basicSearchTerm, #hashSearchTerm").on(
                            'click',
                            function () {
                                if (($("#brandKrList > li").length < 1) ||
                                    ($("#brandEnList > li").length < 1)) {
                                    loadBranIcKrList();
                                }
                                if ($("#brandTab").attr('tabindex') == '0') {
                                    wiseLogAggr("KR_PC_Common_BrandSearch");
                                } else {
                                    wiseLogAggr("KR_PC_Common_SearchKeyword");
                                }
                                srchLayer();
                            });

                        $("#default_category_tab > a").click(function () {
                            //카테고리 로드
                            loadCtgList();
                        });

                        $("#brandTab").on('click', function () {
                            wiseLogAggr("KR_PC_Common_BrandSearch");
                            $(".tab_round #default_brand_tab a").trigger('click');
                        });

                        $("#rcntTab").on('click', function () {
                            wiseLogAggr("KR_PC_Common_SearchKeyword");
                        });

                        $("#default_brand_tab a").on('click', function () {
                            wiseLogAggr("KR_PC_Common_BrandSearch_Brand");
                        });

                        $("#default_category_tab a").on('click', function () {
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
                                "#brand_sortbtn_" + type +
                                " > div > ul > li > .branTabResult")
                            .removeClass("on");
                        $(
                                "#brand_sortbtn_" + type +
                                " > div > ul > li:eq(0) > .branTabResult")
                            .addClass("on");
                    }

                    // 초성 선택시 동작
                    function chgBranTab($this, type) {
                        if (!$($this).hasClass("disabled")) {
                            if (type == 1) { //국문
                                $("#brandKrList > li").each(
                                    function () {
                                        var dataGroup = $(this).data("group-pos");
                                        if ($('[data-group="bran' + dataGroup +
                                                '"]:checked').length < 1) {
                                            $(this).find("button")
                                                .removeClass("on");
                                        }
                                    });
                            } else {
                                $("#brandEnList > li").each(
                                    function () {
                                        var dataGroup = $(this).data("group-pos");
                                        if ($('[data-group="bran' + dataGroup +
                                                '"]:checked').length < 1) {
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
                                function () {
                                    var dataGroup = $(this).data("group-pos");
                                    if ($('[data-group="cate' + dataGroup +
                                            '"]:checked').length < 1) {
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
                        if ($("#basicSearchTerm").val().length > 0 ||
                            $("#hashSearchTerm").val().length > 0) {
                            dq_reqSearch();
                        }

                        // 검색 타입 구분
                        var searchType = $("#searchType").val();

                        $.ajax({
                            async: true,
                            url: ctx_curr + "/sr/searchLayer.json",
                            dataType: "json",
                            type: "POST",
                            data: {
                                searchType: searchType
                            },
                            success: function (data, textStatus, jqXHR) {
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
                            error: function (jqXHR, textStatus, errorThrown) {
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
                            async: true,
                            url: ctx_curr + "/sr/srchWrdSave.json",
                            dataType: "json",
                            type: "POST",
                            cache: false,
                            data: {
                                "rcntOffYn": rcntOffYn
                            },
                            success: function (data, textStatus, jqXHR) {
                                if (!crew.ajaxValidate(data)) {
                                    return;
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
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
                        $
                            .ajax({
                                async: true,
                                url: ctx_curr + "/sr/delSrchWrd.json",
                                dataType: "json",
                                type: "POST",
                                cache: false,
                                data: {
                                    "srchWrd": srchWrd,
                                    "searchType": searchType
                                },

                                success: function (data, textStatus, jqXHR) {
                                    if (!crew.ajaxValidate(data)) {
                                        return;
                                    }

                                    if (data.recentList.length > 0) {
                                        $
                                            .each(
                                                data.recentList,
                                                function (key) {
                                                    var list = data.recentList[key];

                                                    if (list.srchClsCd == "001") {
                                                        html += "<li><a href=\"" +
                                                            ctx_curr +
                                                            "/sr/searchResult.do?searchTerm=" +
                                                            encodeURIComponent(list.srchWrd) +
                                                            "&searchType=" +
                                                            encodeURIComponent("basic") +
                                                            "\">" +
                                                            list.srchWrd +
                                                            "</a><button type=\"button\" class=\"ic_x deleteOne\" onclick=\"javascript:delSrchWrd('" +
                                                            list.srchWrd +
                                                            "', 'N');\">X</button></li>";
                                                    } else {
                                                        html += "<li><a href=\"" +
                                                            ctx_curr +
                                                            "/sr/hashSearchResult.do?searchTerm=" +
                                                            encodeURIComponent(list.srchWrd) +
                                                            "&searchType=" +
                                                            encodeURIComponent("hash") +
                                                            "\">#" +
                                                            list.srchWrd +
                                                            "</a><button type=\"button\" class=\"ic_x deleteOne\" onclick=\"javascript:delSrchWrd('" +
                                                            list.srchWrd +
                                                            "', 'Y');\">X</button></li>";
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
                                error: function (jqXHR, textStatus, errorThrown) {
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

                    // form submit
                     function searchHeaderAction() {
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

                                searchHeader.action = ctx_curr +
                                    "/sr/hashSearchResult.do";
                                searchHeader.submit();
                            }
                        }

                        //}

                        $(".adsearch_dim").hide();

                    }
                    
                    // 23/01/18 김가희 추가 - 검색창전송
                     function searchHeaderAction2() {
         				searchHeader.submit();
         			} 
                </script>
                <!-- 23/01/18 김가희추가 - ajax토큰전송, 로그아웃버튼 작동 script함수 -->
				<script>
				//ajax에서 csrf토큰 같이보내기
				$(document).ajaxSend(function (e, xhr, options) {
			    	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			  	});
				
				//로그아웃 버튼작동
                function gologout() {
                   document.getElementById('form_logout').submit();
                }
                </script>
				<!-- 검색 레이어 영역 END-->
				<div class="default_menu">
					<!-- 시큐리티적용 로그인/로그아웃 -->
					<sec:authorize access="isAnonymous()">
						<a class="menu_login_join" href="/member/login"
							onclick="GA_Event('공통','헤더_메뉴','로그인')"> 로그인 <!-- 로그인 -->
						</a>
						<a class="menu_login_join" id="menu_login_join"
							href="/member/termsAgree/">회원가입</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<form id="form_logout" action="/member/logout" method="post">
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
						<!-- <li class="item_02"><a
							href="https://www.hddfs.com/shop/mm/myOrder/listOrder.do"><strong>주문<br>조회
							</strong></a></li> -->
						<li class="item_03"><a rel="nosublink" href="/member/Mypage"><strong>마이<br>현대
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
								<a href="javascript:" onclick="chgCurrencyInfo('KRW');"
									class="ko">KRW</a> <a href="javascript:"
									onclick="chgCurrencyInfo('CNY');" class="cn">CNY</a>
							</div></li>
						<li class="exchange_rate exchageRateTxt" id="Exchange"></li>
					</ul>
				</div>
				<!-- 환율 -->
				<script type="text/javascript">
                    $(document).ready(function () {


                        var myHeaders = new Headers();
                        myHeaders.append("apikey", "ejpIoeX7rmhnqISYZWdAGY0vxDsb6wgi");

                        var requestOptions = {
                            method: 'GET',
                            redirect: 'follow',
                            headers: myHeaders
                        };

                        fetch("https://api.apilayer.com/fixer/convert?to=KRW&from=USD&amount=1",
                                requestOptions)
                            .then(response => response.text())
                            .then(result => {
                                const num = parseFloat(String(JSON.parse(result).result));
                                const num2 = num.toFixed(1);
                                const Exchange = document.getElementById("Exchange");
                                Exchange.innerText = "1$ =" + String(num2) + " 원";
                                console.log(result);

                            })
                            .catch(error => console.log('error', error));


                    })
                </script>
				<script type="text/javascript">

                </script>

				<!-- 히든메뉴 START -->
				<script type="text/javascript">
                    function commOpenLayer(cookieChkYn, hiddenYn) {
                        $
                            .ajax({
                                async: true,
                                url: ctx_curr + "/dm/main/popInfo.json",
                                dataType: "json",
                                type: "POST",
                                success: function (popInfo, textStatus, jqXHR) {
                                    var data = popInfo.resPop;
                                    var html = "";
                                    for (var i = 0; i < data.popSeqList.length; i++) {
                                        html += "<div class=\"main_popup\" id=\"main_bottom_pop" + data
                                            .popSeqList[i].popSeq + "\" data-seq=\"" + data.popSeqList[i]
                                            .popSeq + "\">";
                                        var addClass = "";
                                        var addStyle = "";
                                        if (data.popSeqList[i].popTmplCd == '001') {
                                            addClass = "popswiper-container";
                                        } else {
                                            addClass = "html_wrap";
                                            addStyle = "style='width:560px; height: 368px;'";
                                        }
                                        html += "<div class=\"" + addClass + "\" " + addStyle + ">";
                                        if (data.popSeqList[i].popTmplCd == '001') {
                                            html += "<ul class=\"swiper-wrapper mainPopList\">";
                                            for (var j = 0; j < data.dataList.length; j++) {
                                                if (data.popSeqList[i].popSeq == data.dataList[j].popSeq) {
                                                    html += "<li class=\"swiper-slide\">";
                                                    var link = data.dataList[j].linkUrl != null ? data.dataList[
                                                            j].linkUrl :
                                                        "javascript:";

                                                    var wiseLog = "";
                                                    if (link != "javascript:") {
                                                        if (link.indexOf("?") != -1) {
                                                            wiseLog = "&MG=KR_PC_Main_Popup" +
                                                                data.popSeqList[i].popSeq +
                                                                "_" +
                                                                data.dataList[j].popDtlSeq;
                                                        } else {
                                                            wiseLog = "?MG=KR_PC_Main_Popup" +
                                                                data.popSeqList[i].popSeq +
                                                                "_" +
                                                                data.dataList[j].popDtlSeq;
                                                        }
                                                    }

                                                    if (data.dataList[j].shrtVdoUrl != null) {
                                                        html +=
                                                            "<video preload=\"none\" muted loop class='video-js'  style='width:560px; height:368px; object-fit:cover; background-color: black;'>";
                                                        html += "<source src=\"https://cdn.hddfs.com/files/" +
                                                            data.dataList[j].shrtVdoUrl +
                                                            "\" type=\"video/mp4\">";
                                                        html +=
                                                            "<strong>Your browser does not support the video tag.</strong>";
                                                        html += "</video>";
                                                    } else {
                                                        var mainTitl = data.dataList[j].mainTitl != null ? data
                                                            .dataList[j].mainTitl :
                                                            "";
                                                        var subTitl = data.dataList[j].subTitl != null ? data
                                                            .dataList[j].subTitl :
                                                            "";
                                                        var bnnrWrd = data.dataList[j].bnnrWrd != null ? data
                                                            .dataList[j].bnnrWrd :
                                                            "";

                                                        html += "<a href=\"" + link + wiseLog +
                                                            "\"  class='item_wrap'>";
                                                        html += "<div class='pop_txt'>";
                                                        html += "<strong class='cate'>" +
                                                            mainTitl +
                                                            "</strong>";
                                                        html += "<p>" + subTitl +
                                                            "</p>";
                                                        html += "<p>" + bnnrWrd +
                                                            "</p>";
                                                        html += "</div>";
                                                        html += "<img src=\"https://cdn.hddfs.com/files/" +
                                                            data.dataList[j].imgUrl +
                                                            "?RS=750X494\" alt=\"" +
                                                            data.dataList[j].popNm +
                                                            "\">";
                                                        html += "</a>";
                                                    }
                                                    html += "</li>";
                                                }
                                            }
                                            html += "</ul>";
                                            html += "<div class=\"swiper_control\" id=\"mainPop_" + data
                                                .popSeqList[i].popSeq + "\">";
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
                                        html +=
                                            "<input type=\"checkbox\" class=\"today_close\" id=\"btn_hidden_layer_" +
                                            data.popSeqList[i].popSeq +
                                            "\" onclick=\"saveMainLayerCookie(" +
                                            data.popSeqList[i].popSeq +
                                            ");\" hiddenYn=\"N\" />";
                                        html += "<label for=\"btn_hidden_layer_" + data.popSeqList[i].popSeq +
                                            "\" style=\"cursor: pointer;\">오늘 하루 보지 않기</label>";
                                        html += "</span>";
                                        html += "<span class=\"popup_close\"  data-seq=\"" +
                                            data.popSeqList[i].popSeq +
                                            "\" onclick=\"closeMainLayer(" +
                                            data.popSeqList[i].popSeq +
                                            ");\">닫기</span>";
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
                                                function () {
                                                    var seq = $(this).data(
                                                        "seq");
                                                    $(".today_close.chk")
                                                        .show();
                                                    $(
                                                            "#btn_hidden_layer_" +
                                                            seq)
                                                        .attr(
                                                            "hiddenYn",
                                                            "N");
                                                    if (getCookie("closePop" +
                                                            seq) == "Y") { // 팝업 오픈
                                                        $(
                                                                "#main_bottom_pop" +
                                                                seq)
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
                                            function () {
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
                                        function () {
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

                    //쿠폰 다운로드
                    function issueHiddenCoupon(cupId) {
                        var lgcpBuyMbshGrpCd = '';
                        var mbshGrpNm = '';

                        // 로그인 체크
                        if (!isLogin) {
                            alert('로그인 후 이용 가능합니다.'); /*로그인 후 이용 가능합니다.*/
                            login();
                            return;
                        }

                        if (lgcpBuyMbshGrpCd == "MG" || mbshGrpNm == "MG") {
                            alert(
                                '본 쿠폰은 현대백화점면세점 일반 회원만 다운로드 및 사용할 수 있습니다.'
                            ); /*본 쿠폰은 현대백화점면세점 일반 회원만 다운로드 및 사용할 수 있습니다.*/
                            return;
                        }

                        issueCoupon(cupId, function (data) {
                            if (data.resultCode == 1) {
                                alert('쿠폰이 다운로드 되었습니다.'); /*쿠폰이 다운로드 되었습니다.*/
                            } else {
                                alert(data.message);
                            }
                        });
                    }

                    // 적립금 다운로드
                    function issueHiddenSvmt(svmtId, baseRsvgAmt) {
                        issueSvmt(svmtId, baseRsvgAmt, function (data) {
                            if (data.resultCode == 1) {
                                alert('적립금이 다운로드 되었습니다.'); /*적립금이 다운로드 되었습니다.*/
                            } else {
                                alert(data.message);
                            }
                        });
                    }

                    // 이벤트 혜택받기
                    function getHiddenMenuEvntBnef(evntId) {
                        addEvnt(evntId);
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
								<li><a
									href="https://www.hddfs.com/shop/op/sale/saleShop.do"> 세일</a></li>
								<li><a href="https://www.hddfs.com/shop/dm/best/weekly.do">
										베스트</a></li>
								<li><a
									href="https://www.hddfs.com/event/op/evnt/evntShop.do"> 혜택</a></li>
								<li><a
									href="https://www.hddfs.com/event/op/spex/spexShop.do"> 기획전</a></li>
								<li><a
									href="https://www.hddfs.com/shop/or/coupon/cupMain.do"> 쿠폰</a></li>
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
								<li><a
									href="https://www.hddfs.com/shop/op/weds/wedsShop.do"> 웨딩샵</a></li>
							</ul></li>

						<li><strong>카테고리</strong>
							<ul class="depth_02 serviceCtgList" style="display: block;">
								<li data-ctgid="ctg0001" class=""><strong>스킨케어</strong>
									<ul class="depth_03" style="display: none;">
										<li><a rel="nosublink"
											href="/product/list?clarge=스킨케어&cmedium=&csmall=">스킨케어
												전체보기</a></li>
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
											href="/product/list?clarge=스킨케어&cmedium=미용기기/도구&csmall=">미용기기/도구</a>
										</li>
									</ul></li>
								<li data-ctgid="ctg0002"><strong>메이크업</strong>
									<ul class="depth_03" style="">
										<li><a rel="nosublink"
											href="/product/list?clarge=메이크업&cmedium=&csmall=">메이크업
												전체보기</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=메이크업&cmedium=페이스&csmall=">페이스</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=메이크업&cmedium=아이&csmall=">아이</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=메이크업&cmedium=립&csmall=">립</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=메이크업&cmedium=네일&csmall=">네일</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=메이크업&cmedium=메이크업도구&csmall=">메이크업도구</a></li>
									</ul></li>
								<li data-ctgid="ctg0003"><strong>향수/헤어/바디</strong>
									<ul class="depth_03" style="">
										<li><a rel="nosublink"
											href="/product/list?clarge=향수/헤어/바디&cmedium=&csmall=">향수/헤어/바디
												전체보기</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=향수/헤어/바디&cmedium=향수&csmall=">향수</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=향수/헤어/바디&cmedium=향초/디퓨저&csmall=">향초/디퓨저</a>
										</li>
										<li><a rel="nosublink"
											href="/product/list?clarge=향수/헤어/바디&cmedium=바디 &csmall=">바디</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=향수/헤어/바디&cmedium=헤어케어 &csmall=">헤어케어</a></li>
									</ul></li>
								<li data-ctgid="ctg0004"><strong>가방/지갑</strong>
									<ul class="depth_03" style="">
										<li><a rel="nosublink"
											href="/product/list?clarge=가방/지갑&cmedium=&csmall=">가방/지갑
												전체보기</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=가방/지갑&cmedium=가방&csmall=">가방</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=가방/지갑&cmedium=여행용가방&csmall=">여행용가방</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=가방/지갑&cmedium=지갑&csmall=">지갑</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=가방/지갑&cmedium=가방
												악세서리&csmall=">가방
												악세서리</a></li>
									</ul></li>
								<li data-ctgid="ctg0007"><strong>패션/잡화</strong>
									<ul class="depth_03" style="">
										<li><a rel="nosublink"
											href="/product/list?clarge=패션/잡화&cmedium=&csmall=">패션/잡화
												전체보기</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=패션/잡화&cmedium=패션소품&csmall=">패션소품</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=패션/잡화&cmedium=여성의류&csmall=">여성의류</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=패션/잡화&cmedium=남성의류&csmall=">남성의류</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=패션/잡화&cmedium=신발&csmall=">신발</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=패션/잡화&cmedium=문구류&csmall=">문구류</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=패션/잡화&cmedium=아이웨어&csmall=">아이웨어</a></li>
									</ul></li>
								<li data-ctgid="ctg0013"><strong>스포츠/레저</strong>
									<ul class="depth_03" style="">
										<li><a rel="nosublink"
											href="/product/list?clarge=스포츠/레저&cmedium=&csmall=">스포츠/레저
												전체보기</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=스포츠/레저&cmedium=수상레져&csmall=">수상레져</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=스포츠/레저&cmedium=골프&csmall=">골프</a></li>
									</ul></li>
								<li data-ctgid="ctg0008"><strong>전자/리빙</strong>
									<ul class="depth_03" style="">
										<li><a rel="nosublink"
											href="/product/list?clarge=전자/리빙&cmedium=&csmall=">전자/리빙
												전체보기</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=카메라/캠코더&cmedium=&csmall=">카메라/캠코더</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=카메라/캠코더&cmedium=음향기기&csmall=">음향기기</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=카메라/캠코더&cmedium=가전제품&csmall=">가전제품</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=카메라/캠코더&cmedium=스마트기기/ACC&csmall=">스마트기기/ACC</a>
										</li>
										<li><a rel="nosublink"
											href="/product/list?clarge=카메라/캠코더&cmedium=노트북/태블릿&csmall=">노트북/태블릿</a>
										</li>
										<li><a rel="nosublink"
											href="/product/list?clarge=카메라/캠코더&cmedium=리빙용품&csmall=">리빙용품</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=카메라/캠코더&cmedium=미용기기/도구&csmall=">미용기기/도구</a>
										</li>
										<li><a rel="nosublink"
											href="/product/list?clarge=카메라/캠코더&cmedium=면도기/칫솔&csmall=">면도기/칫솔</a>
										</li>
										<li><a rel="nosublink"
											href="/product/list?clarge=카메라/캠코더&cmedium=전자담배기기&csmall=">전자담배기기</a>
										</li>
									</ul></li>
								<li data-ctgid="ctg0009"><strong>식품</strong>
									<ul class="depth_03" style="">
										<li><a rel="nosublink"
											href="/product/list?clarge=식품&cmedium=&csmall=">식품 전체보기</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=식품&cmedium=건강식품&csmall=">건강식품</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=식품&cmedium=홍삼/인삼&csmall=">홍삼/인삼</a></li>
										<li><a rel="nosublink"
											href="/product/list?clarge=식품&cmedium=가공식품&csmall=">가공식품</a></li>
									</ul></li>


							</ul>
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