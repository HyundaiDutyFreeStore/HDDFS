<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<sec:authentication property="principal.username" var="loginId" />
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>웹소켓 채팅</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
</head>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
#totaldiv{
	background-color:#ffcc66;
	margin-right: 5%;
    margin-bottom:5%;
    margin-left:5%;
    margin-top:2%;
    border-radius:20px;
    height:100%;
}

#messageWindow {
	background: black;
	color: greenyellow;
}
#inputMessage {
	width: 85%;
	height: 5%;
	border: none;
	background-color:#eeeeee;
	border-radius:10px;
	margin-left:0.5%;

}
#btn-submit{
	border-color: #ffcc66;
    color: white; 
    background-color: #003478;
    width:10%;
    height:5%;
    border-radius:10px;
    margin-left:1%;



}

#btn-submit:hover,
#btn-submit:focus {
    background-color: #ffcc66;
    border-color: #003478;
    color: #003478; 

}
#main-container {
/* 	width: 600px;
	height: 680px;
	border: 1px solid black;
	margin: 10px;
	display: inline-block;
	font-family: 'Noto Serif KR', serif; */
	padding-right: 20%;
    padding-bottom:20%;
    padding-left:20%;
    padding-top:2%;
    font-family: 'Noto Serif KR', serif;
	overflow:hidden;
}
#chat-container {
	vertical-align: bottom;
	border: none;
	border-radius:30px;
	margin: 10px;
	min-height: 85%;
	max-height: 85%;
	/* overflow: scroll; */
	overflow-y:scroll;
	overflow-x: hidden;
	background: #003478;
	background-image:url("${path}/resources/images/admin/chatbot.png");
	background-repeat:no-repeat;background-position: center;
	padding:10px;


}
 ::-webkit-scrollbar{
 	display:block;
 }
.chat {
	font-size: 20px;
	color: black;
	margin: 20px;
	min-height: 20px;
	padding: 10px;
	min-width: 50px;
	text-align: left;
	height: auto;
	word-break: break-all;
	background: #ffffff;
	width: auto;
	display: inline-block;
	border-radius: 10px 10px 10px 10px;

}
/* .notice {
	color: #607080;
	font-weight: bold;
	border: none;
	text-align: center;
	background-color: #9bbbd4;
	display: block;
} */
.my-chat {
	text-align: right;
	background: #ffcc66;
	border-radius: 10px 10px 10px 10px;
	margin-right:1px;
	padding:10px;
}
#bottom-container {
	margin: 10px;
	width:100%;
}
.chat-info {
	color: #eeeeee;
	font-size: 12px;
	text-align: right;
	padding: 20px;
	padding-top: 0px;
}
.chat-box {
	text-align: left;
}
.my-chat-box {
	text-align: right;
}



/*추가*/
.board_list_head {
    border-top: 3px solid #003478;
    border-bottom: 2px solid #003478;
    background-color:#003478;
    color:#ffcc66;
    border-radius:10px;
    font-family: 'Noto Serif KR', serif;
    padding: 10px 0;
   
}

.board_list_head > div{
    display: inline-block;
    text-align: center;
    font-size: 25px; /*본문글자크기*/
    font-weight: 600;
}


</style>

<section id="content">
<div id="totaldiv">
	<div id="main-container">  

		<div id="chat-container"></div> 

		<div id="bottom-container">

			<input id="inputMessage" type="text"> 
			<input id="btn-submit"     
				type="submit" value="전송">

		</div>
	</div>
	</div>
</section>

<script>
	const adminsocket = new SockJS('http://localhost:8080/adminsocket');
	adminsocket.onopen = function() {
		console.log("소켓열림");
		adminsocket.send("memberConnected");
	}
	
	//새로운 채팅이 보내지면
	//전송 버튼 누르는 이벤트
		$("#btn-submit").on("click", function(e) {
			console.log("전송버튼");
			let txt = $("#inputMessage").val();
			var date = new Date();		
	
			if(txt!=""){
				//로그인한사람(관리자)이 고객에게 보낸다
				sendChat('${loginId}', '${memberInfo.mid}', txt, date);
				$('#inputMessage').val("");
			}
		});
	
		//메세지 오면
		adminsocket.onmessage = function(e) {
			let data = JSON.parse(e.data);
			let otherUsid = "${memberInfo.mid}";	//상대방(고객아이디)
			console.log("이채팅방고객Id: "+otherUsid);
			//이전메세지보내기 불러오기
			if(data.prev != null){
				console.log("data.prev: "+data.prev[0].adminChatContent);
				let allChatList = new Array();
				$.each(data.prev,function(i,v){
					allChatList[i]=v; //배열 안에 value를 집어넣는다.
				});
				//지금까지 대화내용 다시 띄워준다
				$.each(allChatList,function(i,v){
					console.log("v:"+v['adminChatContent']);
					console.log("발신인:"+v['adminFirstUsid']);
					console.log("수신인:"+v['adminSecondUsid']);
					
					//발신인==관리자, 수신인==이채팅방고객 (내가보낸메세지이면)
	 				if(v['adminFirstUsid']=='${adminInfo.mid}' && v['adminSecondUsid'] == otherUsid){ 
						
	 					$('#chat-container').append("<div class='my-chat-box'><div class='chat my-chat'>"
									+ v['adminChatContent']
									+ "</div></div>"); 
	 				} 
	 				//발신인==이채팅방고객, 수신인==관리자 (관리자가 보낸 메세지이면- 내가받음)  
	 	         	if(v['adminFirstUsid'] == otherUsid && v['adminSecondUsid']=='${adminInfo.mid}'){
	 	         
	 	         		$('#chat-container').append("<div class='chat-box'><div class='chat'>"
									+ v['adminChatContent']
									+ "</div></div>"); 
										
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
				if(data.adminFirstUsid=='${adminInfo.mid}' && data.adminSecondUsid==otherUsid){
					$('#chat-container').append("<div class='my-chat-box'><div class='chat my-chat'>" + data.adminChatContent + '</div></div>');
				}
				//내가받았으면
				else if(data.adminSecondUsid=='${adminInfo.mid}' && data.adminFirstUsid==otherUsid){
					$('#chat-container').append("<div class='chat-box'><div class='chat'>" + data.adminChatContent + '</div></div>');
				}
			}
			
		}
	
	//메세지 전송 함수
	function sendChat(adminFirstUsid, adminSecondUsid, adminChatContent,
			adminChatDate) {
		console.log("senChat함수실행");
		adminsocket.send(JSON.stringify(new AdminChat(adminFirstUsid,
				adminSecondUsid, adminChatContent, adminChatDate)));
	};
	
	function AdminChat(adminFirstUsid, adminSecondUsid, adminChatContent,
			adminChatDate) {
		this.adminFirstUsid = adminFirstUsid;
		this.adminSecondUsid = adminSecondUsid;
		this.adminChatContent = adminChatContent;
		this.adminChatDate = adminChatDate;
		//this.adminChatFile = adminChatFile;
	
	};

	adminsocket.onclose = function() {
		console.log('onclose 실행');
	};
	
	
	
</script>

