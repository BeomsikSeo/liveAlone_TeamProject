<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	var socket = new SockJS('${pageContext.request.contextPath}/chat');
	//2. 데이터를 전송하고, 받을 수 있는 stompClent객체 생성
	stompClient = Stomp.over(socket);

	//3. 채팅방 지정하여 가입하자.
	stompClient.connect({}, function() {
		stompClient.subscribe("/topic/" + roomNo, function(messageOutput) {
			//서버에서 받은 메시지 출력 
			showMessageOutput(JSON.parse(messageOutput.body));
		})
	})
	//4. 서버에서 보냈을 때 어떻게 처리할지 지정 

	//서버로 메세지 보냄 
	function sendMessage() {
		//url을 /app/cht을 호출하고,data를 json형태의 sring으로 만들어서 보내라. 
		// /chat2처럼 하위를 무조건 써줘야 함 이유는 모름.. + /app은 생략가능 마찬가지로 이유는 모름
		stompClient.send("/app/chat2/" + roomNo, {}, JSON.stringify({ 
			'roomNo' : ${roomInfo.roomNo},
			'sender' : "${member_id}", // -> "" 안해주면 변수로 처리!
			'content' : $('#message').val()
		}));
	}

	//받은 데이터를 원하는 위치에 넣음. ==> 받은 데이터를 채팅목록으로 쌓는다. 
	function showMessageOutput(messageOutput) {
		//<p id="response">
		//	<p> 홍길동: 잘지내지?(13:00)</p>
		//</p>
		var response2 = document.getElementById('response2');
		var p = document.createElement('p'); // p태그를 만들어라.
		//p.style.wordWrap = 'break-word'; // css니까 일단 무시
		p.appendChild(document.createTextNode(messageOutput.sender + " : "
				+ messageOutput.content + " (" + messageOutput.time + ")"));
		response2.appendChild(p);
		
		// 메시지보내면 input 초기화
		// = document.getElementById('message').value = null;
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
	//서버로 연결 끊음. 
	/* function disconnect() {
		if (stompClient != null) {
			stompClient.disconnect();
		}
		setConnected(false); //연결끊어졌을 때 설정 변경 
		console.log("Disconnected");
	} */
	
	/* var message = 'requestor : ${requestor} , receiver : ${receiver}'
	document.getElementById("check").innerHTML = message; */
</script>
</head>
<body>
	<div id="conversationDiv">
		<input type="text" id="message" onkeyup="enter();" placeholder="Write a message..." />
		<button id="sendMessage" onclick="sendMessage();">Send</button>
		<span id="state">
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
					거래중
				</c:otherwise>
			</c:choose>
		</span>
		

		<!-- 메시지리스트 받아오기 -->
		<p id="response">
			<c:forEach items="${list}" var="list">
				<p> ${list.sender} : ${list.content} (${list.time}) </p>
			</c:forEach>
		</p>
		<!-- <p id="response"> 여기다 해버리면 읽어온 리스트위에서 진행되기 때문에 그냥 이렇게 별도로 하나 만들어줌 -->
		<p id="response2">
			
		</p>
		<button onclick="tradeCheck();">거래완료</button>
	</div>

</body>
</html>