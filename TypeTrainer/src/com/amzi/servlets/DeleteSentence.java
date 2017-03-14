package com.amzi.servlets;

import java.io.IOException;

import com.amzi.dao.AdminDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteSentence extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  

	        int id=Integer.parseInt(request.getParameter("phraseId"));

	        System.out.println(id);
	        AdminDao.deleteSentence(id);
	        
	        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	        rd.include(request,response);
	}
}