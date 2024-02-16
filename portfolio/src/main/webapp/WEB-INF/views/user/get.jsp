<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../includes/nav.jsp" %>
<style>

	main {
		/* border-style: solid;
	    border-color: black; */
	    
		
		display: flex;
		justify-content: center;
		align-items: stretch;
		
		min-height: 100vh;
	}
	
	.userinfo-left{
		/* border-style: solid;
	    border-color: red; */
	    
	    width:20%;
	    height:300px;
	    text-align:center;

		margin-top:60px;	    
	    position: sticky;
		top: 60px;
		box-shadow: 0px 15px 15px -15px rgba(0, 0, 0, 0.5); /* 하단 그림자 추가 */
	}
	
	.userinfo-left button{
		width:100%;
		height:40px;
		margin-bottom:10px;
		border: none; /* 외곽선 제거 */
   		background-color: transparent; /* 배경 투명하게 설정 */
	}
	
	.userinfo-left button:hover {
	    background-color: rgba(0, 0, 0, 0.1); /* 호버 시 배경색 변경 */
	}
	
	.userinfo-left ul{
		padding:0;
	}
	
	.userinfo-left li{
		/* border-style: solid;
	    border-color: green; */
	    
	    height:36px;
	    
	    list-style: none;
	    
	    font-size: 2rem;
	    
	    margin-bottom:20px;
	}
	
	.userinfo-right{
		/* border-style: solid;
	    border-color: yellow; */
	    
	    width:80%;
	}
	
	.userinfo-right-header{
		/* border-style: solid;
	    border-color: orange; */
	    
	    width:100%;
		height:60px;
	}
	
	.userinfo-modify-area{
		/* border-style: solid;
	    border-color: green; */
	    
	    width:100%;
	    
	}
	
	.user-introduce{
		/* border-style: solid;
	    border-color: red; */
	    
	    display:flex;
	    flex-direction : column;
	    justify-content : center;
	    align-content : center;
	    
	    width:50%;
	    
	    padding:10px;
	    
	    margin-left: auto;
	    margin-right : auto;
	}
	
	.user-profile-image {
    	
   		margin-top : 30px;
   		border-style: solid;
        border-color: orange;
	    width: 250px; /* 프로필 사진의 너비 */
	    height: 250px; /* 프로필 사진의 높이 */
	    border-radius: 50%; /* 원형으로 모양을 만듭니다. 반지름은 너비/높이의 50%입니다. */
	    overflow: hidden;
	    
	    display: flex;
		justify-content : center;
		align-self: center; /* 아이템을 수평으로 가운데 정렬합니다. */
		
		margin-bottom:20px;
	    
	}
	
	.user-profile-image img {
		/* border-style: solid;
        border-color: red; */
           
		width: 100%;
	    height: 100%;
	    object-fit: cover;
	    
	}
	
	.user-introduce > textarea{
		width:100%;
		height:150px;
		
		margin-top:20px;
		margin-bottom:10px;
		
		align-self: center;
		
		border: 2px solid #dddddd !important;
		border-radius: 8px;
		
		outline: none;
		resize: none;
	}
	
	.register-form{
		/* border-style: solid;
	    border-color: orange; */
	    
		width: 50%; /* 전체는 30% */
		
		padding:10px;
		
		margin-left:auto;
		margin-right:auto;
		
		margin-bottom: 40px;
		
		
	}
	.form-body > textarea{
		width:100%;
		height:150px;
		
		margin-top:20px;
		margin-bottom:10px;
		
		align-self: center;
		
		border: 2px solid #dddddd !important;
		border-radius: 8px;
		
		outline: none;
		resize: none;
		
	}
	.register-form > .form-header{
		text-align: center;
		font-size: 25px;
		/* margin-top: 20px; */
		margin-bottom: 20px;
	}
	
	.register-form input , .user-introduce input{
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
	
	.register-form input[type="submit"], .user-introduce input[type="submit"]{
		width: 100%;
	    padding: 7px;
	    background-color: rgba(218,80,80,0.6);
	}
	
	.register-form input[type="button"], .user-introduce input[type="button"]{
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
		
		<div class="userinfo-left">
			<br>
			<h2><strong>${user.nickname }님 반갑습니다</strong></h2>
			
			<br>
			<ul>
				<li>
					<form action="/user/info" method="post">
						<input type="hidden" name="email" value="${user.email }">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<button type="submit">활동 내역</button>
					</form>
				</li>
				<li>
					<form action="/user/get" method="post">
						<input type="hidden" name="email" value="${user.email }">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<button type="submit">내 정보</button>
					</form>
				</li>
				
			</ul>
		</div>
		
		<div class="userinfo-right">
		
			<div class="userinfo-right-header">
			
			</div>
			<!-- userinfo-right-margin-top -->
			
			
			<div class = "userinfo-modify-area">
			
				
				<form class ="register-form" action="/user/modify" method="post">
					<div class = "form-header">
							내 정보 수정
					</div>
					
					<div class="form-body">
							<span> * </span>인스타그램 계정<br>
							<input type="text" name="instagram" value="${user.instagram }" placeholder="인스타그램 계정을 입력해주세요"><br><br>
							
							<span> * </span>자기 소개(게시글 오른쪽에 보이는 소개 입니다)<br>
							<%-- <textarea name="introduce" placeholder="자기소개를 입력해주세요"><c:out value="${user.introduce}" escapeXml="false" /></textarea><br><br> --%>
							<textarea name="introduce" placeholder="자기소개를 입력해주세요">${user.introduce}</textarea>
							<span> * </span>이메일(현재 변경불가)<span id="checkEmailMessage" style="float: right;"></span><br>
							<input type="email" name="email" value="${user.email }" readonly><input type="button" id="checkEmail" value="확인"><br><br>
							<input type="hidden" id="checkEmailResult" value="">
							
							<span> * </span>이름<br>
							<input type="text" name="name" value="${user.name }"><br><br>
							
							<span> * </span>별명(현재 변경불가)<span id="checkNicknameMessage" style="float: right;"></span><br>
							<input type="text" name="nickname" value="${user.nickname }" readonly><input type="button" id="checkNickname" value="확인" ><br><br>
							<input type="hidden" id="checkNicknameResult" value="">
							
							<span> * </span>생일<br>
							<input type="date" name="birth" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${user.birth }"/>'><br><br>
							
							<span> * </span>전화번호 (숫자만 입력해주세요)<br>
							<input type="tel" id="tel" name="tel" value="${user.tel }"><br><br>
							
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							<input type="hidden" name="usernumber" value="${user.usernumber }">
							<input type='submit' value='등록'>
					</div>
					<!-- form-container -->
					
				</form>
				<!-- register-form -->
				
				
			</div>
			<!-- userinfo-modify-area -->
		
		</div>
	</main>


<%@ include file="../includes/footer.jsp" %>

<script>

	
	<c:if test="${not empty successMessage}">
	    alert("${successMessage}");
	</c:if>

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