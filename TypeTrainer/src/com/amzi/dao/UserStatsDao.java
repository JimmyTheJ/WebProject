package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserStatsDao {

public static double getAvgWPM(int ID){
		
	    Connection conn = null;
	    PreparedStatement pst = null;
	    ResultSet rs = null;
		double words=0;
		

        try {
        	conn = BaseDao.getConnection();
            pst = conn.prepareStatement("SELECT avg_wpm FROM user_stats WHERE user_id=?");
            pst.setInt(1,ID);
            
            rs=pst.executeQuery();
            words = rs.getDouble(1);
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
		return words;
		
	}

public static double getTopWPM(int ID){
	
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
	double words=0;
	
	
    
    try {
    	conn = BaseDao.getConnection();
        pst = conn.prepareStatement("SELECT max_wpm FROM user_stats WHERE user_id=?");
        pst.setInt(1,ID);
        
        rs=pst.executeQuery();
        words = rs.getDouble(1);
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
	return words;
	
}

public static double getAvgAccuracy(int ID){
	
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
	double accuracy=0;
	
	
    
    try {
    	conn = BaseDao.getConnection();
        pst = conn.prepareStatement("SELECT avg_accuracy FROM user_stats WHERE user_id=?");
        pst.setInt(1,ID);
        
        rs=pst.executeQuery();
        accuracy =rs.getDouble(1);
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
	return accuracy;
	
}
	
public static double getTopAccuracy(int ID){
	
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
	double accuracy=0;
	
    
    try {
    	conn = BaseDao.getConnection();
        pst = conn.prepareStatement("SELECT max_accuracy FROM user_stats WHERE user_id=?");
        pst.setInt(1,ID);
        
        rs=pst.executeQuery();
        accuracy =rs.getDouble(1);
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
	return accuracy;
	
}

}
