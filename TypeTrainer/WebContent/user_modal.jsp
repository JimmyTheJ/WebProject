<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.amzi.dao.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <%
		String toLanguage = (String)session.getAttribute("lang");
		//System.out.println(toLanguage);
		if (toLanguage == null)
			toLanguage = "English";
		Internationalizer translate = new Internationalizer(toLanguage);
		String pageName = "user_modal.";
	%>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
 
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    </head>
	<body>
		<div class="modal-header">
			<button id="closeButton" type="button" class="close" data-dismiss="modal">&times;</button>
			<%
				if((Boolean)session.getAttribute("validLogin") != null){
					if((Boolean)session.getAttribute("validLogin")){
						out.print("<img src='assets/user_profile_icon.png' height='48px' width='48px' /><h2 class='modal-title'>" + (String)session.getAttribute("name") + "</h2>");
					}
				}
				else{
					out.print("<h2 class='modal-title'>" + translate.getWords(pageName + "login") + "</h2>");
				}
			
			%>
		</div>
		<div class="modal-body">
		<% 				
		if( (String)session.getAttribute("name") == null) {
			out.print(
				"<form action='loginServlet' method='post'>" +
						"<div class='form-group'>" +
							"<label for='username'>" + translate.getWords(pageName + "username") + "</label> <input type='text' name='username' required='required' />" +
						"</div>" +
						"<div class='form-group'>" +
							"<label for='password'>" + translate.getWords(pageName + "password") + "</label> <input type='password' name='userpass' required='required' />" +
						"</div>" +
					"<input type='submit' value='" + translate.getWords(pageName + "login") + "'/>" +
					"</form>"
			);
		}
		else {
			int userID = UserInfoDao.getID((String)session.getAttribute("name"));
			double topWPM = UserStatsDao.getTopWPM(userID);
			double avgWPM = UserStatsDao.getAvgWPM(userID);
			double avgAccuracy = UserStatsDao.getAvgAccuracy(userID);
			
			out.print(
				"<table class='table table-striped' Style='margin-bottom: 0px; margin-top: 2px; padding: 10px; width: 100%'>" +
					"<tr>" +
						"<td id='statcell'>" +
							translate.getWords(pageName + "best_wpm") +
						"</td>" +
							"<td id='statcell'>" +
								topWPM +
							"</td>" +
					"</tr>" +
					"<tr>" +
						"<td id='statcell'>" +
							translate.getWords(pageName + "avg_wpm") +
						"</td>" +
						"<td id='statcell'>" +
							avgWPM +
						"</td>" +
					"</tr>" +
					"<tr>" +
						"<td id='statcell'>" +
							translate.getWords(pageName + "avg_acc") +
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
			if((Boolean)session.getAttribute("validLogin") == null || (Boolean)session.getAttribute("validLogin") == false) {
				out.print("<div class='modal-footer'><button type='button' Style='background-color: Transparent; border: none; overflow: hidden; outline: none' data-toggle='modal' data-target='#signUpModal' data-dismiss='modal' onclick='load_modal_signup()'>" + translate.getWords(pageName + "signup") + "</button></div>");
			}
		%>
	</body>
	</html>