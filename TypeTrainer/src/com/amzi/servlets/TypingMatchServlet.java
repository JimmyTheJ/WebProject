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

		HttpSession session = request.getSession(true);
		
		String sentence = (String) session.getAttribute("sentence");
		Boolean correct = null;
		
		System.out.println("match  "+request.getParameter("match"));
		System.out.println("Sentence: " + sentence);

		 if(session!=null){
			 session.getAttribute("name");
		 }
		
<<<<<<< HEAD
		if(sentence.equalsIgnoreCase(request.getParameter("match"))){ //will be updated in later version
			correct = true;
			session.setAttribute("correct", correct);  
=======
		 accuracy=matching(sentence,request.getParameter("match")); 
>>>>>>> fd6c64f728525b436589bed526b90996575fb88c
			sentence=TypingMatchDao.getSentence();
			request.setAttribute("sentence", sentence);
			session.setAttribute("sentence", sentence);
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
            rd.include(request,response);
		}
		else{
				correct = false;
				session.setAttribute("correct", correct);
	            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	            sentence=TypingMatchDao.getSentence();
				request.setAttribute("sentence", sentence);
				session.setAttribute("sentence", sentence);
	            rd.include(request,response); 
		}
				
		out.close();
	}
	
}