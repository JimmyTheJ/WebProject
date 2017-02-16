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
    
    <script>
    	var currSentence = "<%= session.getAttribute("sentence")%>"
    	var sentenceArray = [];
    	for (i = 0; i < currSentence.length; i++) {
    		sentenceArray[i] = currSentence.charAt(i);
    	}
    </script>
    
  </head>
  <body>
 	
	<div class="container-fluid" id="Mainbar">
			<nav class="navbar navbar-fixed-top"  Style="margin: 0 auto; max-width: 70%">
				<div class="container-fluid">
					<div class="navbar-header" Style="padding-left: 10px">
						<a href="index.jsp"><img src="assets/tt.png" Height="48px" Width="48px" Style="margin-top: 10px; margin-botton: 2px"></img></a>
					</div>
					<ul class="nav navbar-nav navbar-right" style="margin: 10px">
					<li>
					<%
					
						String user = (String)session.getAttribute("name");
					
						if(user != null){
							out.print(
									
									"<table>" +
										"<tr>" +
											"<td>" +
												"<p Style='margin-bottom: 0px; margin-top: 2px; padding: 2px; background-color: #a6b3c6; box-shadow: 5px 5px 2px #888888;'>" + session.getAttribute("loginMessage") + "</p>" +
											"</td>" +
										"</tr>" +
										"<tr>" +
											"<td>" +
												"<a Style='padding: 2px; margin-left: 112px; margin-top: 0px; background-color: #a6b3c6; box-shadow: 5px 5px 2px #888888;' href='logoutServlet'>logout</a>" +
											"</td>" +
										"</tr>" +
									"</table>");
						}
	
					%>
					</li>
						<li><button type="button" data-toggle="modal" data-target="#userModal" Style="background-color: Transparent; border: none; overflow: hidden; outline: none"><img src="assets/user_profile_icon.png" Height="48px" Width="48px"></button></li>
					</ul>
				</div>
			</nav>
		</div>

	<div class="container-fluid" id="MainArea">
		<form action="TypingMatchServlet" method = "post"> 
		<div class="container-fluid" id="TextArea">
			<div id="TextAreaHeader" class="container-fluid">
				<table>
					<tr>
						<td><h3>WPM: 00</h3></td>

						<td style="padding-left: 50px; padding-right: 50px"><h3>Accuracy: 100%</h3></td>
						<td><h3>Correctly Typed: 
						
						<% 
						
							Boolean correct = (Boolean)session.getAttribute("correct");
							
							if(correct == null){
								out.print("");
							}
							else if(correct){
								out.print("YES!");
							}
							else{
								out.print("NOPE!");
							}
						
						%>
						
						</h3></td>		

						<td id="LastMatch" style="padding-left: 50px"><h3>Accuracy: <%=request.getAttribute("LastMatch")%>%</h3></td>

					</tr>
				</table>
			</div>
			<div id="innerTextArea" class="container-fluid">
				<%
					String sentence = (String)session.getAttribute("sentence");
//					int sentenceLength = sentence.length();
					int sentenceLength = 2;
					//session.setAttribute("currSentence", (String)request.getAttribute("sentence"));
					//out.print("<p align='center' id='sentence1' Style='font-size: 200%; margin-top: 150px'>" + sentence + "</p>");
					out.print("<p align='center' id='sentence1' Style='font-size: 200%; margin-top: 150px'>");
					out.print(sentence.charAt(0));
					for (int i = 0; i < sentenceLength; i++) {
						//out.print(sentence.charAt(i));
						//out.print("<span id=letter" + i + ">" + sentence.charAt(i) + "</span>");
						//out.print(i);
					}
					out.print("</p>");
				%>

				
			</div>
		</div>
		<div Style="width: 100%">
				
				<script>
				
					var pos = 0;
				
					function keys(evt) {
						evt = evt || window.event;
						var charCode = evt.keyCode || evt.which;
						var charStr = String.fromCharCode(charCode);
						if(pos < currSentence.length){
							console.log(charStr);
							console.log(currSentence.charAt(pos));
							if(charStr == currSentence.charAt(pos)){
								console.log("Correct");
								document.getElementById("innerTextArea").style.backgroundColor = "#66ef82";
								pos++;}
							else{
								console.log("false" + pos);
								document.getElementById("innerTextArea").style.backgroundColor = "#ef6767";
								pos++;}}
					};
					
					function bkspce(evt) {
						evt = evt || window.event;
						var charCode = evt.keyCode || evt.which;
						
						if(charCode == 8 || charCode == 46){
							pos--;
						}
					}
					
				</script>
				
				<input class="form-control input-lg" id="text_area" onkeypress="return keys(event)" onkeydown="return bkspce(event)" name="match" type="text" Style="max-width: 500px; margin: 0 auto;" placeholder="Enter Text Here...">

			</div>
		</form>
	</div>

	<div id="userModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<%
					
						if((String)session.getAttribute("name") != null){
							out.print("<h2 class='modal-title'>" + (String)session.getAttribute("name") + "</h2>");
						}
						else{
							out.print("<h2 class='modal-title'>Login</h2>");
						}
					
					%>
					
				</div>
				<div class="modal-body">
					<form action="loginServlet" method="post">
						<div class="form-group">
							<label for="username">Username: </label> <input type="text" name="username" required="required" />
						</div>
						<div class="form-group">
							<label for="password">Password: </label> <input type="password" name="userpass" required="required" />
						</div>
						<input type="submit" value="Login" />
					</form>
				</div>
				<div class="modal-footer">
					<a href="signup.jsp">Sign up</a>
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