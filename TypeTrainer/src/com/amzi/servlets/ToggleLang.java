package com.amzi.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ToggleLang extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
		
		HttpSession session = request.getSession();
	
		Cookie cookies [] = request.getCookies();
		Cookie cookie = null;
		
		response.setContentType("text/html");
		
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				
				if (cookie.getName().equals("language")) {
					session.setAttribute("lang", cookie.getValue());
				}
			}
		}
		
	
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
        rd.include(request,response);
	}
	
}
