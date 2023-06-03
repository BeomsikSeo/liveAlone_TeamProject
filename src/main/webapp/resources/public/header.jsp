<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div> 

<header class="header-area">
        <!-- Navbar Area -->
        <div class="oneMusic-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                        <!-- Nav brand -->
                        <a href="${pageContext.request.contextPath}/mainPage.jsp" class="nav-brand"><img src="${pageContext.request.contextPath}/resources/template/img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul> 
                                    <li><a href="${pageContext.request.contextPath}/mainPage.jsp">메인 페이지</a></li>
                                    <li><a href="${pageContext.request.contextPath}/rice/store/main">혼밥</a>
                                    	<ul class="dropdown">
                                    		<li><a href="${pageContext.request.contextPath}/rice/ticket/userTicket">My 티켓</a></li>
                                    		<li><a href="${pageContext.request.contextPath}/rice/mileage/userMileage">My 마일리지</a></li>
                                    	</ul>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/party/bbsParty/bbsPartyAll?page=1">동행</a></li>
                                    <li><a href="${pageContext.request.contextPath}/share/bbsShare/list?pageno=1">당근</a></li>
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
                                    <div class="login-register-btn mr-50">
                                        <a href="${pageContext.request.contextPath}/login.jsp" id="loginBtn">로그인</a>
                                    </div>
                                    
									<div class="login-register-btn mr-50">
	                                        <a href="${pageContext.request.contextPath}/login.jsp" id="loginBtn">회원가입</a>
	                                </div>
                                    <!-- Cart Button -->
                                    <!-- <div class="cart-btn">
                                        <p><span class="icon-shopping-cart"></span> <span class="quantity">1</span></p>
                                    </div> -->
                                </div>
                            </div>
                            <!-- Nav End -->

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>