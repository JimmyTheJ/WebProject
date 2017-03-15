package com.amzi.dao;

public class UserStatsDao {
	public static double getAvgWPM (int id) {
		return (double) UserInfoDao.performQuery ("SELECT avg_wpm FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
	}
	
	public static double getMinWPM (int id) {
		return (double) UserInfoDao.performQuery ("SELECT min_wpm FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
	}
	
	public static double getTopWPM (int id) {
		return (double) UserInfoDao.performQuery ("SELECT max_wpm FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
	}
	
	public static double getAvgAccuracy (int id) {
		return (double) UserInfoDao.performQuery ("SELECT avg_accuracy FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
	}
	
	public static double getMinAccuracy (int id) {
		return (double) UserInfoDao.performQuery ("SELECT min_accuracy FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
	}
	
	public static double getTopAccuracy (int id) {
		return (double) UserInfoDao.performQuery ("SELECT max_accuracy FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
	}
	
	public static void setAvgWPM (int id, double n) {
		double words = (double) UserInfoDao.performQuery ("SELECT avg_wpm FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
		int numSent = (int) UserInfoDao.performQuery ("SELECT num_sentences FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
		
    double updatedWPM = (numSent * words) + n;
    numSent++;
    updatedWPM /= numSent;

    UserInfoDao.performQuery ("UPDATE user_stats SET avg_wpm=?  WHERE user_id=?", UserInfoDao.UPDATE_QUERY, 2, new int[]{UserInfoDao.OBJ_DOUBLE, UserInfoDao.OBJ_INT}, new Object[]{ updatedWPM, id });
	}
	
	public static void setTopWPM (int id, double n) {
		double words = (double) UserInfoDao.performQuery ("SELECT max_wpm FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });

        if(n > words)
        	UserInfoDao.performQuery ("UPDATE user_stats SET max_wpm=?  WHERE user_id=?", UserInfoDao.UPDATE_QUERY, 2, new int[]{ UserInfoDao.OBJ_DOUBLE, UserInfoDao.OBJ_INT }, new Object[]{ n, id });
	}
	
	public static void setMinWPM (int id, double n) {
		double words = (double) UserInfoDao.performQuery ("SELECT min_wpm FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });

        if(n < words || n == 0)
        	UserInfoDao.performQuery ("UPDATE user_stats SET min_wpm=?  WHERE user_id=?", UserInfoDao.UPDATE_QUERY, 2, new int[]{ UserInfoDao.OBJ_DOUBLE, UserInfoDao.OBJ_INT }, new Object[]{ n, id });
	}
	
	public static void setAVGAccuracy (int id, double n) {
		double words = (double) UserInfoDao.performQuery ("SELECT avg_accuracy FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
		int numSent = (int) UserInfoDao.performQuery ("SELECT num_sentences FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
		
        double updatedAVG = (numSent * words) + n;
        numSent++;
        updatedAVG /= numSent;
        
        UserInfoDao.performQuery ("UPDATE user_stats SET avg_accuracy=? WHERE user_id=?", UserInfoDao.UPDATE_QUERY, 2, new int[]{UserInfoDao.OBJ_DOUBLE, UserInfoDao.OBJ_INT}, new Object[]{ updatedAVG, id });
	}

	public static void setTopAccuracy (int id, double n){
		double words = (double) UserInfoDao.performQuery ("SELECT max_accuracy FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
		
        if(n > words)
        	UserInfoDao.performQuery ("UPDATE user_stats SET max_accuracy=? WHERE user_id=?", UserInfoDao.UPDATE_QUERY, 2, new int[]{ UserInfoDao.OBJ_DOUBLE, UserInfoDao.OBJ_INT }, new Object[]{ n, id });		
	}
	
	public static void setMinAccuracy (int id, double n) {
		double words = (double) UserInfoDao.performQuery ("SELECT min_accuracy FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });

        if(n < words || n == 0)
        	UserInfoDao.performQuery ("UPDATE user_stats SET min_accuracy=? WHERE user_id=?", UserInfoDao.UPDATE_QUERY, 2, new int[]{ UserInfoDao.OBJ_DOUBLE, UserInfoDao.OBJ_INT }, new Object[]{ n, id });		
	}
	
	public static int getUserID (String uName) {
		return (int) UserInfoDao.performQuery ("Select * from users where username=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_STRING }, new Object[]{ uName });
	}
	
	public static void incrementSentences (int id) {
		int numSentences = (int) UserInfoDao.performQuery ("SELECT num_sentences FROM user_stats WHERE user_id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
		
		UserInfoDao.performQuery ("UPDATE user_stats SET num_sentences=? WHERE user_id=?", UserInfoDao.UPDATE_QUERY, 2, new int[]{ UserInfoDao.OBJ_INT, UserInfoDao.OBJ_INT }, new Object[]{ numSentences, id });
	}
}