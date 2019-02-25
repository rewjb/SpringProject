package com.itbank.springProject.rew.controller;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.springframework.data.mongodb.core.MongoClientFactoryBean;
import org.springframework.data.mongodb.core.MongoClientOptionsFactoryBean;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class testmongo2 {

	// 아이디1000000212101
	// 아이디1000000348101
	// 아이디1000000354101
	public static void main(String[] args) {

		MongoClientURI uri = new MongoClientURI(
				"mongodb+srv://rew:1234@rewjubinmongo-g7aac.mongodb.net/test?retryWrites=true");
		
		

		MongoClient mongoClient = new MongoClient(uri);
		MongoDatabase data =  mongoClient.getDatabase("tag");
		
//		MongoTemplate mongoTemplate = new MongoTemplate(mongoClient, "tag");

		MongoCollection<Document> collectionPlace = data.getCollection("place");
//		MongoCollection<Document> collectionsharePlace = data.getCollection("sharePlace");

//		List<Document> condition = new ArrayList<>();
//
//		condition.add(new Document("id", "1000000212101"));
//		condition.add(new Document("id", "1000000348101"));
//		condition.add(new Document("id", "1000000354101"));
		
		collectionPlace.insertOne(new Document("dd","sad"));

		MongoCursor<Document> result = collectionPlace.find().iterator();
//		MongoCursor<Document> result = collectionPlace.find(new Document("$or", condition)).iterator();

		while (result.hasNext()) {
			System.out.println(result.next().toJson());
		}

	}
}
