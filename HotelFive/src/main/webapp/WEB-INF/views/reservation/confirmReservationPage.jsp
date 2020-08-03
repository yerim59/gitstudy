<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="객실예약" name="title" />
</jsp:include>

<div id="step3" class="step3">
	<img id="step_img" alt="step"
		src="resources/assets/reservation_img/R_STEP3.PNG"><br /> <img
		alt="logo" src="resources/logo/register.jpg">
	<p>
		<c:if test="${loginDTO eq null }">
					 ${nmName }
				</c:if>
		<c:if test="${loginDTO ne null }">
					 ${loginDTO.mName}
				</c:if>
		님 예약이 성공적으로 이루어졌습니다.
	</p>
	<p>입금정보를 확인한 후 입금계좌로 금액을 입금해 주세요.</p>
	<div id="step3-info">
		<div id="re-info">
			<h3>예약정보</h3>
			<p id="info-p">
				<c:if test="${loginDTO eq null }">
					예약자명 : ${nmName }
				</c:if>
				<c:if test="${loginDTO ne null }">
					예약자명 : ${loginDTO.mName}<br />
				</c:if>
				예약객실 : ${gName }<br /> 투숙기간 : ${rCheckIn } ~ ${rCheckOut }<br />
			</p>
		</div>
		<div id="bl-info">
			<h3>입금정보</h3>
			<p id="info-p">
				입금자명 : (주)호텔파이브<br /> 입금계좌 : 302-0040-9885-71<br /> 은행명 : 농협중앙회<br />
				입금금액 : ${rPrice }원<br />
			</p>
		</div>
	</div>
	<input type="button" value="홈으로 가기" onclick="location.href='main'" />
</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp"%>