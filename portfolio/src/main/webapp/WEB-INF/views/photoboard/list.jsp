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
    	
    	.photoboard-main > .main-header{
    		/* border-style: solid;
            border-color: red; */
            
            display: flex;
            justify-content: center;
			align-items: center;
			text-align: center;
			
			/* 배경 이미지 추가 */
		    background-image: linear-gradient(to bottom, rgba(255,255,255,0) 85%, rgba(255,255,255,1)), url('${pageContext.request.contextPath}/resources/images/photoboardBanner2.jpg'); /* 배경 이미지 경로 설정 */
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
    	
    	
    	.board-title h1,
		.board-title h2 {
		  color: black;
		}
    	
    	.photoboard-main > .main-function{
    		/* border-style: solid;
            border-color: red; */
            
            width:100%;
            
            display: flex;
            justify-content: center;
			align-items: center;
			text-align: center;
			
			margin-top: 30px;
    		margin-bottom: 30px;
    	}
    	
    	.photoboard-main > .main-function > .board-function{
    		/* border-style: solid;
            border-color: orange; */
            
    		width:60%;
    	}
    	
    	.board-function > .board-header{
    		/* border-style: solid;
            border-color: green; */
            
            width: calc(100% - 30px);
            text-align: left;
            
    		display: flex;
    		justify-content: space-between;
    		
    		padding:15px;
   		}
   		
   		.board-function > .board-notice{
   			/* border-style: solid;
            border-color: purple; */
            
            width:100%;
   		}
   		
   		.board-notice > .notice-area{
   			/* border-style: solid;
            border-color: fuchsia; */
            
            width:100%;
            
            display: none; /* 기본적으로 숨김 처리 */
            box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1), -5px 5px 5px rgba(0, 0, 0, 0.1), 0 5px 5px rgba(0, 0, 0, 0.1);
   		}
   		
   		.board-notice > .notice-area > .notice-form{
   			
   			/* border-style: solid;
            border-color: green; */
   		
   			width:calc(100% - 40px);
   			
   			padding: 20px;
   			display:flex;
   		}
   		
   		.notice-form-footer{
   			width:20%;
   		}
   		
   		.notice-form-body{
   			width:80%;
   			text-align: left;
   		}
    	
    	.photoboard-main > .main-body{
    		/* border-style: solid;
            border-color: red; */
            
            display: flex;
            justify-content: center;
			align-items: center;
			text-align: center;
    	}
    	
    	.photoboard-main > .main-body > .list-area{
    	
    		/* border-style: solid;
            border-color: orange; */
            
    		width:60%;
    		
    		display: flex;
    		flex-wrap: wrap;
  			justify-content: flex-start;
    		
    	}
    	
    	.photoboard-main > .main-body > .list-area > .list-form{
    		/* border-style: solid;
            border-color: green; */
            
            width: 33.33%;
            box-sizing: border-box;
            
            padding: 15px;
            
            margin-bottom:50px;
            
    	}
    	
    	.form-header:hover {
		    /* 마우스를 가져갔을 때의 스타일을 지정하세요. */
		    /* 예시: 배경색을 변경하고 테두리를 추가합니다. */
		    cursor: pointer; /* 커서 모양을 포인터로 변경합니다. */
		}
    	
    	.photoboard-main > .main-body > .list-area > .list-form > .form-header{
    		/* border-style: solid;
            border-color: blue; */
            
            width: 100%;
            padding-bottom: 66.6666%; /* 2:3 비율을 만들기 위해 66.6666%로 설정합니다. */
  			position: relative;
    	}
    	
    	.form-header > img {
    	
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			object-fit: cover; /* 이미지 비율 유지 */
		}
		
    	.photoboard-main > .main-body > .list-area > .list-form > .form-body{
    		/* border-style: solid;
            border-color: red; */
            
            width: 100%;
            
            padding-top:10px;
            padding-bottom:10px;
    	}
    	.photoboard-main > .main-body > .list-area > .list-form > .form-footer{
    		/* border-style: solid;
            border-color: blue; */
            
            width: 100%;
    	}
    	
    	
    	/* -------------------- page button 하위 요소 ------------------------ */
	    .page-button{
	        
	        /* border-style: solid;
	        border-color: blue; */
	
	        height: auto;
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
    	.notice-form-body::before {
		    content: "[notice] ";
		    color: red;
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
		
		<div class="main-function">
		
			<div class="margin-left">
				 <!-- margin-left -->
			</div>
			<!-- margin-left -->
			<div class="board-function">
			<!-- 보드 펑션 -->
				<div class="board-header">
				<!-- 보드 헤더 -->
					<sec:authorize access="isAuthenticated()">
						<a href="/photoboard/write"><input type="button" value="글쓰기"></a>
					</sec:authorize>
					<form id="searchForm" action="/photoboard/list" method="get">
						<select name="type" >
							<option value=""${pageMaker.cri.type == null ? 'selected' : '' }>--</option>
							<option value="T"${pageMaker.cri.type eq 'T' ? 'selected' : '' }>제목</option>                            			
							<option value="C"${pageMaker.cri.type eq 'C' ? 'selected' : '' }>내용</option>                            			
							<option value="TC"${pageMaker.cri.type eq 'TC' ? 'selected' : '' }>제목 or 내용</option>                            			
						</select>
						
						<input type="text" name='keyword' value="${pageMaker.cri.keyword }">
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
						
						<button class="btn btn-info">검색</button>
					</form>
					
					<span>전체 글 : ${total } 개</span>
					
					
					
				</div>
				<!-- board-header -->
				
				<div class="board-notice">
					공지글 <button class="noticeFoldButton">펼치기</button>
					
					<div class="notice-area">
						<!-- notice area	 -->
						<c:forEach var="tmp" items="${list}">
						
							<c:if test="${tmp.category eq 'notice'}">
							
							 <div class="notice-form" data-pbno="${tmp.pbno }">
							 
							 	<!-- <div class="notice-form-header" >글 작성일
							 		
							 	</div> -->
							 	<!-- notice-form-header -->
							 	
							 	<div class="notice-form-body">
							 		<strong>${tmp.title }</strong>
							 	</div>
							 	<!-- notice-form-body -->
							 	
							 	<div class="notice-form-footer">
							 		<fmt:formatDate pattern="yyyy-MM-dd" value="${tmp.createdate }"/>
							 	</div>
							 	<!-- notice-form-footer -->
							 	
							 </div>
							 <!-- notice-form -->
							 
							</c:if>
							
						</c:forEach>
						
					</div>
					<!-- notice-area -->
					
				</div>
				<!-- board-notice -->
				
			</div>
			<!-- board-function -->
			
			
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
				
				<c:forEach var="tmp" items="${list}">
					<c:if test="${tmp.category ne 'notice'}">		
						<!-- ${tmp.category}의 값이 notice 가 아니라면 -->
						<div class="list-form">
							
							<div class="form-header" data-pbno="${tmp.pbno}">
								<%-- <c:choose>
								
					                <c:when test="${tmp.image_path == null}">
				                    	<img src="${pageContext.request.contextPath}/resources/images/test.jpeg"><!-- 이미지가 없을 경우의 기본 이미지 -->
					                </c:when>
					                
					                <c:otherwise>
					                    <img src="${tmp.image_path}"><!-- 이미지가 있을 경우 해당 이미지의 경로 -->
					                </c:otherwise>
					                
					            </c:choose> --%>
				            	
							</div>
							<!-- form-header -->
							
							<div class="form-body">
								<strong>${tmp.title}</strong><!-- 게시글 제목 들어갈자리 -->
								
							</div>
							<!-- form-body -->
							
							<div class="form-footer">
								${tmp.nickname }<br><br>
								<%-- <fmt:formatDate pattern="yyyy-MM-dd" value="${tmp.createdate }"/><br> --%>
								조회 : ${tmp.views} | 댓글 : ${tmp.replycnt }
							</div>
							<!-- form-footer -->
							
						</div>
						<!-- list-form -->
					</c:if>
					</c:forEach>
			</div>
			<!-- list-area -->
				
			
			<div class="margin-right">
				<!-- margin-right -->
			</div>
			<!-- margin-right -->
			
		</div>
		<!-- main-body -->
		
		<div class="main-footer">
		
			<div class="page-button">
	   				
	   				<ul class="pagination">
                   		<c:if test="${pageMaker.prev }">
                   			<li class="paginate-button-previous">
                   				<a href="${pageMaker.startPage -1 }">Previous</a>
                   			</li>
                   		</c:if>
                   		
                   		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
                   			<li class="paginate-button ${pageMaker.cri.pageNum == num ? 'active':'' }">
                   				<a href="${num }">${num}</a>
                   			</li>
                   		</c:forEach>
                   		
                   		<c:if test="${pageMaker.next }">
                   			<li class="paginate-button-next">
                   				<a href="${pageMaker.endPage +1 }">Next</a>
                   			</li>
                   		</c:if>
                   		
                   	</ul>
				  	
				  	<form id='actionForm' action='/photoboard/list' method='get'>
		            	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		            	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		            	<input type="hidden" name='type' value="${pageMaker.cri.type }">
		            	<input type="hidden" name='keyword' value="${pageMaker.cri.keyword }">
		            </form>
					
		 	   </div>
		 	   <!-- page_button -->
		</div>
		<!-- main-footer -->
		<sec:authorize access="isAuthenticated()">
			<input id="email" type="hidden" value='<sec:authentication property="principal.user.email"/>' name="email">
			<input type="hidden" value='<sec:authentication property="principal.user.nickname"/>' name="nickname">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		</sec:authorize>
		
	</main>
	<!-- photoboard-main -->
	
<%@ include file="../includes/footer.jsp" %>

<script>
	// 문서가 준비되면 실행될 함수 등록
	$(document).ready(function() {
		
	    // noticeFoldButton을 클릭할 때 실행되는 함수
	    function toggleNoticeArea() {
	        var noticeArea = $('.notice-area');
	        // noticeArea의 표시 상태를 변경
	        noticeArea.toggle();
	    }
	
	    // noticeFoldButton에 click 이벤트 핸들러 등록
	    $('.noticeFoldButton').click(toggleNoticeArea);
	    
	    
		console.log("getattachList 실행전");
		
		function getFirstAttach(pbno) {
	        $.getJSON("/photoboard/getAttachList", { pbno: pbno }, function(arr) {
	            console.log(arr);
	            var str = "";

	            // arr의 첫 번째 요소만 사용
	            var attach = arr[0];

	            // 첨부 파일 처리
	            if (attach && attach.type != "false") {
	                var fileCallPath = encodeURIComponent(attach.path + "/" + attach.uuid + "_" + attach.name);
	                console.log("fileCallPath : " + fileCallPath);
	                str += "<img src='/display?fileName=" + fileCallPath + "' style='width:100%;'><br>";
	            } else {
	                var fileCallPath = encodeURIComponent(attach.path + "/" + attach.uuid + "_" + attach.name);
	                console.log("fileCallPath : " + fileCallPath);
	                str += "<img src='${pageContext.request.contextPath}/resources/images/test.jpeg'>";
	            }

	            // 해당 pbno에 대한 form-header 업데이트
	            $('.form-header[data-pbno="' + pbno + '"]').html(str);
	        });
	    }

	    // 각 .list-form을 순회하며 pbno 가져오기
	    $('.list-form').each(function() {
	        var pbno = $(this).find('.form-header').data('pbno');
	        getFirstAttach(pbno); // 각 pbno에 대해 getFirstAttach 호출
	    });
		
	});

    // JavaScript로 like-image를 클릭했을 때의 동작을 정의합니다.
    document.querySelectorAll('.like-image').forEach(function (element) {
        element.addEventListener('click', function () {
            // 클릭된 이미지의 src 속성을 변경합니다.
            if (element.src.includes('like.png')) {
                element.src = "${pageContext.request.contextPath}/resources/images/liked.png";
            } else {
                element.src = "${pageContext.request.contextPath}/resources/images/like.png";
            }
        });
    });
    
    /* page_button hover */
    const currentPage = '<c:out value = "${pageMaker.cri.pageNum}"/>';
    
    $(".paginate-button a").each(function() {
        // 각 링크의 href 값을 가져옵니다. 이 값이 페이지 번호에 해당한다고 가정합니다.
        const pageNumber = $(this).attr("href");
        
        // currentPage와 pageNumber를 비교하여 동일한 경우에 파란색으로 스타일을 변경합니다.
        if (currentPage === pageNumber) {
            $(this).css("background-color", "rgba(218,80,80,0.6)"); // 혹은 원하는 스타일로 변경하세요
            $(this).css("color", "white"); // 텍스트 색상 변경 예시
            $(this).css("margin-bottom", "25px"); // 텍스트 색상 변경 예시
            
        }
    });
    /* page_button hover */
    
    
    /* paging */
   	var actionForm = $("#actionForm");
   	$(".pagination a").on("click",function(e){
   		e.preventDefault();
   		console.log('click');
   		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
   		actionForm.attr("action","/photoboard/list");
   		actionForm.submit();
   	});
   	/* paging */
   	
    // list-form을 클릭했을 때의 동작을 정의합니다.
	document.querySelectorAll('.form-header').forEach(function(element) {
	    element.addEventListener('click', function() {
	        // 클릭된 list-form의 pbno 값을 가져옵니다.
	        var pbno = element.getAttribute('data-pbno');
	        
	        // Change the action attribute of the actionForm
	        var actionForm = document.getElementById('actionForm');
	        actionForm.setAttribute('action', '/photoboard/get');
	        
	        // Remove any existing pbno input before adding a new one
	        var existingPbnoInput = actionForm.querySelector('input[name="pbno"]');
	        if (existingPbnoInput) {
	            existingPbnoInput.remove();
	        }
	        
	     // Create a new pbno input and append it to the actionForm
	        var pbnoInput = document.createElement('input');
	        pbnoInput.setAttribute('type', 'hidden');
	        pbnoInput.setAttribute('name', 'pbno');
	        pbnoInput.setAttribute('value', pbno);
	        actionForm.appendChild(pbnoInput);
	        
	        
	     
	        
	        // Submit the actionForm
	        actionForm.submit();
	    });
	});
   	
    // notice-form을 클릭했을 때의 동작을 정의합니다.
	document.querySelectorAll('.notice-form').forEach(function(element) {
	    element.addEventListener('click', function() {
	        // 클릭된 list-form의 pbno 값을 가져옵니다.
	        var pbno = element.getAttribute('data-pbno');
	        
	        // Change the action attribute of the actionForm
	        var actionForm = document.getElementById('actionForm');
	        actionForm.setAttribute('action', '/photoboard/get');
	        
	        // Remove any existing pbno input before adding a new one
	        var existingPbnoInput = actionForm.querySelector('input[name="pbno"]');
	        if (existingPbnoInput) {
	            existingPbnoInput.remove();
	        }
	        
	        // Create a new pbno input and append it to the actionForm
	        var pbnoInput = document.createElement('input');
	        pbnoInput.setAttribute('type', 'hidden');
	        pbnoInput.setAttribute('name', 'pbno');
	        pbnoInput.setAttribute('value', pbno);
	        actionForm.appendChild(pbnoInput);
	        
	        // Submit the actionForm
	        actionForm.submit();
	    });
	});
   	
   	
</script>