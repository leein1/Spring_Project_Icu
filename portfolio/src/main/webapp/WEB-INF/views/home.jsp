<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="./includes/nav.jsp" %>
<style>
    .banner-container {
        position: relative; /* 부모 요소를 상대적으로 위치 지정 */
        width: 100%;
        height: 100vh;
    }

    .banner {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .banner-text {
        position: absolute; /* 자식 요소를 절대적으로 위치 지정 */
        top: 30%; /* 부모 요소 상단에서 50% 위치로 이동 */
        left: 20%; /* 부모 요소 왼쪽에서 50% 위치로 이동 */
        transform: translate(-50%, -50%); /* 중앙 정렬을 위한 이동 */
        text-align: left;
        color: rgba(255,255,255,0.8); /* 텍스트 색상 */
        font-size: 80px; /* 텍스트 크기 */
        background-color: rgba(0, 0, 0, 0.0); /* 배경색 및 투명도 조절 */
        padding: 20px; /* 텍스트 내부 여백 */
        font-weight: bold;
    }
    
    .banner-text2 {
        position: absolute; /* 자식 요소를 절대적으로 위치 지정 */
        top: 50%; /* 부모 요소 상단에서 50% 위치로 이동 */
        left: 25%; /* 부모 요소 왼쪽에서 50% 위치로 이동 */
        transform: translate(-50%, -50%); /* 중앙 정렬을 위한 이동 */
        text-align: left;
        color: rgba(255,255,255,0.8); /* 텍스트 색상 */
        font-size: 80px; /* 텍스트 크기 */
        background-color: rgba(0, 0, 0, 0.0); /* 배경색 및 투명도 조절 */
        padding: 20px; /* 텍스트 내부 여백 */
        text-indent: 100px; /* 들여쓰기 크기 */
        font-weight: bold;
    }
    
</style>

<div class="banner-container">
    <img class="banner" src="${pageContext.request.contextPath}/resources/images/photoboardBanner10.jpg">
    <p class="banner-text">WHAT YOU SEE</p>
    <p class="banner-text2">WHAT YOU TAKE</p>
</div>
<hr>

<div style="width:100%; display:flex; justify-content: center; align-content: center;">
	<div style="width:80%; padding:50px;">
		<h3><li>해당 포트폴리오에 사용된 인물 사진 및 배너 사진, 게시물의 첨부된 사진은 직접 촬영한 사진입니다 - 저작권 침해X </li></h3>
	</div>
</div>


<%@ include file="./includes/footer.jsp" %>