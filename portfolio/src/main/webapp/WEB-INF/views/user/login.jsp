<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/nav.jsp" %>
<style>

	main {
		/* border-style: solid;
	    border-color: black; */
	    
		
		display: flex;
		justify-content: center;
		/* align-items: center; */
		align-items: stretch;
		
		min-height: 100vh;
		/* min-height: calc(100vh - 60px); */
		/* margin-top: 60px; */
		
	}
	
	.register-image {
		/* border-style: solid;
	    border-color: red; */
	    
		width : 70%;
		height : 100vh;
/* 		height : calc(100vh - 60px); */
		overflow: hidden;
	}
	
	.register-image img {
		/* border-style: solid;
	    border-color: orange; */
	    
		width : 100%;
		height :  100%;
		object-fit: cover;
	}
	
	.register-form{
		/* border-style: solid;
	    border-color: red; */
	    
		width: calc(30% - 100px); /* 전체는 30% */
		
		margin-right:50px;
		margin-left:50px;
		padding:0;
		
		align-self: center;
		
	}
	
	.register-form > .form-header{
		text-align: center;
		font-size: 25px;
		/* margin-top: 20px; */
		margin-bottom: 20px;
	}
	
	
	
	.register-form input{
		width: 100%;
		border: 2px solid #dddddd !important;
		font-size: 1rem;
		letter-spacing: -0.04rem;
		border-radius: 8px;
		padding: 16px;
		margin-top: 12px;
		box-sizing: border-box;
		text-align: center;
		height: 36px;
	}
	
	
	.register-form input[type="submit"]{
		width: 100%;
	    padding: 7px;
	    background-color: rgba(218,80,80,0.6);
	}
	
	.register-form input[type="button"]{
		width: 20%;
		padding: 7px;
	    background-color: rgba(235,168,81,0.6);
	}
	
	.register-form span {
	
		margin-left : 10px;
		color: #da4841;
		vertical-align: -1px;
	}
	
	
</style>

	<main>
		<div class="register-image">
		
			<img src="${pageContext.request.contextPath}/resources/images/login.jpg">
		</div>
		<!-- register-image -->
		
		<form class ="register-form" action="/user/login" method="post" onsubmit="return validateForm()">
			<div class = "form-header">
				로그인
			</div>
			
			<div class="form-body">
					<span> * </span>이메일<br>
					<input type="email" name="email" required><br><br>
					
					<span> * </span>비밀번호<br>
					<input type="password" name="inputPassword" required><br><br>
					
					
					<input type='submit' value='로그인'>
					<input type="button" value="아이디 찾기">
					<input type="button" value="비밀번호 변경">
			</div>
			<!-- form-container -->
		</form>
		<!-- register-form -->
	</main>
	<c:if test="${not empty result}">
	
	<script>
	    var result = '<c:out value="${result}"/>';
	    console.log(result);
    	alert(result);
	</script>
	
</c:if>
</body>
</html>
<script>

	
    function validateForm() {
        var requiredFields = document.querySelectorAll('input[required]');
        for (var i = 0; i < requiredFields.length; i++) {
            if (requiredFields[i].value.trim() === '') {
                alert('필수 입력란을 모두 채워주세요.'); // 비어있는 필수 입력란 알림
                requiredFields[i].focus(); // 비어있는 필수 입력란으로 포커스 이동
                return false; // 폼 제출 방지
            }
        }

        return true; // 모든 필수 입력란이 채워져 있고 비밀번호가 일치하면 폼 제출 허용
    }
    
</script>