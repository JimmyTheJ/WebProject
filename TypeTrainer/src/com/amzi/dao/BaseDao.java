package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class BaseDao {

	public static Connection getConnection(){
		
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/";
	    String dbName = "typer_db";
	    String driver = "com.mysql.jdbc.Driver";
	    String userName = "root";
	    //String password = "uber-g";
	    //String password = "spicymemes";
		String password = "i+g7fvJRXNesQZb^";
	    
	    try {
	    	
	    	 Class.forName(driver).newInstance();
             conn = DriverManager
                     .getConnection(url + dbName + "?useSSL=false", userName, password);

	    }
	   catch (Exception e) {
      	System.out.println(e);
      } 
	    
       return conn;
	    
	}
	
}