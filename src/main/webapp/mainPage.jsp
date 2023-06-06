<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>난 혼자 산다</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="resources/template/style.css">

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
                        <a href="mainPage.jsp" class="nav-brand"><img src="resources/template/img/core-img/logo.png" alt=""></a> <!--난혼자산다 아이콘으로 변경-->

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
                                    <li><a href="mainPage.jsp">메인</a></li>
                                    <li><a href="rice/store/main.jsp">혼밥</a></li>
                                    <li class="has-down"><a>동행</a>
                                    	<ul class="dropdown">
                                        	<li><a href="party/bbsParty/bbsPartyAll?page=1">동행</a></li>
                                            <li><a href="voyageall">여행</a></li>
                                        </ul></li>
                                    <li><a href="share/bbsShare/list?pageno=1">나눔&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</a></li>
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <% if(session.getAttribute("member_id") != null){%>
	                            	<div class="login-register-cart-button d-flex align-items-center">
	                                    <!-- Login/Register -->
	                                    <div class="login-register-btn mr-50">
	                                        <a href="mypage/mypage?login_id=<%= session.getAttribute("member_id")%>" id="loginBtn">마이페이지</a>
	                                    </div>
	                                    <div class="login-register-btn mr-50">
	                                        <a href="logout" id="loginBtn">로그아웃</a>
	                                    </div>
	                                </div>										
	                            <%} else{ %>
	                            	<div class="login-register-cart-button d-flex align-items-center">
	                                    <!-- Login/Register -->
	                                    <div class="login-register-btn mr-50">
	                                        <a href="login.jsp" id="loginBtn">로그인</a>
	                                    </div>
	                                    <div class="login-register-btn mr-50">
	                                        <a href="signup.jsp" id="loginBtn">회원가입</a>
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

    <!-- ##### Hero Area Start ##### -->
    <section class="hero-area">
        <div class="hero-slides owl-carousel">
            <!-- Single Hero Slide -->
            <div class="single-hero-slide d-flex align-items-center justify-content-center">
                <!-- Slide Img -->
                <div class="slide-img bg-img" style="background-image: url(resources/template/img/bg-img/bg-5.jpg);"></div>
                <!-- Slide Content -->
                <div class="container">
                    <div class="row">
                        <div class="col-4">
                            <div class="hero-slides-content text-center">
                                <h6>&nbsp식사</h6>
                                <h2>&nbsp혼밥</h2>
                                <a  href="rice/store/main.jsp" class="btn oneMusic-btn mt-50">바로가기 <i class="fa fa-angle-double-right"></i></a>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="hero-slides-content text-center">
                                <h6>&nbsp동행/여행 </h6>
                                <h2>&nbsp동행 <span>&nbsp동행</span></h2>
                                <a  href="party/bbsParty/bbsPartyAll?page=1" class="btn oneMusic-btn mt-50">바로가기 <i class="fa fa-angle-double-right"></i></a>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="hero-slides-content text-center">
                                <h6>&nbsp지식인의 당근</h6>
                                <h2>&nbsp나눔</h2>
                                <a href="share/bbsShare/list?pageno=1" class="btn oneMusic-btn mt-50">바로가기 <i class="fa fa-angle-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Footer Area Start ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="resources/template/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="resources/template/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/template/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="resources/template/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/template/js/active.js"></script>
    
</body>

</html>