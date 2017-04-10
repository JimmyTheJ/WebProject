package com.amzi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  

        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  

        //request.getRequestDispatcher("index.jsp").include(request, response);  
        
        HttpSession session=request.getSession();
        
        String lang = (String)session.getAttribute("lang");
        session.invalidate();
        session = request.getSession();
        session.setAttribute("lang", lang);
          
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
        rd.forward(request,response);  
          
        out.close();
    }
}