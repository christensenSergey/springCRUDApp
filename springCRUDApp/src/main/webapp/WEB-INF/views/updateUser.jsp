<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webjars/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webjars/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/webjars/jquery/jquery.min.js"></script>

</head>

<body>

<h1>Update user</h1>
<form:form method="post" modelAttribute="userForUpdate" action="/">
	<div>
		<form:input type="hidden" path="userId" class="form-control" required="required"></form:input>
	</div>
	<div style="display:inline-block; width:19%">
		<label>First name</label>
		<form:input type="text" path="firstName" class="form-control"
	placeholder="First name" autofocus="true" required="required"></form:input>
	</div>
	<div style="display:inline-block; width:19%">
		<label>Last name</label>
		<form:input type="text" path="lastName" class="form-control"
			placeholder="Last name" required="required"></form:input>
	</div>
	<div style="display:inline-block; width:19%">
		<label>Birth day</label>
		<form:input type="date" path="birthDay" class="form-control"
			placeholder="Birth day" required="required"></form:input>
	</div>
	<div style="display:inline-block; width:19%">
		<label for="gender">Gender</label> <select class="form-control"
			name="gender">
			<c:forEach var="type" items="${genderTypes}">
				<option value="${type}">${type}</option>
			</c:forEach>
		</select>
	</div>
	<button class="btn btn-me btn-primary btn-block" type="submit" style="display:inline-block; width:19%">Update user</button>
</form:form>
   
</body>
</html>