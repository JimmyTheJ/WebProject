package com.amzi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao {
	public static void addSentence(String album, String artist, String song, String sentence, int year, String lang){
		  Connection conn = null;
		    PreparedStatement pst = null;
		    ResultSet rs = null;
		    
		    try {
	        	conn = BaseDao.getConnection();
	            pst = conn.prepareStatement("INSERT INTO music_sentences (album, artist, song, sentence, year_released, song_language) VALUES (?,?,?,?,?,?)");
	            pst.setString(1,album);
	            pst.setString(2,artist);
	            pst.setString(3,song);
	            pst.setString(4,sentence);
	            pst.setInt(5,year);
	            pst.setString(6,lang);
	            
	            pst.executeUpdate();
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
	}
	
	public void deleteSentence(int id){
		  Connection conn = null;
		    PreparedStatement pst = null;
		    ResultSet rs = null;
		    
		    try {
	        	conn = BaseDao.getConnection();
	            pst = conn.prepareStatement("DELETE from music_sentences where id=?");
	            pst.setInt(1, id);
	           
	            
	            pst.executeUpdate();
	           
	           
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
	}
	
	
	
	public ResultSet sentenceList(String language){
		  Connection conn = null;
		    PreparedStatement pst = null;
		    ResultSet rs = null;
		    
		    try {
	        	conn = BaseDao.getConnection();
	            pst = conn.prepareStatement("SELECT * from music_sentences where song_language = ?");
	            pst.setString(1, language);
	            
	           rs= pst.executeQuery();
	           
	           
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
		    return rs;
	}
	
	
}