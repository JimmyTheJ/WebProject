package com.amzi.dao;

//import java.time.*;
import java.sql.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class UserInfoDao {
	public static final int OBJ_INT = 1;
	public static final int OBJ_DOUBLE = 2;
	public static final int OBJ_DATE = 3;
	public static final int OBJ_STRING = 4;
	
	public static final int SELECT_QUERY = 1;
	public static final int UPDATE_QUERY = 2;
	
	public static Object performQuery (String statement, int typeSQL, int numQuestionMarks, int objectType[], Object data[]) {
	    Connection conn = null;
	    PreparedStatement pst = null;
	    ResultSet rs = null;
		Object value = -1;
		
        try {
        	conn = BaseDao.getConnection();
            pst = conn.prepareStatement(statement);
            for (int i = 0; i < numQuestionMarks; i++) {
            	if (objectType[i] == OBJ_INT)
            		pst.setInt(i+1, (int)data[i]);
	        	if (objectType[i] == OBJ_DOUBLE)
	        		pst.setDouble(i+1, (double)data[i]);
	        	if (objectType[i] == OBJ_DATE)
	        		pst.setTimestamp(i+1, (Timestamp)data[i]);
            	if (objectType[i] == OBJ_STRING)
            		pst.setObject(i+1, (String)data[i]);
            }
            
            if (typeSQL == SELECT_QUERY) {
            	rs=pst.executeQuery();
            	
                while (rs.next()) {
                	value = rs.getObject(1);
                }
            }
            else if (typeSQL == UPDATE_QUERY)
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
		return value;
	}

	public static String getUsername (int id) {
		return (String) performQuery ("SELECT username FROM users WHERE id=?", SELECT_QUERY, 1, new int[]{ OBJ_INT }, new Object[]{ id });
    }

	public static int getID (String uName) {
		return (int) performQuery ("SELECT id FROM users WHERE username=?", SELECT_QUERY, 1, new int[]{ OBJ_STRING }, new Object[]{ uName });
	}
	
	public static String getFirstName (String uName) {
		return (String) performQuery ("SELECT f_name FROM users WHERE username=?", SELECT_QUERY, 1, new int[]{ OBJ_STRING }, new Object[]{ uName });
	}
	
	public static String getLastName (String uName) {
		return (String) performQuery ("SELECT l_name FROM users WHERE username=?", SELECT_QUERY, 1, new int[]{ OBJ_STRING }, new Object[]{ uName });
	}
	
	public static String getEmail (String uName) {
		return (String) performQuery ("SELECT email FROM users WHERE username=?", SELECT_QUERY, 1, new int[]{ OBJ_STRING }, new Object[]{ uName });
	}	
	
	public static String getUserType (String uName) {
		return (String) performQuery ("SELECT user_type FROM users WHERE username=?", SELECT_QUERY, 1, new int[]{ OBJ_STRING }, new Object[]{ uName });
	}
	
	public static void setJoinDate (int id, Timestamp date) {
		performQuery ("UPDATE users SET join_date=?  WHERE id=?", UPDATE_QUERY, 2, new int[]{ OBJ_DATE, OBJ_INT }, new Object[]{ date, id });
	}
	
	public static void setLastLoginDate (int id, Timestamp date) {
		performQuery ("UPDATE users SET last_login=?  WHERE id=?", UPDATE_QUERY, 2, new int[]{ OBJ_DATE, OBJ_INT }, new Object[]{ date, id });
	}
}