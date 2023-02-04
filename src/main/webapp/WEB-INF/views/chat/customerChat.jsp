<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="hasRole('ROLE_MEMBER')">
	<sec:authentication property="principal.username" var="loginId" />
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script type="text/javascript" src="date.js"></script>
</head>

<c:set var="path" value="${pageContext.request.contextPath }" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">

<body id="smartchat" class="smartchat themeA">
	<div class="wrapper">
		<div class="header">
			<div class="header-inner">
				<!-- Title -->
				<h1>
					<span class="logo">현대백화점 인터넷면세점 고객센터 실시간 상담</span>
				</h1>
			</div>
		</div>
		<div class="container">
			<div class="contents">
				<div id="intro" class="intro-wrap">
					<!-- 인트로 캐릭터 (채널별 표시) -->
					<div class="intro-character" style="padding: 10px;">
						<p>1:1 실시간 상담</p>

						<!-- 	<div id="subIntroMsg"
							style='font-size: 14px; font-weight: normal; text-align: center; padding-top: 10px;'>
							현대백화점인터넷면세점 고객센터입니다. 무엇을 도와드릴까요?</div> -->

						<!-- <div class="characters" style="margin: 10px auto 0;">
								<span class=""><img
									src="/resources/images/hddfs.png"></span>
							</div> -->
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
			<!-- 
			<button type="button" class="btn-gohome" title="홈 버튼"
				onclick="home();"></button>
			-->
			<div class="chat-forms">
				<form id="f-chat-wrap" method="post" class="forms"
					onsubmit="return false;" autocomplete="off">
					<!-- 검색어 입력 부분  -->
					<label for="inp-chat"
						style="position: absolute; width: 1px; height: 1px; top: 0; left: 0; font-size: 1px; overflow: hidden;">검색어</label>
					<input type="text" class="inp-chat" id="inp-chat"
						placeholder="질문을 입력하세요">

					<!--  메시지 전송 버튼 -->
					<button type="submit" class="btn-send" title="전송"></button>
				</form>
			</div>


		</div>
	</div>


	<script>
	//const adminsocket = new SockJS('http://localhost:8080/adminsocket');
	const adminsocket = new SockJS('/adminsocket');
	//const adminsocket = new SockJS('http://192.168.0.24:8080/adminsocket');
	//const adminsocket = new WebSocket('ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/adminsocket');
	adminsocket.onopen = function() {
		console.log("소켓열림");
		adminsocket.send("memberConnected");
	}
	
	//새로운 채팅이 보내지면
	//전송 버튼 누르는 이벤트
		$(".btn-send").on("click", function(e) {
			//console.log("http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/adminsocket");
			console.log("전송버튼");
			let txt = $("#inp-chat").val();
			var date = new Date();
			var adminChatRoomNo = '${loginId}';
	
			if(txt!=""){
				//로그인한사람(고객)이 관리자에게 보낸다
				sendChat('${loginId}', '${adminInfo.mid}', txt, date,adminChatRoomNo);
				$('#inp-chat').val("");
			}
		});
	
		//메세지 오면
		adminsocket.onmessage = function(e) {
			let data = JSON.parse(e.data);
			let otherUsid = "관리자";
			
			//이전메세지보내기 불러오기
			if(data.prev != null){
				console.log("data.prev: "+data.prev[0].adminChatContent);
				let allChatList = new Array();
				$.each(data.prev,function(i,v){
					allChatList[i]=v; //배열 안에 value를 집어넣는다.
				});
				//지금까지 대화내용 다시 띄워준다
				$.each(allChatList,function(i,v){
					console.log("v:"+v['adminChatDate']);
					/* var date = v['adminChatDate']; */
					var dateInfo =formatDate(v['adminChatDate']);
					console.log("형식변환: "+formatDate(v['adminChatDate']));
					
					//발신인==나, 수신인==관리자 (내가보낸메세지이면)
	 				if(v['adminFirstUsid']=='${myInfo.mid}'){ 
	 					var template = `<div class="chat-item is-customer"><div class="bubble has-moving in" style="max-height: 105px;"><div class="inner">`+ v['adminChatContent'] +`</div></div>`;
	 					template += `<div class="date">`+dateInfo+`</div></div>`;
	 					document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
	 				} 
	 				//발신인==관리자, 수신인==나 (관리자가 보낸 메세지이면- 내가받음)  
	 	         	if(v['adminSecondUsid']=='${myInfo.mid}'){
	 	         		var template = `<div class="chat-item is-ktalk" style="visibility: visible;">`;
	 	         			template += `<span class="name"> `+otherUsid+`</span>`;
	 	         			template += `<div class="bubble has-moving in" style="max-height: 2468px;">`;
	 	         			template += `<div class="inner">`+v['adminChatContent']+`</div></div>`;
	 	                	template += `<div class="date">`+dateInfo+`</div></div>`
	 	         		document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);		
					}
				});
			}
			//그이후 전송되는 메세지 보여주기
			else{
				console.log("이건 리스트가 아님");
				console.log("보낸사람:"+data.adminFirstUsid);
				console.log("채팅내용:"+data.adminChatContent);
				console.log("받는사람:"+data.adminSecondUsid);
				//내가보냈으면
				if(data.adminFirstUsid=='${myInfo.mid}'){
					var template = `<div class="chat-item is-customer"><div class="bubble has-moving in" style="max-height: 105px;">
 			            <div class="inner">`+ data.adminChatContent +`</div></div>`;
 			        template += `<div class="date">`+ formatDate(data.adminChatDate)+`</div></div>`;
 					document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
				}
				//내가받았으면
				else if(data.adminSecondUsid=='${myInfo.mid}'){
					var template = `<div class="chat-item is-ktalk" style="visibility: visible;">`;
						template += `<span class="name"> `+otherUsid+`</span>`;
						template += `<div class="bubble has-moving in" style="max-height: 2468px;">`;
						template += `<div class="inner">` +data.adminChatContent +`</div></div>`;
	 	            	template += `<div class="date">`+formatDate(data.adminChatDate)+`</div></div>`
	 	         	document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
				
				}
			}
			scrollDown();
		}
	
	//메세지 전송 함수
	function sendChat(adminFirstUsid, adminSecondUsid, adminChatContent,
			adminChatDate,adminChatRoomNo) {
		console.log("senChat함수실행 roomNo: "+adminChatRoomNo);
		adminsocket.send(JSON.stringify(new AdminChat(adminFirstUsid,
				adminSecondUsid, adminChatContent, adminChatDate,adminChatRoomNo)));
	};
	
	function AdminChat(adminFirstUsid, adminSecondUsid, adminChatContent,
			adminChatDate,adminChatRoomNo) {
		this.adminFirstUsid = adminFirstUsid;
		this.adminSecondUsid = adminSecondUsid;
		this.adminChatContent = adminChatContent;
		this.adminChatDate = adminChatDate;
		this.adminChatRoomNo = adminChatRoomNo;
	
	};

	adminsocket.onclose = function() {
		console.log('onclose 실행');
	};
	
	// 페이지 맨 하단으로 이동
    function scrollDown() {
        setTimeout(function () {
            $('.contents').animate({
                'scrollTop': $('.contents')[0].scrollHeight
            }, 300);
        }, 100);
    }
	
  //시간 형식 바꾸기
    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();
        	hour = '' +d.getHours();
        	minute = '' +d.getMinutes();
        	second = '' +d.getSeconds();
        	

        if (month.length < 2) 
            month = '0' + month;
        if (day.length < 2) 
            day = '0' + day;
        console.log("hour의 길이: "+hour.length);
        if (hour.length < 2)
        	hour = '0' + hour;
        if (minute.length < 2)
        	minute = '0'+minute;
        if (second.length < 2)
        	second = '0'+second;
        

        return [year, month, day].join('-') +" "+ [hour, minute, second].join(':');
    }
	
 	// 현재시간 반환 (ex; 오전 6:25)
    function getCurrentTime() {
        var currentTime = moment().format('A h:mm');

        currentTime = currentTime.replace(/AM/gi, '오전');
        currentTime = currentTime.replace(/PM/gi, '오후');

        return currentTime;
    };
	
	
</script>