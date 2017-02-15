package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.amzi.dao.BaseDao;

public class UserCreationDao {

	public static boolean addUser(String username, String password, String fName, String lName, String email){
		boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
		
        try{
        	conn= BaseDao.getConnection();
        	
        	pst = conn
                    .prepareStatement("SELECT * FROM users WHERE username=?");
            pst.setString(1, username);

            rs = pst.executeQuery();
            status = rs.next();
            
            pst.close();
            rs.close();
            
            if(!status){
            	pst = conn.prepareStatement("INSERT INTO users (username, password, f_name, l_name, email) VALUES (? ,? ,?, ?, ?)");
            	pst.setString(1, username);
            	pst.setString(2, password);
            	pst.setString(3, fName);
            	pst.setString(4, lName);
            	pst.setString(5, email);
            	//rs = pst.executeQuery();
            	int result = pst.executeUpdate();
            	if (result == 0) {
            		;
            	}
            }
            else
            	return false;

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
        
		return true;
	}
	
}