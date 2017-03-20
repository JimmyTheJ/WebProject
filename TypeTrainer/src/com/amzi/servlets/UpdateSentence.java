package com.amzi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.amzi.dao.*;

public class UpdateSentence extends HttpServlet{
	
	private static final long serialVersionUID =1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException , IOException{
		
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();
		//HttpSession session = request.getSession(true);

	    //if(session!=null)
	    //	session.getAttribute("name");
	    
        int id=Integer.parseInt(request.getParameter("u_sentence_id"));
        String album=request.getParameter("u_album");
        String artist=request.getParameter("u_artist");
        String song=request.getParameter("u_song");
        String sentence=request.getParameter("u_sentence");
        String year=request.getParameter("u_year_released");
        String lang=request.getParameter("u_lang");
	    
	    AdminDao.updateSentence(id, album, artist, song, sentence, year, lang);
		
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
        rd.include(request,response);
          
		out.close();
	}
}