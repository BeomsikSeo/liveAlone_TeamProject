<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <table>
   <tr>
      <td class="left">번호</td>
      <td class="left">제목</td>
      <td class="left">작성자</td>
   </tr>
   <c:forEach items="${list}" var="one">
   <tr>
      <td class="right">${one.partyBbs_num}</td> <!-- one.getId() -->
      <td class="right"><a href="bbsPartyOne?partyBbs_num=${one.partyBbs_num}">${one.partyBbs_title}</a></td>     
      <td class="right">${one.partyBbs_writer}</td>
   </tr>
   </c:forEach>
</table>