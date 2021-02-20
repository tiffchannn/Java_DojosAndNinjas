<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="UTF-8">
<title>Add Dojo Location</title>
</head>
<body>
	<div class="header">
		<p></p>
		<h1 class="title"> Add a New Dojo Location</h1>
		<a href="/">Dashboard</a>
	</div>
	
	<%-- <div class="dojo-info-list">
		<ul>
			<c:forEach items="${dojos}" var="d">
				<li><c:out value="${d.name}"/></li>
				<ul>
					<c:forEach items="${d.ninjas}" var="n">
					<li><c:out value="${n.firstName}"></c:out></li>
					</c:forEach>
				</ul>
			</c:forEach>
		</ul>
	</div> --%>
	
	<form:form action="/dojos" method="post" modelAttribute="dojo" id="newDojo-form">
	    <p>
	        <form:label path="name">Dojo Name:</form:label>
	        <form:errors path="name"/>
	        <form:input path="name"/>
	    </p>
	    <input type="submit" value="Submit" class="btn"/>
	</form:form>  
</body>
</html>