package com.amzi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.amzi.dao.TypingMatchDao;

public class TypingMatchServlet extends HttpServlet{
	
	private static final long serialVersionUID =1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException , IOException{
		
		 response.setContentType("text/html");  
		 PrintWriter out = response.getWriter();  
		//String sentence= "Test Text";
		 
		String sentence =   request.getParameter("sentence1");
		
		System.out.println("match  "+request.getParameter("match"));
		System.out.println(request.getParameter("sentence1"));
		HttpSession session = request.getSession(false);
		 if(session!=null){
			 session.getAttribute("name");
		 }
		
		if(sentence.equalsIgnoreCase(request.getParameter("match"))){ //will be updated in later version
			  out.print("<p style=\"color:blue\">Matched</p>");  
			  sentence=TypingMatchDao.getSentence();
			  request.setAttribute("sentence", TypingMatchDao.getSentence());
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
            rd.include(request,response);
		}
		else{
			 
			 out.print("<p style=\"color:red\">Sorry incorrect</p>");  
	            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	            sentence=TypingMatchDao.getSentence();
	            request.setAttribute("sentence", request.getAttribute("sentence"));
	            rd.include(request,response); 
		}
		
	
		
		out.close();
	}
	
}
