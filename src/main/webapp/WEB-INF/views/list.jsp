<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>여행지 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/style.css">
    <style>
  .NameContainer {
    display: inline-block;
    margin-right: 10px; /* 요소 사이 간격을 조정할 수 있습니다 */
    vertical-align: middle; /* 요소를 수직 정렬합니다 */
  }
</style>
</head>
<body>
<%@ include file="/resources/public/header.jsp" %>
	<%-- 해당 주제 페이지에 맞는 이미지와 페이지 설명이 들어가는 부분 --%>
	<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(${pageContext.request.contextPath}/resources/template/img/bg-img/breadcumb3.jpg); --%>">
        <div class="bradcumbContent">
            <p>설명 부분</p>
            <h2>여행지</h2>
        </div>
	</section>
	<section>
   
   <br><br>
   <div class="row oneMusic-albums">
   
  <c:forEach items="${list}" var="vo">
    
    <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item ">
                    <div class="single-album">
                  <img src="${pageContext.request.contextPath}/resources/voyageimg/${vo.name}.jpg" alt="Image">
                        <div class="album-info">
                           <button class="nameButton" data-name="${vo.name}">${vo.name}</button>
                       
                        </div>
                    </div>
                </div>
  </c:forEach>
  </div>
   <script>
     $(document).ready(function() {
         $('.nameButton').click(function() {
            var name = $(this).text();
            insertSelect(name);
            window.open("one?name=" + name, "_blank");
         });
      });
      
     function insertSelect(name) {
    	  $.ajax({
    	    url: 'insertselect',
    	    method: 'POST',
    	    data: {
    	      member_id: '<%= session.getAttribute("member_id") %>',
    	      selection: name
    	    },
    	    success: function(response) {
    	      console.log('데이터가 추가되었습니다.');
    	     
    	    },
    	    error: function(xhr, status, error) {
    	      console.log('Error:', error);
    	    }
    	  });
    	}
   </script>
   </section>
   <%@ include file="/resources/public/footer.jsp" %>
	<div>
	    <!-- jQuery-2.2.4 js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/jquery/jquery-2.2.4.min.js"></script>
	    <!-- Popper js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/bootstrap/popper.min.js"></script>
	    <!-- Bootstrap js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/bootstrap/bootstrap.min.js"></script>
	    <!-- All Plugins js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/plugins/plugins.js"></script>
	    <!-- Active js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/active.js"></script>
	</div>
</body>
</html>
