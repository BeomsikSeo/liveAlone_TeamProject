<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>난 혼자 산다</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/template/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="resources/template/style.css">


</head>

<body>
<!--     Preloader
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div> -->

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
                                    <li><a href="albums-store.jsp">혼밥</a></li>
                                    <li class="has-down"><a>동행</a>
                                    	<ul class="dropdown">
                                        	<li><a href="party/bbsParty/bbsPartyAll?page=1">동행</a></li>
                                            <li><a href="https://themewagon.github.io/one-music/#">여행</a></li>
                                        </ul></li>
                                    <li><a href="blog.jsp">나눔&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</a></li>
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
                                    <div class="login-register-btn mr-50">
                                        <a href="login.jsp" id="loginBtn">로그인</a>
                                    </div>
                                    <div class="login-register-btn mr-50">
                                        <a href="login.jsp" id="loginBtn">회원가입</a>
                                    </div>
                                </div>
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
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(resources/template/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Login</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Login Area Start ##### -->
    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content">
                        <h3>Welcome Back</h3>
                        <!-- Login Form -->
                        <div class="login-form">
                            <form action="login" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Id</label>
                                    <input type="text" name="member_id" placeholder="아이디 입력" pattern="[a-zA-Z0-9!@#$%^&]*">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" id="password" name="password" placeholder="비밀번호 입력" pattern="[a-zA-Z0-9!@#$%^&]*">
                                </div>
                                <button type="submit" class="btn oneMusic-btn mt-30">Login</button>
                                <a href="signup.jsp"><button>회원가입</button></a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Login Area End ##### -->
    
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

>>>>>>> party
</html>