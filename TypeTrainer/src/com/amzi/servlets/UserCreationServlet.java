package com.amzi.servlets;

import java.io.IOException;
import com.amzi.dao.TypingMatchDao;
import com.amzi.dao.UserCreationDao;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.amzi.dao.LoginDao;

public class UserCreationServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String u_name=request.getParameter("username");
        String pw=request.getParameter("userpass");
        String f_name=request.getParameter("f_name");
        String l_name=request.getParameter("l_name");
        String email=request.getParameter("email");
        
        boolean isCreated = UserCreationDao.addUser(u_name, pw, f_name, l_name, email);
        
        if (isCreated) {
		 out.print("<p style=\"color:blue\">Created "+"</p>");  
		 RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");  
         rd.include(request,response);
        }
        else {
   		 out.print("<p style=\"color:red\">Failed to create. Username taken. "+"</p>");        
		 RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");  
         rd.include(request,response);
        }
        out.close();
    }  
} 