<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 채팅 css -->
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
	
<!-- 웹소켓 통신 -->
<script type="text/javascript" src="../../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript" src="../../resources/js/sockjs-0.3.4.js"></script>
<script type="text/javascript" src="../../resources/js/stomp.js"></script>
<script type="text/javascript" src="../../resources/js/webSocketSendToUserApp.js"></script>

<script type="text/javascript">
	var stompClient = null;
	var roomNo = ${roomInfo.roomNo};
	var nowSession = "${member_id}";
	var requestor = "${roomInfo.chatRequestor}";
	var receiver = "${roomInfo.chatReceiver}";
	var chatcode = ${roomInfo.chatCode};

	//1. 소켓객체 생성
	var socket = new SockJS('${pageContext.request.contextPath}/chat2');
	//2. 데이터를 전송하고, 받을 수 있는 stompClent객체 생성
	stompClient = Stomp.over(socket);

	//3. 채팅방 지정하여 가입하자.
	stompClient.connect({}, function() {
		stompClient.subscribe("/topic2/" + roomNo, function(messageOutput) {
			//서버에서 받은 메시지 출력 
			showMessageOutput(JSON.parse(messageOutput.body));
		})
	})
	//4. 서버에서 보냈을 때 어떻게 처리할지 지정 

	//서버로 메세지 보냄 
	function sendMessage() {
		//url을 /app/cht을 호출하고,data를 json형태의 sring으로 만들어서 보내라. 
		// /chat2처럼 하위를 무조건 써줘야 함 이유는 모름.. + /app은 생략가능 마찬가지로 이유는 모름
		stompClient.send("/app2/chat3/" + roomNo, {}, JSON.stringify({ 
			'roomNo' : ${roomInfo.roomNo},
			'sender' : "${member_id}", // -> "" 안해주면 변수로 처리!
			'content' : $('#message').val()
		}));
	}

	//받은 데이터를 원하는 위치에 넣음. ==> 받은 데이터를 채팅목록으로 쌓는다. 
	function showMessageOutput(messageOutput) {
    var response = document.getElementById('response');
    var newMessageDiv = document.createElement('div');

    if (messageOutput.sender === "${member_id}") {
        newMessageDiv.classList.add("d-flex", "justify-content-end", "mb-4");

        var msgContainerSend = document.createElement('div');
        msgContainerSend.classList.add("msg_cotainer_send");

        msgContainerSend.textContent = messageOutput.content;

        var msgTimeSend = document.createElement('span');
        msgTimeSend.classList.add("msg_time_send");
        msgTimeSend.textContent = messageOutput.time;

        msgContainerSend.appendChild(msgTimeSend);

        newMessageDiv.appendChild(msgContainerSend);
    } else {
        newMessageDiv.classList.add("d-flex", "justify-content-start", "mb-4");

        var msgContainer = document.createElement('div');
        msgContainer.classList.add("msg_cotainer");

        msgContainer.textContent = messageOutput.content;

        var msgTime = document.createElement('span');
        msgTime.classList.add("msg_time");
        msgTime.textContent = messageOutput.time;

        msgContainer.appendChild(msgTime);

        newMessageDiv.appendChild(msgContainer);
    }
    response.appendChild(newMessageDiv);

    // 메시지 보내면 input 초기화
    $('#message').val(null);
}


	// form이 없을 때 버튼을 마우스로 클릭하지 않고 엔터로 입력처리
	function enter(){
		if(window.event.keyCode == 13){
			$('#sendMessage').click();
			// = document.getElementById('sendMessage').click();
		}
	}
	
	function tradeCheck(){
	
		$.ajax({
		    url: "codeCheck",  // Spring 컨트롤러의 URL
		    data: {
		    	requestor : requestor,
		    	receiver : receiver,
		    	nowSession : nowSession,
		    	roomNo : roomNo
		    },  // 전송할 데이터를 JSON 형태로 변환
		    success: function(trade) {
		    	if (trade == 0) {
					alert("포인트가 부족합니다!")
				} else {
					$('#state').text("거래수락");	
				}
		      // 요청이 성공했을 때 실행되는 콜백 함수
		      // 서버에서 반환한 응답 데이터를 처리
		    },
		    error: function(xhr, status, error) {
		      // 요청이 실패했을 때 실행되는 콜백 함수
		      // 에러 처리
		    }
		  });
	}
