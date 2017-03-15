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
														"<button style='display: block' type='button' data-toggle='modal' data-target='#adminModal' data-dismiss='modal'>Admin Panel</button>"	+
													"</td>" +
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
		<script>
	    	var pos = 0;
	    	var uName = "<%= userName %>";
	  		var currSentence = "<%= sentence %>";
	    	var sentenceArray = [];
	    	var userSentence = "";
	    	var compareSentence = "";
	    	var t = null;
	    	var baseTime = -1;
	    	var words = 0;
	    	var curWPM = 0;
	    	var perMatch = 0;
	    	
	    	for (i = 0; i < currSentence.length; i++) {
	    		sentenceArray[i] = currSentence.charAt(i);
	    	}

			$(document).on('keypress', function(evt) {
				
				if(!$('#userModal').hasClass('in') && !$('#signUpModal').hasClass('in') && !$('#adminModal').hasClass('in')) {
					evt = evt || window.event;
					var charCode = evt.keyCode || evt.which;
					var charStr = String.fromCharCode(charCode);
					var count = 0;

					 if (evt.which == 32) {
			                evt.preventDefault();
					 }
					
					if(t==null)
						t= new Date();
					// after first key press start timer
					if(baseTime==-1){
						baseTime=0;
						baseTime+= t.getMinutes();
						baseTime*=60;
						baseTime+=t.getSeconds();
					}

					if(pos < currSentence.length) {
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
						
						

						if(charStr == " ")
							words++;

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
						//check accuracy						
						for(x = 0; x < compareSentence.length; x++){
							if(compareSentence.charAt(x) == userSentence.charAt(x)) {
								count++;
							}
						}
						perMatch=((100.00*count)/compareSentence.length);

						statsFormAccess = document.forms["stats"];
						statsFormAccess.elements["WPM"].value = curWPM;
						statsFormAccess.elements["Accuracy"].value = perMatch.toPrecision(3);
						
						if (uName != "null") {
							document.getElementById("stats").submit();
						}
						else {
							location.reload();
						}
					}
				}
			});

			$(document).on('keydown', function(evt){
				
				if(!$('#userModal').hasClass('in') && !$('#signUpModal').hasClass('in') && !$('#adminModal').hasClass('in')){
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
					/*
					if(charCode == 32){
						
						if(pos < userSentence.length - 1){
							
							pos++
							document.getElementById("letter"+pos).style.backgroundColor = "#66ef82";
							
						}
						
						return false;
					}*/
				}
			});

			// updates every second
			var wpmInterval = setInterval(WPM, 1000);

			function WPM() {
				// if no key has been pressed
				if(baseTime==-1)
					return;

				var cT= new Date();
				var curTime= 0;


				curTime+= cT.getMinutes();
				curTime*=60;
				curTime+=cT.getSeconds();
				// some day/ hour overflow
				if(cT.getDay() != t.getDay())
					curTime+=(24*60*60);
				else if(cT.getHours() != t.getHours())
					curTime+=(60*60);
				curTime-=baseTime;

				curWPM= (words*60)/(curTime);

				document.getElementById("WPM").innerHTML= "<h3>WPM: "+curWPM.toPrecision(4)+"</h3>";
			}
			</script>
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
					else {
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
					 %>
				</div>
				
				<%
					if((Boolean)session.getAttribute("validLogin") == null) {
						out.print("<div class='modal-footer'><button type='button' Style='background-color: Transparent; border: none; overflow: hidden; outline: none' data-toggle='modal' data-target='#signUpModal' data-dismiss='modal'>Sign up</button></div>");
					}
				%>
			</div>

		</div>
	</div>

	<script>
	$(document).ready(function() {
		
	    $("#SentenceListLink").click(function(){
	        AddSentence.style.display = 'none';
	        UpdateSentence.style.display = 'none';
	        SentenceList.style.display = 'inline';
	    });
	    
	    $("#AddSentenceLink").click(function(){
	        AddSentence.style.display = 'inline';
	        UpdateSentence.style.display = 'none';
	        SentenceList.style.display = 'none';
	    });
	    
	    $(".DeleteSentence").click(function(){
	    	var sentenceToBeDeletedID = this.id;
	    	
			deleteAPhraseAccess = document.forms["deleteAPhrase"];
			deleteAPhraseAccess.elements["phraseId"].value = sentenceToBeDeletedID;
			
			document.getElementById("deleteAPhrase").submit();
	    });	    
	})
	</script>

	<div id="adminModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<a href="#" id="AddSentenceLink">Add Sentence</a> &nbsp;&nbsp; <a href="#" id="SentenceListLink">Sentence List</a>&nbsp;&nbsp;
				</div>
				<div class="modal-body">
					<div id="AddSentence">
						<form action="addSentence" method="post">
								<table>
								<tr>
									<td class="form-group" id="addcell">
										<label for="album">Album: </label> 
									</td>
									<td class="form-group" id="addcell">
										<input type="text" id="album" name="album" required="required" />
										 
									</td>
								</tr>
								<tr>
									<td class="form-group" id="addcell">
								<label for="artist">Artist: </label> 
								</td>
									<td class="form-group" id="addcell">
										<input type="text" id="artist" name="artist" required="required" />	 
									</td>
								</tr>
								<tr>
									<td class="form-group" id="addcell">
										<label for="song">Song: </label> 
								</td>
									<td class="form-group" id="addcell">
										<input type="text" id="song" name="song" required="required" />
									</td>
								</tr>
								<tr>
									<td class="form-group" id="addcell">
								<label for="sentence">Sentence: </label> 
								</td>
									<td class="form-group" id="addcell">
										<textarea  id="sentence" name="sentence" required="required"></textarea> 
									</td>
								</tr>
								<tr>
									<td class="form-group" id="addcell">
										<label for="year_released">Year Released: </label> 
									</td>
									<td class="form-group" id="addcell">		
										<input type="text" id="year_released" name="year_released" required="required" />
										</td>
									</tr>
								</table>
							<input type="radio" id="Lang" name="Lang" value="English" checked> English<br>
							<input type="radio" id="Lang" name="Lang" value="French" > French<br>
						<input type="submit" value="Add" />
						</form>
					</div>
					<div id="SentenceList" Style="display: none">
						<%
							ArrayList<Object[]> al = AdminDao.sentenceList("English");
							if (al.size() > 0) {
								out.print(
								"<table Style='margin-bottom: 0px; margin-top: 2px; padding: 2px; background-color: #a6b3c6; box-shadow: 5px 5px 2px #888888; width: 100%'" +
									"<tr>" +
										"<th>" +
											" &nbsp;" +
										"</th>" +
										"<th>" + 
											"#:" +
										"</th>" +
										"<th>" +
											"Phrase:" +
										"</th>" +
									"</tr>");
							}
						
							for (int i = 0; i < al.size(); i++) {
								out.print(
									"<table Style='margin-bottom: 0px; margin-top: 2px; padding: 2px; background-color: #a6b3c6; box-shadow: 5px 5px 2px #888888; width: 100%'" +
										"<tr>" +
											"<td Style='margin-right: 10px; padding-right: 10px;'>" +
												"<button type='button' class='DeleteSentence' id='" +al.get(i)[0].toString() +"'> x </button>" + "<form name='SentenceUpdating' id='SentenceUpdating' action='selectSentenceServlet' method='post'><input type='hidden' id='musicsentence_id' name='musicsentence_id' value='" +al.get(i)[0].toString() + "' /><input type='submit' value='Update' /> &nbsp; </form>" +
											"</td>" +
											"<td Style='margin-left: 5px; margin-right: 5px; padding-left: 5px; padding-right: 5px]'>" +
												(i+1) +
											"</td>" +
											"<td Style='margin-left: 10px; padding-left: 10px;'>" +
												al.get(i)[4].toString() +
											"</td>" +
										"</tr>"
								);
							}
							if (al.size() > 0) {
								out.print("</table>");
							}
						%>
					</div>
					<div id="UpdateSentence" Style="display: none">
						<form action="updateSentence" id="updateSentence" name="updateSentence" method="post">
							<input type="hidden" name="u_sentence_id" id="u_sentence_id" value="" />
								<table>
								<tr>
									<td class="form-group" id="addcell">
										<label for="u_album">Album: </label> 
									</td>
									<td class="form-group" id="addcell">
										<input type="text" id="u_album" name="u_album" required="required" value="" />
										 
									</td>
								</tr>
								<tr>
									<td class="form-group" id="addcell">
								<label for="u_artist">Artist: </label> 
								</td>
									<td class="form-group" id="addcell">
										<input type="text" id="u_artist" name="u_artist" required="required" value="" />	 
									</td>
								</tr>
								<tr>
									<td class="form-group" id="addcell">
										<label for="u_song">Song: </label> 
								</td>
									<td class="form-group" id="addcell">
										<input type="text" id="u_song" name="u_song" required="required" value="" />
									</td>
								</tr>
								<tr>
									<td class="form-group" id="addcell">
								<label for="u_sentence">Sentence: </label> 
								</td>
									<td class="form-group" id="addcell">
										<textarea  id="u_sentence" name="u_sentence" required="required"></textarea> 
									</td>
								</tr>
								<tr>
									<td class="form-group" id="addcell">
										<label for="u_year_released">Year Released: </label> 
									</td>
									<td class="form-group" id="addcell">		
										<input type="text" id="u_year_released" name="u_year_released" required="required" value="" />
										</td>
									</tr>
								</table>
							<input type="radio" id="u_lang" name="u_lang" value="English" checked> English<br>
							<input type="radio" id="u_lang" name="u_lang" value="French" > French<br>
						<input type="submit" value="Update" />
						</form>
					</div>
				</div>					

			</div>
		</div>
	</div>
	
	<div id="signUpModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2>Sign Up</h2>
				</div>
				<div class="modal-body">
					<form action="userCreationServlet" method="post">
						<table>
							<tr>
								<td class="form-group" id="signupcell">
									<label for="username">Username: </label>
								</td>
								<td class="form-group" id="signupcell">
									 <input type="text" id="username" name="username" required="required" />
								</td>
							</tr>
							<tr>
								<td class="form-group" id="signupcell">
									<label for="password">Password: </label>
								</td>
								<td class="form-group" id="signupcell">
									 <input type="password" name="userpass" required="required" />
								</td>
							</tr>
							<tr>
								<td class="form-group" id="signupcell">
									<label for="f_name">First Name: </label>
								</td>
								<td class="form-group" id="signupcell">
									 <input type="text" name="f_name" />
								</td>
							</tr>
							<tr>
								<td class="form-group" id="signupcell">
									<label for="l_name">Last Name: </label>
								</td>
								<td class="form-group" id="signupcell">
									 <input type="text" name="l_name" />
								</td>
							</tr>
							<tr>
								<td class="form-group" id="signupcell">
									<label for="email">Email: </label>
								</td>
								<td class="form-group" id="signupcell">
									 <input type="text" name="email" />
								</td>
							</tr>
							<tr>
								<td> <input type="submit" value="Submit!" /> </td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" Style="background-color: Transparent; border: none; overflow: hidden; outline: none" data-toggle="modal" data-target="#userModal" data-dismiss="modal">Login</button>
				</div>
			</div>

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