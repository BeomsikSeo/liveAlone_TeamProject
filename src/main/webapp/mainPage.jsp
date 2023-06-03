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
	<%@ include file="/resources/public/header.jsp" %> <!-- 헤더 파일 -->


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