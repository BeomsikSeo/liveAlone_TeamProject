<%@page import="com.multi.liveAlone.party.bbsParty.BbsPartyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
	
 <table style="margin-left:auto;margin-right:auto;text-align: center;">
   <tr>
      <td class="left">번호</td>
      <td class="left">제목</td>
      <td class="left">내용</td>
      <td class="left">글작성자</td>
      <td class="left">최대인원</td>
      <td class="left">현재인원</td>
      <td class="left">동행일자</td>
      <td class="left">마감일자</td>
      <td class="left">동행지역</td>
      <td class="left">글작성일</td>
   </tr>

   <tr>
      <td class="right">${one.partyBbs_num}</td> <!-- one.getId() -->
      <td class="right">${one.partyBbs_title}</td>
      <td class="right">${one.partyBbs_content}</td>     
      <td class="right">${one.partyBbs_writer}</td>
      <td class="right">${one.partyBbs_partyMax}</td>
      <td class="right">${count}</td>
      <td class="right">${one.partyBbs_date}</td>
      <td class="right">${one.partyBbs_period}</td>
      <td class="right">${one.partyBbs_location}</td>
      <td class="right">${one.partyBbs_writtenDate}</td>
   </tr>

</table>

   
	<% if(id.equals(writer)) { %>
  		
<!--   		<a href="bbsPartyUpdate.jsp">
			<button style = "background: pink;">수정</button>
		</a> -->
		<a href="bbsPartyDelete?partyBbs_num=${one.partyBbs_num}">
			<button style = "background: pink;">삭제</button>
		</a>
	<% } %>
	<% 
	
	if(session.getAttribute("member_id") != null) { %>
		<a href="bbsPartyJoin?partyBbs_num=${one.partyBbs_num}">
			<button style = "background: pink;">참여</button><br>
		</a>
	<% } %>
	<table>	
		<% if(id.equals(writer)) { %>
		<c:forEach items="${memList}" var="memList">
	   		<tr>
	      		<td class="right">${memList.member_id}</td> <!-- one.getId() -->
	      		<td class="right">
	      			<a href="bbsPartyFire?member_id=${memList.member_id}">
	      				<button style = "background: pink;">강제퇴장</button><br>
	      			</a>
	      		</td>     
			</tr>
	    </c:forEach>
		<% } %>
	</table>    
   