package com.amzi.servlets;

import java.io.IOException;
import com.amzi.dao.TypingMatchDao;
import com.amzi.dao.UserInfoDao;

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

public class LoginServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String n=request.getParameter("username");
        String p=request.getParameter("userpass");
        String sentence;
        
        //encryption
        String genPass=null;
        try{
        	MessageDigest md = MessageDigest.getInstance("MD5");
        	md.update(p.getBytes());
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
    	HttpSession session = request.getSession();
    	
    	
        if (session.getAttribute("lang") != null)
        	 sentence = TypingMatchDao.getSentence((String)session.getAttribute("lang"));
        else
        	sentence = TypingMatchDao.getSentence("english");
    	
        
        if( UserInfoDao.validateLogin(n, genPass) ){
        	session.setAttribute("name", n);
            session.setAttribute("sentence", sentence);

            UserInfoDao.setLastLoginDate(UserInfoDao.getID(n), new Timestamp(System.currentTimeMillis()) );
        }
        else{
        	//session.setAttribute("validLogin", new Boolean(false));
        	session.setAttribute("name", null);
        }
        
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
        rd.include(request,response); 

        out.close();  
    }  
} 