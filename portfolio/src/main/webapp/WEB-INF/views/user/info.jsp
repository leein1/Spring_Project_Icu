<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ include file="../includes/nav.jsp" %>
<style>

	main {
		/* border-style: solid;
	    border-color: black; */
	    
		
		display: flex;
		justify-content: center;
		align-items: stretch;
		
		min-height: 100vh;
		max-height: 100vh;
		
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
	
	.userinfo-right-body{
		/* border-style: solid;
	    border-color: blue; */
	    
	    width:100%;
	}
	
	.userinfo-right-body > .list-area{
		/* border-style: solid;
	    border-color: red; */
	    
	    width:100%;
	    
	    display: flex;
	    justify-content: left;
	    align-content: center;
	}
	
	.list-area li{
		list-style: none;
	}
	
	.list-nav{
		/* border-style: solid;
	    border-color: purple; */
	    
		display: flex;
	    justify-content: center;
	    align-content: center;
	    
	    margin-top:10px;
	    margin-bottom:10px;
	    
	    height: 30px;
	}
	
	.list-nav > div{
		display: flex;
        justify-content: center;
        align-items: center;
	}
	
	.list-form{
	
		/* border-style: solid;
	    border-color: purple; */
	    
		display: flex;
	    justify-content: center;
	    align-content: center;
	    
	    margin-top:10px;
	    margin-bottom:10px;
	    
	    height: 30px;
	}
	
	.list-form > div{
		display: flex;
        justify-content: center;
        align-items: center;
        
        
	}
	
	.list-form:hover {
        /* 원하는 스타일을 여기에 추가하세요. 예를 들어 배경색을 바꾸고 싶다면 */
        background-color: lightgray;
        /* 다른 스타일을 추가하려면 위와 같은 방식으로 추가하세요. */
    }
	
	.userinfo-right-body > .list-area > .photoboard-list{
		/* border-style: solid;
	    border-color: fuchsia; */
	    
		width:calc(50% - 20px);
		
		padding : 10px;
		
	}
	
	.userinfo-right-body > .list-area > .reply-list{
		/* border-style: solid;
	    border-color: fuchsia; */
	    
		width:calc(50% - 20px);
		
		padding : 10px;
		
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
	
	.graph-area{
		display:flex;
		justify-content: center;
		align-content: center;
	}
	canvas{
		/* border-style: solid;
	    border-color: green; */
	    margin-top : 10px;
	    box-sizing: border-box;
	    width : 200px;
	    height: 200px;
	    padding:0;
	    margin:0;
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
		<!-- userinfo-left -->
			
		<div class="userinfo-right">
		
			<div class="userinfo-right-header">
			</div>
			<!-- userinfo-right-margin-top -->
			
			<div class="userinfo-right-body">
				<div class="graph-area">
				
					<input class="photoboardListCnt" type="hidden" value="${photoboardList.size() }">
					<input class="replyListCnt" type="hidden" value="${replyList.size() }">
			
					<canvas id="content-reply-chart"></canvas>
					
				</div>
				<!-- graph-area -->
				<div class="list-area">
				
					<div class="photoboard-list">
					
						<h3 style="text-align: center;">작성한 게시글 목록 ( ${photoboardList.size() } 개)</h3>
						
						<div class="list-nav">
							<div class="list-nav-header" style="width:15%;">
								<strong>카테고리</strong>
							</div>
							<div class="list-nav-body" style="width:50%;">
								<strong>제목</strong>
							</div>
							<div class="list-nav-body2" style="width:15%;">
								<strong>댓글 갯수</strong>
							</div>
							<div class="list-nav-footer" style="width:20%;">
								<strong>작성일</strong>
							</div>
						</div>
						<!-- list-nav -->
						
						<c:forEach items="${photoboardList}" var="photoboard">
							<form class="list-form" action="/photoboard/get" method="get">
							
								<div class="list-header" style="width:15%;">
									${photoboard.category }
								</div>
								<div class="list-body" style="width:50%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
									${photoboard.title } 
								</div>
								<div class="list-body2" style="width:15%;">
									${photoboard.replycnt } 
								</div>
								<div class="list-footer" style="width:20%;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${photoboard.createdate }"/>
								</div>
								
								<input type="hidden" name="pbno" value="${photoboard.pbno }">
							</form>
						</c:forEach>
						
					</div>
					<!-- photoboard-list -->
					
					<div class="reply-list">
					
						<h3 style="text-align: center;">작성한 댓글 목록 ( ${replyList.size() } 개)</h3>
						
						<div class="list-nav">
							<!-- <div class="list-nav-header" style="width:15%;">
								<strong>카테고리</strong>
							</div> -->
							<div class="list-nav-body" style="width:70%;">
								<strong>댓글내용</strong>
							</div>
							<!-- <div class="list-nav-body2" style="width:15%;">
								<strong>댓글 갯수</strong>
							</div> -->
							<div class="list-nav-footer" style="width:20%;">
								<strong>작성일</strong>
							</div>
						</div>
						<!-- list-nav -->
						
						<c:forEach items="${replyList}" var="reply">
							<form class="list-form" action="/photoboard/get" method="get">
							
								<%-- <div class="list-header" style="width:15%;">
									${photoboard.category }
								</div> --%>
								<div class="list-body" style="width:70%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
									${reply.reply } 
								</div>
								<%-- <div class="list-body2" style="width:15%;">
									${photoboard.replycnt } 
								</div> --%>
								<div class="list-footer" style="width:20%;">
									<fmt:formatDate pattern="yyyy-MM-dd" value="${reply.replydate }"/>
								</div>
								
								<input type="hidden" name="pbno" value="${reply.pbno }">
							</form>
						</c:forEach>
						
					</div>
					<!-- reply-List -->
					
				</div>
				
			</div>
			<!-- userinfo-right-body -->
			
		</div>
		<!-- userinfo-right -->
		
	</main>


<%@ include file="../includes/footer.jsp" %>


<script>
$(document).ready(function() {
    $('.list-form').click(function() {
        $(this).submit();
    });
    
    var photoboardListCnt = $("input.photoboardListCnt").val();
	var replyListCnt = $("input.replyListCnt").val();
	
	new Chart(document.getElementById("content-reply-chart"), {
	    type: 'doughnut',
	    data: {
	      labels: ["게시글", "댓글"],
	      datasets: [
	        {
	          label: [" 개수"],
	          backgroundColor: ["#3e95cd", "#8e5ea2"],
	          data: [photoboardListCnt, replyListCnt]
	        }
	      ]
	    },
	    options: {
	      responsive: false,
	      maintainAspectRatio: false, // `aspectRatio`를 사용하기 위해 `maintainAspectRatio`를 false로 설정
	      aspectRatio: 1, // 가로:세로 비율을 1:1로 유지
	      title: {
	        display: true,
	        text: '작성한 게시글과 댓글'
	      }
	    }
	});
});
</script>
