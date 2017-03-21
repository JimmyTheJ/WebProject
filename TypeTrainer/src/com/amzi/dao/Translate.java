package com.amzi.dao;

import com.gtranslate.Language;
import com.gtranslate.Translator;

public class Translate {
	
	static Translator translate;
	
	public Translate(){
		
		
		translate = Translator.getInstance();
		
	}
	
	public static String getTranslation(String input){
		String output = translate.translate(input, Language.ENGLISH, Language.FRENCH);
		
		return output;
	}

}
