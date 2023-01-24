<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  
 * faq.jsp
 * 
 * @author 김가희
 * @since 01.23
 * 
 *        
 * 수정일                 수정자                              수정내용
 * ----------  ---------------  ---------------------------
 * 2023.01.23    김가희                        최초 생성
 *        
-->
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">


<title>현대백화점인터넷면세점 FAQ</title>

<link rel="apple-touch-icon" href="/client/apple-touch-icon.png" />
<link rel="apple-touch-icon-precomposed" href="/client/icon-normal.png" />

<link rel="shortcut icon" type="image/x-icon"
	href="https://ibot.hmall.com/images/20220816/5d2c556447e84403a00644ea61bdce3e.png" />
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/smartTalk.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

<body id="smartchat" class="smartchat themeA">
	<div class="wrapper">
		<div class="header">
			<div class="header-inner">
				<!-- Title -->
				<h1>
					<span class="logo">현대백화점 인터넷면세점 고객센터</span>
				</h1>
			</div>
		</div>
		<div class="container">
			<div class="contents">
				<div id="intro" class="intro-wrap">
						<!-- 인트로 캐릭터 (채널별 표시) -->
						<div class="intro-character" style="padding: 10px;">
							<p>FAQ</p>

							<div id="subIntroMsg"
								style='font-size: 14px; font-weight: normal; text-align: center; padding-top: 10px;'>
								현대백화점인터넷면세점 고객센터입니다. 무엇을 도와드릴까요?</div>

							<!-- <div class="characters" style="margin: 10px auto 0;">
								<span class=""><img
									src="/resources/images/hddfs.png"></span>
							</div> -->
						</div>
						<!-- 인트로 추천 GRID 타입 -->
						<div id="intro-faq-grid" class="intro-faq is-basic"
							style="margin: 0px;">
							<!-- <p>다른 고객님들이 자주 이용하는 메뉴입니다.</p> -->
							<div class="inner">
								<ul>
									<li title="내주문 보기"><a
										href="javascript:requestAnswer('면세한도 안내')"><span
											class="img"><img
												src="/resources/images/shopping.png"
												alt=""></span><span class="txt">면세한도 안내</span></a></li>
									<li title="취소/반품/교환"><a
										href="javascript:requestAnswer('기내반입금지물품')"><span
											class="img"><img
												src="/resources/images/plane.png"
												alt=""></span><span class="txt">기내반입금지물품</span></a></li>
									<li title="자주하는 질문"><a
										href="javascript:requestAnswer('인도장안내')"><span class="img"><img
												src="/resources/images/gps.png"
												alt=""></span><span class="txt">인도장 안내</span></a></li>
								</ul>
							</div>
						</div>
						</div>
				<div id="chat-list" class="chat-list">
					
						<!-- 처음시작 -->
						<div id="OT8HrethHwsPFv60vWIq" class="chat-item is-ktalk"
							style="visibility: visible;">
							<div id="RmczOk1feOuFhOAUqzZg" class="bubble has-moving in"
								style="max-height: 357px;">
								<div class="inner">고객님, 안녕하세요. 무엇이 궁금하신가요?</div>
							</div>
							<!-- <div class="date">오후 8:43</div> -->
						</div>
					<!-- </div> -->
				</div>
			</div>
		</div>
		<div class="chat-wrap">
    	<!-- 홈 버튼 -->
   		 <button type="button" class="btn-gohome" title="홈 버튼" onclick="home();"></button>
    	<div class="chat-forms">
   			<form id="f-chat-wrap" method="post" class="forms" onsubmit="return false;" autocomplete="off">
      			<!-- 검색어 입력 부분 -->
        		<label for="inp-chat" style="position: absolute; width: 1px; height: 1px; top: 0; left: 0; font-size: 1px; overflow: hidden;">검색어</label>
        		<input type="text" class="inp-chat" id="inp-chat" placeholder="하이(H-AI)봇에 무엇이든 물어보세요!">

   				<!-- 메시지 전송 버튼 -->
        		<button type="submit" class="btn-send" title="전송"></button>
    		</form>
    	</div>

   
