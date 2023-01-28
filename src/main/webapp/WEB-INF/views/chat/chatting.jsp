<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script
	src="https://cdn.hddfs.com/front/js/KO/jquery-1.12.4.min.js?ver=18"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
</head>
<body>
<div class="container">
	<div class="col-6">
		<label><b>채팅방</b></label>
	</div>
	<div>
		<div id="msgArea" class="col">
		
		</div>
		<div class="col-6">
		<div class="input-group mb-3">
			<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
			</div>
		</div>
		</div>
	</div>
	<div class="col-6">
	</div>
</div>

<script type="text/javascript">
console.log("param: ${param.mid}");
//전송 버튼 누르는 이벤트
$("#button-send").on("click", function(e) {
	var txt = $("#msg").val();
	sendMessage(txt,'${userid}');
	$('#msg').val('')
	console.log("전송"+'${userid}');
});
var sock = new SockJS('http://localhost:8080/adminsocket');
sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;

function sendMessage(txt,mid) {
	console.log('메세지보내는 방번호: '+mid);
	console.log('메세지보내는 txt: '+txt);
	sock.send(JSON.stringify(new AdminChat(txt,mid)));
}

function AdminChat(txt,mid){
	this.txt = txt;
	this.mid = mid;
}
//서버에서 메시지를 받았을 때
function onMessage(msg) {
	
	var data = msg.data;
	var sessionId = null; //데이터를 보낸 사람
	var message = null;
	
	var arr = data.split(":");
	
	for(var i=0; i<arr.length; i++){
		console.log('arr[' + i + ']: ' + arr[i]);
	}
	
	var cur_session = '${userid}'; //현재 세션에 로그인 한 사람
	console.log("cur_session : " + cur_session);
	
	sessionId = arr[0];
	message = arr[1];
	
    //로그인 한 클라이언트와 타 클라이트를 분류하기 위함
	if(sessionId == cur_session){
		console.log("지금은 내가 말함");
		var str = "<div class='col-6'>";
		str += "<div class='alert alert-secondary'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str);
	}
	else{
		console.log("지금은 남이 말함");
		var str = "<div class='col-6'>";
		str += "<div class='alert alert-warning'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str);
	}
	
}
//채팅창에서 나갔을 때
function onClose(evt) {
	
	var user = '${userid}';
	var str = user + " 님이 퇴장하셨습니다.";
	
	$("#msgArea").append(str);
}
//채팅창에 들어왔을 때
function onOpen(evt) {
	
	var user = '${userid}';
	var str = user + "님이 입장하셨습니다.";
	
	$("#msgArea").append(str);
}

</script>
</body>
</html>