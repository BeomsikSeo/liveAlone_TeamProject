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
 <table>
   <tr>
      <td class="left">번호</td>
      <td class="left">제목</td>
      <td class="left">내용</td>
      <td class="left">작성자</td>
   </tr>

   <tr>
      <td class="right">${one.partyBbs_num}</td> <!-- one.getId() -->
      <td class="right">${one.partyBbs_title}</td>
      <td class="right">${one.partyBbs_content}</td>     
      <td class="right">${one.partyBbs_writer}</td>
   </tr>


   
	<% 
	
		if(id.equals(writer)) { %>
  		
  		<a href="bbsPartyUpdate.jsp">
			<button style = "background: pink;">수정</button>
		</a>
		<a href="bbsPartyDelete?partyBbs_num=${one.partyBbs_num}">
			<button style = "background: pink;">삭제</button>
		</a>
	<% } %>
	<% 
	
	if(session.getAttribute("member_id") != null) { %>
  		
		<a href="chatParty.jsp">
			<button style = "background: pink;">참여</button><br>
		</a>
	<% } %>

   
</table>