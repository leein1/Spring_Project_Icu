<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/nav.jsp" %>
    
    
    <style>
   		.photoboard-main{
    		/* border-style: solid;
            border-color: black; */
            
    	}
   		.margin-left{
    		/* border-style: solid;
            border-color: orange; */
    	
    		width:20%;
    	}
    	
    	.margin-right{
    		/* border-style: solid;
            border-color: orange; */
            
    		width:20%;
    		
    	}
    	.user-area{
    		/* border-style: solid;
            border-color: blue; */
    	
    		width:100%;
    		display: flex;
			flex-direction: column; /* 수직으로 아이템을 배치합니다. */
			justify-content:center;
			align-items: center; /* 아이템을 수평으로 가운데 정렬합니다. */
			
			z-index:1;
			
			position: sticky;
  			top: 60px;
    	}
    	.user-area-image {
    	
    		margin-top : 30px;
    		border-style: solid;
            border-color: orange;
		    width: 100px; /* 프로필 사진의 너비 */
		    height: 100px; /* 프로필 사진의 높이 */
		    border-radius: 50%; /* 원형으로 모양을 만듭니다. 반지름은 너비/높이의 50%입니다. */
		    overflow: hidden;
		    
		    display: flex;
			justify-content : center;
			align-items: center; /* 아이템을 수평으로 가운데 정렬합니다. */
		    
		}
		
		.user-area-image img {
			/* border-style: solid;
            border-color: red; */
            
			width: 100%;
		    height: 100%;
		    object-fit: cover;
		}
		
		.user-area-head{
			margin-top:20px;
			margin-bottom:20px;
			
			text-align: center;
		}
		.user-area-body {
			/* border-style: solid;
            border-color: red; */
			
			margin-bottom : 30px;
			
			display:flex;
			flex-direction:column;
			justify-content:center;
			align-content:center;
			text-align: left;
		}
    	
    	
    	.photoboard-main > .main-header{
    		/* border-style: solid;
            border-color: red; */
            
            display: flex;
            justify-content: center;
			align-items: center;
			text-align: center;
			
			/* 배경 이미지 추가 */
		    background-image: linear-gradient(to bottom, rgba(255,255,255,0) 85%, rgba(255,255,255,1)), url('${pageContext.request.contextPath}/resources/images/photoboardBanner.jpg'); /* 배경 이미지 경로 설정 */
		    background-size: cover; /* 이미지를 창에 맞게 조절 */
		    background-position: center; /* 이미지를 가운데 정렬 */
    	}
    	
    	.photoboard-main > .main-header > .board-title{
    		/* border-style: solid;
            border-color: orange; */
            
            text-align: left;
            
    		width:60%;
    		
    		margin-top: 100px;
    		margin-bottom: 100px;
    	}
    	
    	.photoboard-main > .main-category{
    		/* border-style: solid;
            border-color: red; */
            
            display: flex;
            justify-content: center;
			align-items: center;
			text-align: center;
			
			margin-top: 30px;
    		margin-bottom: 30px;
    	}
    	
    	.photoboard-main > .main-category > .board-category{
    		/* border-style: solid;
            border-color: orange; */
            
            text-align: left;
            
    		width:60%;
    		
    		display: flex;
    		justify-content: space-between;
    		
    		padding:15px;
   		}
    	
    	.photoboard-main > .main-body{
    		/* border-style: solid;
            border-color: red; */
            
            display: flex;
            justify-content: center;
			text-align: center;
			/* height: 100vh;
			overflow-y: auto; */
    	}
    	
    	.photoboard-main > .main-body > .list-area{
    		/* border-style: solid;
            border-color: orange; */
            
    		width:60%;
    		
    		display: flex;
    		flex-wrap: wrap;
  			justify-content: flex-start;
    	}
    	
    	.list-area > .list-header{
    		/* border-style: solid;
            border-color: green; */
            
    		width: 100%;
    		padding-left: 20px;
            padding-right: 20px;
            
            /* display: flex;
            justify-content: center;
            align-content: center; */
    	}
    	
    	.list-header input{
			width: 8%;
			border: 2px solid #dddddd !important;
			font-size: 1rem;
			letter-spacing: -0.04rem;
			border-radius: 8px;
			padding: 7px;
			box-sizing: border-box;
			text-align: center;
			height: 36px;
			background-color: rgba(235,168,81,0.6);
		}
    	
    	.list-area > .list-body{
    		/* border-style: solid;
            border-color: blue; */
            
            padding-left: 20px;
            padding-right: 20px;
    		width: 100%;
    		min-height: 500px;
    		
    		text-align: left;
    	}
    	
    	.list-body > .list-footer{
    		/* border-style: solid;
            border-color: green; */
            
            
            display: flex;
           	align-content: center;
    	}
    	
    	.list-body > .list-title{
    		/* border-style: solid;
            border-color: purple; */
            
            
            height : 100px;
    	}
    	
    	.list-body > .list-content{
    		/* border-style: solid;
            border-color: purple; */
            
           	padding-top:50px;
    	}
    	
    	.list-body > .chat-area{
    		/* border-style: solid;
            border-color: red; */
            
           	align-content: center;
           	
           	margin-top:20px;
           	
    	}
    	
    	.chat-area ul{
    		/* border-style: solid;
    		border-color: orange; */
    		
    		list-style: none;
    		
    		padding:0;
    		
    	}
    	
    	.chat-area p {
    		/* border-style: solid;
    		border-color: blue; */
    	}
    	
    	.chat-header{
    		/* border-style: solid;
    		border-color: green; */
    		
    		display:flex;
    		justify-content: space-between;
    	}
    	
    	.chat-footer{
    		display:flex;
    		
    		justify-content: flex-end;
    		align-content: center;
    	}
    	
    	.chat-add{
    		/* border-style: solid;
    		border-color: green; */
    		box-sizing: border-box;
    		
    		padding-top: 20px;
    	}
    	
    	.chat-insert-area{
    		/* border-style: solid;
    		border-color: red; */
    		
    		box-sizing: border-box;
    	
    		display:flex;
    		justify-content: center;
    		align-content: center;
    	}
    	
    	.chat-insert-area textarea{
    		box-sizing: border-box;
    	
    		width:92%;
    		height: 100px;
    		margin: 0;
    		outline: none;
    		font-size: 1.0rem;
    		
    		resize: none;
    	}
    	
    	.chat-insert-area button{
    		box-sizing: border-box;
    	
    		width:8%;
    		height: 100px;
    		margin: 0;
    		
    	}
    	
    	.chat-modify-area{
    		/* border-style: solid;
    		border-color: red; */
    		
    		box-sizing: border-box;
    	
    		display:flex;
    		justify-content: center;
    		align-content: center;
    	}
    	
    	.chat-modify-area textarea{
    		box-sizing: border-box;
    	
    		width:92%;
    		height: 100px;
    		margin: 0;
    		outline: none;
    		font-size: 1.0rem;
    		
    		resize: none;
    	}
    	
    	.chat-modify-area button{
    		box-sizing: border-box;
    	
    		width:8%;
    		height: 100px;
    		margin: 0;
    		
    	}
    	
    	
    	
    	
    	.photoboard-main > .main-footer{
    		/* border-style: solid;
            border-color: purple; */
    	}
    	
    	/* -------------------- page button 하위 요소 ------------------------ */
	    .page-button{
	        
	        /* border-style: solid;
	        border-color: blue; */
	
	        height: auto;
	        
	        margin-top: 20px;
	    }
	    
	    
	    .pagination {
		    list-style: none;
		    
		    padding: 0;
		    
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		.paginate-button {
		    margin: 0 5px;
		}
		
		.paginate-button a {
		    display: block;
		    padding: 7px 18px;
		    text-decoration: none;
		    border: 1px solid #ccc;
		    border-radius: 15px;
		    color: black;
		}
		
		.paginate-button a:hover {
		    background-color: rgba(100,100,100,0.2);
		}
	    
	    /* ------------------------------------------------------- */
    	.uploadResult ul{
    		padding:0;
    	}
    	
    	.uploadResult li{
    		/* border-style: solid;
	        border-color: black; */
	        
    		list-style: none;
    	}
    	
    	.likes-area{
    		/* border-style: solid;
            border-color: pink; */
            
            margin-top:100px;
            display:flex;
            justify-content: center;
            align-content: center;
            width:100%;
    	}
    	.likes-area2{
    		/* border-style: solid;
            border-color: pink; */
            
            display:flex;
            justify-content: center;
            align-content: center;
            width:100%;
    	}
		.likes-area img{
			/* border-style: solid;
	        border-color: orange; */
			width:7%;
			height:7%;
		}

    </style>
    
    
	<main class=photoboard-main>
	
		<div class = main-header>
		
			<div class="margin-left">
				<!-- margin-left -->
			</div>
			<!-- margin-left -->
			
			<div class="board-title">
				<h1>사진 게시판</h1>
				<h2>당신의 사진을 공유 해보세요</h2>
			</div>
			
			<div class="margin-right">
				<!-- margin-right -->
			</div>
			<!-- margin-right -->
		
		</div>
		<!-- main-header -->
		
		<div class="main-category">
			<div class="margin-left">
				<!-- margin-left -->
			</div>
			<!-- margin-left -->
			
			<div class="board-category">
				<span><strong>카테고리 : ${photoboard.category }</strong></span>
				<span><strong>생성일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${photoboard.createdate }"/></strong></span>
			</div>
			
			<div class="margin-right">
				<!-- margin-right -->
			</div>
			<!-- margin-right -->
		</div>
		
		<div class = main-body>
			<div class="margin-left">
				<!-- margin-left -->
			</div>
			<!-- margin-left -->
			
			<div class="list-area">
			
				<div class="list-header" data-pbno="${photoboard.pbno}">
				
					<sec:authentication property="principal" var="pinfo"/>
					<sec:authorize access="isAuthenticated()">
						<c:if test="${pinfo.user.email eq photoboard.email}">
							<input class="delete-button" type="button" value="삭제" style="background-color: rgba(220,50,50,0.7); float:right;">
							<input class="modify-button" type="button" value="수정" style="float:right;">
						</c:if>
					</sec:authorize>
					
				</div>
				
				<div class="list-body">
					
					<div class="list-title">
						<h2>${photoboard.title }</h2>
					</div>
					
					<div class="file-list">
						<div class="uploadResult">
							<ul>
							
							</ul>
						</div>
						<!-- uploadResult -->
					</div>
					<!-- list-footer -->
					
					
					
					<div class="list-content">
						${photoboard.content }
					</div>
					
					<div class="likes-area">
						<img class='like-image' src='${pageContext.request.contextPath}/resources/images/like.png'>
					</div>
					<div class="likes-area2">
						<label>좋아요 n 개</label>
					</div>
					<div class="chat-area">
						<span class="replyCnt">댓글 : 0 개</span><hr>
						<ul class="chat">
							<li data-rno="">
								<div>
									<div class="chat-header">
										<strong>nickname</strong>
										<small>작성일</small>
									</div>
									<p>댓글 내용</p>
									<div class="chat-footer">
										<button id="replyModifyButton">수정</button><button id="replyDeleteButton">삭제</button><button>신고</button>
									</div>
								</div>
								<hr>
							</li>
						</ul>
						
						<div class="page-button">
							 				
						</div>
						<!-- page_button -->
						
						<div class="chat-add">
							<c:choose>
							    <c:when test="${empty pageContext.request.userPrincipal}">
							            <input name="replyerNickName" value='로그인이 필요합니다' style="border: none;">
							    </c:when>
							    <c:otherwise>
							        <sec:authorize access="isAuthenticated()">
							            <input id="principalNickname" name="replyer_nickname" value='<sec:authentication property="principal.user.nickname"/>'>
										<input id="principalEmail" type="hidden" name="replyer" value='<sec:authentication property="principal.user.email"/>'>
							        </sec:authorize>
							    </c:otherwise>
							</c:choose>
							
							<div class="chat-insert-area">
								<textarea name="reply"></textarea>
								<c:choose>
								    <c:when test="${empty pageContext.request.userPrincipal}">
								        <button id="">로그인<br>해주세요</button>
								    </c:when>
								    <c:otherwise>
								        <sec:authorize access="isAuthenticated()">
								            <button id="replyRegisterButton">등록</button>
								        </sec:authorize>
								    </c:otherwise>
								</c:choose>
							</div>
							<!-- chat-insert-area -->
						</div>
						<!-- chat-add -->
					</div>
					<!-- chat-area -->
					<form action="/photoboard/list" method="get">
						<input type='hidden' name='pageNum' value='${cri.pageNum}'>
		            	<input type='hidden' name='amount' value='${cri.amount}'>
		            	<input type="hidden" name='type' value="${cri.type }">
		            	<input type="hidden" name='keyword' value="${cri.keyword }">
						<button class="return-list" style="float:right; margin-top:25px; margin-bottom:25px; width:8%; height:36px;">목록</button>
					</form>
				</div>
				<!-- list-body -->
				
				
			</div>
			<!-- list-area -->
			
			<div class="margin-right">
				
				<div class="user-area">
					<%-- <div class="user-area-image">
						<img src="${pageContext.request.contextPath}/resources/images/profile-default-image.png">
					</div> --%>
					<div class="user-area-head">
						<h3>작성자</h3>
						${userInfo.nickname }
					</div>
					<div class="user-area-body">
						
						<span style="display: flex; align-items: center; text-align: center; margin-bottom:20px;">
							<img src="${pageContext.request.contextPath}/resources/images/instagram.png" style="width:20px; height:20px; margin-right:10px;">
							<a href="https://www.instagram.com/${userInfo.instagram}/?hl=en" target="_blank" style="text-decoration: none; color: inherit;">${userInfo.instagram}</a>
						</span>
						
						${userInfo.introduce }<br>
						
					</div>
				</div>
				<!-- user-area -->
			</div>
			<!-- margin-right -->
			
		</div>
		<!-- main-body -->
		
		<div class="main-footer">
			
			<%-- <img src="${pageContext.request.contextPath}/resources/images/like.png">
			<img src="${pageContext.request.contextPath}/resources/images/liked.png"> --%>
		</div>
		<!-- main-footer -->
		
		
	</main>
	<!-- photoboard-main -->
	<form id='actionForm' action='/photoboard/modify' method='get'>
    	<input type='hidden' name='pageNum' value='${cri.pageNum}'>
    	<input type='hidden' name='amount' value='${cri.amount}'>
    	<input type="hidden" name='type' value="${cri.type }">
    	<input type="hidden" name='keyword' value="${cri.keyword }">
    </form>
		            
		            
	<div class="bigPictureWrapper">
		<div class="bigPicture">
		</div>
	</div>
	<style>
		.bigPictureWrapper{
			position: fixed; /* 스크롤에 상관없이 항상 뷰포트에 고정됨 */
			display : none;
			justify-ontent: center;
			align-items: center;
			top:0%;
			width:100%;
			height:100%;
			background-color: gray;
			z-index : 100;
			background:rgba(1,1,1,0.95);
		}
		.bigPicture{
			position : relative;
			display:flex;
			justify-content: center;
			align-items:center;
		}
		.bigPicture img{
			max-width: calc(100% - 160px);
			max-height: calc(100% - 160px);
			width: auto;
		    height: auto;
		    object-fit: contain; /* 이미지를 부모 요소에 맞게 축소하여 모두 보이게 합니다. */
		    margin-top:80px;
		}
	</style>


<%@ include file="../includes/footer.jsp" %>


<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	$(document).ready(function(){
		// 좋아요 이미지에 이벤트 핸들러 등록
	    $(document).on('click', '.like-image', function() {
	        insertLikes();
	    });

	    // 좋아요 취소 이미지에 이벤트 핸들러 등록
	    $(document).on('click', '.liked-image', function() {
	        deleteLikes();
	    });
		
		function checkLikes() {
		    <sec:authorize access="isAuthenticated()">
		        var pbno = '${photoboard.pbno}';
		        var boardtype = 'photoboard';
		        var email = $('input[name="replyer"]').val();
		        
		        var likesVO = {
		            bno: pbno,
		            boardtype: boardtype,
		            email: email
		        };
		        
		        $.ajax({
		               type: "GET",
		               url: "/likes/check",
		               data: likesVO,
		               dataType: "json",
		               success: function(response) {
		                   if (response === 1) {
		                       // 받은 값이 1일 때의 처리
		                       var likesarea = $(".likes-area");
		                       var str="";
		                       str += "<img class='liked-image' src='${pageContext.request.contextPath}/resources/images/liked.png'>";
		                       likesarea.html(str);
		                       
		                   } else if (response === 0) {
		                       // 받은 값이 0일 때의 처리
		                       var likesarea = $(".likes-area");
		                       var str="";
		                       str += "<img class='like-image' src='${pageContext.request.contextPath}/resources/images/like.png'>";
		                       likesarea.html(str);
		                       
		                   } else {
		                       // 다른 경우의 처리
		                   }
		               },
		               error: function(xhr, status, error) {
		                   // 요청이 실패했을 때 실행될 함수
		                   // 오류 메시지를 화면에 출력하거나 다른 처리를 수행할 수 있습니다.
		               }
		        });
		    </sec:authorize>
		}
		
		function insertLikes(){
			<sec:authorize access="isAuthenticated()">
				var pbno = '${photoboard.pbno}';
		        var boardtype = 'photoboard';
		        var email = $('input[name="replyer"]').val();
		        
		        var likesVO = {
		            bno: pbno,
		            boardtype: boardtype,
		            email: email
		        };
		        
		        $.ajax({
		               type: "GET",
		               url: "/likes/click",
		               data: likesVO,
		               dataType: "json",
		               success: function(response) {
		                   if (response === 1) {
		                       
		                       /* alert("좋아요 누름"); */
		                       checkLikes();
		                       count();
		                   } else if (response === 0) {
		                	   
		                   } else {
		                       // 다른 경우의 처리
		                   }
		               },
		               error: function(xhr, status, error) {
		                   // 요청이 실패했을 때 실행될 함수
		                   // 오류 메시지를 화면에 출력하거나 다른 처리를 수행할 수 있습니다.
		               }
		        });
			</sec:authorize>
		}
		
		function deleteLikes(){
			<sec:authorize access="isAuthenticated()">
				var pbno = '${photoboard.pbno}';
		        var boardtype = 'photoboard';
		        var email = $('input[name="replyer"]').val();
		        
		        var likesVO = {
		            bno: pbno,
		            boardtype: boardtype,
		            email: email
		        };
		        
		        $.ajax({
		               type: "GET",
		               url: "/likes/unclick",
		               data: likesVO,
		               dataType: "json",
		               success: function(response) {
		                   if (response === 1) {
		                       
		                       /* alert("좋아요 취소"); */
		                       checkLikes();
		                       count();
		                   } else if (response === 0) {
		                	   
		                   } else {
		                       // 다른 경우의 처리
		                   }
		               },
		               error: function(xhr, status, error) {
		                   // 요청이 실패했을 때 실행될 함수
		                   // 오류 메시지를 화면에 출력하거나 다른 처리를 수행할 수 있습니다.
		               }
		        });
			</sec:authorize>
		}
		
		function count(){
			
				var pbno = '${photoboard.pbno}';
		        var boardtype = 'photoboard';
		        
		        var likesVO = {
		            bno: pbno,
		            boardtype: boardtype,
		        };
		        
		        $.ajax({
		               type: "GET",
		               url: "/likes/count",
		               data: likesVO,
		               dataType: "json",
		               success: function(response) {
		            	   /* alert("카운트 실행" + response); */
		            	   $('.likes-area2 label').text('좋아요 ' + response + ' 개');
		            	   
		               },
		               error: function(xhr, status, error) {
		                   // 요청이 실패했을 때 실행될 함수
		                   // 오류 메시지를 화면에 출력하거나 다른 처리를 수행할 수 있습니다.
		               }
		        });
			
		}
	
		checkLikes();
		count();
		console.log("getattachList 실행전");
		
		//파일 불러오기
		(function getAttachList(){
			var pbno = '${photoboard.pbno}';
			
			$.getJSON("/photoboard/getAttachList", {pbno:pbno},function(arr){
				console.log(arr);
				var str = "";
				
				$(arr).each(function(i, attach){
					//image type
					if(attach.type != "false"){
						
						var fileCallPath = encodeURIComponent( attach.path+"/"+attach.uuid+"_"+attach.name);
						console.log("fileCallPath : " + fileCallPath);
						
						str += "<li data-path='"+attach.path+"'";
						str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.name+"' data-type='"+attach.type+"'";
						str += " ><div>";
						str += "<img src='/display?fileName="+fileCallPath+"' style='width:100%;'><br>";
						str += "<span> " + attach.name + "</span>";
						str += "</div>";
						str += "</li>";
						
					}else {
						
						var fileCallPath = encodeURIComponent( attach.path+"/"+attach.uuid+"_"+attach.name);
						
						console.log("fileCallPath : " + fileCallPath);
						
						str += "<li data-path='"+attach.path+"'";
						str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.name+"' data-type='"+attach.type+"'";
						str += " ><div>";
						str += "<span> " + attach.name + "</span>";
						str += "</div>";
						str += "</li>";
						
					}
				}); //$(arr)
				
				$(".uploadResult ul").html(str);
			}); //end getJSON
			
		})(); //end function
		
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		//ajax spring security header
		$(document).ajaxSend(function(e,xhr,options){
			
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			
		});
		
		//댓글 처리
		console.log("===========");
		console.log("JS TEST");
		
		var pbnoValue= '${photoboard.pbno}';
		console.log(pbnoValue);
		
		//댓글 리스트
		var replyUL = $(".chat");
		console.log(replyUL);
		
		showList(1);
		console.log("showlist() 실행");
		
		function showList(page){
			console.log("show list " + page + "페이지");
			
			replyService.getList({pbno:pbnoValue, page: page||1}, function(replyCnt,list){
				
				console.log("getList 진입");
				console.log(list);
				console.log("replyCnt : " + replyCnt);
				
				var str="";
				var principalEmailValue = $('#principalEmail').val();
				
				if(page == -1){
					
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					
					return;
					
				}
				
				if(list == null || list.length == 0){
					
					console.log("목록 없음");
					
					str += "<li data-rno=''>";
					str += "<div>";
					str += "<div class='chat-header'>";
					str += "<strong>관리자</strong>";
					str += "<small></small>";
					str += "</div>";
					str += "<p>첫번째 댓글을 작성해주세요!</p>";
					str += "</div><hr>";
					str += "</li>";
					
					replyUL.html(str);
					
					return;
				}
				
				for(var i = 0, len = list.length || 0; i < len; i++){
					
					if(list[i].parent_rno == 0){
						
						str += "<li data-rno='"+list[i].rno+"'>";
						str += "<div>";
						str += "<div class='chat-header'>";
						str += "<strong>"+list[i].replyer_nickname+"</strong>";
						str += "<small>"+replyService.displayTime(list[i].replydate)+"</small>";
						str += "</div>";
						str += "<p>"+list[i].reply+"</p>";
						str += "<div class='chat-footer'>";
						
						<sec:authorize access="isAuthenticated()">
						str += "<button id='childReplyInsertButton'>댓글달기</button>";
						</sec:authorize>
						
						if(principalEmailValue === list[i].replyer){
							str += "<button id='replyModifyButton'>수정</button><button id='replyDeleteButton'>삭제</button>";
						}
						
						<sec:authorize access="isAuthenticated()">
						str += "<button>신고</button>";
						</sec:authorize>
						
						str += "</div>";
						str += "</div><hr>";
						str += "</li>";
						
					}else{
						
						str += "<li style='margin-left:5%;' data-rno='"+list[i].rno+"'>";
						str += "<div>";
						str += "<div class='chat-header'>";
						str += "<strong>"+list[i].replyer_nickname+"</strong>";
						str += "<small>"+replyService.displayTime(list[i].replydate)+"</small>";
						str += "</div>";
						str += "<p>"+list[i].reply+"</p>";
						str += "<div class='chat-footer'>";
						
						if(principalEmailValue === list[i].replyer){
							str += "<button id='replyModifyButton'>수정</button><button id='replyDeleteButton'>삭제</button>";
						}
						
						<sec:authorize access="isAuthenticated()">
						str += "<button>신고</button>";
						</sec:authorize>
						str += "</div>";
						str += "</div><hr>";
						str += "</li>";
						
					}
					
				}
				replyUL.html(str);
				showReplyPage(replyCnt);
				$(".replyCnt").text("댓글 : " + replyCnt + " 개");
			});
			
		}//end showList
		
		//답글달기 버튼 클릭시 입력필드 추가
		$(".chat").on("click","button[id='childReplyInsertButton']",function(e){
			
			console.log("답글달기 버튼 누름");
			$(".childChat-add").remove();
			
			
			var rno = $(this).closest("li").data("rno");
			console.log(rno);
			
			var chatUpdateDiv = $("<div>", { class: "childChat-add" , style:"margin-left:5%;" });
			var principalEmailValue = $('#principalEmail').val();
			var principalNicknameValue = $('#principalNickname').val();
			
			chatUpdateDiv.append($("<input>", { name: "replyer", value: principalEmailValue, type:"hidden"}));
			
			chatUpdateDiv.append($("<input>", { name: "replyer_nickname", value: principalNicknameValue, readonly: true }));
       		
       		chatUpdateDiv.append($("<input>", { name: "parent_rno" , value: rno, type:"hidden"}));
       		
       		chatUpdateDiv.append($("<div>", { class: "chat-insert-area" }).append(
           	$("<textarea>", { name: "reply"}),
           	$("<button>", { id: "childReplyRegisterButton", text: "등록" })
	        ));
       		
       		var targetLi = $(".chat").find("li[data-rno='" + rno + "']");
       		
       		targetLi.after(chatUpdateDiv);
			
       		var replyDiv = $(".childChat-add");
       		
       		var replyInputParentRno = replyDiv.find("input[name='parent_rno']");
       		var replyInputReply = replyDiv.find("textarea[name='reply']");
    		var replyInputReplyer = replyDiv.find("input[name='replyer']");
    		var replyInputReplyerNickname = replyDiv.find("input[name='replyer_nickname']");
    		
       		var childReplyRegisterButton = $("#childReplyRegisterButton");
       		
    		
       		//대댓글 추가
    		childReplyRegisterButton.on("click", function(e){
    			
    			var reply = {
    					reply : replyInputReply.val(),
    					replyer : replyInputReplyer.val(),
    					replyer_nickname : replyInputReplyerNickname.val(),
    					parent_rno : replyInputParentRno.val(),
    					pbno : pbnoValue
    			};
    			
    			replyService.add(reply, function(result){
    				
    				alert("댓글 등록을 완료하였습니다");
    				showList(pageNum);
    				
    			});
    		});
		});
		
		//댓글 추가 준비
		var replyDiv = $(".chat-add");
		var replyInputReply = replyDiv.find("textarea[name='reply']");
		var replyInputReplyer = replyDiv.find("input[name='replyer']");
		var replyInputReplyerNickname = replyDiv.find("input[name='replyer_nickname']");
		
		var replyRegisterButton = $("#replyRegisterButton");
		var replyModifyButton = $("#replyModifyButton");
		var replyDeleteButton = $("#replyDeleteButton");
		
		//댓글 추가
		replyRegisterButton.on("click", function(e){
			
			var reply = {
					reply : replyInputReply.val(),
					replyer : replyInputReplyer.val(),
					replyer_nickname : replyInputReplyerNickname.val(),
					pbno : pbnoValue
			};
			
			replyService.add(reply, function(result){
				
				alert("댓글 등록을 완료하였습니다");
				replyInputReply.val(''); 
				showList(pageNum);
				
			});
		});
		
		// 댓글 수정버튼 클릭시 입력필드로 변환
		var previousReplyContent = {}; // 이전 댓글 내용을 저장할 객체

		$(".chat").on("click", "button[id='replyModifyButton']", function(e) {
		    var rno = $(this).closest("li").data("rno");
		    
		    console.log("댓글 수정 버튼 눌림 rno : " + rno);
		    
		    $(".childChat-add").remove();
		    
		    // 이전에 열려 있던 수정 필드를 닫고 이전 내용을 복원
		    var previousModifyDiv = $(".chat-modify");
		    if (previousModifyDiv.length > 0) {
		        var previousRno = previousModifyDiv.find("input[name='rno']").val();
		        var previousContent = previousModifyDiv.find("textarea[name='reply']").val();
		        
		        var targetLi = $(".chat").find("li[data-rno='" + previousRno + "']");
		        targetLi.html(previousReplyContent[previousRno]); // 이전 내용 복원
		    }
		    
		    // replyService.get 호출 후 .chat 내용 변경
		    replyService.get(rno, function(reply) {
		        var chatUpdateDiv = $("<div>", { class: "chat-modify" });
		        
		        chatUpdateDiv.append($("<input>", { name: "replyer", value: reply.replyer, type:"hidden"}));
		        chatUpdateDiv.append($("<input>", { name: "replyer_nickname", value: reply.replyer_nickname, readonly:true}));
		        
		        chatUpdateDiv.append($("<input>", { name: "rno", value: reply.rno, type:"hidden" }));
		        
		        chatUpdateDiv.append($("<div>", { class: "chat-modify-area" }).append(
		            $("<textarea>", { name: "reply", text: reply.reply }),
		            $("<button>", { id: "replyModifyConfirmButton", text: "수정완료" })
		        ));
		        
		        var targetLi = $(".chat").find("li[data-rno='" + reply.rno + "']");
		        
		        previousReplyContent[reply.rno] = targetLi.html(); // 이전 내용 저장
		        targetLi.html(chatUpdateDiv); // 수정 필드 열기
		        
		        // 수정 완료 버튼 이벤트 처리
		        //실제로 수정이 이루어 지는 부분
	       		var replyModifyRno = chatUpdateDiv.find("input[name='rno']");
	       		var replyModifyReply = chatUpdateDiv.find("textarea[name='reply']");
	       		
	       		var replyModifyConfirmButton = $("#replyModifyConfirmButton");
	       		
	       		var originalReplyer = $('.chat-modify input[name="replyer"]').val();
	       		
	       		replyModifyConfirmButton.on("click", function(e){
	       			
	       			console.log("수정완료 버튼 누름");
	       			
	       			var reply = {
	       					rno : replyModifyRno.val(),
	       					reply : replyModifyReply.val(),
	       					replyer : originalReplyer
	       			};
	       			
	       			replyService.update(reply,function(result){
	       				
	       				alert("수정되었습니다");
	       				showList(pageNum);
	       			});
		        });
		    });
		});
		
		//댓글 삭제
		
		$(".chat").on("click", "button[id='replyDeleteButton']", function(e){
		    var rno = $(this).closest("li").data("rno");
		    var originalReplyer = $("input[name='replyer']").val();
		    
		    replyService.remove(rno, originalReplyer, function(result){
		        alert("삭제되었습니다");
		        showList(pageNum);
		    });
		});
		
		//댓글 추가 테스트
		/* replyService.add({reply:"JS TEST", replyer:"tester", pbno: pbnoValue}
				, function(result){
					alert("RESULT : " + result);
				}
		); */
		
		//댓글 목록 테스트
		/* replyService.getList({pbno: pbnoValue , page:1}, function(list){
			for(var i = 0, len = list.length||0; i < len; i++){
				console.log(list);
			}
		}); */
		
		//댓글 삭제 테스트
		/* replyService.remove(3, function(count){
			console.log(count);
			if(count === "success"){
				alert("REMOVED");
			}
		}, function(err){
			laert("ERROR");
		}); */
		
		//댓글 수정 테스트
		/* replyService.update({
			rno : 6, 
			pbno : pbnoValue,
			reply : "댓글수정 get에서 확인"
		}, function(result){
			alert("수정 완료");
		}); */
		
		var pageNum = 1;
		var replyPageFooter = $(".page-button");
		
		function showReplyPage(replyCnt){
			
			var endNum = Math.ceil(pageNum/10.0)*10; // (1 / 10.0 ) * 10 = 1
			var startNum = endNum - 9; // - 8 
			
			var prev = startNum != 1; // true
			var next = false; // false
			
			if(endNum * 10 >= replyCnt){ // 1 * 10 >= 12 false
				endNum = Math.ceil(replyCnt/10.0);
			}
			if(endNum * 10 < replyCnt ){ // 1 * 10 < 25 true;
				next = true;
			}
			
			var str = "<ul class = 'pagination'>";
			
			if(prev){
				str += "<li class='paginate-button-previous'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
			}
			
			for(var i = startNum; i<= endNum; i++){
				
				str += "<li class='paginate-button'><a class = 'page-link' href='" + i + "'>" + i + "</a></li>";
			}
			
			if(next){
				str += "<li class = 'paginate-button-next'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
			}
			str += "</ul></div>";
			console.log(str);
			replyPageFooter.html(str);
			
			/* page_button hover */
			
			console.log("current page: " + pageNum);
			
			$(".paginate-button a").each(function() {
			    // 각 링크의 href 값을 가져옵니다. 이 값이 페이지 번호에 해당한다고 가정합니다.
			    const pageNumber = $(this).attr("href");
			    
			    
			    // currentPage와 pageNumber를 비교하여 동일한 경우에 파란색으로 스타일을 변경합니다.
			    if (pageNum === pageNumber) {
			    	
			        $(this).css("background-color", "rgba(218,80,80,0.6)"); // 혹은 원하는 스타일로 변경하세요
			        $(this).css("color", "white"); // 텍스트 색상 변경 예시
			        $(this).css("margin-bottom", "25px"); // 텍스트 색상 변경 예시
			        
			    }else if(pageNum === 1 && pageNumber == 1){
		    	 	$(this).css("background-color", "rgba(218,80,80,0.6)"); // 혹은 원하는 스타일로 변경하세요
			        $(this).css("color", "white"); // 텍스트 색상 변경 예시
			        $(this).css("margin-bottom", "25px"); // 텍스트 색상 변경 예시
			    }
			});
			/* page_button hover */
		}
		
		replyPageFooter.on("click","li a", function(e){
			e.preventDefault();
			console.log("page click");
			
			var targetPageNum = $(this).attr("href");
			
			console.log("targetPageNum: " + targetPageNum);
			
			pageNum = targetPageNum;
			showList(pageNum);
		});
		
		
		
		
		
	});
	
	
	
	$(".uploadResult").on("click","li",function(e){
		console.log("view image");
		
		var liObj = $(this);
		var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
		
		if(liObj.data("type")){
			showImage(path);
		}else{
			//download
		}
	});
	
	function showImage(fileCallPath){
		/* alert(fileCallPath); */
		
		$(".bigPictureWrapper").css("display","flex").show();
		
		$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:'100%', height:'100%'},1);
	}
	
	$(".bigPictureWrapper").on("click",function(e){
		$(".bigPicture").animate({width:'0%', height:'0%'},1);
		setTimeout(function(){$(".bigPictureWrapper").hide();},1);
	});
	
	
	document.querySelectorAll('.modify-button').forEach(function(button) {
	    button.addEventListener('click', function() {
	        // 클릭된 수정하기 버튼이 속한 list-form의 pbno 값을 가져옵니다.
	        var pbno = button.closest('.list-header').getAttribute('data-pbno');
	
	        var pbnoInput = document.createElement('input');
	        
	        pbnoInput.setAttribute('type', 'hidden');
	        pbnoInput.setAttribute('name', 'pbno');
	        pbnoInput.setAttribute('value', pbno);
	        
	        document.getElementById('actionForm').appendChild(pbnoInput);
	
	        document.getElementById('actionForm').submit();
	    });
	});
	
	document.querySelectorAll('.delete-button').forEach(function(button) {
	    button.addEventListener('click', function() {
	        // 클릭된 수정하기 버튼이 속한 list-form의 pbno 값을 가져옵니다.
	        var pbno = button.closest('.list-header').getAttribute('data-pbno');
	        var email = '${photoboard.email}';

	        // form 엘리먼트 생성
	        var form = document.createElement('form');
	        form.setAttribute('method', 'post'); // POST 방식 사용
	        form.setAttribute('action', '/photoboard/remove');

	        // pbno를 위한 hidden input 생성 후 form에 추가
	        var pbnoInput = document.createElement('input');
	        pbnoInput.setAttribute('type', 'hidden');
	        pbnoInput.setAttribute('name', 'pbno');
	        pbnoInput.setAttribute('value', pbno);
	        form.appendChild(pbnoInput);

	        // email을 위한 hidden input 생성 후 form에 추가
	        var emailInput = document.createElement('input');
	        emailInput.setAttribute('type', 'hidden');
	        emailInput.setAttribute('name', 'email');
	        emailInput.setAttribute('value', email);
	        form.appendChild(emailInput);

	        // CSRF 토큰을 위한 hidden input 생성 후 form에 추가
	        var csrfName = '${_csrf.parameterName}';
	        var csrfValue = '${_csrf.token}';
	        var csrfInput = document.createElement('input');
	        csrfInput.setAttribute('type', 'hidden');
	        csrfInput.setAttribute('name', csrfName);
	        csrfInput.setAttribute('value', csrfValue);
	        form.appendChild(csrfInput);

	        // form을 body에 추가하고 submit
	        document.body.appendChild(form);
	        form.submit();
	    });
	});
	
	/* window.addEventListener('scroll', function() {
		  var userArea = document.querySelector('.user-area');
		  var scrollPosition = window.scrollY;

		  if (scrollPosition > 439) {
		    userArea.style.position = 'fixed';
		    userArea.style.top = '60px';
		  } else {
		    userArea.style.position = 'absolute';
		    userArea.style.top = '439px';
		  }
		}); */
</script>
	
