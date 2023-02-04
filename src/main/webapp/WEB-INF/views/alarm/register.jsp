<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="utf-8">
    <title>현대백화점인터넷면세점</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script type="text/javascript" async=""
        src="https://www.googletagmanager.com/gtag/js?id=G-PV9DPJR96M&amp;l=dataLayer&amp;cx=c"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-56VKRZT"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery-ui.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery.bxslider.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/swiper.min.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/common.ui.js?ver=18"></script>
    <script src="https://cdn.hddfs.com/front/js/KO/jquery.lazyload.min.js?ver=18"></script>
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
</head>
<script>
	$(function(){
		<c:if test="${mphone ne ''}">
		var phoneFull = "${mphone}";
		console.log("시작할 때 들어온 전화번호: "+phoneFull);
		
		var phone1 = phoneFull.substring(0,3);
		var phone2 = phoneFull.substring(3,7);
		var phone3 = phoneFull.substring(7);
		console.log("첫번쨰: "+phone1);
		console.log("두번쨰: "+phone2);
		console.log("세번쨰: "+phone3);
		
		$('input[name=mophNo1]').attr('value',phone1);
		$('input[name=mophNo2]').attr('value',phone2);
		$('input[name=mophNo3]').attr('value',phone3);
		</c:if>
		
	});
