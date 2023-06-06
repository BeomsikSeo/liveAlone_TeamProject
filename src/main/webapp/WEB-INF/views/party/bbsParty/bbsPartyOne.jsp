<%@page import="com.multi.liveAlone.party.bbsParty.BbsPartyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>One Music - Modern Music HTML5 Template</title>

    <!-- Favicon -->
    <link rel="icon" href="../../resources/template/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../../resources/template/style.css">
    
    <% 
		String id = (String)session.getAttribute("member_id"); 
		
		BbsPartyVO one = (BbsPartyVO)request.getAttribute("one");
		
		String writer = one.getPartyBbs_writer();
		
		int partyBbs_num = (int)one.getPartyBbs_num();
		
		session.setAttribute("partyBbs_num", partyBbs_num);
		
		System.out.println("partyBbs_num: " + partyBbs_num);
	%>
	<c:set var="count" value="0" />
	<c:forEach items="${memList}" var="member">
  		<c:set var="count" value="${count + 1}" />
	</c:forEach>

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
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(../../resources/template/img/bg-img/trip1.jpg);">
        <div class="bradcumbContent">
            <p>동행 게시글</p>
            <h2>${one.partyBbs_title}</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Elements Area Start ##### -->
    <section class="elements-area mt-30 section-padding-100-0">
		<table style="margin-left:auto;margin-right:auto;text-align: center; width: 60%;">
		   <tr>
		      <td class="left">번호:</td> <td class="left">${one.partyBbs_num}</td>
		      <td class="left">글작성자:</td> <td class="right">${one.partyBbs_writer}</td>
		      
		      <td class="left">동행일자</td><td class="right">${one.partyBbs_date}</td>
		      <td class="left">마감일자</td><td class="right">${one.partyBbs_period}</td>
		      
		   </tr>
		
		   <tr>
		      <td class="left">최대인원:</td> <td class="right">${one.partyBbs_partyMax}</td>
		      <td class="left">현재인원:</td><td class="right">${count}</td>
		     
		      <td class="left">동행지역</td><td class="right">${one.partyBbs_location}</td>
		      <td class="left">글작성일</td><td class="right">${one.partyBbs_writtenDate}</td>
		   </tr>
		   <tr>
		      <td class="center" colspan="8"><br><br><br>상세 내용</td>
		   </tr>
		   <tr>
		      <td class="center" colspan="8">${one.partyBbs_content}</td>     
			</tr>
		</table>

	
	   <div style = "width:100px; position: absolute; right: 20px;">
	   <% if(session.getAttribute("member_id") != null) { %>
			<% if(id.equals(writer)) { %>
		  		
		<!--   		<a href="bbsPartyUpdate.jsp">
					<button style = "background: pink;">수정</button>
				</a> -->
				<a href="bbsPartyDelete?partyBbs_num=${one.partyBbs_num}" >
					<button >삭제</button>
				</a>
			<% } %>
		<% } %>	
		<% 
		
		if(session.getAttribute("member_id") != null) { %>
			<a href="bbsPartyJoin?partyBbs_num=${one.partyBbs_num}">
				<button >참여</button><br>
			</a>
		<% } %>
		</div>
		<table>	
		<% if(session.getAttribute("member_id") != null) { %>
				<% if(id.equals(writer)) { %>
				<c:forEach items="${memList}" var="memList">
			   		<tr>
			      		<td class="right">${memList.member_id}</td> <!-- one.getId() -->
			      		<td class="right">
			      			<a href="bbsPartyFire?member_id=${memList.member_id}">
			      				<button >강제퇴장</button><br>
			      			</a>
			      		</td>     
					</tr>
			    </c:forEach>
				<% } %>
		<% } %>		
		</table>   
    </section>
    <!-- ***** Elements Area End ***** -->
	


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