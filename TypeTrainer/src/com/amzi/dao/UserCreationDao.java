package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.amzi.dao.BaseDao;

public class UserCreationDao {

	public static boolean addUser(String username, String password, String fName, String lName, String email, Timestamp time, String lang){
		boolean status = false;
		int user_id = -1;
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
               	pst = conn.prepareStatement("INSERT INTO users (username, password, f_name, l_name, email, join_date, user_type, user_lang) VALUES (? ,? ,?, ?, ?, ?, 'user', ?)");
            	pst.setString(1, username);
            	pst.setString(2, password);
            	pst.setString(3, fName);
            	pst.setString(4, lName);
            	pst.setString(5, email);
            	pst.setTimestamp(6, time);
            	pst.setString(7, lang);
            	pst.executeUpdate();
            	pst.close();
            	
            	pst = conn.prepareStatement("SELECT id FROM users WHERE username=?");
            	pst.setString(1, username);
                rs = pst.executeQuery();
            	rs.next();
                user_id = rs.getInt(1);
            	pst.close();
            	
            	pst = conn.prepareStatement("INSERT INTO user_stats (user_id, min_wpm, avg_wpm, max_wpm, min_accuracy, avg_accuracy, max_accuracy, num_sentences) VALUES (?, 0, 0, 0, 0, 0, 0, 0)");
            	pst.setInt(1, user_id);
            	pst.executeUpdate();
            	pst.close();
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