package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TypingMatchDao {

	public static String getSentence(){
		
		String sentence ="";
		
		Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

       
		
        try {
        	conn = BaseDao.getConnection();
             pst = conn.prepareStatement("SELECT sentence FROM music_sentences ORDER BY RAND() LIMIT 1");
        rs = pst.executeQuery();
        sentence=rs.getString(1);
        
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
