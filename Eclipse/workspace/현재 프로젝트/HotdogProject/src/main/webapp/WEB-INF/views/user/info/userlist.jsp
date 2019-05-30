<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../../include/bootstrap.jsp"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@include file="../../include/header.jsp" %>
	<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Password</th>
      <th scope="col">Nickname</th>
      <th scope="col">Email</th>
      <th scope="col">Regdate</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list }" var = "list">
    <tr>
      <td>${list.id}</td>
      <td><a href="/modifypassword?nickname=${list.nickname }">${list.password }</a></td>
      <td>${list.nickname }</td>
      <td>${list.email }</td>
      <td>${list.regdate }</td>
    </tr>
   </c:forEach>
  </tbody>
</table>
</body>
</html>