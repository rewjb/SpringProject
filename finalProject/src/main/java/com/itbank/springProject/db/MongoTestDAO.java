package com.itbank.springProject.db;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

@Repository("MongoTestDAO")
public class MongoTestDAO {
	
	@Autowired
	@Qualifier("mongoClient")
	MongoClient mongoClient;
	
	
	public void mongoTest(){
		
		MongoDatabase database = mongoClient.getDatabase("test");

		MongoCollection<Document> collection = database.getCollection("test2");
		System.out.println(collection.getNamespace());

		collection.deleteMany(new Document());
		
		collection.insertOne(new Document("aa","bb"));
		
		
		MongoCursor<Document> result = collection.find().iterator();
		while (result.hasNext()) {
			System.out.println(result.next().toJson());

		}
		
		
	}
	

}
