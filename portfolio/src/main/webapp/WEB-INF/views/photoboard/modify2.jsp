<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/nav.jsp" %>
    
    
    <style>
   		.photoboard-main{
    		/* border-style: solid;
            border-color: black; */
            
    	}
   		.margin-left{
    		/* border-style: solid;
            border-color: orange; */
    	
    		width:15%;
    	}
    	
    	.margin-right{
    		/* border-style: solid;
            border-color: orange; */
            
    		width:15%;
    		
    		display: flex;
			flex-direction: column; /* 수직으로 아이템을 배치합니다. */
			align-items: center; /* 아이템을 수평으로 가운데 정렬합니다. */
    	}
    	
    	.user-profile-image {
    	
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
		
		.user-profile-image img {
			/* border-style: solid;
            border-color: red; */
            
			width: 80%;
		    height: 80%;
		    object-fit: cover;
		}
		
		
		.user-profile-text {
			margin-top : 30px;
			margin-bottom : 30px;
			
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
            
    		width:70%;
    		
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
            
    		width:70%;
    		
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
    	}
    	
    	.photoboard-main > .main-body > .list-area{
    		/* border-style: solid;
            border-color: orange; */
            
    		width:70%;
    		
    		display: flex;
    		flex-wrap: wrap;
  			justify-content: flex-start;
    	}
    	
    	.list-area > .list-header{
    		border-style: solid;
            border-color: green;
            
    		width: 100%;
    		padding-left: 20px;
            padding-right: 20px;
            
    	}
    	
    	.list-header > .list-file{
    		border-style: solid;
            border-color: blue;
            
            width: 100%;
            padding-top: 20px;
            padding-bottom: 20px;
            
            display: flex;
			align-content: center;            
    	}
    	
    	.list-file > .uploadResult ul{
    		display: flex;
    		align-content: center;
    	}
    	
    	/* .list-header input{
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
		} */
    	
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
            
            width: 100%;
            
            display: flex;
           	justify-content: center;
           	align-content: center;
    	}
    	
    	.list-footer input{
			width: 8%;
			border: 2px solid #dddddd !important;
			font-size: 1rem;
			letter-spacing: -0.04rem;
			border-radius: 8px;
			padding: 7px;
			box-sizing: border-box;
			text-align: center;
			height: 36px;
			background-color: rgba(100,255,100,0.6);
		}
    	
    	
    	.list-body > .list-title{
    		/* border-style: solid;
            border-color: purple; */
            width: 100%;
            height : 100px;
            
    	}
    	
    	.list-body > .list-title input{
    		width: 100%; /* Set the width of the input to 100% */
			box-sizing: border-box;
			border-style: solid;
			border-color: grey;
			border-radius: 8px;
			font-size: 1.5rem;
			padding: 10px;
			outline: none;
    	}
    	
    	.list-body > .list-content{
    		/* border-style: solid;
            border-color: purple; */
            width: 100%;
    	}
    	
    	.list-body > .list-content textarea{
    		margin-top:25px;
    		border-style: solid;
	        border-color: black;
	        border-radius: 8px;
	        
			resize: none;
			
			
			width: 100%;
			height: 600px;
			padding: 20px; /* 내부 여백 추가 (선택사항) */
			box-sizing: border-box;
			outline: none;
			
			font-size: 1.0rem;
    	}
    	
    	
    	.photoboard-main > .main-footer{
    		/* border-style: solid;
            border-color: purple; */
    	}
    	
    </style>
    
    
	<main class=photoboard-main>
	
		<div class = main-header>
		
			<div class="margin-left">
				<!-- margin-left -->
			</div>
			<!-- margin-left -->
			
			<div class="board-title">
				<h1>TITLE</h1>
				<h2>sub title</h2>
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
				<span>test</span>
				<span>test</span>
			</div>
			
			<div class="margin-right">
				<!-- margin-right -->
			</div>
			<!-- margin-right -->
		</div>
		
		<div class = main-body>
			<div class="margin-left">
				margin-left
			</div>
			<!-- margin-left -->
			
			<div class="list-area" >
			
				<div class="list-header">
					
					<!-- <input type="button" value="수정하기">
					<input type="button" value="삭제하기" style="background-color: rgba(220,50,50,0.7);"> -->
					<div class="list-file">
						<div class="uploadDiv"> <!-- 책에서는 class="form-group uploadDiv -->
							<input type="file" name="uploadFile" multiple>
						</div>
						<!-- uploadDiv -->
						
						<div class="uploadResult">
							<ul>
							
							</ul>
						</div>
						<!-- uploadResult -->
					
						<!-- <button id="uploadBtn">Upload</button> -->
					</div>
					<!-- list-file -->
				</div>
				
				
				<form role="form" class="list-body" action="/photoboard/modify" method="post">
				
					<!-- 테스트용 히든  -->
					<input type="hidden" value="${photoboard.pbno }" name="pbno">
					<input type="hidden" value="${photoboard.email }" name="email">
					<input type="hidden" value="${photoboard.category }" name="category">
					<!--  -->
				
					<div class="list-title">
						<h2><input type="text" name="title" value="${photoboard.title }"></h2>
						
					</div>
					
					<div class="list-content">
						카테고리 
						<select>
							<option>category</option>
							<option>category</option>
							<option>category</option>
							<option>category</option>
							<option>category</option>
						</select>
						
						<textarea name="content">${photoboard.content }</textarea>
					</div>
					<div class="list-footer">
						<!-- <input type="submit" value="등록"> -->
						<button type="submit">등록</button>
					</div>
				</form>
				
				
			</div>
			<!-- list-area -->
			
			<div class="margin-right">
				<div class="user-profile-image">
					<img src="${pageContext.request.contextPath}/resources/images/profile-default-image.png">
				</div>
				
				<div class="user-profile-text">
					
					로그인 한 유저 정보란<br>
					유저가 등록한 인스타 주소<br>
					유저 소개란<br>
				</div>
				
				
			</div>
			<!-- margin-right -->
			
		</div>
		<!-- main-body -->
		
		
		<div class="main-footer">
		
			main footer
		</div>
		<!-- main-footer -->
		
		
	</main>
	<!-- photoboard-main -->
	
	<div class="bigPictureWrapper">
		<div class="bigPicture">
		</div>
	</div>
	<style>
		.bigPictureWrapper{
			position: absolute;
			display : none;
			justify-ontent: center;
			align-items: center;
			top:0%;
			width:100%;
			height:100%;
			background-color: gray;
			z-index : 100;
			background:rgba(1,1,1,0.7);
		}
		.bigPicture{
			position : relative;
			display:flex;
			justify-content: center;
			align-items:center;
		}
		.bigPicture img{
			width:600px;
		}
	</style>
