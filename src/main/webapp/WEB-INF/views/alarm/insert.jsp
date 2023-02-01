<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>현대백화점인터넷면세점</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script type="text/javascript" async=""
        src="https://www.googletagmanager.com/gtag/js?id=G-PV9DPJR96M&amp;l=dataLayer&amp;cx=c"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-56VKRZT"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery-1.11.3.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery.bxslider.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/swiper.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/jquery-ui.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/swiper.min.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/common.css?ver=18">
    <link rel="stylesheet" href="https://cdn.hddfs.com/front/css/KO/popup.css?ver=18">
    <link rel="shortcut icon" href="https://cdn.hddfs.com/front/images/KO/common/favicon_H.ico">

    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/crew.source.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/form/form.source.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/sns.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/jquery.cookie.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/common.js?ver=18"></script>

    <!-- S: 다이퀘스트 스크립트 추가 -->
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/diquest/dqAutoCompleteCommon.js?ver=18">
    </script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/diquest/dqHeader.js?ver=18"></script>
    <!-- E: 다이퀘스트 스크립트 추가 -->

    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/cloud-zoom.1.0.2.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoAjax.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/SsoHttpRequest.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/makePCookie.js?ver=18"></script>
    <script type="text/javascript" src="https://cdn.hddfs.com/front/js/KO/crew/hash.js?ver=18"></script>

</head>

<body>
    <div class="pop_wrap">
        <h1 class="h1_type">재입고 알림신청 완료</h1>
        <div class="pop_content">
            <div class="restock_alim_wrap">
                <p class="restock_end_txt">재입고 알림 신청이 완료되었습니다.</p>
                <h2 class="h5_type">재입고 알림신청 내역</h2>
                <table class="tb_view01 vm mgtxs">
                    <caption>재입고 알림신청</caption>
                    <colgroup>
                        <col style="width:120px">
                        <col style="width:auto">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">상품명</th>
                            <td>
                                <div class="p_small">
                                    <div class="p_simg"><img
                                            src="${product.img1}"
                                            alt="EDP Do Son 75 m" title="EDP Do Son 75 m"></div>
                                    <p class="p_stit">
                                        <span class="ref_code">REF.NO DOSONP75CV1 / <span>SKU.NO
                                                104873200106</span></span>
                                        <span class="brand_name">${product.pbrand}</span>
                                        <span class="pro_name">${product.pname}</span>
                                    </p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">휴대폰번호</th>
                            <td>
                                ${mphone}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="attention_wrap mgtsm">
                    <p class="attention">유의사항</p>
                    <ul class="dot_list">
                        <li>
                            신청한 재입고 알림 내역은 마이현대 &gt; 재입고 알림 신청내역 에서 확인할 수 있습니다.</li>
                        <li>
                            재입고 알림신청은 최대 20개까지 가능합니다.</li>
                        <li>
                            상품 입고시간에 따라 한국시간 기준 오전 9시부터 오후 6시까지 1시간 간격으로 알림 문자가 발송됩니다.</li>
                        <li>
                            재입고 알림은 1회 발송되며, 다시 알림을 받고 싶으신 경우 재신청 하실 수 있습니다.</li>
                        <li>
                            재입고 알림은 먼저 신청한 순으로 발송되며, 재입고 알림 후 인기 상품은 조기 품절될 수 있습니다.</li>
                    </ul>

                </div>
            </div>
            <!-- S : 2017-08-17 modify -->
            <div class="basic_btn_box">
                <button type="button" class="btn_basic1" onclick="javascript:self.close();">닫기</button>
            </div>
            <!-- E : 2017-08-17 modify -->
        </div>
    </div>

    <p class="gnb_dim"></p>
    <div class="adsearch_dim"></div>
    <div tabindex="-1" role="dialog"
        class="ui-dialog ui-corner-all ui-widget ui-widget-content ui-front main_popup2_layer ui-draggable ui-resizable"
        aria-describedby="ui-id-2" style="display: none; position: fixed;" aria-labelledby="ui-id-3">
        <div class="ui-dialog-titlebar ui-corner-all ui-widget-header ui-helper-clearfix ui-draggable-handle"><span
                id="ui-id-3" class="ui-dialog-title">&nbsp;</span><button type="button"
                class="ui-button ui-corner-all ui-widget ui-button-icon-only ui-dialog-titlebar-close"
                title="Close"><span class="ui-button-icon ui-icon ui-icon-closethick"></span><span
                    class="ui-button-icon-space"> </span>Close</button></div>
        <div class="main_popup2 ui-dialog-content ui-widget-content" id="ui-id-2" style="display: block;">
            <div class="pop_img">
                <a href="javascript:void(0);" onclick="login('')">
                    <img src="https://cdn.hddfs.com/files/editor/20220504/6b3d071d_202205041549127060.jpg"
                        alt="로그인 한번으로 즐기는 간편한 면세쇼핑">
                </a>
            </div>
            <div class="close_section2">
                <span class="today_close2 chk">
                    <input type="checkbox" id="today_close2">
                    <label for="today_close2">오늘하루보지 않기</label>
                </span>
                <span class="popup_close2">닫기</span>
            </div>
        </div>
        <div class="ui-resizable-handle ui-resizable-n" style="z-index: 90;"></div>
        <div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
        <div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div>
        <div class="ui-resizable-handle ui-resizable-w" style="z-index: 90;"></div>
        <div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90;">
        </div>
        <div class="ui-resizable-handle ui-resizable-sw" style="z-index: 90;"></div>
        <div class="ui-resizable-handle ui-resizable-ne" style="z-index: 90;"></div>
        <div class="ui-resizable-handle ui-resizable-nw" style="z-index: 90;"></div>
    </div><iframe id="groobeeBox" name="groobeeBox" style="display: none;"></iframe>
</body>
<whale-quicksearch translate="no"></whale-quicksearch>

</html>