package com.amzi.servlets;

import java.io.IOException;

import com.amzi.dao.AdminDao;
import com.amzi.dao.MusicSentencesDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class SelectSentenceServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
		
			HttpSession session = request.getSession(true);
		
		    int musicID = Integer.parseInt(request.getParameter("musicsentence_id"));
		    String musicArist = MusicSentencesDao.getArtist(musicID);
		    String musicAlbum = MusicSentencesDao.getAlbum(musicID);
		    String musicSong = MusicSentencesDao.getSong(musicID);
		    String musicSentence = MusicSentencesDao.getSentence(musicID);
		    String musicYear = MusicSentencesDao.getYear(musicID);
		    String musicLanguage = MusicSentencesDao.getLanguage(musicID);
	
		    session.setAttribute("sentence_id", musicID );
			session.setAttribute("artist", musicArist );
			session.setAttribute("album", musicAlbum );
			session.setAttribute("song", musicSong );
			session.setAttribute("music_sentence", musicSentence );
			session.setAttribute("year", musicYear );
			session.setAttribute("music_language", musicLanguage );
			session.setAttribute("validUpdate", true );
			
	        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
	        rd.include(request,response);
	}
	
}