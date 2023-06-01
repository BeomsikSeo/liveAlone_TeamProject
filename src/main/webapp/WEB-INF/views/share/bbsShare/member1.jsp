<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setAttribute("member_id","가나다");
session.setAttribute("certification","1");
session.setAttribute("address","서울특별시_노원구_중계본동");
%>

	<a href="list?pageno=1">게시물 리스트</a>