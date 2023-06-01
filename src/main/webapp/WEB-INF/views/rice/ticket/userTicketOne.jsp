<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function(){
		var refer = document.referrer;
		refer = refer.split("?")
		
		if(  "미사용" != "${ticket.ticket_use}"){
			
			$("#use-ticket-button").remove();
			$("#refund-ticket-button").remove();
			$("#terms-list-1").remove();
		}
			
			
		$("#Ticket-List").click(function(){
			location.href="userTicket";
		})
		
		$("#Ticket-Use").click(function(){
			document.getElementById("terms-list-1").style.display = "block";
			document.getElementById("terms-list-2").style.display = "block";
			console.log("클릭")
			if (document.getElementById("terms-list-1").style.display==='none'){
				document.getElementById("terms-list-1").style.display = "block";
			} else {
				document.getElementById("terms-list-1").style.display = "none";
			}
		})
		
		$("#Ticket-Refund").click(function(){
			document.getElementById("terms-list-1").style.display = "block";
			document.getElementById("terms-list-2").style.display = "block";
			console.log("클릭")
			if (document.getElementById("terms-list-2").style.display==='none'){
				document.getElementById("terms-list-2").style.display = "block";
			} else {
				document.getElementById("terms-list-2").style.display = "none";
			}
		})
		
		$(".terms-checkBox-1").click(function(){
			console.log($('.terms-checkBox-1').filter(":checked").length)
			console.log($('.terms-checkBox-1').length)
			console.log($('.terms-checkBox-1').filter(":checked").length==$('.terms-checkBox-1').length)
			
			if ($('.terms-checkBox-1').filter(":checked").length == $('.terms-checkBox-1').length){
				$("#useTicket-final").attr("disabled", false);
			} else{
				$("#useTicket-final").attr("disabled", true);
			}
		})
		
		$(".terms-checkBox-2").click(function(){
			console.log($('.terms-checkBox-2').filter(":checked").length)
			console.log($('.terms-checkBox-2').length)
			console.log($('.terms-checkBox-2').filter(":checked").length==$('.terms-checkBox-2').length)
			
			if ($('.terms-checkBox-2').filter(":checked").length == $('.terms-checkBox-2').length){
				$("#useTicket-final-2").attr("disabled", false);
			} else{
				$("#useTicket-final-2").attr("disabled", true);
			}
		})
		
		$("#useTicket-final").click(function(){
			location.href="userTicketUpdate?ticket_ID=${ticket.ticket_ID}&update=1"
		})
		
		$("#useTicket-final-2").click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/rice/order/kakaoPayRefund?ticket_ID=${ticket.ticket_ID}",
				type : "POST",
				success : function() {
					window.location.reload()
				} 
			})
		})
	})
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/style.css">
<style type="text/css">
	.check-point {
		width : 75px;
		
		text-align: right;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ include file="/resources/public/header.jsp" %>
    
	<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(${pageContext.request.contextPath}/resources/templeate/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>식권 및 상점에 대한 정보 제공</p>
            <h2>식권 상세 정보</h2>
        </div>
    </section>
	
	<section class="contact-area section-padding-100-0">
        <div class="container">
            <div class="row">

                <div class="col-12 col-lg-6">
                    <div class="contact-content mb-100">
                        <!-- Title -->
                        <div class="contact-title mb-50">
                            <h5>식권 정보</h5>
                        </div>

                        <!-- Single Contact Info -->
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-bell"></span>
                            </div>
                        	<div class="mr-30">
                                <span>식권 번호</span>
                            </div>
                            <div class="mr-30">
                                <span><b>${ticket.ticket_ID }</b></span>
                            </div>
                        </div>
                        
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-home	"></span>
                            </div>
                        	<div class="mr-30">
                                <span>식권 사용 가게 이름</span>
                            </div>
                            <div class="mr-30">
                                <span><b>${store.store_name}</b></span>
                            </div>
                        </div>
                        
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-placeholder"></span>
                            </div>
                        	<div class="mr-30">
                                <span>식권 사용 가게 위치</span>
                            </div>
                            <div class="mr-10 d-flex">
                                <span style="color:black;"><b>${store.store_addr }</b></span>
                            </div>
                        </div>
                        
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-phone-call"></span>
                            </div>
                        	<div class="mr-30">
                                <span>식권 사용 가게 전화번호</span>
                            </div>
                            <div class="mr-30">
                                <span><b>${store.store_tel}</b></span>
                            </div>
                        </div>
                        
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-shopping-cart"></span>
                            </div>
                        	<div class="mr-30">
                                <span>식권 주문 내역</span>
                            </div>
                            <div class="mr-30">
                                <span><c:forEach items="${orderList }" var="order"><p style="color:black;"><b>${order.order_fName } (${order.order_fCount}개)</b></p></c:forEach></span>
                            </div>
                        </div>
                        
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-calendar"></span>
                            </div>
                        	<div class="mr-30">
                                <span>식권 발행 시간</span>
                            </div>
                            <div class="mr-30">
                                <span><b>${ticket.ticket_start }	</b></span>
                            </div>
                        </div>
                        
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-calendar"></span>
                            </div>
                        	<div class="mr-30">
                                <span>식권 마감 시간</span>
                            </div>
                            <div class="mr-30">
                                <span><b>${ticket.ticket_end }</b></span>
                            </div>
                        </div>
                        
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-money"></span>
                            </div>
                        	<div class="mr-30">
                                <span>식권 결제 금액</span>
                            </div>
                            <div class="mr-30">
                                <span><b>${ticket.ticket_price }원</b></span>
                            </div>
                        </div>
                        
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-money"></span>
                            </div>
                        	<div class="mr-30">
                                <span>식권 사용 마일리지</span>
                            </div>
                            <div class="mr-30">
                                <span><b>${ticket.ticket_usedMileage } 마일리지</b></span>
                            </div>
                        </div>
                        
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-checked"></span>
                            </div>
                        	<div class="mr-30">
                                <span>식권 사용 여부</span>
                            </div>
                            <div class="mr-30">
                                <span><b>${ticket.ticket_use }</b></span>
                            </div>
                        </div>
                        <div>
                        	
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <!-- ##### Google Maps ##### -->
                    <div class="map-area mb-25">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d22236.40558254599!2d-118.25292394686001!3d34.057682914027104!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2z4Kay4Ka4IOCmj-CmnuCnjeCmnOCnh-CmsuCnh-CmuCwg4KaV4KeN4Kav4Ka-4Kay4Ka_4Kar4KeL4Kaw4KeN4Kao4Ka_4Kav4Ka84Ka-LCDgpq7gpr7gprDgp43gppXgpr_gpqgg4Kav4KeB4KaV4KeN4Kak4Kaw4Ka-4Ka34KeN4Kaf4KeN4Kaw!5e0!3m2!1sbn!2sbd!4v1532328708137" allowfullscreen=""></iframe>
                    </div>
                    
                    <div class="d-flex align-items-center" style="padding-left: 25pt; padding-right:25pt;">
                    	<button class="btn mr-1 ml-1" style="width:50%;" id="Ticket-Use">식권 사용</button>
                        <button class="btn mr-1 ml-1" style="width:50%;" id="Ticket-Refund">식권 환불</button>
                    </div>
                    
                    <div class="termClass mt-3 mb-3" id="terms-list-1" style="display : none; padding-left: 25pt; padding-right:25pt;">
                    	<hr>
                    		<div>
                    			<table>
									<tr>
										<td>1. 고객 실수로 인한 식권 사용한 취소는 불가능합니다.</td>
										<td class="check-point"><input type="checkbox" class="terms-checkBox-1" value="동의">확인</td>
									</tr>
									<tr>
										<td>2. 식권 사용에 사용된 마일리지 내역은 확인이 가능합니다.</td>
										<td class="check-point"><input type="checkbox" class="terms-checkBox-1" value="동의">확인</td>
									</tr>
									<tr>
										<td>3. 위의 약관에 대한 숙지를 모두 했습니다.</td>
										<td class="check-point"><input type="checkbox" class="terms-checkBox-1" value="동의">확인</td>
									</tr>
								</table>
							</div>
							<div style="text-align: center; ">
								<button class="btn" id="useTicket-final" disabled="disabled" style="padding-left: 25pt; padding-right:25pt; width : 100%;">사용하기</button>
							</div>
                    	<hr>
                    </div>
                    <div class="termClass mt-3 mb-3" id="terms-list-2" style="display : none; padding-left: 25pt; padding-right:25pt;">
                    	<hr>
                    		<div>
                    			<table>
									<tr>
										<td>1. 티켓 환불시 고객님께서 사용하신 금액의 <b>90%</b> 만 환불됩니다.</td>
										<td class="check-point"><input type="checkbox" class="terms-checkBox-2" value="동의">확인</td>
									</tr>
									<tr>
										<td>2. 식권 사용에 사용된 마일리지 내역은 확인이 가능합니다.</td>
										<td class="check-point"><input type="checkbox" class="terms-checkBox-2" value="동의">확인</td>
									</tr>
									<tr>
										<td>3. 위의 약관에 대한 숙지를 모두 했습니다.</td>
										<td class="check-point"><input type="checkbox" class="terms-checkBox-2" value="동의">확인</td>
									</tr>
								</table>
							</div>
							<div style="text-align: center; ">
								<button class="btn" id="useTicket-final-2" disabled="disabled" style="padding-left: 25pt; padding-right:25pt; width : 100%;">환불하기</button>
							</div>
                    	<hr>
                    </div>
                </div>
            </div>
        </div>
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