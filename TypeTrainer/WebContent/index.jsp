<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.amzi.dao.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript" src="./javascript.js"></script>
    
	<!-- Modal Handerl JS-->
	<script async type="text/javascript" src="scripts/modalhandler.js"></script>

    <title>Type Trainer</title>
 
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    
    <% 	
    	String sentence = TypingMatchDao.getSentence(); 
		String userName = (String)session.getAttribute("name");
		int userID = UserInfoDao.getID(userName);
    %>
   
    <script>
		$(window).load(function(){
			var validUpdate = "<%= (Boolean)request.getAttribute("validUpdate") %>";

			console.log(validUpdate);
			
			if(validUpdate == "true") {
				var music_id = "<%= request.getAttribute("sentence_id") %>";
		    	var music_artist = "<%= request.getAttribute("artist") %>";
		    	var music_album = "<%= request.getAttribute("album") %>";
		    	var music_song = "<%= request.getAttribute("song") %>";
		    	var music_sentence = "<%= request.getAttribute("music_sentence") %>";
		    	var music_year = "<%= request.getAttribute("year") %>";
		    	var music_language = "<%= request.getAttribute("music_language") %>";

		        $('#adminModal').modal('show');
		    	
		    	UpdateSentence.style.display = 'inline';
		        SentenceList.style.display = 'none';
		        AddSentence.style.display = 'none';

				updateAPhraseAccess = document.forms["updateSentence"];
				updateAPhraseAccess.elements["u_sentence_id"].value = music_id;
				updateAPhraseAccess.elements["u_artist"].value = music_artist;
				updateAPhraseAccess.elements["u_album"].value = music_album;
				updateAPhraseAccess.elements["u_song"].value = music_song;
				updateAPhraseAccess.elements['u_sentence'].value = music_sentence;
				updateAPhraseAccess.elements["u_year_released"].value = music_year;
				updateAPhraseAccess.elements["u_lang"].value = music_language;
			}
		});
    </script>

