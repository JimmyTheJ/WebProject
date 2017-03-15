package com.amzi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminDao {
	public static void addSentence(String album, String artist, String song, String sentence, int year, String lang){
		  	Connection conn = null;
		    PreparedStatement pst_insert = null;
		    ResultSet rs = null;
		    
		    try {
	        	conn = BaseDao.getConnection();
	            pst_insert = conn.prepareStatement("INSERT INTO music_sentences (album, artist, song, sentence, year_released, song_language) VALUES (?,?,?,?,?,?)");
	            pst_insert.setString(1,album);
	            pst_insert.setString(2,artist);
	            pst_insert.setString(3,song);
	            pst_insert.setString(4,sentence);
	            pst_insert.setInt(5,year);
	            pst_insert.setString(6,lang);
	            
	            pst_insert.executeUpdate();
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
	            if (pst_insert != null) {
	                try {
	                    pst_insert.close();
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
	
	public static void deleteSentence(int id){
		  Connection conn = null;
		    PreparedStatement pst_delete = null;
		    ResultSet rs = null;
		    
		    try {
	        	conn = BaseDao.getConnection();
	            pst_delete = conn.prepareStatement("DELETE from music_sentences where id=?");
	            pst_delete.setInt(1, id);
	           
	            
	            pst_delete.executeUpdate();
	           
	           
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
	            if (pst_delete != null) {
	                try {
	                    pst_delete.close();
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
	
	public static void updateSentence(int id, String album, String artist, String song, String sentence, int year, String lang){
		Connection conn = null;
	    PreparedStatement pst_update = null;
	    ResultSet rs = null;
	    
	    try {
        	conn = BaseDao.getConnection();
            pst_update = conn.prepareStatement("UPDATE music_sentences set (album, artist, song, sentence, year_released, song_language) VALUES (?,?,?,?,?,?) WHERE id=?");
            pst_update.setString(1,album);
            pst_update.setString(2,artist);
            pst_update.setString(3,song);
            pst_update.setString(4,sentence);
            pst_update.setInt(5,year);
            pst_update.setString(6,lang);
            pst_update.setInt(6, id);
            
            pst_update.executeUpdate();
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
            if (pst_update != null) {
                try {
                    pst_update.close();
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
	
	
	
	public static ArrayList<String> sentenceList(String language){
		  Connection conn = null;
		  PreparedStatement pst_select = null;
		  ResultSet rs = null;
		  ArrayList<String> ls = new ArrayList<String>();
		    
		    try {
	        	conn = BaseDao.getConnection();
	            pst_select = conn.prepareStatement("SELECT * from music_sentences where song_language = ?");
	            pst_select.setString(1, language);
	            
	           rs= pst_select.executeQuery();
	           
	           while (rs.next()) {
	        	   ls.add(rs.getString("sentence"));
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
	            if (pst_select != null) {
	                try {
	                    pst_select.close();
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
		    return ls;
	}
	
	public static String retreiveSentence(int id){
		
		return null;
	}
	
	
}