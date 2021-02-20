<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="UTF-8">
<title>Welcome to Dojos & Ninjas!</title>
</head>
<body>
	<h1 class="title">Welcome to Dojos & Ninjas!</h1>
	
	<h2>Where We're Located!</h2>
	<div class="dojo-table-div">
		<table class="dojo-table">
		    <thead>
		        <tr>
		            <th>Dojo Name</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items="${dojos}" var="dojo">
		        <tr>
		            <td><a href="/dojos/${dojo.id}"><c:out value="${dojo.name}"/></a></td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
	</div>
	<br>
	<br>
	
	<h2>Ninja Roster</h2>
	<div class="ninja-table-div">
		<table>
		    <thead>
		        <tr>
		            <th>Name</th>
		            <th>Age</th>
		            <th>Dojo Location</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items="${ninjas}" var="ninja">
		        <tr>
		            <td><c:out value="${ninja.firstName}"/> <c:out value="${ninja.lastName}"/></td>
		            <td><c:out value="${ninja.age}"/></td>
		            <td><c:out value="${ninja.dojo.name}"/></td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
	</div>
	<br>
	<br>
	
	<div class="create-links">
		<a href="/ninjas" class="create-link">Create a Ninja</a>
		<a href="/dojos" class="create-link">Create a Dojo</a>
	</div>
</body>
</html>