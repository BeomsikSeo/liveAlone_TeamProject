<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../../resources/js/sockjs-0.3.4.js"></script>
<script type="text/javascript" src="../../resources/js/stomp.js"></script>
<script type="text/javascript" src="../../resources/js/webSocketSendToUserApp.js"></script>
<script type="text/javascript">
<%
int roomId = (int) session.getAttribute("partyBbs_num");

%>	
	var stompClient = null;
	var roomId = <%= roomId %>;
	
	//이렇게하면 찍을수 있는지
 	$(document).ready(function() {
		$.ajax({
			url : "chatLog",
			dataType : "json",
			success : function(array) {
				//var response = $('#response')
				console.log(array.length);
				for(i = 0; i < array.length; i++){
					var p = document.createElement('p'); //p태그를 만들어라.
					//p.style.wordWrap = 'break-word';
					//p.appendChild(document.createTextNode(array[i].member_id + ": "
						//	+ array[i].chat_log + " (" + array[i].chat_time + ")"));
					//response.appendChild(p);
					$('#pre_response').append('<p>' + array[i].member_id + ": " +  array[i].chat_log + " (" + array[i].chat_time + ")</p>")
				}//for
				console.log("(완료)");
			} //success
		})//ajax
	}) //b2 
	
	
	
	//바로 커넥트 하는 기능
	function setConnected(connected) { //연결 여부에 따라 설정 
		document.getElementById('connect').disabled = connected;
		document.getElementById('disconnect').disabled = !connected;
		document.getElementById('conversationDiv').style.visibility = connected ? 'visible'
				: 'hidden';
		//$('#response').html('')와 동일한 코드 
		document.getElementById('response').innerHTML = '';
	}
	
	function connect() {
		//1. 소켓객체 생성
		var socket = new SockJS('${pageContext.request.contextPath}/chat/' + roomId)
		//2. 데이터를 전송하고, 받을 수 있는 stompClent객체 생성
		stompClient = Stomp.over(socket);
		
		//3. 채팅방 지정하여 가입하자.
		stompClient.connect({}, function(frame) {
			setConnected(true) //css설정 
			/* alert('연결됨. '+ frame) */
			stompClient.subscribe('/topic/messages/' + roomId, function(messageOutput) {
				//서버에서 받은 메시지 출력 
				showMessageOutput(JSON.parse(messageOutput.body));
			})
		})
		//4. 서버에서 보냈을 때 어떻게 처리할지 지정 
	}
	
	//서버로 메세지 보냄 
	/* function sendMessage(roomId) { */
	function sendMessage() {
		//입력한 정보를 가지고 와서 
		var from = '<%= session.getAttribute("member_id") %>' ;
		var text = document.getElementById('text').value;
		
		//url을 /app/cht을 호출하고,data를 json형태의 sring으로 만들어서 보내라. 
		stompClient.send("/app/chat/"+roomId, {}, JSON.stringify({
			'from' : from, 
			'text' : text

		}));
	}
	
	//받은 데이터를 원하는 위치에 넣음. ==> 받은 데이터를 채팅목록으로 쌓는다. 
	function showMessageOutput(messageOutput) {
		//<p id="response">
		//	<p> 홍길동: 잘지내지?(13:00)</p>
		//</p>
		var response = document.getElementById('response');
		
		//아래 부분 for문으로 돌리기
		var p = document.createElement('p'); //p태그를 만들어라.
		p.style.wordWrap = 'break-word';
		p.appendChild(document.createTextNode(messageOutput.from + ": "
				+ messageOutput.text + " (" + messageOutput.time + ")"));
		response.appendChild(p);
	}
	
	//서버로 연결 끊음. 
	function disconnect() {
		if (stompClient != null) {
			stompClient.disconnect();
		}
		setConnected(false); //연결끊어졌을 때 설정 변경 
		console.log("Disconnected");
	}
	
</script>
</head>
<body onload="connect()">

<br><br>
	<div>

		<br />
		<div>
			<button id="connect" onclick="connect();" class="btn btn-danger" style="width:200px">Connect</button>
			<button id="disconnect" disabled="disabled" onclick="disconnect();" style="width:200px" class="btn btn-danger">Disconnect</button>
		</div>
		<br />
		<div id="conversationDiv">
			<input type="text" id="text" placeholder="Write a message..." class="form-control" />
			<button id="sendMessage" onclick="sendMessage();"
				class="btn btn-primary">Send</button>
			<div id="pre_response" class="alert alert-success">"이전 채팅 기록"</div>
			<div id="response" class="alert alert-success"></div>
		</div>
	</div>
	<%-- ${pageContext.request.contextPath} --%>
</body>
</html>