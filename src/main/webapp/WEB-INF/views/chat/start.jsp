<<<<<<< HEAD
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
										class="img"><img src="/resources/images/shopping.png"
											alt=""></span><span class="txt">면세한도 안내</span></a></li>
								<li title="취소/반품/교환"><a
									href="javascript:requestAnswer('기내반입금지물품')"><span
										class="img"><img src="/resources/images/plane.png"
											alt=""></span><span class="txt">기내반입금지물품</span></a></li>
								<li title="자주하는 질문"><a
									href="javascript:requestAnswer('인도장안내')"><span class="img"><img
											src="/resources/images/gps.png" alt=""></span><span
										class="txt">인도장 안내</span></a></li>
								<li title="시간당 고객수 확인"><a
									href="javascript:requestAnswer('시간당 고객수 확인')"><span
										class="img"><img src="/resources/images/crowd.png" alt=""></span><span
										class="txt">시간당 고객수 확인</span></a></li>
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
			<button type="button" class="btn-gohome" title="홈 버튼"
				onclick="home();"></button>
			<!-- <div class="chat-forms">
   			<form id="f-chat-wrap" method="post" class="forms" onsubmit="return false;" autocomplete="off">
      			검색어 입력 부분
        		<label for="inp-chat" style="position: absolute; width: 1px; height: 1px; top: 0; left: 0; font-size: 1px; overflow: hidden;">검색어</label>
        		<input type="text" class="inp-chat" id="inp-chat" placeholder="하이(H-AI)봇에 무엇이든 물어보세요!">

   				메시지 전송 버튼
        		<button type="submit" class="btn-send" title="전송"></button>
    		</form>
    	</div> -->


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
							<li title="시간당 고객수 확인"><a
								href="javascript:requestAnswer('시간당 고객수 확인')"><span class="img"><img
										src="/resources/images/crowd.png"
										alt=""></span><span class="txt">시간당 고객수 확인</span></a></li>
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
			if(menu=='시간당 고객수 확인'){
				console.log("시간당 고객수 확인에대한답변");
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
                if(menu=='시간당 고객수 확인'){
               	 template += ` <button type="button" class="btn-link is-node"
                        onclick="customCnt('인천공항 1터미널 동쪽')">
                        <span>인천공항 1터미널 동쪽</span> 
                    </button>`;
               	 template += ` <button type="button" class="btn-link is-node"
                        onclick="customCnt('인천공항 1터미널 서쪽')">
                        <span>인천공항 1터미널 서쪽</span> 
                    </button>`;
               	 template += ` <button type="button" class="btn-link is-node"
                        onclick="customCnt('인천공항 2터미널')">
                        <span>인천공항 2터미널</span> 
                    </button>`;
               	 template += ` <button type="button" class="btn-link is-node"
                        onclick="customCnt('김포공항')">
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
			clickMenu(ter+" 인도장 위치확인");
			var terImg;
			var terTxt;
			var terConf;
			if(ter=='인천공항 1터미널 동쪽'){
				console.log("인천공항 1터미널 동쪽");
				terImg = "https://cdn.hddfs.com/files/om/20200831/3b429243_202008311038223570.jpg";
				terTxt = `  ▶ 위치안내: 11번 게이트 맞은편 4층
					▶ 문의안내: 1811-6688</div>`;
			}
			if(ter=='인천공항 1터미널 서쪽'){
				console.log("인천공항 1터미널 서쪽");
				terImg = "https://cdn.hddfs.com/files/om/20200831/0742db50_202008311039325500.jpg";
				terTxt = `  ▶ 위치안내: 43번 게이트 맞은편 4층
					▶ 문의안내: 1811-6688</div>`;
			}
			if(ter=='인천공항 2터미널'){
				console.log("인천공항 2터미널");
				terImg = "https://cdn.hddfs.com/files/om/20200831/0742db50_202008311039325500.jpg";
				terTxt = `  ▶ 위치안내: 2번 출입국 심사대 통과 후 252번 게이트 건너편 4층
					▶ 문의안내: 1811-6688</div>`;
			}
			if(ter=='김포공항'){
				console.log("김포공항");
				terImg = "https://cdn.hddfs.com/files/om/20181005/014b0326_201810051531252800.jpg";
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
						<div class="desc">`+terTxt+`
						<button type="button" class="btn-link is-node"
	                        onclick="conf('`+ter+`')">
	                        <span>혼잡도 확인</span> 
	                    	</button>
						</div>
					</div>
				</div>
				</div>`;
				document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
			scrollDown();
		}
		//혼잡도 가져오기
		function conf(ter){
			console.log(ter+"인도장 혼잡도 확인");
			clickMenu(ter+"인도장 혼잡도 확인");
			
			$.ajax({
				type : 'GET',
				url : "/common/conf",
				success: function(data){
					console.log("ajax성공");
					cnt = data.cnt;
					console.log("현재인원수: "+cnt);
					var confAnswer = "현재 인원수는 "+cnt+"명 입니다.";
					var template = `<div class="chat-item is-ktalk" style="visibility: visible;">
		                <div class="bubble has-moving in" style="max-height: 2468px;">
		                <div class="inner">`
		                + confAnswer
		                +`</div>`;
					 document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
			         scrollDown();
				}
			});
			
			
			scrollDown();
		}
		
		 function customCnt(ter,date) {
			 console.log("날짜구하기");
			 console.log(new Date());
			 var today = new Date();
			 console.log("today: "+today);
				var tomorrow = new Date();
				var datomorrow = new Date();
				
				var now = today.getDate();	//계산을 위한 오늘날짜
				tomorrow.setDate(now+1);
				datomorrow.setDate(now+2);
				
				today = getFormatDate(today);
				tomorrow = getFormatDate(tomorrow);
				datomorrow = getFormatDate(datomorrow);
				
				console.log("today : "+	today);
				console.log("tomorrow : "+ tomorrow);
				console.log("datomorrow : "+datomorrow);
				var txt = ter+" 인도장<br> 조회할 날짜를 선택하세요";
				var template = `<div class="chat-item is-ktalk" style="visibility: visible;">
	                <div class="bubble has-moving in" style="max-height: 2468px;">
	                <div class="inner">`
	                + txt
	                +`</div>`;
				template += ` <button type="button" class="btn-link is-node"
                    onclick="customCnt2('`+ter+`','`+today+`')">
                    <span>`+today+`</span> 
                </button>`;
                template += ` <button type="button" class="btn-link is-node"
                    onclick="customCnt2('`+ter+`','`+tomorrow+`')">
                    <span>`+tomorrow+`</span> 
                </button>`;
                template += ` <button type="button" class="btn-link is-node"
                    onclick="customCnt2('`+ter+`','`+datomorrow+`')">
                    <span>`+datomorrow+`</span> 
                </button>`;
				document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
		        scrollDown();
		 }
		
		//인도장의 시간당 고객수 띄우기
		 function customCnt2(ter,date) {
			 console.log(date+" - "+ter+" 시간당 고객수 띄우기");
			 clickMenu(ter+"인도장 시간대 별  고객수");
			 
			 $.ajax({
					type : 'GET',
					url : "/common/conffut",
					data : {odeptdate : date},
					success: function(data){
						console.log("ajax성공");
						console.log(data.customers);
						arr = data.customers;
						
						 var txt = ter+" 인도장<br>"+ date +"<br> 탑승시간대 별 고객수 입니다.<hr>";
						 var answer ="";
						for(let i=0; i<24;i++){
							var customer = arr.at(i);
							var hours = customer.hours;
							var count = customer.count;
							console.log(hours+" : "+count);
							answer += hours+"시 : "+count+" 명<br>";
							/* let tmp = data.i;
							console.log(i+"시: "+tmp); */
						}
						 var template = `<div class="chat-item is-ktalk" style="visibility: visible;">
				                <div class="bubble has-moving in" style="max-height: 2468px;">
				                <div class="inner">`
				                + txt
				                + answer
				                +`</div>`;
				         document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
						 scrollDown();
					}
				});
		 }
		
		//시간포맷바꾸는함수
		 function getFormatDate(date){
			    var year = date.getFullYear();              //yyyy
			    var month = (1 + date.getMonth());          //M
			    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
			    var day = date.getDate();                   //d
			    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
			    return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
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