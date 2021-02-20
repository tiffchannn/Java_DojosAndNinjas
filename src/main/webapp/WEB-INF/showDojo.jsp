<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">

<style>
	.header1{
		margin-left: 64px;
	}
	.header{
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	}
	
	.dojoInfo-div{
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	th,td{
		padding: 10px;
	}
</style>

<meta charset="UTF-8">
<title>Dojo Page</title>
</head>
<body>
	<div class="header">
		<p></p>
		<h1  class="header1"><c:out value="${dojo.name}"/> Ninjas</h1>
		<a href="/">Dashboard</a>
	</div>
	
	<div class="dojoInfo-div">
		<table>
		    <thead>
		        <tr>
		            <th>First Name</th>
		            <th>Last Name</th>
		            <th>Age</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items="${ninjas}" var="ninja">
		        <tr>
		            <td><c:out value="${ninja.firstName}"/></td>
		            <td><c:out value="${ninja.lastName}"/></td>
		            <td><c:out value="${ninja.age}"/></td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
	</div>
</body>
</html>