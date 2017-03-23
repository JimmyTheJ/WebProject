package com.amzi.dao;
import java.util.Locale;
import java.util.ResourceBundle;

public class Internationalizer {
	private Locale locale;
	private ResourceBundle bundle;
	
	public Internationalizer (String language) {
		if ( language.equalsIgnoreCase("english") ) {
			locale = new Locale("en", "US");
			bundle = ResourceBundle.getBundle("LanguageBundle", locale);
		}
		else if ( language.equalsIgnoreCase("french") ) {
			locale = new Locale("fr", "CA");
			bundle = ResourceBundle.getBundle("LanguageBundle", locale);
		}
	}
	
	public String getWords (String words) {
		return bundle.getString(words);
	}
}