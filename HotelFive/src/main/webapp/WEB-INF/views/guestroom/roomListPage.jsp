<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
<!--

.backimg {
	width: 100%;
	height: 750px;
	background-size: cover;
	background-image: url("resources/assets/background_img/hotel.jpg");
	text-align: center;
	color: white;
	padding-top: 300px;
}
-->
</style>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="객실소개" name="title" />
</jsp:include>

<!-- roomInfo 리스트 페이지  -->
<div class="backimg">
	<h3 id="hotelfive">Hotel Five</h3>
	<h1 id="pagetitle">Preview Rooms</h1>
	<p id="explain">호텔파이브만의 감성을 추구하는 호텔파이브의 객실</p>
</div>
<div class="roomListBox">
	<img id="roominfo" alt="roominfo"
		src="resources/assets/name_img/roominfo_name.png" /><br />
	<br />
	<c:forEach var="gDTO" items="${list }" varStatus="k">
		<c:if test="${1 eq (gDTO.gNo % 2)}">
			<div class="roomListOne">
				<!-- RoomView(상세페이지)로 이동 -->
				<img usemap="#${k.index }" alt="${gDTO.gName }" id="room_list_img"
					src="resources/assets/guestroom_img/${gDTO.gThumbnail }.png">
				<map name="${k.index }">
					<area href="roomViewPage?gNo=${gDTO.gNo }&gName=${gDTO.gName}"
						shape="rect" coords="16, 276, 150, 318">
				</map>
				<!-- 방정보  -->
				<div class="roomInfoLeft">
					<h3>${gDTO.gName }Information</h3>
					${gDTO.gExplain}<br /> ▶ 객실 크기 : ${gDTO.gRoomSize}평<br /> ▶ 기준인원 :
					${gDTO.gMinPeople}명<br /> ▶ 최대인원 : ${gDTO.gMaxPeople}명<br />
				</div>
			</div>
			<br />
			<hr id="line" />
		</c:if>

		<c:if test="${0 eq (gDTO.gNo % 2)}">
			<div class="roomListOne">
				<!-- 방정보  -->
				<div class="roomInfoRight">
					<h3>${gDTO.gName }Information</h3>
					${gDTO.gExplain}<br /> 객실 크기 : ${gDTO.gRoomSize}평 ◀<br /> 기준인원 :
					${gDTO.gMinPeople}명 ◀<br /> 최대인원 : ${gDTO.gMaxPeople}명 ◀<br />
				</div>
				<!-- RoomView(상세페이지)로 이동 -->
				<img usemap="#${k.index }" alt="${gDTO.gName }" id="room_list_img"
					src="resources/assets/guestroom_img/${gDTO.gThumbnail }.png">
				<map name="${k.index }">
					<area href="roomViewPage?gNo=${gDTO.gNo }&gName=${gDTO.gName}"
						shape="rect" coords="16, 276, 150, 318">
				</map>
			</div>
			<br />
			<hr id="line" />
		</c:if>
	</c:forEach>
</div>
</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp"%>