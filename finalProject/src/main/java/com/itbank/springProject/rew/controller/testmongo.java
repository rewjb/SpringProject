package com.itbank.springProject.rew.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class testmongo {
	
	public static void main(String[] args) {
		
		
		  MongoClientURI uri = new MongoClientURI(
			    "mongodb+srv://rew:1234@rewjubinmongo-g7aac.mongodb.net/test?retryWrites=true");

			MongoClient mongoClient = new MongoClient(uri);
			
			
			MongoDatabase database = mongoClient.getDatabase("tag");
			
		    MongoCollection<Document> collection = database.getCollection("place");
			
			collection.deleteMany(new Document());
			
			collection.insertOne(new Document("id", "1000000354101"));
			collection.insertOne(new Document("id", "1000000212101"));
			collection.insertOne(new Document("id", "1000000348101"));
			
			collection.updateOne(new Document("id","1000000354101"),new Document( "$set" ,new Document("tag","A/B/C/D/E/F/G")) );
			collection.updateOne(new Document("id", "1000000212101"),new Document( "$set" ,new Document("tag","A/B/C/D")) );
			collection.updateOne(new Document("id", "1000000348101"),new Document( "$set" ,new Document("tag","E/F/G/H/I")) );
			
			Document doc1 = new Document("id", "1000000212101");
			Document doc2 = new Document("id", "1000000348101");
			
			List<Document> condition = new ArrayList<>();
			
			for (int i = 0; i < args.length; i++) {
				
			}
			
			
			MongoCursor<Document> result = collection.find(new Document("$or", condition ) ).iterator();
//			{ $and: [ { price: 1.99 }, { qty: { $lt: 20 } }, { sale: true } ] }
//			 $and : [ { $or : [ { price : 0.99 }, { price : 1.99 } ] }
			
			System.out.println(new Document("$and", Arrays.asList(doc1,doc2)).toJson());
			
			while (result.hasNext()) {
				System.out.println(result.next().toJson());
			}
	}

}
