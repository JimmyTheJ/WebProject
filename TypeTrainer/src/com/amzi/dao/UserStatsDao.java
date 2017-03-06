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
            rs.next();
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

public static void setAvgWPM(int ID, double n){
	
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
	double words=0;
	int numSent=0;
	double updatedWPM=0;
	
    
    try {
    	conn = BaseDao.getConnection();
        pst = conn.prepareStatement("SELECT avg_wpm FROM user_stats WHERE user_id=?");
        pst.setInt(1,ID);
        
        rs=pst.executeQuery();
        rs.next();
        words = rs.getDouble(1);
        
        
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        pst.close();
        
        pst = conn.prepareStatement("SELECT num_sentences FROM user_stats WHERE user_id=?");
        pst.setInt(1, ID);
        rs=pst.executeQuery();
        rs.next();
        numSent=rs.getInt(1);
        
        updatedWPM=(numSent*words)+n;
        
        numSent++;
        updatedWPM/=numSent;
      
        pst.close();
        	pst=conn.prepareStatement("UPDATE user_stats SET avg_wpm=? ,num_sentences=? WHERE user_id=?");
        	pst.setDouble(1, updatedWPM);
        	pst.setInt(2, numSent);
        	pst.setInt(3,ID);
            
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
        rs.next();
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


public static void setTopWPM(int ID, double n){
	
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
	double words=0;
	
	
    
    try {
    	conn = BaseDao.getConnection();
        pst = conn.prepareStatement("SELECT max_wpm FROM user_stats WHERE user_id=?");
        pst.setInt(1,ID);
        
        rs=pst.executeQuery();
        rs.next();
        words = rs.getDouble(1);
        
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        if(n>words){
        	pst.close();
        	pst=conn.prepareStatement("UPDATE user_stats SET max_wpm=? WHERE user_id=?");
        	pst.setDouble(1,n);
        	pst.setInt(2,ID);
            
            pst.executeUpdate();
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
	
	
}


public static double getMinWPM(int ID){
	
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
	double words=0;
	
	
    
    try {
    	conn = BaseDao.getConnection();
        pst = conn.prepareStatement("SELECT min_wpm FROM user_stats WHERE user_id=?");
        pst.setInt(1,ID);
        
        rs=pst.executeQuery();
        rs.next();
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

public static void setMinWPM(int ID, double n){
	
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
	double words=0;
	
	
    
    try {
    	conn = BaseDao.getConnection();
        pst = conn.prepareStatement("SELECT min_wpm FROM user_stats WHERE user_id=?");
        pst.setInt(1,ID);
        
        rs=pst.executeQuery();
        rs.next();
        words = rs.getDouble(1);
        
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        if(n<words || n==0){
        	pst.close();
        	pst=conn.prepareStatement("UPDATE user_stats SET min_wpm=? WHERE user_id=?");
        	pst.setDouble(1,n);
        	pst.setInt(2,ID);
            
            pst.executeUpdate();
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
        rs.next();
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
	
public static void setAVGAccuracy(int ID, double n){
	
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
	double words=0;
	double updatedAVG=0;
	int  numSent;
	
    
    try {
    	conn = BaseDao.getConnection();
        pst = conn.prepareStatement("SELECT avg_accuracy FROM user_stats WHERE user_id=?");
        pst.setInt(1,ID);
        
        rs=pst.executeQuery();
        rs.next();
        words = rs.getDouble(1);
        
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        
        pst.close();
        
        pst = conn.prepareStatement("SELECT num_sentences FROM user_stats WHERE user_id=?");
        pst.setInt(1, ID);
        rs=pst.executeQuery();
        rs.next();
        numSent=rs.getInt(1);
        
        updatedAVG=(numSent*words)+n;
        numSent++;
        updatedAVG/=numSent;
        pst.close();
        	pst=conn.prepareStatement("UPDATE user_stats SET avg_accuracy=?, num_sentences=? WHERE user_id=?");
        	pst.setDouble(1,updatedAVG);
        	pst.setInt(2, numSent);
        	pst.setInt(3,ID);
            
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
        rs.next();
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
public static void setTopAccuracy(int ID, double n){
	
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
	double words=0;
	
	
    
    try {
    	conn = BaseDao.getConnection();
        pst = conn.prepareStatement("SELECT max_accuracy FROM user_stats WHERE user_id=?");
        pst.setInt(1,ID);
        
        rs=pst.executeQuery();
        rs.next();
        words = rs.getDouble(1);
        
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        if(n>words){
        	pst.close();
        	pst=conn.prepareStatement("UPDATE user_stats SET max_accuracy=? WHERE user_id=?");
        	pst.setDouble(1,n);
        	pst.setInt(2,ID);
            
            pst.executeUpdate();
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
	
	
}


public static double getMinAccuracy(int ID){
	
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
	double accuracy=0;
	
    
    try {
    	conn = BaseDao.getConnection();
        pst = conn.prepareStatement("SELECT min_accuracy FROM user_stats WHERE user_id=?");
        pst.setInt(1,ID);
        
        rs=pst.executeQuery();
        rs.next();
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


public static void setMinAccuracy(int ID, double n){
	
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
	double words=0;
	
	
    
    try {
    	conn = BaseDao.getConnection();
        pst = conn.prepareStatement("SELECT min_accuracy FROM user_stats WHERE user_id=?");
        pst.setInt(1,ID);
        
        rs=pst.executeQuery();
        rs.next();
        words = rs.getDouble(1);
        
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        if(n<words || n==0){
        	pst.close();
        	pst =conn.prepareStatement("UPDATE user_stats SET min_accuracy=? WHERE user_id=?");
        	pst.setDouble(1,n);
        	pst.setInt(2,ID);
            
            pst.executeUpdate();
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
	
	
}


public static int getUserID(String uname){
	
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
	int id=0;
	
	
    try {
    	conn = BaseDao.getConnection();
    	 pst = conn.prepareStatement("Select * from users where username=?");
         pst.setString(1,uname);
         
         rs= pst.executeQuery();
         rs.next();
         id=rs.getInt("id");
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
	return id;
	
}

}