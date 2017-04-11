package com.amzi.servlets;

import java.io.IOException;

import com.amzi.dao.AdminDao;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class AddSentence extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
		
	        String album=request.getParameter("album");
	        String artist=request.getParameter("artist");
	        String song=request.getParameter("song");
	        String sentence=request.getParameter("sentence");
	        String language=request.getParameter("Lang");
	        String year=request.getParameter("year_released");
		    AdminDao.addSentence(album,artist,song,sentence,year,language);
		        
	        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	        rd.include(request,response);
	}
	
}