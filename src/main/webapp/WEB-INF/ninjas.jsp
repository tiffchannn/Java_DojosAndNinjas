<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="UTF-8">
<title>Create a New Ninja!</title>
</head>
<body>
	<div class="header">
		<p></p>
		<h1 class="header1">Let's Create A Ninja</h1>
		<a href="/">Dashboard</a>
	</div>
	
	<div class="newNinja-form">
		<form:form action="/ninjas" method="post" modelAttribute="ninja">
		    <p>
		    	<form:label path="dojo">Location:</form:label>
		    	<form:errors path="dojo"></form:errors>
		    	<form:select path="dojo">
		    	<option value="" disabled selected>Select a Dojo!</option>
		    		<c:forEach items="${dojos}" var="d">
						<form:option value="${d}">
							<c:out value="${d.name}"></c:out>
						</form:option>
					</c:forEach>
		    	</form:select>
		    </p>
		    <p>
		        <form:label path="firstName">First Name:</form:label>
		        <form:errors path="firstName"/>
		        <form:input path="firstName"/>
		    </p>
		    <p>
		        <form:label path="lastName">Last Name:</form:label>
		        <form:errors path="lastName"/>
		        <form:input path="lastName"/>
		    </p>
		    <p>
		        <form:label path="age">Age:</form:label>
		        <form:errors path="age"/>
		        <form:input path="age"/>
		    </p>
		    <input type="submit" value="Submit"/>
		</form:form>
	</div>
</body>
</html>