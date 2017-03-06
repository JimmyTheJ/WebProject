package com.amzi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserInfoDao {
	
	public static int getID(String uName){
		
	    Connection conn = null;
	    PreparedStatement pst = null;
	    ResultSet rs = null;
		int ID=-1;
		
		
        
        try {
        	conn = BaseDao.getConnection();
            pst = conn.prepareStatement("SELECT id FROM users WHERE username=?");
            pst.setString(1,uName);
            
            rs=pst.executeQuery();
            while (rs.next()) {
            	ID = rs.getInt(1);
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
		return ID;
		
	}

	public static String getUsername(int ID){
		
	    Connection conn = null;
	    PreparedStatement pst = null;
	    ResultSet rs = null;
		String uName="";
		
		
        
        try {
        	conn = BaseDao.getConnection();
            pst = conn.prepareStatement("SELECT username FROM users WHERE id=?");
            pst.setInt(1,ID);
            
            rs=pst.executeQuery();
            while (rs.next()) {
            	uName = rs.getString(1);
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
		return uName;
		
	}
	
	public static String getFirstName(String uName){
		
	    Connection conn = null;
	    PreparedStatement pst = null;
	    ResultSet rs = null;
		String name="";
		
		
        
        try {
        	conn = BaseDao.getConnection();
            pst = conn.prepareStatement("SELECT f_name FROM users WHERE username=?");
            pst.setString(1,uName);
            
            rs=pst.executeQuery();
            name = rs.getString(1);
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
		return name;
		
	}
	
	
	public static String getLastName(String uName){
		
	    Connection conn = null;
	    PreparedStatement pst = null;
	    ResultSet rs = null;
		String name="";
		
		
        
        try {
        	conn = BaseDao.getConnection();
        	
            pst = conn.prepareStatement("SELECT l_name FROM users WHERE username=?");
            pst.setString(1,uName);
            
            rs=pst.executeQuery();
            name = rs.getString(1);
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
		return name;
		
	}
	
	
public static String getEmail(String uName){
		
	    Connection conn = null;
	    PreparedStatement pst = null;
	    ResultSet rs = null;
		String name="";
		
		
        
        try {
        	conn = BaseDao.getConnection();
            pst = conn.prepareStatement("SELECT email FROM users WHERE username=?");
            pst.setString(1,uName);
            
            rs=pst.executeQuery();
            name = rs.getString(1);
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
		return name;
		
	}

public static String getUserType(String uName){
	
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
	String name="";
	
	
    
    try {
    	conn = BaseDao.getConnection();
        pst = conn.prepareStatement("SELECT user_type FROM users WHERE username=?");
        pst.setString(1,uName);
        
        rs=pst.executeQuery();
        name = rs.getString(1);
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
	return name;
	
}

}
