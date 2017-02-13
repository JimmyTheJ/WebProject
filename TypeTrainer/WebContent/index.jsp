<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Type Trainer</title>
 
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    
  </head>
  <body>
	
	<div class="container-fluid" id="MainArea">
		<div class="container-fluid" id="Mainbar">
			<nav class="navbar navbar-fixed-top"  Style="margin: 0 auto; max-width: 70%">
				<div class="container-fluid">
					<div class="navbar-header" Style="padding-left: 10px">
						<a href="index.jsp"><img src="assets/tt.png" Height="48px" Width="48px" Style="margin-top: 10px; margin-botton: 2px"></img></a>
					</div>
					<ul class="nav navbar-nav navbar-right" style="margin: 10px">
						<li><%=session.getAttribute("loginMessage")%></li>
						<li><button type="button" data-toggle="modal" data-target="#loginModal" Style="background-color: Transparent; border: none; overflow: hidden; outline: none"><img src="assets/user_profile_icon.png" Height="48px" Width="48px"></button></li>
						<li><a href="logoutServlet">logout</a></li>
					</ul>
					
				</div>
			</nav>
		</div>
		<form action="TypingMatchServlet" method = "post"> 
		<div class="container-fluid" id="TextArea">
			<div id="TextAreaHeader" class="container-fluid">
				<table>
					<tr>
						<td><h3>WPM: 00</h3></td>
						<td id="LastMatch" style="padding-left: 50px"><h3>Accuracy: <%=request.getAttribute("LastMatch")%>%</h3></td>
					</tr>
				</table>
			</div>
			<div id="innerTextArea" class="container-fluid">
				<p align="center" id="sentence1" Style="font-size: 200%; margin-top: 150px"><%=request.getAttribute("sentence")%></p>
				
			</div>
		</div>
		<div Style="width: 100%">
			
				<input class="form-control input-lg" id="inputlg" name="match" type="text"  Style="max-width: 500px; margin: 0 auto;" placeholder="Enter Text Here..." >
			
		</div>
		</form>
	</div>

	<div id="loginModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title">Login</h2>
				</div>
				<div class="modal-body">
					<form action="loginServlet" method="post">
						<div class="form-group">
							<label for="username">Username: </label> <input type="text" name="username" required="required" />
						</div>
						<div class="form-group">
							<label for="password">Password: </label> <input type="password" name="userpass" required="required" />
						</div>
						<td><input type="submit" value="Login" /></td>
					</form>
				</div>
				<div class="modal-footer">
					<a href="signup.html">Sign up</a>
				</div>
			</div>

		</div>
	</div>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
 
  </body>
</html>