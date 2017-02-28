<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="./javascript.js"></script>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.lang.String"%>
<%@page import="com.amzi.dao.TypingMatchDao"%>
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
    
    <% String sentence = TypingMatchDao.getSentence(); %>

    
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
						<td id="WPM" style="padding-left: 25px"><h3>WPM: 00</h3></td>
						<td id="Accuracy" style="padding-left: 500px"><h3>Accuracy: --</h3></td>
					</tr>
				</table>
			</div>
			<div id="innerTextArea" class="container-fluid">
				<%
					int stringLength = getStringLength(sentence);
					
					out.print("<p align='center' id='sentence1' Style='font-size: 200%; margin-top: 150px'>");
					for (int i = 0; i < stringLength; i++) {
						out.print("<span id='letter" + i + "'>" + getCharacterFromString(sentence, i) + "</span>");
					}
					out.print("</p>");
				%>
			</div>
		</div>
		<div Style="width: 100%">
		<script>
	    	var pos = 0;
	  		var currSentence = "<%= sentence %>";
	    	var sentenceArray = [];
	    	var userSentence = "";
	    	var compareSentence = "";
	    	
	    	for (i = 0; i < currSentence.length; i++) {
	    		sentenceArray[i] = currSentence.charAt(i);
	    	}
	    	
			$(document).on('keypress', function(evt){
				evt = evt || window.event;
		    	var charCode = evt.keyCode || evt.which;
		    	var charStr = String.fromCharCode(charCode);
				var perMatch = 0;
				var count = 0;
				
				if(pos < currSentence.length-1) {
					console.log(charStr);
					console.log(currSentence.charAt(pos));
					
					userSentence = userSentence + charStr;
					compareSentence = compareSentence + sentenceArray[pos];
					
					//Change background colour to green for correct letter, red if incorrect
					if(charStr == currSentence.charAt(pos)){
						document.getElementById("letter"+pos).style.backgroundColor = "#66ef82";
						pos++;
					}
					else {
						document.getElementById("letter"+pos).style.backgroundColor = "#ef6767";
						pos++;
					}
					
					//check accuracy						
					for(x = 0; x < compareSentence.length; x++){
						if(compareSentence.charAt(x) == userSentence.charAt(x)) {
							count++;
						}
					}
					perMatch=((100.00*count)/compareSentence.length);
					
					//display accuracy
					Accuracy.innerHTML ="<h3>Accuracy: "+perMatch.toPrecision(3)+"%</h3>";
				}
				else {
					location.reload();	// Reload the page with a new sentence upon completion of the first one.
				}
			});
			
			$(document).on('keydown', function(evt){
				evt = evt || window.event;
				var charCode = evt.keyCode || evt.which;
				
				if (pos > 0) {
					if(charCode == 8 || charCode == 46){
						pos--;
						document.getElementById("letter"+pos).style.backgroundColor = "#ffff00";
						
						userSentence = userSentence.substring(0, userSentence.length()-1);
						compareSentence = compareSentence.substring(0, compareSentence.length()-1);
					}
				}
			});
			</script>

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

<%!
	private int getStringLength (String s) {
		if (s != null)
			return s.length();
		else
			return 0;
	}
	private char getCharacterFromString (String s, int position) {
		if (s != null) {
			return s.charAt(position);
		}
		else {
			return ' ';
		}
	}
%>