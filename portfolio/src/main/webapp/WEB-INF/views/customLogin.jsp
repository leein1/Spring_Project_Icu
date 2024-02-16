<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%@ include file="./includes/nav.jsp" %>

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
	
	
	
	.input-email, .input-password, .input-submit {
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
	
	.input-checkbox{
		
	}
	
	.register-form input[type="submit"]{
		width: 100%;
	    padding: 7px;
	    background-color: rgba(218,80,80,0.6);
	}
	
	.register-form input[type="button"]{
		width: 49%;
		padding: 7px;
	    background-color: rgba(235,168,81,0.6);
	}
	
	.register-form span {
	
		margin-left : 10px;
		color: #da4841;
		vertical-align: -1px;
	}
	
	.user-service {
		display:flex;
		justify-content: space-between;
		align-content: center;
		
		margin-top:12px;
	}
	
	.modal input[type="submit"]{
		width: 100%;
	    padding: 7px;
	    background-color: rgba(218,80,80,0.6);
	}
	
	
</style>

	<main>
		<div class="register-image">
		
			<img src="${pageContext.request.contextPath}/resources/images/login.jpg">
		</div>
		<!-- register-image -->
		
		<form class ="register-form" action="/login" method="post" onsubmit="return validateForm()">
			<div class = "form-header">
				로그인
			</div>
			
			<div class="form-body">	
				
				
				<span> * </span>이메일<br>
				<input class="input-email" type="email" name="username" required><br><br>
				
				<span> * </span>비밀번호<br>
				<input class="input-password" type="password" name="password" required><br><br>
				
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				
				<input class="input-checkbox" type="checkbox" name="remember-me">로그인 유지하기
				
				<input class="input-submit" type='submit' value='로그인'>
				<!-- <div class="user-service">
					<input id="find-id" type="button" value="아이디 찾기">
					<input id="change-password" type="button" value="비밀번호 변경">
				</div> -->
			</div>
			<!-- form-container -->
		</form>
		<!-- register-form -->
	</main>
	
	
	<!-- 모달 -->
<!-- <div id="id-modal" class="modal" style="display: none;">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>아이디 찾기</h2>
    <form id="find-id-form">
	    <span> * </span>이메일<br>
		<input class="input-email" type="email" name="username" required><br><br>
	    <span> * </span>이메일<br>
		<input class="input-email" type="email" name="username" required><br><br>
	    
      	<input class="input-submit" type="submit" value="찾기">
    </form>
  </div>
</div>

<div id="password-modal" class="modal" style="display: none;">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>비밀번호 변경</h2>
    <form id="change-password-form">
	    <span> * </span>이메일<br>
		<input class="input-email" type="email" name="username" required><br><br>
	    <span> * </span>이메일<br>
		<input class="input-email" type="email" name="username" required><br><br>
	    
      	<input class="input-submit" type="submit" value="찾기">
    </form>
  </div>
</div> -->

<style>
    /* 모달 스타일 */
    .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0,0,0,0.4);
    }

    .modal-content {
      background-color: #fefefe;
      margin: 15% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 30%;
    }

    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close:hover,
    .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }
  </style>


	<c:if test="${not empty result}">
	
	<!-- <script>
	    var result = '<c:out value="${result}"/>';
	    console.log(result);
    	alert(result);
	</script> -->
	
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
    
 // 버튼을 클릭하면 모달을 열도록 설정
    $("#find-id").click(function() {
      $("#id-modal").css("display", "block");
    });

    // 닫기 버튼을 클릭하면 모달을 닫도록 설정
    $(".close").click(function() {
      $("#id-modal").css("display", "none");
    });

    // 모달 외부를 클릭하면 모달을 닫도록 설정
    $(window).click(function(event) {
      if (event.target == $("#id-modal")[0]) {
        $("#id-modal").css("display", "none");
      }
    });
    
 // 버튼을 클릭하면 모달을 열도록 설정
    $("#change-password").click(function() {
      $("#password-modal").css("display", "block");
    });

    // 닫기 버튼을 클릭하면 모달을 닫도록 설정
    $(".close").click(function() {
      $("#password-modal").css("display", "none");
    });

    // 모달 외부를 클릭하면 모달을 닫도록 설정
    $(window).click(function(event) {
      if (event.target == $("#id-modal")[0]) {
        $("#password-modal").css("display", "none");
      }
    });
</script>

<%-- 
	<h1>Custom Login page</h1>
	
	<h2><c:out value="${error}"/></h2>
	
	<h3><c:out value="${logout}"/></h3>
	
	
	<form method='post' action="/login">
	
		<div>
			<input type="text" name="username" value="admin">
		</div>
		
		<div>
			<input type="text" name="password" value="admin">
		</div>
		
		<div>
			<input type="checkbox" name="remember-me">remember-me
		</div>
		
		<div>
			<input type="submit">
		</div>
		
		<div>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		</div>
	
	</form> --%>
