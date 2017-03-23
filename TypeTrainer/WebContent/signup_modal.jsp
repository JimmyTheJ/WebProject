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
		String pageName = "signup_modal.";
	%>    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
 
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    </head>
    <body>
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2><%= translate.getWords(pageName + "signup") %></h2>
                
            </div>
                <div class="modal-body">
                    <form action="userCreationServlet" method="post">
                        <table>
                            <tr>
                                <td class="form-group" id="signupcell"><label for="username"><%= translate.getWords(pageName + "username") %>
                                </label></td>
                                <td class="form-group" id="signupcell"><input type="text"
                                    id="username" name="username" required="required" /></td>
                            </tr>
                            <tr>
                                <td class="form-group" id="signupcell"><label for="password"><%= translate.getWords(pageName + "password") %>
                                </label></td>
                                <td class="form-group" id="signupcell"><input
                                    type="password" name="userpass" required="required" /></td>
                            </tr>
                            <tr>
                                <td class="form-group" id="signupcell"><label for="f_name">
                                	<%= translate.getWords(pageName + "f_name") %> </label></td>
                                <td class="form-group" id="signupcell"><input type="text"
                                    name="f_name" /></td>
                            </tr>
                            <tr>
                                <td class="form-group" id="signupcell"><label for="l_name">
                                       <%= translate.getWords(pageName + "l_name") %></label></td>
                                <td class="form-group" id="signupcell"><input type="text"
                                    name="l_name" /></td>
                            </tr>
                            <tr>
                                <td class="form-group" id="signupcell"><label for="email">
                                	<%= translate.getWords(pageName + "email") %></label></td>
                                <td class="form-group" id="signupcell"><input type="email"
                                    name="email" /></td>
                            </tr>
                            <tr>
                                <td class="form-group" id="signupcell"><label for="lang">
                                	<%= translate.getWords(pageName + "language") %></label></td>
								<td class="form-group" id="signupcell">
									<select name="lang" id="lang" Style="margin-top: 10px;">
										<option value="English"><%= translate.getWords(pageName + "english") %></option>
										<option value="French"><%= translate.getWords(pageName + "french") %></option>
									</select>
								</td>
                            </tr>
                            <tr>
                                <td><input type="submit" value='<%= translate.getWords(pageName + "create_account") %>' /></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn-success" 
                        Style="background-color: Transparent; border: none; overflow: hidden; outline: none"
                        data-toggle="modal" data-target="#userModal" data-dismiss="modal">Login</button>
                </div>
    </body>
</html>