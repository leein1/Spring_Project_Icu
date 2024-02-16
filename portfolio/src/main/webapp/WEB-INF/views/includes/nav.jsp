<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<style type="text/css">
		html, body {
		    
		    margin: 0;
		    padding: 0;
		    background-color: white;
		}
		
        nav{
            /* border-style: solid;
            border-color: orange; */

            background-color: rgba(1, 1, 1, 0);
            
			top: 0;
	    	left: 0;
	   		right: 0;
			z-index:999;
			position: fixed;
			
            width:100%;
            height: 60px;
            
            display: flex; /* Add this line */
            justify-content: center; /* Add this line */
            align-items: center; /* Add this line */
            text-align: center;
        }
        
        a {
		  text-decoration: none; /* 링크 텍스트에 밑줄 제거 */
		  color: inherit; /* 링크 색상을 부모 요소의 색으로 상속 */
		  outline: none; /* 클릭했을 때의 아웃라인 제거 (접근성을 고려할 필요가 있음) */
		}
        
        .nav-left-margin, .nav-right-margin{
       		/* border-style: solid;
            border-color: gray; */
            
            width: 50px;
        }

        .logo {
            /* border-style: solid;
            border-color: blue; */

            width: 140px;
            height: 60px;
        }
        .nav-ul-group{
        	/* border-style: solid;
            border-color: fuchsia; */
            
        	width:100%;
        	height:60px;
        	display: flex; /* Add this line */
            justify-content: space-between; /* Add this line */
            align-items: center; /* Add this line */
        }

		.nav-ul-group > ul{
            /* border-style: solid;
            border-color: red; */

			list-style: none;
			height:60px;
			
			padding:0;
            display: flex; /* Add this line */
            justify-content: center; /* Add this line */
            align-items: center; /* Add this line */
		}
		
		.nav-ul-menu1{
			margin-left : 80px;
		}

        .nav-ul-group > ul > li{
           	/* border-style: solid;
            border-color: green; */
            
            height:40px;
           	font-size: 16px;
           	font-weight: bold;
           	
           	padding-left:5px;
           	padding-right:5px;
           	
           	display: flex; /* 세로 가운데 정렬을 위해 추가 */
 			align-items: center; /* 세로 가운데 정렬을 위해 추가 */
        }
        
        .nav-ul-group > ul > li:not(:last-child) {
 			margin-right: 30px; /* 마지막 요소를 제외한 모든 li 요소에 오른쪽 여백을 30px로 설정합니다. */
		}
		
		.nav-ul-group > ul > li:hover{
			background-color: rgba(200,200,200,0.7);
		  	border-radius: 10px;
		}

        
        
        .dropdown-menu {
       		/* border-style: solid;
            border-color: red; */
            
            border-radius: 10px; /* 왼쪽 하단 모서리에 radius 적용 */
  			/* border-bottom-right-radius: 10px; */ /* 오른쪽 하단 모서리에 radius 적용 */
		 	display: none; /* 초기에는 숨김 */
		  	position: absolute;
		  	background-color: rgba(255,255,255,1);
		  	min-width: 200px;
		  	top:60px;
		  	padding:5px;
		  	
		  	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.5); /* 수평 오프셋, 수직 오프셋, 흐림 정도, 색상 */
    /* 기존 CSS 속성들... */
		  
		}
		
		.dropdown-menu li {
			/* border-style: solid;
            border-color: orange; */
            
		 	padding: 12px 16px;
		  	text-decoration: none;
		  	display: block;
		  	color: #000;
		}
		
		.dropdown-menu li:hover {
		  	background-color: rgba(200,200,200,0.7);
		  	border-radius: 10px;
		}
		
		
		.modal {
		  display: none; /* 기본으로 숨기기 */
		  position: fixed;
		  z-index: 1;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  overflow: auto;
		  background-color: rgba(0, 0, 0, 0.4);
		}
		
		.modal-content {
		  background-color: #fefefe;
		  margin: 15% auto;
		  padding: 20px;
		  border: 1px solid #888;
		  width: 80%;
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
</head>
<body>

	<nav id="nav">
        <div class="nav-left-margin">
            

        </div>

		<a href="/"><img class = "logo" src="${pageContext.request.contextPath}/resources/images/logo.svg"></a>
		
		<div class="nav-ul-group">
	        <ul class="nav-ul-menu1">
	            
	            <li><a href="/photoboard/list">사진 게시판</a></li>
	            <li id="menu2">게시판 기능 추가중^^
			        <ul class="dropdown-menu">
			          	<li>추가 예정</li>
			          	<li>추가 예정</li>
			        </ul>
		      	</li>
	            
	        </ul>
	        
	        <ul class= "nav-ul-menu2">
	       		
  				<sec:authorize access="isAuthenticated()">
  					<li>
	  					<form id="userInfoForm" action="/user/info" method="post">
	  						<input type="hidden" name="email" value='<sec:authentication property="principal.user.email"/>'>
	  						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	  						<input class="userinfo-input" type="submit" value="내정보" style="display: none;">
	  						<span class="userinfo-li">회원정보</span>
	     				</form>
     				</li>
     				
      				<li>
						<form id="logoutForm" action="/customLogout" method="post">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
							<input class="logout-input" type="submit" value="로그아웃" style="display: none;">
							<span class="logout-li">로그아웃</span>
						</form>
					</li>
  				</sec:authorize>
      				
		        <sec:authorize access="isAnonymous()">
		            <li><a href="/user/register">회원가입</a></li>
           			<li><a href="/customLogin">로그인</a></li>
           			<!-- <li><button>신고하기</button></li> -->
           			
		        </sec:authorize>
				
	        </ul>
		</div>

		<div class="nav-right-margin">
            

        </div>
	</nav>
	
	
	<!-- 모달 -->
<div id="reportModal" class="modal" style="display: none;">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>신고하기</h2>
    <form id="reportForm">
      <label for="reportNumber">신고 글 번호:</label>
      <input type="text" id="reportNumber" name="reportNumber"><br>
      <label for="reportContent">신고 내용:</label>
      <textarea id="reportContent" name="reportContent"></textarea><br>
      <label for="reporterName">신고자 이름:</label>
      <input type="text" id="reporterName" name="reporterName"><br>
      <input type="submit" value="제출">
    </form>
  </div>
</div>

<script>
	function getCurrentUrl() {
	    return window.location.pathname;
	}

	// 현재 URL이 /user/login 또는 /user/register인 경우에만 실행되는 스크립트
	if (getCurrentUrl() === '/customLogin' || getCurrentUrl() === '/user/register') {
	    // /user/login 또는 /user/register일 때 실행할 스크립트
	    document.querySelector('.nav-left-margin').style.display = 'none';
	    document.querySelector('nav ul.nav-ul-menu1').style.display = 'none';
	    document.querySelector('nav ul.nav-ul-menu2').style.display = 'none';
	}
	
	$(window).scroll(function() {
	    var scroll = $(window).scrollTop();

	    // 스크롤 위치에 따라 배경색 조절
	    if (scroll > 0) {
	        // 스크롤이 발생한 경우
	        $('nav').css('background-color', 'rgba(255, 255, 255, 1)');
	    } else {
	        // 스크롤이 발생하지 않은 경우
	        $('nav').css('background-color', 'rgba(1, 1, 1, 0)');
	    }
	});
	  
	  
	  $(document).ready(function() {
		  $(".userinfo-li").click(function() {
	            $("#userInfoForm").submit();
	        });

	        $(".logout-li").click(function() {
	            $("#logoutForm").submit();
	        });
		  
		  
		  $('#menu2').click(function(e) {
		    e.stopPropagation(); // 상위 요소로 이벤트 전파 방지
		    $('.dropdown-menu').toggle(); // 클릭 시 드롭다운 메뉴를 숨기거나 보이게 함
		  });

		  // Document 클릭 시 드롭다운 메뉴가 열려있는 경우 닫기
		  $(document).click(function(event) {
		    var $target = $(event.target);
		    if (!$target.closest('.nav-ul-menu1').length && 
		        $('.dropdown-menu').is(":visible")) {
		      $('.dropdown-menu').hide();
		    }
		  });
		  
		  
		// "신고하기" 버튼 클릭 이벤트 처리
		  $('nav ul.nav-ul-menu2 button').click(function(e) {
		    e.preventDefault(); // 기본 버튼 동작 방지
		    $('#reportModal').css('display', 'block'); // 모달 표시
		  });

		  // 모달 닫기 버튼 클릭 이벤트 처리
		  $('.close').click(function() {
		    $('#reportModal').css('display', 'none'); // 모달 숨기기
		  });

		  // 모달 외부 클릭으로 닫기
		  $(window).click(function(event) {
		    if (event.target === document.getElementById('reportModal')) {
		      $('#reportModal').css('display', 'none'); // 모달 숨기기
		    }
		  });

		  // 폼 제출 처리
		  $('#reportForm').submit(function(e) {
		    e.preventDefault(); // 기본 폼 제출 방지
		    // 폼 제출 로직 처리 (예: 서버로 데이터 전송)
		    // $('#reportNumber').val() 등을 사용하여 폼 값에 접근할 수 있습니다.
		    // 제출 후에 필요하다면 모달을 숨길 수 있습니다.
		    $('#reportModal').css('display', 'none'); // 모달 숨기기
		  });
		  
		});
</script>