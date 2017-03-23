<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.amzi.dao.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
	 <%
		String toLanguage = (String)session.getAttribute("lang");
		if (toLanguage == null)
			toLanguage = "English";
		Internationalizer translate = new Internationalizer(toLanguage);
		String pageName = "admin_modal.";
	%>
	
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    </head>

    <script type="text/javascript" src="scripts/modalhandler.js"> </script>
    
    <%	Object sentence_id, artist, album, song, music_sentence, year, music_language, validUpdate; %>
    <script>
    	$(document).ready(function() {
		    $(".DeleteSentence").click(function(){
		    	var sentenceToBeDeletedID = this.id;
		    	
				deleteAPhraseAccess = document.forms["deleteAPhrase"];
				deleteAPhraseAccess.elements["phraseId"].value = sentenceToBeDeletedID;
				
				document.getElementById("deleteAPhrase").submit();
		    });
		    
		    $(".RemoveUser").click(function(){
		    	var userToRemove = this.id;
		    	
				removeUser = document.forms["removeUser"];
				removeUser.elements["userId"].value = userToRemove;
				
				document.getElementById("removeUser").submit();
		    });	
		});
    </script>

    <script>
		//$(window).load(function(){
		$(document).ready(function() {
			var validUpdate = "<%= (Boolean)session.getAttribute("validUpdate") %>";
			console.log("ADMIN MODAL: " + validUpdate);
			
			if(validUpdate == "true") {
				admin_modal_controller(2);
				console.log("ADMIN MODAL: inside validUpdate");
				
				<%
					sentence_id = session.getAttribute("sentence_id");
					artist = session.getAttribute("artist");
					album = session.getAttribute("album");
					song = session.getAttribute("song");
					music_sentence = session.getAttribute("music_sentence");
					year = session.getAttribute("year");
					music_language = session.getAttribute("music_language");
					validUpdate = session.getAttribute("validUpdate");
				    session.setAttribute("sentence_id", "");
					session.setAttribute("artist", "");
					session.setAttribute("album", "");
					session.setAttribute("song", "");
					session.setAttribute("music_sentence", "");
					session.setAttribute("year", "");
					session.setAttribute("music_language", "");
					session.setAttribute("validUpdate", false);
				%>
			}
		});
    </script>

    <body>
    <form name="deleteAPhrase" id="deleteAPhrase" action="deleteSentence" method="post">
  		<input type="hidden" id="phraseId" name="phraseId" value="0" />
  	</form>
  	 <form name="removeUser" id="removeUser" action="removeUser" method="post">
  		<input type="hidden" id="userId" name="userId" value="0" />
  	</form>  	
    	<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<button onclick="admin_modal_controller(1)"><%= translate.getWords(pageName + "add_phrase") %></button>&nbsp;&nbsp;
			<button onclick="admin_modal_controller(3)"><%= translate.getWords(pageName + "phrase_list") %></button>&nbsp;&nbsp;
			<button onclick="admin_modal_controller(4)"><%= translate.getWords(pageName + "remove_user") %></button>&nbsp;&nbsp;
		</div>
		<div class="modal-body">
			<div id="AddSentence">
				<form action="addSentence" method="post">
						<table>
						<tr>
							<td class="form-group" id="addcell">
								<label for="album"><%= translate.getWords(pageName + "album") %></label> 
							</td>
							<td class="form-group" id="addcell">
								<input type="text" id="album" name="album" required="required" />
								 
							</td>
						</tr>
						<tr>
							<td class="form-group" id="addcell">
						<label for="artist"><%= translate.getWords(pageName + "artist") %></label> 
						</td>
							<td class="form-group" id="addcell">
								<input type="text" id="artist" name="artist" required="required" />	 
							</td>
						</tr>
						<tr>
							<td class="form-group" id="addcell">
								<label for="song"><%= translate.getWords(pageName + "song") %></label> 
						</td>
							<td class="form-group" id="addcell">
								<input type="text" id="song" name="song" required="required" />
							</td>
						</tr>
						<tr>
							<td class="form-group" id="addcell">
						<label for="sentence"><%= translate.getWords(pageName + "phrase") %></label> 
						</td>
							<td class="form-group" id="addcell">
								<textarea  id="sentence" name="sentence" required="required" rows="5" cols="60"></textarea> 
							</td>
						</tr>
						<tr>
							<td class="form-group" id="addcell">
								<label for="year_released"><%= translate.getWords(pageName + "year_released") %></label> 
							</td>
							<td class="form-group" id="addcell">		
								<input type="text" id="year_released" name="year_released" required="required" />
								</td>
							</tr>
						</table>
					<input type="radio" id="Lang" name="Lang" value="English" checked><%= translate.getWords(pageName + "english") %><br>
					<input type="radio" id="Lang" name="Lang" value="French" ><%= translate.getWords(pageName + "french") %><br>
				<input type="submit" value="<%= translate.getWords(pageName + "add") %>" />
				</form>
			</div>
			
			<div id="RemoveUser" Style="display: none">
				<%
					ArrayList<Object[]> ul = AdminDao.returnATable("SELECT * from users where user_type='user'", 0, new int[] { UserInfoDao.OBJ_STRING }, new Object[] { null } );
					if (ul.size() > 0) {
						out.print(
						"<table Style='margin-bottom: 0px; margin-top: 2px; padding: 2px; background-color: #a6b3c6; box-shadow: 5px 5px 2px #888888; width: 100%'" +
							"<tr>" +
								"<th>" +
									"&nbsp; " +
								"</th>" +
								
								"<th >" +
									translate.getWords(pageName + "account_name") +
								"</th>" +
							"</tr>");
					}
				
					for (int i = 0; i < ul.size(); i++) {
						out.print(
							
								"<tr>" +
									"<td Style='margin-right: 10px; padding-right: 10px;'>" +
										"<button type='button' class='RemoveUser' id='" +ul.get(i)[0].toString() +"'> x </button>" +
									"</td>" +
									"<td  Style='margin-right: 10px; padding-left: 10px;'>" +
										ul.get(i)[1].toString() +
									"</td>" +
								"</tr>"
								
						);
					}
					if (ul.size() > 0) {
						out.print("</table>");
					}
				%>
			</div>
			
			<div id="SentenceList" Style="display: none">
				<%
					ArrayList<Object[]> al = AdminDao.returnATable("SELECT * from music_sentences where song_language = ?", 1, new int[]{ UserInfoDao.OBJ_STRING }, new Object[]{ toLanguage });
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
									translate.getWords(pageName + "phrase_list_phrase") +
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
					<input type="hidden" name="u_sentence_id" id="u_sentence_id" value="<%= sentence_id %>" />
						<table>
						<tr>
							<td class="form-group" id="addcell">
								<label for="u_album">Album: </label> 
							</td>
							<td class="form-group" id="addcell">
								<input type="text" id="u_album" name="u_album" required="required" value="<%= album %>" />
								 
							</td>
						</tr>
						<tr>
							<td class="form-group" id="addcell">
						<label for="u_artist">Artist: </label> 
						</td>
							<td class="form-group" id="addcell">
								<input type="text" id="u_artist" name="u_artist" required="required" value="<%= artist %>" />	 
							</td>
						</tr>
						<tr>
							<td class="form-group" id="addcell">
								<label for="u_song">Song: </label> 
						</td>
							<td class="form-group" id="addcell">
								<input type="text" id="u_song" name="u_song" required="required" value="<%= song %>" />
							</td>
						</tr>
						<tr>
							<td class="form-group" id="addcell">
						<label for="u_sentence">Sentence: </label> 
						</td>
							<td class="form-group" id="addcell">
								<textarea id="u_sentence" name="u_sentence" required="required" rows="5" cols="60"><%= music_sentence %></textarea> 
							</td>
						</tr>
						<tr>
							<td class="form-group" id="addcell">
								<label for="u_year_released">Year Released: </label> 
							</td>
							<td class="form-group" id="addcell">		
								<input type="text" id="u_year_released" name="u_year_released" required="required" value="<%= year %>" />
								</td>
							</tr>
						</table>
						<% String lang = (String)music_language;
							if (lang == null) {
								lang = "English";
							}
							if (lang.equalsIgnoreCase("english")) {
								out.print(
										"<input type='radio' id='u_lang' name='u_lang' value='English' checked> English<br>" +
										"<input type='radio' id='u_lang' name='u_lang' value='French' > French<br>"
								); 
							}
							else if (lang.equalsIgnoreCase("french")) {
								out.print(
										"<input type='radio' id='u_lang' name='u_lang' value='English' > English<br>" +
										"<input type='radio' id='u_lang' name='u_lang' value='French' checked> French<br>"
								); 								
							}
							else {
								out.print(
										"<input type='radio' id='u_lang' name='u_lang' value='English' checked> English<br>" +
										"<input type='radio' id='u_lang' name='u_lang' value='French' > French<br>"
								); 
							}
							%>
				<input type="submit" value="Update" />
				</form>
			</div>
		</div>
    </body>
</html>