</body>
</html>

<script>
$(document).ready(function(){
	(function(){
		var pbno = '${photoboard.pbno}';
		
		$.getJSON("/photoboard/getAttachList", {pbno:pbno}, function(arr){
			console.log(arr);
			
			var str = "";
			
			$(arr).each(function(i, attach){
				
				//image type
				if(attach.type != "false"){
					var fileCallPath = encodeURIComponent( attach.path+"/s_"+attach.uuid+"_"+attach.name);
					
					console.log("fileCallPath : " + fileCallPath);
					
					str += "<li data-path='"+attach.path+"'";
					str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.name+"' data-type='"+attach.type+"'";
					str += " ><div>";
					str += "<img src='/display?fileName="+fileCallPath+"'><br>";
					str += "<span> " + attach.name + "</span>";
					str += "<button type='button' data-file=/"+fileCallPath+" data-type='image' class=''><i class=''>x</i></button>";
					str += "</div>";
					str += "</li>";
					
				}else{

					str += "<li data-path='"+attach.path+"'";
					str += " data-uuid='"+attach.uuid+"' data-filename='"+attach.name+"' data-type='"+attach.type+"'";
					str += " ><div>";
					str += "<span> " + attach.name + "</span>";
					str += "<button type='button' data-file=/"+fileCallPath+" data-type='image' class=''><i class=''>x</i></button>";
					str += "</div>";
					str += "</li>";
					
				}
			}); //$(arr)
		$(".uploadResult ul").html(str);
		});
	})();
	
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB

	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈초과");
			
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	$("input[type='file']").change(function(e){
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		for(var i = 0; i < files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result){
				console.log(result);
				showUploadResult(result); // 업로드 결과 처리 함수
			}
		});//$.ajax
		
	});//$("input[type='file']")
	
	function showUploadResult(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0 ){
			return;
		}
		
		var uploadUL = $(".uploadResult ul");
		
		var str = "";
		
		$(uploadResultArr).each(function(i,obj){
			
			if(obj.image){
				var fileCallPath = encodeURIComponent( obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName );
				
				console.log("fileCallPath : " + fileCallPath);
				
				/* str += "<li><img src='/display?fileName=" + fileCallPath+"'><li><li>" + obj.fileName + "</li>"; */
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
				str += " ><div>";
				str += "<img src='/display?fileName="+fileCallPath+"'><br>";
				str += "<span> " + obj.fileName + "</span>";
				str += "<button type='button' data-file=/"+fileCallPath+" data-type='image' class=''><i class=''>x</i></button>";
				str += "</div>";
				str += "</li>";
					
			}else{
				var fileCallPath = encodeURIComponent( obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName );
				
				console.log("fileCallPath : " + fileCallPath);
				
				var fileLink = fileCallPath; //.replace(new RegExp(/\\/g),"/");
				
				/* str += "<li>" + obj.fileName + "</li>"; */
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
				str += " ><div>";
				str += "<span> " + obj.fileName + "</span>";
				str += "<button type='button' data-file=/"+fileCallPath+" data-type='image' class=''><i class=''>x</i></button>";
				str += "</div>";
				str += "</li>";
			}
		});
		
		uploadUL.append(str);
		
	}
	
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		
		console.log("수정하기 클릭");
		
		var str = "";
		
		$(".uploadResult ul li").each(function(i, obj){
			var jobj = $(obj);
			
			console.dir(jobj);
			str += "<input type='hidden' name='attachList["+i+"].name' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].path' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].type' value='"+jobj.data("type")+"'>";
		});
		
		formObj.append(str).submit();
	});
		
		
});

$(".uploadResult").on("click", "button", function(e){
		console.log("첨부파일 화면에서만 사라짐");
		
		if(confirm("이 파일을 삭제하시겠습니까? ")){
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
});
</script>

