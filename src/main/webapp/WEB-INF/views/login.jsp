<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Boolean loginSuccess = (Boolean) request.getAttribute("loginSuccess"); %>

<script>
    <% if (loginSuccess != null && loginSuccess) { %>
        alert('로그인에 성공했습니다.');
        location.href = "login.jsp"; //메인페이지 주소
    <% } else { %>
        alert('로그인에 실패했습니다. 다시 시도해주세요.');
        location.href = "login.jsp";
    <% } %>
</script>
    