</head>
  <body>


	<!-- Script to get user input on document, hidden fields allow for the JSP variables to be passed...-->
	<input type="hidden" value="<%= userName %>" id="uName_var">
	<input type="hidden" value="<%= sentence %>" id="sentence_var">
	<script type="text/javascript" src="scripts/keyhandler.js"></script>

	<!-- THE GREAT SEPERATOR MUAHAHAHA BOW TO MY CODE SEPERATION POWERS!!! -->

  	<form name="stats" id="stats" action="userUpdateServlet" method="post">
  		<input type="hidden" id="wpm_id" name="WPM" value="0" />
  		<input type="hidden" id="accuracy_id" name="Accuracy" value="0" />
  		<input type="hidden" id="username_id" name="Username" value=<%=userName %> />
  	</form>
   	<form name="deleteAPhrase" id="deleteAPhrase" action="deleteSentence" method="post">
  		<input type="hidden" id="phraseId" name="phraseId" value="0" />
  	</form> 

  		
	<div class="container-fluid" id="Mainbar">
			<nav class="navbar navbar-fixed-top"  Style="margin: 0 auto; max-width: 70%">
				<div class="container-fluid">
					<div class="navbar-header" Style="padding-left: 10px">
						<a href="index.jsp"><img src="assets/tt.png" Height="48px" Width="48px" Style="margin-top: 10px; margin-botton: 2px"></img></a>
					</div>
					
					<ul class="nav navbar-nav navbar-right" style="margin: 10px">
					<li>
					<%
						Boolean validLogin = (Boolean)session.getAttribute("validLogin");
					
						if(validLogin != null) {
							if(validLogin) {
								if(userName != null) {
									if(UserInfoDao.getUserType(userName).equalsIgnoreCase("admin")){
										out.print(
											"<table>" +
												"<tr>" +
													"<td>" +
														"<p Style='margin-bottom: 0px; margin-top: 2px; padding: 2px; background-color: #a6b3c6; box-shadow: 5px 5px 2px #888888;'>" + session.getAttribute("loginMessage") + "</p>" +
													"</td>" +
												"</tr>" +
												"<tr>" +
													"<td>"+
														"<button style='display: block' onclick='load_modal_admin()' type='button' data-toggle='modal' data-target='#adminModal' data-dismiss='modal'>Admin Panel</button>"	+
													"</td>" +
													"<td>" +
														"<a Style='padding: 2px; background-color: #a6b3c6; box-shadow: 5px 5px 2px #888888;' href='logoutServlet'>logout</a>" +
													"</td>" +
												"</tr>" +
											"</table>");
									}
									else{
										out.print(
												"<table>" +
													"<tr>" +
														"<td>" +
															"<p Style='margin-bottom: 0px; margin-top: 2px; padding: 2px; background-color: #a6b3c6; box-shadow: 5px 5px 2px #888888;'>" + session.getAttribute("loginMessage") + "</p>" +
														"</td>" +
													"</tr>" +
													"<tr>" +
														"<td>" +
															"<a Style='padding: 2px; background-color: #a6b3c6; box-shadow: 5px 5px 2px #888888;' href='logoutServlet'>logout</a>" +
														"</td>" +
													"</tr>" +
												"</table>");
									}
								}
							}
						}
					%>
					</li>					
						<li><button type="button" data-toggle="modal" data-target="#userModal" Style="background-color: Transparent; border: none; overflow: hidden; outline: none"><img src="assets/user_profile_icon.png" Height="48px" Width="48px"></button></li>
					</ul>
				</div>
			</nav>
		</div>

	<div class="container-fluid" id="MainArea">
		
		<div class="container-fluid" id="TextArea">
			<div id="TextAreaHeader" class="container-fluid">
				<table>
					<tr>
						<td id="WPM" style="padding-left: 25px"><h3>WPM: 00</h3></td>
						<td id="Accuracy" style="padding-left: 450px"><h3>Accuracy: --</h3></td>
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
		</div>
	</div>
	
	<div class="container-fluid" id="MainArea">
	
		<h2 class="page-header">Leaderboards</h2>
		<table class="table table-striped">
		
			<tr class="table-bordered">
				<th>User</th>
				<th>Average WPM</th>
				<th>Average Accuracy</th>
			</tr>			
		</table>
	
	</div>

	<div id="userModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button id="closeButton" type="button" class="close" data-dismiss="modal">&times;</button>
					<%
						if((Boolean)session.getAttribute("validLogin") != null){
							if((Boolean)session.getAttribute("validLogin")){
								out.print("<img src='assets/user_profile_icon.png' height='48px' width='48px' /><h2 class='modal-title'>" + (String)session.getAttribute("name") + "</h2>");
							}
						}
						else{
							out.print("<h2 class='modal-title'>Login</h2>");
						}
					
					%>
					
				</div>
				<div class="modal-body">
				<% 				
					if((Boolean)session.getAttribute("validLogin") == null) {
						out.print(
							"<form action='loginServlet' method='post'>" +
								"<div class='form-group'>" +
									"<label for='username'>Username: </label> <input type='text' name='username' required='required' />" +
								"</div>" +
								"<div class='form-group'>" +
									"<label for='password'>Password: </label> <input type='password' name='userpass' required='required' />" +
								"</div>" +
							"<input type='submit' value='Login' />" +
							"</form>");
					}
					else if((Boolean)session.getAttribute("validLogin") == true) {
						double topWPM = UserStatsDao.getTopWPM(userID);
						double avgWPM = UserStatsDao.getAvgWPM(userID);
						double avgAccuracy = UserStatsDao.getAvgAccuracy(userID);
						
						out.print(
							"<table class='table table-striped' Style='margin-bottom: 0px; margin-top: 2px; padding: 10px; width: 100%'>" +
								"<tr>" +
									"<td id='statcell'>" +
										"Best WPM: " +
									"</td>" +
										"<td id='statcell'>" +
											topWPM +
										"</td>" +
								"</tr>" +
								"<tr>" +
									"<td id='statcell'>" +
										"Average WPM: " +
									"</td>" +
									"<td id='statcell'>" +
										avgWPM +
									"</td>" +
								"</tr>" +
								"<tr>" +
									"<td id='statcell'>" +
										"Average Accuracy: " +
									"</td>" +
									"<td id='statcell'>" +
										avgAccuracy +
									"</td>" +
								"</tr>" +									
							"</table>"
						);
					}
					else{
						out.print(
								"<form action='loginServlet' method='post'>" +
									"<div class='form-group'>" +
										"<label for='username'>Username: </label> <input type='text' name='username' required='required' />" +
									"</div>" +
									"<div class='form-group'>" +
										"<label for='password'>Password: </label> <input type='password' name='userpass' required='required' />" +
									"</div>" +
								"<input type='submit' value='Login' />" +
								"</form>");
					}
					 %>
				</div>
				
				<%
					if((Boolean)session.getAttribute("validLogin") == null || (Boolean)session.getAttribute("validLogin") == false) {
						
						out.print("<div class='modal-footer'><button type='button' Style='background-color: Transparent; border: none; overflow: hidden; outline: none' data-toggle='modal' data-target='#signUpModal' data-dismiss='modal' onclick='load_modal_signup()'>Sign up</button></div>");
					}
				%>
			</div>

		</div>
	</div>

	<div id="adminModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="admin"></div>
			</div>
		</div>
	</div>



	<div id="signUpModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

		<!-- Modal content-->
			<div class="modal-content">
				<div id="signup"></div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
 
  	<script>
		var validLogin = "<%= (Boolean)session.getAttribute("validLogin") %>";
		
		if(validLogin == "false") {
			$('#userModal').modal('show');
		}
	
    	$(document).on('hidden.bs.modal', function() {
       	 	document.activeElement.blur();
    	});
    	
    </script>
 
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