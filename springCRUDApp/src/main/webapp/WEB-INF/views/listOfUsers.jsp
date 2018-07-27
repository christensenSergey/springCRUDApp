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


<!-- FORM WITHOUT BINDING

<form id="test" action="/" method="post">
    <div class="form-group">
        <label for="name">First Name</label>
        <input class="form-control" type="text" name="firstName" id="firstName" />
    </div>
 	<div class="form-group">
        <label for="name">Last Name"</label>
        <input class="form-control" type="text" name="lastName" id="lastName" />
    </div>
    <div class="form-group">
        <label for="name">Date</label>
        <input class="form-control" type="text" name="birthDay" id="birthDay" />
    </div>
    <div class="form-group">
    	<label for="select">Select your gender</label>
    	<select name="gender" class="form-control">
    		<option value="MALE">MALE</option>
    		<option value="FEMALE">FEMALE</option>
    	</select>

    </div> 
    <p>
        <input type="submit" value="Add user" class="btn btn-primary btn-block" />
    </p>
</form>	
-->

<h1>Add user</h1>
<form:form method="post" modelAttribute="user" action="/">
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
	<button class="btn btn-me btn-primary btn-block" type="submit" style="display:inline-block; width:19%">Add user</button>
</form:form>

<br>
<h1>User list</h1>

<div class="form-group">
	<input type="text" class="form-control pull-right" id="search"
		placeholder="Search">
</div>


<!-- Building table from model -->
<div class="table-responsive">
	<table class="table table-striped table-bordered" id="userTable">
		<thead>
			<tr>
				<th scope="col">Id</th>
				<th scope="col">First name</th>
				<th scope="col">Last name</th>
				<th scope="col">Birth day</th>
				<th scope="col">Gender</th>
				<th scope="col">Update</th>
				<th scope="col">Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userList}" var="user">
				<tr>
					<td><c:out value="${user.userId}" /></td>
					<td><c:out value="${user.firstName}" /></td>
					<td><c:out value="${user.lastName}" /></td>
					<td><c:out value="${user.birthDay}" /></td>
					<td><c:out value="${user.gender}" /></td>
					<td>
						<form action="/update" method="post">
  							<button type="submit" name="userId" value="${user.userId}" class="btn">Update</button>
						</form>
					<td>
						<form action="/delete" method="post">
  							<button type="submit" name="userId" value="${user.userId}" class="btn btn-outline-danger" onclick="return confirm('Delete user?')">Delete</button>
						</form>
					</td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
</div>


<script>
	<%-- search --%>
	$(document).ready(
			function() {
				$('#search').keyup(
						function() {
							_this = this;
							$.each($('#userTable tbody tr'), function() {
								if ($(this).text().toLowerCase().indexOf(
										$(_this).val().toLowerCase()) === -1) {
									$(this).hide();
								} else {
									$(this).show();
								}
							});
						});
			});

	<%-- pagination --%>
	$('#userTable').each(function() {
    var currentPage = 0;
    var numPerPage = 5;
    var $table = $(this);
    $table.bind('repaginate', function() {
        $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
    });
    $table.trigger('repaginate');
    var numRows = $table.find('tbody tr').length;
    var numPages = Math.ceil(numRows / numPerPage);
    var $pager = $('<div class="page-number">');
   
    for (var page = 0; page < numPages; page++) {
        $('<span class="btn btn-info"></span>').text(page + 1).bind('click', {
            newPage: page
        }, function(event) {
            currentPage = event.data['newPage'];
            $table.trigger('repaginate');
            $(this).addClass('active').siblings().removeClass('active');
        }).appendTo($pager).addClass('clickable');
    }
    $pager.insertBefore($table).find('span.page-number:first').addClass('active');
    $previous.insertBefore('span.page-number:first');
    $next.insertAfter('span.page-number:last');
    $next.click(function (e) {
        $previous.addClass('clickable');
        $pager.find('.active').next('.page-number.clickable').click();
    });
    $previous.click(function (e) {
        $next.addClass('clickable');
        $pager.find('.active').prev('.page-number.clickable').click();
    });
    $table.on('repaginate', function () {
        $next.addClass('clickable');
        $previous.addClass('clickable');
        
        setTimeout(function () {
            var $active = $pager.find('.page-number.active');
            if ($active.next('.page-number.clickable').length === 0) {
                $next.removeClass('clickable');
            } else if ($active.prev('.page-number.clickable').length === 0) {
                $previous.removeClass('clickable');
            }
        });
    });
    $table.trigger('repaginate');
	});

</script>
   
</body>
</html>