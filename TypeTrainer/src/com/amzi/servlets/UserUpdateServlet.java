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
import com.amzi.dao.UserStatsDao;

public class UserUpdateServlet extends HttpServlet{
	 private static final long serialVersionUID = 1L;

	    public void doPost(HttpServletRequest request, HttpServletResponse response)  
	            throws ServletException, IOException {  
		

			double wpm;
			double acc;
			String name;
			int id;
			
			 response.setContentType("text/html");

			
			wpm=Double.parseDouble(request.getParameter("WPM"));
			acc=Double.parseDouble(request.getParameter("Accuracy"));
			name= (String)request.getParameter("Username");
			
			id = UserInfoDao.getID(name);
			
	    	//System.out.println(name);
	    	//System.out.println(id);
			
			//wpm
			UserStatsDao.setAvgWPM(id, wpm);
			UserStatsDao.setTopWPM(id, wpm);
			UserStatsDao.setMinWPM(id, wpm);
			
			//accuracy
			UserStatsDao.setAVGAccuracy(id, acc);
			UserStatsDao.setTopAccuracy(id, acc);
			UserStatsDao.setMinAccuracy(id, acc);
			
			 RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
	            rd.include(request,response);  
	}

}