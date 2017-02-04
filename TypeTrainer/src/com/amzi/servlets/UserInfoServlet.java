package com.amzi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.amzi.dao.UserInfoDao;

public class UserInfoServlet extends HttpServlet{
	private static final long serialVersionUID =1L;
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException , IOException{
		
		 response.setContentType("text/html");  
		 PrintWriter out = response.getWriter();  
		 String uname= request.getParameter("username"); //Changed this line, not sure if it's right.
		 request.setAttribute("FirstName", UserInfoDao.getFirstName(uname));
		 request.setAttribute("LastName", UserInfoDao.getLastName(uname));
	}
	
}
