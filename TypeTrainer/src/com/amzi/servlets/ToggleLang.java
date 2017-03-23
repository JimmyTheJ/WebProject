package com.amzi.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ToggleLang extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
		
			String lang = request.getParameter("lang");
			
			HttpSession session = request.getSession();
			
			System.out.println(lang);
			
			if((String)session.getAttribute("lang") != null){
				session.removeAttribute("lang");
				session.setAttribute("lang", lang);
			}
			else{
				session.setAttribute("lang", lang);
			}
		
	        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	        rd.include(request,response);
	}
	
}