</script>
    <div class="pop_wrap">
        <h1 class="h1_type">재입고 알림신청</h1>
        <div class="pop_content">
            <form name="form" method="post" action="/alarm/insert">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <div class="restock_alim_wrap">
                    <table class="tb_write01 vm">
                        <caption>재입고 알림신청</caption>
                        <colgroup>
                            <col style="width:120px">
                            <col style="width:auto">
                        </colgroup>
                        <tbody>
                            <!-- <tr>
                                <th scope="row">알림신청기간</th>
                                <td>
                                    <span class="today">2023-01-31<input type="hidden" name="stDt"
                                            value="2023-01-31"></span>
                                    <span class="gap">~</span>
                                    <span class="datepicker_box"><input type="text" id="dp1675153960306" name="endDt"
                                            value="2023-02-27" placeholder=""
                                            class="agin_recp_ntc_datepicker hasDatepicker" style="width:160px;"
                                            onfocus="blur()"><img class="ui-datepicker-trigger"
                                            src="https://cdn.hddfs.com/front/images/KO/common/calendar.png"
                                            alt="Select date" title="Select date"></span>
                                    <p class="info_file">기간은 최대 1개월까지 선택하실 수 있습니다.</p>
                                </td>
                            </tr> -->
                            <tr>
                                <th scope="row">휴대폰번호</th>
                                <td class="radio_sel">
                                    <span class="selw02">
                                        <select name="telNatiCd" class="sel_type required" disabled="" id="telNatiCd"
                                            valmsg="휴대폰 국가번호를 선택해주세요." style="display: none;">
                                            <option value="82" selected="selected">한국 (+82)</option>
                                            <option value="86">중국 (+86)</option>
                                            <option value="886">대만 (+886)</option>
                                            <option value="65">싱가포르 (+65)</option>
                                            <option value="84">베트남 (+84)</option>
                                            <option value="852">홍콩 (+852)</option>
                                            <option value="81">일본 (+81)</option>
                                            <option value="61">호주 (+61)</option>
                                            <option value="66">태국 (+66)</option>
                                            <option value="64">뉴질랜드 (+64)</option>
                                            <option value="1">미국/캐나다 (+1)</option>
                                            <option value="63">필리핀 (+63)</option>
                                            <option value="233">가나 (+233)</option>
                                            <option value="241">가봉 (+241)</option>
                                            <option value="592">가이아나 (+592)</option>
                                            <option value="220">감비아 (+220)</option>
                                            <option value="590">과델로프 (+590)</option>
                                            <option value="502">과테말라 (+502)</option>
                                            <option value="1671">괌 (+1671)</option>
                                            <option value="379">교황청 (+379)</option>
                                            <option value="1473">그레나다 (+1473)</option>
                                            <option value="995">그루지아 (+995)</option>
                                            <option value="30">그리스 (+30)</option>
                                            <option value="299">그린랜드 (+299)</option>
                                            <option value="245">기네비소 (+245)</option>
                                            <option value="224">기니 (+224)</option>
                                            <option value="264">나미비아 (+264)</option>
                                            <option value="234">나이지리아 (+234)</option>
                                            <option value="27">남아프리카 (+27)</option>
                                            <option value="31">네덜란드 (+31)</option>
                                            <option value="599">네덜란드 열도 (+599)</option>
                                            <option value="977">네팔 (+977)</option>
                                            <option value="47">노르웨이 (+47)</option>
                                            <option value="687">뉴 칼레도니아 (+687)</option>
                                            <option value="227">니제르 (+227)</option>
                                            <option value="505">니카라과 (+505)</option>
                                            <option value="45">덴마크 (+45)</option>
                                            <option value="1767">도미니카 (+1767)</option>
                                            <option value="1809">도미니카 공화국 (+1809)</option>
                                            <option value="49">독일 (+49)</option>
                                            <option value="856">라오스 (+856)</option>
                                            <option value="231">라이베리아 (+231)</option>
                                            <option value="371">라트비아 (+371)</option>
                                            <option value="7">러시아/카자흐 (+7)</option>
                                            <option value="961">레바논 (+961)</option>
                                            <option value="266">레소토 (+266)</option>
                                            <option value="40">루마니아 (+40)</option>
                                            <option value="250">루안다 (+250)</option>
                                            <option value="352">룩셈부르그 (+352)</option>
                                            <option value="218">리비아 (+218)</option>
                                            <option value="370">리투아니아 (+370)</option>
                                            <option value="423">리히텐슈타인 (+423)</option>
                                            <option value="261">마다카스카르 (+261)</option>
                                            <option value="692">마샬군도 (+692)</option>
                                            <option value="389">마세도니아 (+389)</option>
                                            <option value="691">마이크로네시아 (+691)</option>
                                            <option value="853">마카오 (+853)</option>
                                            <option value="596">마티니크 (+596)</option>
                                            <option value="265">말라위 (+265)</option>
                                            <option value="60">말레이지아 (+60)</option>
                                            <option value="223">말리 (+223)</option>
                                            <option value="269">코모로스/메요트 (+269)</option>
                                            <option value="52">멕시코 (+52)</option>
                                            <option value="377">모나코 (+377)</option>
                                            <option value="212">모로코/서사하라 (+212)</option>
                                            <option value="230">모리셔스 (+230)</option>
                                            <option value="258">모잠비크 (+258)</option>
                                            <option value="1664">몬트세라트 (+1664)</option>
                                            <option value="373">몰도바 (+373)</option>
                                            <option value="960">몰디브 (+960)</option>
                                            <option value="356">몰타 (+356)</option>
                                            <option value="976">몽골 (+976)</option>
                                            <option value="1284">미령 버진군도 (+1284)</option>
                                            <option value="95">미얀마 (+95)</option>
                                            <option value="678">바누아투 (+678)</option>
                                            <option value="973">바레인 (+973)</option>
                                            <option value="1246">바베이도스 (+1246)</option>
                                            <option value="880">방글라데시 (+880)</option>
                                            <option value="1441">버뮤다 (+1441)</option>
                                            <option value="58">베네주엘라 (+58)</option>
                                            <option value="229">베닝 (+229)</option>
                                            <option value="375">베라루스 (+375)</option>
                                            <option value="32">벨기에 (+32)</option>
                                            <option value="501">벨리제 (+501)</option>
                                            <option value="387">보스니아-헤르체고비나 (+387)</option>
                                            <option value="267">보츠와나 (+267)</option>
                                            <option value="591">볼리비아 (+591)</option>
                                            <option value="257">부룬디 (+257)</option>
                                            <option value="226">부르키나 파소 (+226)</option>
                                            <option value="975">부탄 (+975)</option>
                                            <option value="850">북한 (+850)</option>
                                            <option value="359">불가리아 (+359)</option>
                                            <option value="594">불령 가이아나 (+594)</option>
                                            <option value="262">불령 리유니온,코모도 제도 (+262)</option>
                                            <option value="689">불령 폴리네시아 (+689)</option>
                                            <option value="55">브라질 (+55)</option>
                                            <option value="673">브루나이 (+673)</option>
                                            <option value="685">사모아 (+685)</option>
                                            <option value="966">사우디아라비아 (+966)</option>
                                            <option value="357">사이프러스 (+357)</option>
                                            <option value="378">산마리노 (+378)</option>
                                            <option value="239">상토메 프린스페 (+239)</option>
                                            <option value="221">세네갈 (+221)</option>
                                            <option value="248">세이쉘 (+248)</option>
                                            <option value="1758">세인트 루시아 (+1758)</option>
                                            <option value="1784">세인트 빈센트 그레나딘 (+1784)</option>
                                            <option value="1869">세인트 키츠 네비스 (+1869)</option>
                                            <option value="290">세인트 헬레나 (+290)</option>
                                            <option value="252">소말리아 (+252)</option>
                                            <option value="677">솔로몬 군도 (+677)</option>
                                            <option value="249">수단 (+249)</option>
                                            <option value="597">수리남 (+597)</option>
                                            <option value="94">스리랑카 (+94)</option>
                                            <option value="268">스와질랜드 (+268)</option>
                                            <option value="46">스웨덴 (+46)</option>
                                            <option value="41">스위스 (+41)</option>
                                            <option value="34">스페인 (+34)</option>
                                            <option value="421">슬로바키아 (+421)</option>
                                            <option value="386">슬로베니아 (+386)</option>
                                            <option value="963">시리아 (+963)</option>
                                            <option value="232">시에라 리온 (+232)</option>
                                            <option value="971">아랍에미리트 연합 (+971)</option>
                                            <option value="297">아루바 (+297)</option>
                                            <option value="374">아르메니아 (+374)</option>
                                            <option value="54">아르헨티나 (+54)</option>
                                            <option value="1684">아메리칸 사모아 (+1684)</option>
                                            <option value="354">아이슬란드 (+354)</option>
                                            <option value="509">아이티 (+509)</option>
                                            <option value="353">아일랜드 (+353)</option>
                                            <option value="994">아제르바이잔 (+994)</option>
                                            <option value="93">아프카니스탄 (+93)</option>
                                            <option value="376">안도라 (+376)</option>
                                            <option value="1268">안티가 바부다 (+1268)</option>
                                            <option value="355">알바니아 (+355)</option>
                                            <option value="213">알제리 (+213)</option>
                                            <option value="244">앙골라 (+244)</option>
                                            <option value="1264">앙귈라 (+1264)</option>
                                            <option value="372">에스토니아 (+372)</option>
                                            <option value="593">에쿠아도르 (+593)</option>
                                            <option value="503">엘살바도르 (+503)</option>
                                            <option value="44">영국 (+44)</option>
                                            <option value="1340">영령 버진군도 (+1340)</option>
                                            <option value="1345">영령 캐이맨 군도 (+1345)</option>
                                            <option value="967">예맨 (+967)</option>
                                            <option value="968">오만 (+968)</option>
                                            <option value="43">오스트리아 (+43)</option>
                                            <option value="504">온두라스 (+504)</option>
                                            <option value="962">요르단 (+962)</option>
                                            <option value="256">우간다 (+256)</option>
                                            <option value="598">우루과이 (+598)</option>
                                            <option value="998">우즈베크 (+998)</option>
                                            <option value="380">우크라이나 (+380)</option>
                                            <option value="251">이디오피아 (+251)</option>
                                            <option value="964">이라크 (+964)</option>
                                            <option value="98">이란 (+98)</option>
                                            <option value="972">이스라엘 (+972)</option>
                                            <option value="20">이집트 (+20)</option>
                                            <option value="39">이탈리아 (+39)</option>
                                            <option value="62">인도네시아 (+62)</option>
                                            <option value="91">인디아 (+91)</option>
                                            <option value="1876">자마이카 (+1876)</option>
                                            <option value="260">잠비아 (+260)</option>
                                            <option value="240">적도 기니 (+240)</option>
                                            <option value="236">중앙아프리카 (+236)</option>
                                            <option value="253">지부티 (+253)</option>
                                            <option value="350">지브랄타 (+350)</option>
                                            <option value="263">짐바브웨 (+263)</option>
                                            <option value="235">챠드 (+235)</option>
                                            <option value="420">체코공화국 (+420)</option>
                                            <option value="56">칠레 (+56)</option>
                                            <option value="237">카메룬 (+237)</option>
                                            <option value="238">카보 베르데 (+238)</option>
                                            <option value="974">카타르 (+974)</option>
                                            <option value="855">캄보디아 (+855)</option>
                                            <option value="254">케냐 (+254)</option>
                                            <option value="506">코스타리카 (+506)</option>
                                            <option value="57">콜롬비아 (+57)</option>
                                            <option value="243">콩고 (+243)</option>
                                            <option value="53">쿠바 (+53)</option>
                                            <option value="965">쿠웨이트 (+965)</option>
                                            <option value="682">쿡 아일랜드 (+682)</option>
                                            <option value="385">크로아티아 (+385)</option>
                                            <option value="996">키르기스 (+996)</option>
                                            <option value="686">키리바티 (+686)</option>
                                            <option value="992">타지크 (+992)</option>
                                            <option value="255">탄자니아 (+255)</option>
                                            <option value="90">터키 (+90)</option>
                                            <option value="228">토고 (+228)</option>
                                            <option value="676">통가 (+676)</option>
                                            <option value="1649">투르크 &amp; 카이코스 군도 (+1649)</option>
                                            <option value="993">투르크멘 (+993)</option>
                                            <option value="688">투발루 (+688)</option>
                                            <option value="216">튀니지 (+216)</option>
                                            <option value="1868">트리니다드 토바고 (+1868)</option>
                                            <option value="670">티모르 (+670)</option>
                                            <option value="507">파나마 (+507)</option>
                                            <option value="595">파라과이 (+595)</option>
                                            <option value="298">파로에 군도 (+298)</option>
                                            <option value="92">파키스탄 (+92)</option>
                                            <option value="675">파푸아 뉴기니 (+675)</option>
                                            <option value="680">팔라우 (+680)</option>
                                            <option value="970">팔레스타인 (+970)</option>
                                            <option value="51">페루 (+51)</option>
                                            <option value="351">포루투갈 (+351)</option>
                                            <option value="500">포클랜드 군도 (+500)</option>
                                            <option value="48">폴란드 (+48)</option>
                                            <option value="1787">푸에르토리코 (+1787)</option>
                                            <option value="33">프랑스 (+33)</option>
                                            <option value="679">피지 (+679)</option>
                                            <option value="358">핀란드 (+358)</option>
                                            <option value="36">헝가리 (+36)</option>
                                        </select><!-- <span
                                                class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span><span
                                                class="ui-selectmenu-text">한국 (+82)</span></span> -->
                                    </span>
                                    <span class="phone_num mbshIosdClsCd mbshIosdClsCd0">
                                        <input type="text" name="mophNo1" value=""  placeholder=""
                                            class="w_s required mophNoTxt0" valmsg="휴대폰 번호를 입력해주세요.">
                                        <span class="gap">-</span>
                                        <input type="text" name="mophNo2" value=""  placeholder=""
                                            class="w_s required mophNoTxt0" valmsg="휴대폰 번호를 입력해주세요.">
                                        <span class="gap">-</span>
                                        <input type="text" name="mophNo3" value=""  placeholder=""
                                            class="w_s rgap01 required mophNoTxt0" valmsg="휴대폰 번호를 입력해주세요.">
                                         <input type="hidden" name="pcode" value="${pcode}">
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="attention_wrap mgtsm">
                        <p class="attention">유의사항</p>
                        <ul class="dot_list">
                            <li>
                                재입고 알림을 신청하신 상품이 입고 될 경우, 카카오 알림톡 또는 SMS로 발송됩니다.</li>
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
                    <h2 class="h5_type mgtsm">개인정보의 수집 · 이용동의</h2>
                    <div class="step_agree_box mgtxs">
                        <ul class="dot_list">
                            <li>개인정보의 수집 · 이용 목적 : 재입고 알림서비스 제공</li>
                            <li>수집하는 개인정보의 항목 : 휴대폰 번호 (마이현대-기본정보관리)</li>
                            <li><strong class="f_size02">개인정보의 보유 · 이용기간 : 알림 신청시점부터 3개월 보관 후 즉시 파기</strong></li>
                            <li>개인정보 수집 · 이용 동의를 거부할 권리가 있으며, 동의 거부 시 휴대폰 번호로의 재입고 알림서비스는 이용하실 수 없습니다.</li>
                        </ul>
                    </div>
                    <p class="agree_txt">
                        <span class="checkbox small">
                            <input type="checkbox" name="agree_check" id="agree_check">
                            <label for="agree_check">개인정보의 수집 · 이용동의 내용을 확인하였으며, 동의합니다.</label>
                        </span>
                    </p>
                </div>
                <div class="basic_btn_box">
                    <button type="button" class="btn_basic1" onclick="javascript:self.close();">취소</button>
                    <button type="button" class="btn_basic2" onclick="sendData()">동의 후 신청</button>
                </div>
            </form>
        </div>
    </div>




    <script>
        // 전송처리
        function sendData() {


            $('#telNatiCd').removeAttr('disabled');

            var form = $("form[name=form]");

            // 동의항목 체크
            if (!$("input[name=agree_check]").prop("checked")) {
                alert("개인정보수집 · 이용동의는 필수 항목입니다.");
                return;
            }

            // 국가코드별로 유효성체크가 다름.
            var telNatiCd = $("select[name=telNatiCd]").val();
            if (telNatiCd == "82") {
                $(".mophNoTxt1").removeClass("required");
            } else {
                $(".mophNoTxt0").removeClass("required");
            }

            // 유효성 체크
            if (!form.validateForm()) {
                return;
            }

            // 데이터 구성
            var data = form.serializeObject();

            data.mophNo = (telNatiCd == "82" ? "" + data.mophNo1 + data.mophNo2 + data.mophNo3 : data.mophNo);
            console.log("전화번호: "+data.mophNo);
            /* data.stDt = data.stDt.replace(/-/g, '');
            data.endDt = data.endDt.replace(/-/g, '');
            data.onlnGoosCd = "10487320010602"; */

            form.submit();

            // 전송
           /*  $.ajax({
                async: true,
                url: "//www.hddfs.com/shop/mm/my/addAginRecpNtcSave.json",
                dataType: "json",
                type: "POST",
                data: data,
                success: function (data, textStatus, jqXHR) {
                    if (!crew.ajaxValidate(data)) {
                        return;
                    }

                    if (data.info.dupYn == "Y") {
                        alert("기존에 신청된 항목이 있습니다.");
                        return;
                    }


                    location.href =
                        "https://www.hddfs.com/shop/mm/my/addAginRecpNtcEnd.do?aginRecpNtcSeq=" + data.info
                        .aginRecpNtcSeq;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    //console.log(jqXHR.status);
                }
            }); */
        }

        $(document).ready(function (evt) {
            // 국가코드 변경 이벤트 핸들...
            $("select[name=telNatiCd]").selectmenu({
                change: function (event, ui) {
                    var val = this.value;

                    $(".mbshIosdClsCd").hide();
                    if (val == "82") {
                        $(".mbshIosdClsCd0").show();
                    } else {
                        $(".mbshIosdClsCd1").show();
                    }
                }
            });
        });
    </script>