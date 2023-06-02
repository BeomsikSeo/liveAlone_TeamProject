<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>동행</title>

    <!-- Favicon -->
    <link rel="icon" href="../../resources/template/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../../resources/template/style.css">


<script type="text/javascript" src="../../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$('.pages').click(function() {
			$.ajax({
				url : "bbsPartyList", 
				data : {
					page : $(this).text()
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('#d1').html(result)
				},
				error : function() {
					alert('연결 실패.')
				}
			}) //ajax
		})
	})
</script>


</head>

<body>


    <!-- ##### Header Area Start ##### -->
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
                                        	<li><a href="bbsPartyAll?page=1">동행</a></li>
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
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(../../resources/template/img/bg-img/trip1.jpg);">
        <div class="bradcumbContent">
            <p></p>
            <h2>동행 게시판</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <h2>전체 게시글 수:${count}</h2>
                    <div id="d1" class="login-content">
                         <table>
   							<tr>
      						  <td class="left" style="width: 10%; border: 1px;word-break:break-all;table-layout:fixed;">번호</td>
						      <td class="left" style="width: 30%; border: 1px;word-break:break-all;table-layout:fixed;">제목</td>
						      <td class="left" style="width: 10%; border: 1px;word-break:break-all;table-layout:fixed;">작성자</td>
						  	</tr>
						   	<c:forEach items="${list}" var="one">
						  	<tr>
						      <td class="right" style="width: 10%; border: 1px;word-break:break-all;table-layout:fixed;">${one.partyBbs_num}</td> <!-- one.getId() -->
						      <td class="right" style="width: 30%; border: 1px;word-break:break-all;table-layout:fixed;"><a href="bbsPartyOne?partyBbs_num=${one.partyBbs_num}">${one.partyBbs_title}</a></td>     
						      <td class="right" style="width: 10%; border: 1px;word-break:break-all;table-layout:fixed;">${one.partyBbs_writer}</td>
						   	</tr>
						   	</c:forEach>
						 </table>
                    </div>
                    <!-- Buttons -->
                    <div id = "d2" class="oneMusic-buttons-area mb-100">
						<%
							int pages = (int)request.getAttribute("pages");
							for(int p = 1; p <= pages; p++){
						%>
							<button style=" width: 50px;" class="pages"><%= p %></button>
						<%		
							}
						%><br><br>
						
					   <% if(session.getAttribute("member_id") != null){%>
					   <button type="button" style="float: right;" onclick="location.href='bbsPartyWrite.jsp'">게시물 작성</button>
				<!-- 	   <a href="bbsPartyWrite.jsp">게시물 작성</a> -->
					   <%} %>                    
    
                    </div>
                </div>
            </div>
        </div>
    </section>
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