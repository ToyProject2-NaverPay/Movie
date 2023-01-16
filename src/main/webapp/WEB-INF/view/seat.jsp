<%@ page import="com.example.movie.dto.TicketDTO" %>
<%--<%@ page import="com.example.demo.model.MemberDTO" %>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<%
	//	MemberDTO login = (MemberDTO) session.getAttribute("login");
	TicketDTO ticket = (TicketDTO) request.getAttribute("ticket");
//	if (reserve != null && reserve.getCgvPayDto() != null) {
//		System.out.println(reserve.toString());
//	} else {
//		System.out.println("오류가있습니다!!");
//	}
%>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="css/resett.css">
	<link rel="stylesheet" href="css/seat.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel='stylesheet'
		  href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
	<script
			src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
	<link rel="stylesheet"
		  href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>

<body>
<%@ include file="header.jsp" %>
<div class="select-container">
	<div class="select-wrapper">
		<div class="select-title">인원 / 좌석</div>
		<div class="select-seat-container">
			<div class="select-seat-number-container">
				<div class="select-seat-number-wrapper">
					<div class="select-seat">
						<div class="select-seat-age">일반</div>
						<div class="select-seat-number">
							<ul class="select-seat-ul select-seat-ul-normal">
								<li class="select-number-normal ">0</li>
								<li class="select-number-normal">1</li>
								<li class="select-number-normal">2</li>
								<li class="select-number-normal">3</li>
								<li class="select-number-normal">4</li>
								<li class="select-number-normal">5</li>
							</ul>
						</div>
					</div>
					<div class="select-seat">
						<div class="select-seat-age">청소년</div>
						<div class="select-seat-number">
							<ul class="select-seat-ul select-seat-ul-teen">
								<li class="select-number-teen">0</li>
								<li class="select-number-teen">1</li>
								<li class="select-number-teen">2</li>
								<li class="select-number-teen">3</li>
								<li class="select-number-teen">4</li>
								<li class="select-number-teen">5</li>
							</ul>
						</div>
					</div>
					<div class="select-seat">
						<div class="select-seat-age">우대</div>
						<div class="select-seat-number">
							<ul class="select-seat-ul  select-seat-ul-old">
								<li class="select-number-old">0</li>
								<li class="select-number-old">1</li>
								<li class="select-number-old">2</li>
								<li class="select-number-old">3</li>
								<li class="select-number-old">4</li>
								<li class="select-number-old">5</li>
							</ul>
						</div>
					</div>

				</div>
				<div class="reserve-number-wrapper">
					<div class="reserve-number-title">선택된 좌석 수</div>
					<div class="reserve-number">0</div>
				</div>
			</div>
			<div class="select-seat-information">
				<div class="selected-movie"><%=ticket.getMovieTitle()%></div>
				<div class="select-seat-information-wrapper">
					<div class="select-theater-place selected-theater-place-info"><%=ticket.getSelectedTheater()%></div>
					<div class="select-theater-place selected-theater-place-info">
						4관(Laser)6층 </div>
					<div class="select-theater-place">
						<span>남은좌석</span><span class="remain-seats">152</span>/<span
							class="all-seats">172</span>
					</div>

				</div>
				<div class="select-theater-date">
					<div class="theater-date"><%=ticket.getMovieDate()%></div>
					<div class="theater-time"><%=ticket.getMovieStartTime()%></div>
				</div>
				<div class="selected-seats-wrapper">
					<span class="selected-seats-title">좌석번호</span> <span
						class="selected-seats">선택한 좌석이 없습니다.</span>
				</div>
				<div class="ticket-price-wrapper">
					<div class="ticket-price-title">가격</div>
					<div class="ticket-price" id = "ticket-price">0원</div>
				</div>

			</div>
		</div>
		<div class="seat-container">

			<div class="seat-wrapper">
				<div class="screen-view-wrapper">
					<div class="screen-view">SCREEN</div>
				</div>
			</div>
		</div>
		<div class="btn_group">
			<button class="before_btn" onclick="history.go(-1)">< 이전</button>
			<button class="next_btn" onclick="seatConfirm();">다음 ></button>
		</div>
	</div>
</div>


</div>
</div>
<form action="moveKakao.do" class="seatForm" method="POST">
	<input type="hidden" class="title" name="movieTitle">
	<input type="hidden" class="selectedTheater" name="selectedTheater">
	<input type="hidden" class="reserveDate" name="movieDate">
	<input type="hidden" class="runningTime" name="movieStartTime">
	<input type="hidden" class="ticketNumber" name="ticketNumber">
	<input type="hidden" class="selectedSeat" name="selectedSeat">
	<input type="hidden" class="payMoney" name="payMoney">
</form>


</body>
<script src="js/seat.js"></script>

<div class = "facam-image">
	<img src="./images/facam.png">
</div>
<script>

	function seatConfirm(){
		if (confirm("좌석을 선택하시겠습니까?")){
			reserve();
			if (flag == 1){
				setTimeout(function() {
					location.href = "/payticket.do";
				}, 200);
			}
		} else {
			reserve();
		}
	}
</script>



</html>