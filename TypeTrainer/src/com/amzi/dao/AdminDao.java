package com.amzi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminDao {
	public static void addSentence(String album, String artist, String song, String sentence, int year, String lang){
		UserInfoDao.performQuery ("INSERT INTO music_sentences (album, artist, song, sentence, year_released, song_language) VALUES (?,?,?,?,?,?)", UserInfoDao.UPDATE_QUERY, 6, new int[]{ UserInfoDao.OBJ_STRING, UserInfoDao.OBJ_STRING, UserInfoDao.OBJ_STRING, UserInfoDao.OBJ_STRING, UserInfoDao.OBJ_INT, UserInfoDao.OBJ_STRING }, new Object[]{ album, artist, song, sentence, year, lang });
	}
	
	public static void deleteSentence(int id) {
		UserInfoDao.performQuery ("DELETE from music_sentences where id=?", UserInfoDao.UPDATE_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
	}

	public static void updateSentence(int id, String album, String artist, String song, String sentence, String year, String lang){
		UserInfoDao.performQuery ("UPDATE music_sentences SET album=?, artist=?, song=?, sentence=?, year_released=?, song_language=? WHERE id=?", UserInfoDao.UPDATE_QUERY, 7, new int[]{ UserInfoDao.OBJ_STRING, UserInfoDao.OBJ_STRING, UserInfoDao.OBJ_STRING, UserInfoDao.OBJ_STRING, UserInfoDao.OBJ_STRING, UserInfoDao.OBJ_STRING, UserInfoDao.OBJ_INT }, new Object[]{ album, artist, song, sentence, year, lang, id });
	}
	
	public static ArrayList<Object[]> sentenceList(String language){
		  Connection conn = null;
		  PreparedStatement pst = null;
		  ResultSet rs = null;
		  ResultSetMetaData rsmd = null;
		  int columnCount = 0;
		  ArrayList<Object[]> phraseList = new ArrayList<Object[]>();
		  
		  
		    try {
	        	conn = BaseDao.getConnection();
	            pst = conn.prepareStatement("SELECT * from music_sentences where song_language = ?");
	            pst.setString(1, language);
	            
	           rs= pst.executeQuery();
	           rsmd = rs.getMetaData();
	           columnCount = rsmd.getColumnCount();           
	           
	           while (rs.next()) {
	        	    Object[] columnValues = new Object[columnCount];
	        	    for (int i = 0; i < rsmd.getColumnCount(); i++) {
	        	    	columnValues[i] = rs.getObject(i+1);
	        	    }
	        	    phraseList.add(columnValues);
	           }
	           
	        }
	        catch (Exception e) {
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
		    return phraseList;
		}
}