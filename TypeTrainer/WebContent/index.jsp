<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.amzi.dao.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    
	<!-- Modal Handerl JS-->
	<script async type="text/javascript" src="scripts/modalhandler.js"></script>

    <title>Type Trainer</title>
 
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    
    <% 	
    	String toLanguage = (String)session.getAttribute("lang");
    	if (toLanguage == null)
    		toLanguage = "English";
    	Internationalizer translate = new Internationalizer(toLanguage);
    	String pageName = "index.";
	    String sentence = TypingMatchDao.getSentence(toLanguage);
		String userName = (String)session.getAttribute("name");
		int userID = UserInfoDao.getID(userName);
    %>
   
</head>
  <body>
    <script>
    	function toggleLanguage () {
    		var langSelect =  document.getElementById("toggle-lang");
    		var langValue = langSelect.options[langSelect.selectedIndex].value;
	    	//document.cookie = "language=" + langValue +"; expires=Sun, 31 Dec 2017 23:59:59; path=/";
	    	
	    	setCookie("language", langValue, 365);
	    	document.getElementById("toggleLang").submit();
    	}
 
    	function setCookie(cname, cvalue, exdays) {
    	    var d = new Date();
    	    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    	    var expires = "expires="+d.toUTCString();
    	    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    	}
    	
    	function getCookie(cname) {
    	    var name = cname + "=";
    	    var ca = document.cookie.split(';');
    	    for(var i = 0; i < ca.length; i++) {
    	        var c = ca[i];
    	        while (c.charAt(0) == ' ') {
    	            c = c.substring(1);
    	        }
    	        if (c.indexOf(name) == 0) {
    	            return c.substring(name.length, c.length);
    	        }
    	    }
    	    return "";
    	}
    	
    	function checkCookie() {
    	    var langCookie = getCookie("language");
    	    var lang = "<%= (String)session.getAttribute("lang") %>";
    	    
    	    if (langCookie == "") {
    	    	if (lang == "null") {
        	    	setCookie("language", "English", 365);    	    		
    	    	}
    	    	else {
    	    		setCookie("language", lang, 365);
    	    	}
    	    }
    	}
    	
		var validUpdate = "<%= (Boolean)session.getAttribute("validUpdate") %>";
		var user_name = "<%= userName %>";
		var validSubmission = <%= (Boolean)request.getAttribute("ValidSubmission") %>
		
		$(window).load(function(){
			console.log(validUpdate);
			console.log(user_name);
			
		    load_modal_user();
			checkCookie();
			
			if(validUpdate == "true") {
				 $('#adminModal').modal('show');
				load_modal_admin();
			}
			
			if (validSubmission == false) {
				console.log("Submission invalid!");
				alert("Your submission failed. Please make sure to maintain an accuracy above " + <%= UserInfoDao.MIN_ACCURACY %> + "%");
			}
		});

	</script>

	<!-- Script to get user input on document, hidden fields allow for the JSP variables to be passed...-->
	<input type="hidden" value="<%= userName %>" id="uName_var">
	<input type="hidden" value="<%= sentence %>" id="sentence_var">

	<!-- Leaderboard and key handling JS -->
	<script type="text/javascript" src="scripts/keyhandler.js"></script>
	<script type="text/javascript" src="scripts/leaderboard.js"></script>

	<!-- THE GREAT SEPERATOR MUAHAHAHA BOW TO MY CODE SEPERATION POWERS!!! -->

  	<form name="stats" id="stats" action="userUpdateServlet" method="post">
  		<input type="hidden" id="wpm_id" name="WPM" value="0" />
  		<input type="hidden" id="accuracy_id" name="Accuracy" value="0" />
  		<input type="hidden" id="username_id" name="Username" value=<%=userName %> />
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
						if(userName != null) {
							if(UserInfoDao.getUserType(userName).equalsIgnoreCase("admin")){
								out.print(
									"<table>" +
										"<tr>" +
											"<td>" +
												"<p Style='margin-bottom: 0px; margin-top: 2px; padding: 2px; background-color: #a6b3c6; box-shadow: 5px 5px 2px #888888;'>" + translate.getWords(pageName + "greeting") + " " + userName + "</p>" +
											"</td>" +
										"</tr>" +
										"<tr>" +
											"<td>"+
												"<button style='display: block' onclick='load_modal_admin()' type='button' data-toggle='modal' data-target='#adminModal' data-dismiss='modal' id='admin_panel_button'>" + translate.getWords(pageName + "admin_panel") + "</button>"	+
											"</td>" +
											"<td>" +
												"<a Style='padding: 2px; background-color: #a6b3c6; box-shadow: 5px 5px 2px #888888;' href='logoutServlet'>" + translate.getWords(pageName + "logout") + "</a>" +
											"</td>" +
										"</tr>" +
									"</table>");
							}
							else{
								out.print(
										"<table>" +
											"<tr>" +
												"<td>" +
													"<p Style='margin-bottom: 0px; margin-top: 2px; padding: 2px; background-color: #a6b3c6; box-shadow: 5px 5px 2px #888888;'>" + translate.getWords(pageName + "greeting") + " " + userName + "</p>" +
												"</td>" +
											"</tr>" +
											"<tr>" +
												"<td>" +
													"<a Style='padding: 2px; background-color: #a6b3c6; box-shadow: 5px 5px 2px #888888;' href='logoutServlet'>" + translate.getWords(pageName + "logout") + "</a>" +
												"</td>" +
											"</tr>" +
										"</table>");
							}
						}
					%>
					</li>					
						<li><button id="user_stats_button" type="button" data-toggle="modal" data-target="#userModal" Style="background-color: Transparent; border: none; overflow: hidden; outline: none"><img src="assets/user_profile_icon.png" Height="48px" Width="48px"></button></li>
					</ul>
				</div>
			</nav>
		</div>

	<div class="container-fluid" id="MainArea">

	<!--  LANGUAGE  -->
	<form id="toggleLang" action="toggleLang" method="POST">
		<select id="toggle-lang" name="lang" onchange="toggleLanguage();">
			<option><%= translate.getWords(pageName + "select_lang") %></option>

			<option value="French"><%= translate.getWords(pageName + "fr") %></option>
			<option value="English"><%= translate.getWords(pageName + "eng") %></option>
		</select>
	</form>
		<div class="container-fluid" id="TextArea">
			<div id="TextAreaHeader" class="container-fluid">
				<table>
					<tr>
						<td id="WPM"><h3><%= translate.getWords(pageName + "wpm") %>: --</h3></td>
						<td id="Accuracy"><h3><%= translate.getWords(pageName + "acc") %>: --</h3></td>
					</tr>
				</table>
			</div>
			<div id="innerTextArea" class="container-fluid">
				<%
					int stringLength = getStringLength(sentence);
					
					out.print("<p align='center' id='sentence1' Style='font-size: 200%; margin-top: 150px'>");
					for (int i = 0; i < stringLength; i++) {
						out.print("<span translate='no' id='letter" + i + "'>" + getCharacterFromString(sentence, i) + "</span>");
					}
					out.print("</p>");
				%>
			</div>
		</div>
		<div Style="width: 100%">
		</div>
	</div>

	<div class="container-fluid" id="MainArea">
		<h2 class='page-header'><%= translate.getWords(pageName + "leaderboard") %></h2>
	
		<select id="leaderboard_num_entries">
	  		<option value="10" selected>10</option>
	  		<option value="25">25</option>
			<option value="50">50</option>
			<option value="100">100</option>
		</select>
		<table class="table table-striped" id="leaderboard-table">
			<tr class="table-bordered">
				<th><%= translate.getWords(pageName + "user") %></th>
				<th><%= translate.getWords(pageName + "avgwpm") %></th>
				<th><%= translate.getWords(pageName + "maxwpm") %></th>
				<th><%= translate.getWords(pageName + "avgacc") %></th>
				<th><%= translate.getWords(pageName + "completed") %></th>
			</tr>
			<%
				ArrayList<Object[]> leaderboard_data = AdminDao.returnATable("SELECT user_id, avg_wpm, max_wpm, avg_accuracy, num_sentences FROM user_stats WHERE num_sentences > 0 ORDER BY avg_wpm DESC LIMIT 100", 0, new int[] { UserInfoDao.OBJ_INT}, new Object[] { 100 });
				
				for (int i = 0; i < leaderboard_data.size(); i++) {
					out.print("<tr>");
					for (int j = 0; j < leaderboard_data.get(i).length; j++) {						
						int table_user_id = (int)leaderboard_data.get(i)[0];
						String table_user_name = (String)UserInfoDao.getUsername( (int)table_user_id );
						if (j == 0)
							out.print("<td>" + table_user_name + "</td>");
						else if (j > 0 && j < 4) {
							double roundedValue = (double)leaderboard_data.get(i)[j];
							roundedValue = Math.round(roundedValue * 100.0) / 100.0;
							out.println("<td>" + roundedValue + "</td>");
						}
						else if (j == 4) {
							out.println("<td>" + (int)leaderboard_data.get(i)[4] + "</td>");							
						}
					}
					out.print("</tr>");
				}
			%>
			
		</table>
	</div>

	<div id="userModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="user"></div>
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
			<div class="modal-content">
				<div id="signup"></div>
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