</div>
	</div>

	<script>
		function home(){
			var template = `<div id="intro" class="intro-wrap">
				<!-- 인트로 캐릭터 (채널별 표시) -->
				<div class="intro-character" style="padding: 10px;">
					<p>FAQ</p>

					<div id="subIntroMsg"
						style='font-size: 14px; font-weight: normal; text-align: center; padding-top: 10px;'>
						현대백화점인터넷면세점 고객센터입니다. 무엇을 도와드릴까요?</div>

					<!-- <div class="characters" style="margin: 10px auto 0;">
						<span class=""><img
							src="/resources/images/hddfs.png"></span>
					</div> -->
				</div>
				<!-- 인트로 추천 GRID 타입 -->
				<div id="intro-faq-grid" class="intro-faq is-basic"
					style="margin: 0px;">
					<!-- <p>다른 고객님들이 자주 이용하는 메뉴입니다.</p> -->
					<div class="inner">
						<ul>
							<li title="내주문 보기"><a
								href="javascript:requestAnswer('면세한도 안내')"><span
									class="img"><img
										src="/resources/images/shopping.png"
										alt=""></span><span class="txt">면세한도 안내</span></a></li>
							<li title="취소/반품/교환"><a
								href="javascript:requestAnswer('기내반입금지물품')"><span
									class="img"><img
										src="/resources/images/plane.png"
										alt=""></span><span class="txt">기내반입금지물품</span></a></li>
							<li title="자주하는 질문"><a
								href="javascript:requestAnswer('인도장안내')"><span class="img"><img
										src="/resources/images/gps.png"
										alt=""></span><span class="txt">인도장 안내</span></a></li>
						</ul>
					</div>
				</div>
				</div>`;
			document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
			 scrollDown();
		}
		function clickMenu(menu){
			console.log(menu);
			//누른메뉴 표시해주기
			var template = `<div class="chat-item is-customer"><div class="bubble has-moving in" style="max-height: 105px;">
            <div class="inner">`+ menu +`</div></div></div>`;
			document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
		}
		function requestAnswer(menu){
			clickMenu(menu);
			//답변 출력해주기
			var faqAnswer="";
			if(menu=='면세한도 안내'){
				faqAnswer=`▶한국에서 해외로 출국 시 구매한도액 제한 없음
					▶단 해외에서 한국으로 입국 시 1인당 면세 금액 미화 $800 제한(해외구매 포함)`;
			}
			if(menu=='기내반입금지물품'){
				faqAnswer="액체류/젤류(화장품, 향수, 홍삼엑기스, 음료, 치약, 헤어젤, 샴푸, 마스카라, 립스틱, 스프레이, 리튬여분 배터리, 만년필 등) 액체 폭발물질 기내 반입 차단을 위한 국제민간항공기구(ICAO)의 권고에 따라 액체류 및 젤류의 휴대반입 제한조치가 실시 중이니 상품 구매에 참고하시기 바랍니다.";
			}
			if(menu=='인도장안내'){
				console.log("인도장안내에대한답변");
				faqAnswer="문의하실 인도장을 선택하세요";
			}
			var template = `<div class="chat-item is-ktalk" style="visibility: visible;">
                <div class="bubble has-moving in" style="max-height: 2468px;">
                <div class="inner">`
                + faqAnswer
                +`</div>`;
                if(menu=='인도장안내'){
                	 template += ` <button type="button" class="btn-link is-node"
                         onclick="platform('인천공항 1터미널 동쪽')">
                         <span>인천공항 1터미널 동쪽</span> 
                     </button>`;
                	 template += ` <button type="button" class="btn-link is-node"
                         onclick="platform('인천공항 1터미널 서쪽')">
                         <span>인천공항 1터미널 서쪽</span> 
                     </button>`;
                	 template += ` <button type="button" class="btn-link is-node"
                         onclick="platform('인천공항 2터미널')">
                         <span>인천공항 2터미널</span> 
                     </button>`;
                	 template += ` <button type="button" class="btn-link is-node"
                         onclick="platform('김포공항')">
                         <span>김포공항</span> 
                     </button>`;
                }
                template+=`</div></div>`;
            document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
            scrollDown();
		}
		
		//인도장위치 띄우기
		 function platform(ter) {
			console.log(ter);
			clickMenu(ter);
			var terImg;
			var terTxt;
			if(ter=='인천공항 1터미널 동쪽'){
				console.log("인천공항 1터미널 동쪽");
				terImg = "/resources/images/ICNT1W.jpg";
				terTxt = `  ▶ 위치안내: 11번 게이트 맞은편 4층
					▶ 문의안내: 1811-6688</div>`;
			}
			if(ter=='인천공항 1터미널 서쪽'){
				console.log("인천공항 1터미널 서쪽");
				terImg = "/resources/images/ICNT1E.jpg";
				terTxt = `  ▶ 위치안내: 43번 게이트 맞은편 4층
					▶ 문의안내: 1811-6688</div>`;
			}
			if(ter=='인천공항 2터미널'){
				console.log("인천공항 2터미널");
				terImg = "/resources/images/ICNT2.jpg";
				terTxt = `  ▶ 위치안내: 2번 출입국 심사대 통과 후 252번 게이트 건너편 4층
					▶ 문의안내: 1811-6688</div>`;
			}
			if(ter=='김포공항'){
				console.log("김포공항");
				terImg = "/resources/images/GMP.jpg";
				terTxt = `  ▶ 위치안내: 출입국 심사대 통과 후 34번 게이트 맞은편
					▶ 문의안내: 1811-6688</div>`;
			}
			
			var template = `<div class="chat-item is-ktalk"
				style="visibility: visible;">
				<div class="holder">
					<div class="img-text">
						<div class="thumb">
							<img
								src="`+terImg+`"
								alt="">
						</div>
						<div class="desc">`+terTxt+`</div>
					</div>
				</div>
				</div>`;
				document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
			scrollDown();
		} 
		// 페이지 맨 하단으로 이동
	    function scrollDown() {
	        setTimeout(function () {
	            $('.contents').animate({
	                'scrollTop': $('.contents')[0].scrollHeight
	            }, 300);
	        }, 100);
	    }
	</script>
</body>


</html>