</script>

<!-- 공용 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/style.css">
	
<!-- 게시물로 이동 버튼 css -->	
<style>
  .btn {
    background-color: #555555;
    color: white;
    border: none;
    padding: 5px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    transition-duration: 0.4s;
    cursor: pointer;
  }
  
  .btn:hover {
    background-color: #333333;
  }
</style>	
	
</head>
<body>
<%@ include file="/resources/public/header.jsp"%>

	<div class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(${pageContext.request.contextPath}/resources/template/img/bg-img/breadcumb3.jpg);">
		<div class="bradcumbContent">
			<p>채팅방</p>
			<h2>Chat Room</h2>
		</div>
	</div>
<!-- ---------------------------------------------------------------------------- -->
<div class="row justify-content-center">

	<div class="col-md-8 col-xl-6 chat mt-5">

		<div class="card">

			<div class="card-header msg_head">
				<div class="d-flex bd-highlight">
					<div class="img_cont">
						<img src="${pageContext.request.contextPath}/resources/img/bbs/member.jpg" class="rounded-circle user_img">
					</div>
					<div class="user_info">
					
						<span style="display: inline-block;">
							${member.member_id} (${member.count}회)
							&nbsp;&nbsp;&nbsp;&nbsp;
							<c:if test="${bbs.bbsShareSuccess eq false}">
								<button class="btn" onclick="tradeCheck();">거래완료</button>
							</c:if>
							<c:if test="${bbs.bbsShareSuccess eq true}">
								<button class="btn" onclick="tradeCheck();" disabled>거래완료</button>
							</c:if>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<span id="state" style="display: inline-block;">
								<c:choose>
									<c:when test="${roomInfo.chatCode eq 1 && roomInfo.chatRequestor eq member_id}">
										거래수락
									</c:when>
									
									<c:when test="${roomInfo.chatCode eq 2 && roomInfo.chatReceiver eq member_id}">
										거래수락
									</c:when>
									
									<c:when test="${roomInfo.chatCode eq 3}">
										거래수락
									</c:when>
									
									<c:otherwise>
										거래미수락
									</c:otherwise>
								</c:choose>
							</span>
						</span>
						
						<p style="font-size: 20px; display: inline-block;">
							<img src="${pageContext.request.contextPath}/resources/img/bbs/${bbs.bbsShareImage}" width="50" height="50">
							: ${bbs.bbsShareTitle} &nbsp;/&nbsp; ${bbs.bbsSharePoint}P &nbsp;/&nbsp; 
							<c:if test="${bbs.bbsShareSuccess eq false}">
								[거래중]
							</c:if>
							<c:if test="${bbs.bbsShareSuccess eq true}">
								[거래완료]
							</c:if>
						</p>&nbsp;&nbsp;
						<form action="../bbsShare/one" method="post" style="display: inline-block;">
							<input type="hidden" name="bbsShareNo" value="${bbs.bbsShareNo}">
							<button class="btn">게시글로 이동</button>
						</form>
						
					</div>
				</div>
			</div>

			<div class="card-body msg_card_body" id="response">
			
				<c:forEach items="${list}" var="list">
					<c:choose>
						<c:when test="${list.sender eq member_id}">
							<div class="d-flex justify-content-end mb-4">
								<div class="msg_cotainer_send">
									${list.content}
									 <span class="msg_time_send">${list.time}</span>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="d-flex justify-content-start mb-4">
								<div class="msg_cotainer">
									${list.content} <span class="msg_time">${list.time}</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>

			<div class="card-footer">
				<div class="input-group">
					<input type="text" class="form-control type_msg" id="message" onkeyup="enter();"
						placeholder="메시지를 입력하세요.">
					<div class="input-group-append">
						<span class="input-group-text send_btn">
							<i class="fas fa-location-arrow" id="sendMessage" onclick="sendMessage();"></i>
						</span>
					</div>
				</div>
			</div>

		</div>

	</div>

</div>
<!-- ---------------------------------------------------------------------------- -->
	
	
	<!-- jQuery-2.2.4 js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/active.js"></script>
</body>
</html>