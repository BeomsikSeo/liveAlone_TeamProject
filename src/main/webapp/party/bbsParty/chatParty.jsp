<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>One Music - Modern Music HTML5 Template</title>




    <!-- Favicon -->
    <link rel="icon" href="../../resources/template/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../../resources/template/style.css">
    
    
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
						$('#pre_response').append('<p>' + array[i].member_id + ": " +  array[i].chat_log + " (" + array[i].chat_time + ")</p>")
					}//for
	<%-- 				if (<%=session.getAttribute("newJoin")%> == 1) {
						console.log("새로운사람");
						var p = document.createElement('p');
						$('#response').append('<p>'+ "<%= session.getAttribute("member_id") %>" + '님이 새로 채팅방에 가입하셨습니다.</p>')
						/* location.href="http://localhost:8887/liveAlone/party/bbsParty/newJoinParty.jsp"; */
					}//if --%>
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
				//setConnected(true) //css설정 
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
			$("#text").val("");
		}
		
		//받은 데이터를 원하는 위치에 넣음. ==> 받은 데이터를 채팅목록으로 쌓는다. 
		function showMessageOutput(messageOutput) {
			//<p id="response">
			//	<p> 홍길동: 잘지내지?(13:00)</p>
			//</p>
			var response = document.getElementById('response');
			
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
<%@ include file="/resources/public/header.jsp" %>
    <%-- <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="oneMusic-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                        <!-- Nav brand -->
                        <a href="../../mainPage.jsp" class="nav-brand"><img src="../../resources/template/img/core-img/logo.png" alt=""></a> <!--난혼자산다 아이콘으로 변경-->

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu ">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav ">
                                <ul>
                                    <li><a href="../../mainPage.jsp">메인</a></li>
                                    <li><a href="albums-store.jsp">혼밥</a></li>
                                    <li class="has-down"><a>동행</a>
                                    	<ul class="dropdown">
                                        	<li><a href="../../party/bbsParty/bbsPartyAll?page=1">동행</a></li>
                                            <li><a href="https://themewagon.github.io/one-music/#">여행</a></li>
                                        </ul></li>
                                    <li><a href="blog.jsp">나눔&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</a></li>
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <% if(session.getAttribute("member_id") != null){%>
	                            	<div class="login-register-cart-button d-flex align-items-center">
	                                    <!-- Login/Register -->
	                                    <div class="login-register-btn mr-50">
	                                        <a href="../../login.jsp" id="loginBtn">마이페이지</a>
	                                    </div>
	                                    <div class="login-register-btn mr-50">
	                                        <a href="../../login.jsp" id="loginBtn">로그아웃</a>
	                                    </div>
	                                </div>										
	                            <%} else{ %>
	                            	<div class="login-register-cart-button d-flex align-items-center">
	                                    <!-- Login/Register -->
	                                    <div class="login-register-btn mr-50">
	                                        <a href="../../login.jsp" id="loginBtn">로그인</a>
	                                    </div>
	                                    <div class="login-register-btn mr-50">
	                                        <a href="../../login.jsp" id="loginBtn">회원가입</a>
	                                    </div>
	                                </div>
	                            <%} %>
                            </div>
                            <!-- Nav End -->

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### --> --%>





    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(../../resources/template/img/bg-img/trip1.jpg);">
        <div class="bradcumbContent">
            <p>채팅방</p>
            <h2>${roomId}</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Blog Area Start ##### -->
    <div class="blog-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-9">

                    <!-- Single Post Start -->
                    <div class="single-blog-post mb-100 wow fadeInUp" data-wow-delay="100ms">
                        <!-- Post Thumb -->
                        <div id="conversationDiv" class="blog-post-thumb mt-30" >
	                           <div id="pre_response" class="alert alert-success">"이전 채팅 기록"</div>
								<div id="response" class="alert alert-success"></div>
								<input type="text" id="text" placeholder="Write a message..." class="form-control" onkeyup="if(window.event.keyCode==13){sendMessage()}" />
								<button id="sendMessage" onclick="sendMessage();"
									class="btn btn-primary">Send</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="../../resources/template/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="../../resources/template/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="../../resources/template/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="../../resources/template/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="../../resources/template/js/active.js"></script>



</body>
</html>