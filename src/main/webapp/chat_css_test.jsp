<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/chatroom/chatroom.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
</head>
<body>

	<div class="col-md-8 col-xl-6 chat">

		<div class="card">

			<div class="card-header msg_head">
				<div class="d-flex bd-highlight">
					<div class="img_cont">
						<img src="" class="rounded-circle user_img">
					</div>
					<div class="user_info">
						<span>Chat with Khalid</span>
						<p>1767 Messages</p>
					</div>
				</div>
			</div>

			<div class="card-body msg_card_body">

				<div class="d-flex justify-content-start mb-4">
					<div class="img_cont_msg">
						<img src="" class="rounded-circle user_img_msg">
					</div>
					<div class="msg_cotainer">
						Hi, how are you samim? <span class="msg_time">8:40 AM,
							Today</span>
					</div>
				</div>

				<div class="d-flex justify-content-end mb-4">
					<div class="msg_cotainer_send">
						Hi Khalid i am good tnx how about you? <span class="msg_time_send">8:55
							AM, Today</span>
					</div>
					<div class="img_cont_msg">
						<img src="" class="rounded-circle user_img_msg">
					</div>
				</div>

			</div>

			<div class="card-footer">
				<div class="input-group">
					<textarea name="" class="form-control type_msg"
						placeholder="Type your message..."></textarea>
					<div class="input-group-append">
						<span class="input-group-text send_btn"><i
							class="fas fa-location-arrow"></i></span>
					</div>
				</div>
			</div>

		</div>

	</div>
</body>
</html>