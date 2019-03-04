package com.itbank.springProject.rew.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.bson.Document;
import org.springframework.data.mongodb.core.MongoClientFactoryBean;
import org.springframework.data.mongodb.core.MongoClientOptionsFactoryBean;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.MongoClientURI;
import com.mongodb.ServerAddress;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class testmongo2 {

	// 아이디1000000212101
	// 아이디1000000348101
	// 아이디1000000354101
	public static void main(String[] args) {

//		ServerAddress asd = new ServerAddress("34.73.155.96:27017");
		
		MongoClient mongoClient = new MongoClient("35.190.134.214", 27017);
		MongoDatabase data =  mongoClient.getDatabase("tag");

		MongoCollection<Document> collectionPlace = data.getCollection("shareProject");
		
//		collectionPlace.insertOne(new Document("dd","sad"));

		MongoCursor<Document> result = collectionPlace.find().iterator();
//		MongoCursor<Document> result = collectionPlace.find(new Document("$or", condition)).iterator();

		while (result.hasNext()) {
			System.out.println(result.next().toJson());
		}
		
		HashMap<String, String> map = new HashMap<>();
		MongoClient mongoClient2 = new MongoClient("35.190.134.214", 27017);
		DB db = mongoClient2.getDB("tag");
		// 컬렉션 가져오기
		DBCollection coll = db.getCollection("shareProject");
		DBCursor cursor = coll.find();
		String tag = "";
		String pMid_ptitle = "";  
		DBObject nowDoc;
		while (cursor.hasNext()) {
		nowDoc = cursor.next();
		pMid_ptitle =  nowDoc.get("pMid")+"/"+nowDoc.get("ptitle");
		tag = (String) nowDoc.get("tag");
		
		System.out.println(pMid_ptitle);
		System.out.println(tag);
		}

	}
}
