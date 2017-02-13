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
		int accuracy=0;
		HttpSession session = request.getSession(true);
		
		String sentence = (String) session.getAttribute("sentence");
		
		

		 if(session!=null){
			 session.getAttribute("name");
		 }
		
		 accuracy=matching(sentence,request.getParameter("match"));
			
		 out.print("<p style=\"color:blue\">Matched "+accuracy+"</p>");  
			sentence=TypingMatchDao.getSentence();
			request.setAttribute("sentence", sentence);
			session.setAttribute("sentence", sentence);
			
			request.setAttribute("LastMatch", accuracy);
			session.setAttribute("LastMatch", accuracy);
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
            rd.include(request,response);
          
		out.close();
	}
	
	//returns a percent matching char of the 2 sentences
	int matching(String sen, String mat){
		
		int perMatch=0;
		int count=0;
		
		for(int x=0;x< sen.length() && x<mat.length();++x){
			//if(sen.charAt(x)!=' ')//will fix later version for whitespace
			if(sen.charAt(x)==mat.charAt(x)){
				count++;
			}
		}
		perMatch=(int)((100.00*count)/sen.length());

		
		return perMatch;
		
	}
}
