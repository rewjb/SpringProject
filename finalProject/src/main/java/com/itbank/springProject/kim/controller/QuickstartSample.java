package com.itbank.springProject.kim.controller;

//Imports the Google Cloud client library
import com.google.cloud.translate.Translate;
import com.google.cloud.translate.Translate.TranslateOption;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;

public class QuickstartSample {
	public String translate(String text) throws Exception {
		 // Instantiates a client
		 Translate translate = TranslateOptions.getDefaultInstance().getService();
		
		 // The text to translate
		
		 // Translates some text into Russian
		 Translation translation =
		     translate.translate(
		         text,
		         TranslateOption.sourceLanguage("en"),
		         TranslateOption.targetLanguage("ko"));
		
		
		 //System.out.printf("Text: %s%n", text);
		 String result = translation.getTranslatedText();
		 return result;
	}
}
