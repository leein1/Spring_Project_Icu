<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- all or member or admin -->
	<h1>/sample/admin page</h1>
	
	
	<p>principal : <sec:authentication property="principal"/></p>
	<p>UserVO : <sec:authentication property="principal.user"/></p>
	<p>사용자 이름 : <sec:authentication property="principal.user.name"/></p>
	<p>사용자 아이디 : <sec:authentication property="principal.user.email"/></p>
	<p>사용자 권한 리스트 : <sec:authentication property="principal.user.authList"/></p>
	
	
	<a href="/customLogout">logout</a>
</body>
</html>