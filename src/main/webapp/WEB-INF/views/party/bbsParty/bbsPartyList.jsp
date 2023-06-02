<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <table>
   <tr>
      <td class="left" style="width: 10%; border: 1px;word-break:break-all;table-layout:fixed;">번호</td>
      <td class="left" style="width: 30%; border: 1px;word-break:break-all;table-layout:fixed;">제목</td>
      <td class="left" style="width: 10%; border: 1px;word-break:break-all;table-layout:fixed;">작성자</td>
   </tr>
   <c:forEach items="${list}" var="one">
   <tr>
      <td class="left" style="width: 10%; border: 1px;word-break:break-all;table-layout:fixed;">${one.partyBbs_num}</td> <!-- one.getId() -->
      <td class="left" style="width: 30%; border: 1px;word-break:break-all;table-layout:fixed;"><a href="bbsPartyOne?partyBbs_num=${one.partyBbs_num}">${one.partyBbs_title}</a></td>     
      <td class="left" style="width: 10%; border: 1px;word-break:break-all;table-layout:fixed;">${one.partyBbs_writer}</td>
   </tr>
   </c:forEach>
</table>