package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;

public class TypingMatchDao {

	//public static String getSentence(){
	public static String getSentence(String lang){
		
		String sentence ="";
		
		Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
       
		
        try {
        	conn = BaseDao.getConnection();
        	 //pst = conn.prepareStatement("SELECT * FROM music_sentences ORDER BY RAND() LIMIT 1");
        	 pst = conn.prepareStatement("SELECT * FROM music_sentences WHERE song_language = ? ORDER BY RAND() LIMIT 1");
        	
        	 pst.setString(1, lang);
        	rs = pst.executeQuery();
        	
        	rs.next();
        sentence=rs.getString("sentence");
        
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
		return sentence;
		
	}
	
}