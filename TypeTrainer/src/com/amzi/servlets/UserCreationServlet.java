package com.amzi.servlets;

import java.io.IOException;
import com.amzi.dao.UserCreationDao;

import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        
      //encryption
        String genPass=null;
        try{
        	MessageDigest md = MessageDigest.getInstance("MD5");
        	md.update(pw.getBytes());
        	byte[] bytes = md.digest();
        	
        	StringBuilder build = new StringBuilder();
        	
        	for(int i=0; i< bytes.length ;++i){
        		build.append(Integer.toString((bytes[i]& 0xff) +0x100,16).substring(1));
        	}
        	genPass=build.toString();
        }
        catch(NoSuchAlgorithmException e){
        	e.printStackTrace();
        }
        
        boolean isCreated = UserCreationDao.addUser(u_name, genPass, f_name, l_name, email, new Timestamp(System.currentTimeMillis()));
        
        HttpSession session = request.getSession();
        
        if (isCreated) {
		 session.setAttribute("isCreated", new Boolean(true));
        }
        else {      
   		 session .setAttribute("isCreated", new Boolean(false));
        }
        
        RequestDispatcher rd=request.getRequestDispatcher("loginServlet");
        rd.include(request,response);
        
        out.close();
    }  
} 