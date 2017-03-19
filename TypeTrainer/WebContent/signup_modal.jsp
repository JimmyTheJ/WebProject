<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.amzi.dao.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript" src="./javascript.js"></script>
 
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    </head>
    <body>
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2>Sign Up</h2>
                
            </div>
                <div class="modal-body">
                    <form action="userCreationServlet" method="post">
                        <table>
                            <tr>
                                <td class="form-group" id="signupcell"><label for="username">Username:
                                </label></td>
                                <td class="form-group" id="signupcell"><input type="text"
                                    id="username" name="username" required="required" /></td>
                            </tr>
                            <tr>
                                <td class="form-group" id="signupcell"><label for="password">Password:
                                </label></td>
                                <td class="form-group" id="signupcell"><input
                                    type="password" name="userpass" required="required" /></td>
                            </tr>
                            <tr>
                                <td class="form-group" id="signupcell"><label for="f_name">First
                                        Name: </label></td>
                                <td class="form-group" id="signupcell"><input type="text"
                                    name="f_name" /></td>
                            </tr>
                            <tr>
                                <td class="form-group" id="signupcell"><label for="l_name">Last
                                        Name: </label></td>
                                <td class="form-group" id="signupcell"><input type="text"
                                    name="l_name" /></td>
                            </tr>
                            <tr>
                                <td class="form-group" id="signupcell"><label for="email">Email:
                                </label></td>
                                <td class="form-group" id="signupcell"><input type="text"
                                    name="email" /></td>
                            </tr>
                            <tr>
                                <td><input type="submit" value="Submit!" /></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn-success" 
                        Style="background-color: Transparent; border: none; overflow: hidden; outline: none"
                        data-toggle="modal" data-target="#userModal" data-dismiss="modal">Login</button>
                </div>
            </div>
    </body>
</html>