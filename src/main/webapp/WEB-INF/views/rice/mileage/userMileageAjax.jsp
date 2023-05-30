<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table id="mileage-List-table">
	<tr class="mileageList-table-row-head">
		<th>번호</th>
		<th>구분</th>
		<th>마일리지</th>
		<th>이유</th>
		<th>일시</th>
	</tr>
	<c:forEach var="mileage" items="${mileageList}">
		<tr class="mileageList-table-row">
			<td>${mileage.mileage_no }</td>
			<td>${mileage.mileage_how }</td>
			<td>${mileage.mileage_what }</td>
			<td>${mileage.mileage_why }</td>
			<td>${mileage.mileage_when }</td>
		</tr>
	</c:forEach>  
</table>