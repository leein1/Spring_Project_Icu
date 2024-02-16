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
/* 		min-height: calc(100vh - 60px); */
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
	
	.register-form input[name='email'],
	.register-form input[name='nickname']{
		width: 80%;
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
		
			<img src="${pageContext.request.contextPath}/resources/images/register.jpg">
		</div>
		
		<form class ="register-form" action="/user/register" method="post" onsubmit="return validateForm()">
			<div class = "form-header">
					회원가입
			</div>
			
			<div class="form-body">
					<span> * </span>이메일<span id="checkEmailMessage" style="float: right;"></span><br>
					<input type="email" name="email" required><input type="button" id="checkEmail" value="확인"><br><br>
					<input type="hidden" id="checkEmailResult" value="">
					
					<span> * </span>비밀번호<br>
					<input type="password" name="password" oninput="checkPasswordMatch()" required><br><br>
					
					<span> * </span>비밀번호 확인<span id="passwordMatchMessage" style="float: right;"></span><br>
					<input type="password" name="password-check" oninput="checkPasswordMatch()" required><br><br>
					
					<span> * </span>이름<br>
					<input type="text" name="name" required><br><br>
					
					<span> * </span>별명<span id="checkNicknameMessage" style="float: right;"></span><br>
					<input type="text" name="nickname" required><input type="button" id="checkNickname" value="확인" ><br><br>
					<input type="hidden" id="checkNicknameResult" value="">
					
					<span> * </span>생일<br>
					<input type="date" name="birth" required><br><br>
					
					<span> * </span>전화번호 (숫자만 입력해주세요)<br>
					<input type="tel" id="tel" name="tel" required><br><br>
					
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					
					<input type='submit' value='등록'>
			</div>
			<!-- form-container -->
		</form>
	</main>
</body>
</html>
<script>
	

	$('#checkEmail').click(function() {
	    var email = $('input[name="email"]').val();
	
	    $.ajax({
	        url: '/duplicate/getEmailResult',
	        method: 'GET',
	        data : { email: email },
	        contentType: 'application/json',
	        success: function(data) {
	            var messageElement = $('#checkEmailMessage');
	            var resultElement = $('#checkEmailResult');
	            if (data === '1') {
	                messageElement.css('color', 'red').text('존재하는 이메일 입니다');
	                resultElement.val('1');
	               
	            } else if (data === '0') {
	                messageElement.css('color', 'green').text('사용가능한 이메일 입니다');
	                resultElement.val('0');
	                
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('Error:', error);
	            // 오류 발생 시 처리할 내용을 추가합니다.
	        }
	    });
	});
	
	$('#checkNickname').click(function() {
	    var nickname = $('input[name="nickname"]').val();
	
	    $.ajax({
	        url: '/duplicate/getNicknameResult',
	        method: 'GET',
	        data : { nickname: nickname },
	        contentType: 'application/json',
	        success: function(data) {
	            var messageElement = $('#checkNicknameMessage');
	            var resultElement = $('#checkNicknameResult');
	            if (data === '1') {
	                messageElement.css('color', 'red').text('존재하는 별명 입니다');
	                resultElement.val('1');
	            } else if (data === '0') {
	                messageElement.css('color', 'green').text('사용가능한 별명 입니다');
	                resultElement.val('0');
	            } else {
	                // 다른 응답에 대한 처리
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('Error:', error);
	            // 오류 발생 시 처리할 내용을 추가합니다.
	        }
	    });
	});
	
    function checkPasswordMatch() {
        var password = document.getElementsByName("password")[0].value;
        var confirmPassword = document.getElementsByName("password-check")[0].value;
        var message = document.getElementById("passwordMatchMessage");

        if (password !== '' && confirmPassword !== '') {
            if (password === confirmPassword) {
                message.style.color = 'green';
                message.innerHTML = '비밀번호가 일치합니다';
                return true;
            } else {
                message.style.color = 'red';
                message.innerHTML = '비밀번호가 일치하지 않습니다';
                return false;
            }
        } else {
            message.innerHTML = ''; // 필드가 비어 있으면 메시지를 지웁니다.
            return false;
        }
    }
    
	$("#tel").keyup(function (){
		chk_input_filter("number", $("#tel"));
	});
    
	function chk_input_filter(type, obj){

		var str = $(obj).val();

		if(type == 'alphabet'){
			//영문만 허용
			$(obj).val(str.replace(/[^a-z]/gi,""));
		}else if(type == 'number'){
			//숫자만 허용
			$(obj).val(str.replace(/[^0-9]/gi,""));
		}else if(type == 'alphabet_number'){
			//영문 , 숫자만 허용
			$(obj).val(str.replace(/[^a-z0-9]/gi,""));
		}else if(type == 'non_spec'){
			//특수문자 비허용
			$(obj).val(str.replace(/[~!@#$%^&*()_+|<>?:;{}`\-\=\\\,.'"\[\]/]/gi,""));
		}else if(type == 'name'){
			//특수문자, 숫자 비허용
			$(obj).val(str.replace(/[~!@#$%^&*()_+|<>?:;{}`\-\=\\\,.'"\[\]/0-9]/gi,""));
		}
	}    

    function validateForm() {
        var requiredFields = document.querySelectorAll('input[required]');
        for (var i = 0; i < requiredFields.length; i++) {
            if (requiredFields[i].value.trim() === '') {
                alert('필수 입력란을 모두 채워주세요.'); // 비어있는 필수 입력란 알림
                requiredFields[i].focus(); // 비어있는 필수 입력란으로 포커스 이동
                return false; // 폼 제출 방지
            }
        }

        if (!checkPasswordMatch()) {
            alert('비밀번호가 일치하지 않습니다.'); // 비밀번호 확인 알림
            document.getElementsByName("password-check")[0].focus(); // 비밀번호 확인 입력란으로 포커스 이동
            return false; // 폼 제출 방지
        }
        
        var emailResult = $('#checkEmailResult').val(); // 수정된 부분
        var nicknameResult = $('#checkNicknameResult').val(); // 수정된 부분
        
        if(emailResult !== '0' || nicknameResult !== '0'){
        	alert("이메일 또는 별명 중복 확인을 해주세요");
        	return false;
        }

        return true; // 모든 필수 입력란이 채워져 있고 비밀번호가 일치하면 폼 제출 허용
    }
    
    
    
    
</script>