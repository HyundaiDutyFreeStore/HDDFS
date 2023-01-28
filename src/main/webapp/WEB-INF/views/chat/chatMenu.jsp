<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="hasRole('ROLE_MEMBER')">
	<sec:authentication property="principal.username" var="mid" />
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<a href="${path}/chat/chat2?bang_id=${mid}">채팅</a> 
	<a href="#" onclick="window.open('/chat/customerChat?adminId=admin&myId=${mid}','일대일채팅','width=500,height=500,location=no,status=no,scrollbars=yes');">
	<strong>일대일채팅</strong>
	</a>
</body>
</html>