<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var radios = document.querySelectorAll('input[name="bbsShareRequest"]');
		var span = document.getElementById('requestpoint');

		radios.forEach(function(radio) {
			radio.addEventListener('change', function() {
				if (this.value === '0') {
					span.textContent = "보상 ";
				} else if (this.value === '1') {
					span.textContent = "요구 ";
				}
			});
		});

		document.querySelector('form').addEventListener('submit', function(event) {
			  event.preventDefault(); // submit 이벤트의 기본 동작을 방지
				console.log("form start");
			  var form = this;

			  $.ajax({
			    url: "checkpoint",
			    type: 'POST',
			    data: {"nickname": "<%=session.getAttribute("nickname")%>"},
			    success: function(data) {
			      var point = parseInt(document.querySelector('input[name="bbsSharePoint"]').value);
			      if (data >= point || document.querySelector('input[name="bbsShareRequest"]:checked').value == 1) {
			        // AJAX를 사용하여 폼 데이터를 서버로 전송
			        $.ajax({
			          type : 'POST',
			          url : 'insert',
			          data : new FormData(form),
			          processData : false,
			          contentType : false
			        });

			        // 이전 페이지로 이동
			        history.back();
			      } else {
			        alert('포인트가 부족합니다. 보유포인트 : ' + data);
			      }
			    }
			  });
			});
		};
		
	</script>
</head>
<body>
<div id="bbs">
	<div id="bbs_title">
		게 시 판
	</div>
	
	<form action="insert" method="post" name="myForm">
	<div id="bbsCreated">
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 : <input type="text" name=bbsShareTitle size="60" maxlength="100"/></dt>
			</dl>
			<dl>
				<dt>작&nbsp;성&nbsp;자 : <input type="text" name="bbsShareWriter" size="20" maxlength="30" value="<%=session.getAttribute("nickname")%>" readonly/></dt>
			</dl>		
			<dl>
				<dt>요청&nbsp;여부 : <input type="radio" name="bbsShareRequest" value="0" checked="checked"/>요청<input type="radio" name="bbsShareRequest" value="1"/>나눔</dt>
			</dl>	
			<dl>
				<dt><span id="requestpoint">보상 </span>포인트 : <input type="number" name="bbsSharePoint" size="5" maxlength="5" value="0" /></dt>
			</dl>
			<dl>
				<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt><br>
				<dt><textarea rows="12" cols="63" name="bbsShareContent"></textarea></dt>
			</dl>
		</div>
	</div>
	<button type="submit">글쓰기</button>
	</form>

</div>
	
</body>
</html>