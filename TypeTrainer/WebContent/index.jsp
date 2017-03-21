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
   
</head>
  <body>
    <script>
		$(window).load(function(){
			var validUpdate = "<%= (Boolean)session.getAttribute("validUpdate") %>";
			console.log(validUpdate);
			
	    	load_modal_user();
		
			if(validUpdate == "true") {
				document.getElementById("admin_panel_button").click();
			}
		});
	</script>

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
														"<button style='display: block' onclick='load_modal_admin()' type='button' data-toggle='modal' data-target='#adminModal' data-dismiss='modal' id='admin_panel_button'>Admin Panel</button>"	+
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
	<!--  LANGUAGE  -->
	<select id="site_lang" Style="margin-top: 10px;">
	  <option value="English">English</option>
	  <option value="French">French</option>
	</select>
	
		<div class="container-fluid" id="TextArea">
			<div id="TextAreaHeader" class="container-fluid">
				<table>
					<tr>
						<td id="WPM" style="padding-left: 25px"><h3>WPM: --</h3></td>
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

	<script>
		function updateLeaderboard() {
			console.log("LIMIT LEADERBOARD ROWS");
			
			var input, filter, table, tr, td, i;
			input = document.getElementById("leaderboard_num_entries");
			filter = $("#leaderboard_num_entries option:selected").val();
			
			console.log(filter);
			table = document.getElementById("leaderboard-table");
			tr = table.getElementsByTagName("tr");
			
			// Loop through all table rows, and hide those who don't match the search query
			for (i = 0; i < tr.length; i++) {
				if (i > filter) {
					tr[i].style.display = "none";
				}
				else {
					tr[i].style.display = "";
				}
			}	
		}
		
		$(document).ready(function() {
			$(window).load(function() {
				updateLeaderboard();
		    });
			
			$('#leaderboard_num_entries').change(function() {
				updateLeaderboard();
		    });
		});
	</script>
	
	<div class="container-fluid" id="MainArea">
		<h2 class="page-header">Leaderboards</h2>
		<select id="leaderboard_num_entries" Style="margin-bottom: 10px;">
	  		<option value="10" selected>10</option>
	  		<option value="25">25</option>
			<option value="50">50</option>
			<option value="100">100</option>
		</select>
		<table class="table table-striped" id="leaderboard-table">
			<tr class="table-bordered">
				<th>User</th>
				<th>Average WPM</th>
				<th>Average Accuracy</th>
			</tr>
			<%
				ArrayList<Object[]> leaderboard_data = AdminDao.returnATable("SELECT user_id, avg_wpm, avg_accuracy FROM user_stats ORDER BY avg_wpm DESC LIMIT 100", 0, new int[] { UserInfoDao.OBJ_INT}, new Object[] { 100 });
				
				for (int i = 0; i < leaderboard_data.size(); i++) {
					out.print("<tr>");
					for (int j = 0; j < leaderboard_data.get(i).length; j++) {
						int table_user_id = (int)leaderboard_data.get(i)[0];
						String table_user_name = (String)UserInfoDao.getUsername( (int)table_user_id );
						//out.print("<td>" + leaderboard_data.get(i)[j] + "</td>");
						if (j == 0)
							out.print("<td>" + table_user_name + "</td>");
						else
							out.println("<td>" + leaderboard_data.get(i)[j] + "</td>");
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