package com.itbank.springProject.rew.controller;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;

public class testmongo {
	
	public static void main(String[] args) {
		  MongoClientURI uri = new MongoClientURI(
			    "mongodb+srv://rew:1234@rewjubinmongo-g7aac.mongodb.net/test?retryWrites=true");

			MongoClient mongoClient = new MongoClient(uri);
			MongoDatabase database = mongoClient.getDatabase("test");
			
			System.out.println("데이터 베이스 정상 실행");
	}

}
