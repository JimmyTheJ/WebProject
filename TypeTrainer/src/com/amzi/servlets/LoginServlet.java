package com.amzi.servlets;

import java.io.IOException;
import com.amzi.dao.TypingMatchDao;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.amzi.dao.LoginDao;

public class LoginServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String n=request.getParameter("username");
        String p=request.getParameter("userpass");
        
        String sentence = TypingMatchDao.getSentence();
        
        if(LoginDao.validate(n, p)){  
        	HttpSession session = request.getSession();
        	session.setAttribute("name", n);

            session.setAttribute("sentence", sentence);
            session.setAttribute("LastMatch", 100); 
            session.setAttribute("loginMessage", "welcome back, " + n);          
            request.setAttribute("LastMatch", 100);

            session.setAttribute("sentence", sentence);  	
            session.setAttribute("loginMessage", "welcome back, " + n);          
            request.setAttribute("sentence", sentence);

            request.setAttribute("loginMessage", "welcome back, " + n);

            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");           
            rd.forward(request,response);  
        }  
        else{  
            out.print("<p style=\"color:red\">Sorry username or password error</p>");
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
            rd.include(request,response);  
        }  

        out.close();  
    }  
} 