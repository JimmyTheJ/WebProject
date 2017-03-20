package com.amzi.dao;

public class MusicSentencesDao {
	public static int getId (String sentence) {
		return (int) UserInfoDao.performQuery ("SELECT id FROM music_sentences WHERE sentence=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_STRING }, new Object[]{ sentence });
	}
	
	public static String getArtist (int id) {
		return (String) UserInfoDao.performQuery ("SELECT artist FROM music_sentences WHERE id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
	}
	
	public static String getAlbum (int id) {
		return (String) UserInfoDao.performQuery ("SELECT album FROM music_sentences WHERE id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
	}
	
	public static String getSong (int id) {
		return (String) UserInfoDao.performQuery ("SELECT song FROM music_sentences WHERE id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
	}
	
	public static String getSentence (int id) {
		return (String) UserInfoDao.performQuery ("SELECT sentence FROM music_sentences WHERE id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
	}
	
	public static String getLanguage (int id) {
		return (String) UserInfoDao.performQuery ("SELECT song_language FROM music_sentences WHERE id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
	}
	
	public static String getYear (int id) {
		return (String) UserInfoDao.performQuery ("SELECT year_released FROM music_sentences WHERE id=?", UserInfoDao.SELECT_QUERY, 1, new int[]{ UserInfoDao.OBJ_INT }, new Object[]{ id });
	}
}
