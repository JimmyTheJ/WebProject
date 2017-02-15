<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="userCreationServlet" method="post">
		<div class="form-group">
			<label for="username">Username: </label> <input type="text" name="username" required="required" />
		</div>
		<br />
		<div class="form-group">
			<label for="password">Password: </label> <input type="password" name="userpass" required="required" />
		</div>
		<br />
		<div class="form-group">
			<label for="f_name">First Name: </label> <input type="text" name="f_name" />
		</div>
		<br />
		<div class="form-group">
			<label for="l_name">Last Name: </label> <input type="text" name="l_name" />
		</div>
		<br />
		<div class="form-group">
			<label for="email">Email: </label> <input type="text" name="email" />
		</div>
		<br />
		<td><input type="submit" value="Create" /></td>
	</form>
</body>
</html>