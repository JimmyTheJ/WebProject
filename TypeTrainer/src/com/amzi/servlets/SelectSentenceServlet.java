package com.amzi.servlets;

import java.io.IOException;

import com.amzi.dao.AdminDao;
import com.amzi.dao.MusicSentencesDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class SelectSentenceServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
		
		    int musicID = Integer.parseInt(request.getParameter("musicsentence_id"));
		    String musicArist = MusicSentencesDao.getArtist(musicID);
		    String musicAlbum = MusicSentencesDao.getAlbum(musicID);
		    String musicSong = MusicSentencesDao.getSong(musicID);
		    String musicSentence = MusicSentencesDao.getSentence(musicID);
		    String musicYear = MusicSentencesDao.getYear(musicID);
		    String musicLanguage = MusicSentencesDao.getLanguage(musicID);
	
			request.setAttribute("sentence_id", musicID );
			request.setAttribute("artist", musicArist );
			request.setAttribute("album", musicAlbum );
			request.setAttribute("song", musicSong );
			request.setAttribute("music_sentence", musicSentence );
			request.setAttribute("year", musicYear );
			request.setAttribute("music_language", musicLanguage );
			request.setAttribute("validUpdate", true );
			
	        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	        rd.include(request,response);
	}
	
}