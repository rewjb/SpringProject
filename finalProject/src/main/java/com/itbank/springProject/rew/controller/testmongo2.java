package com.itbank.springProject.rew.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.bson.BsonDocument;
import org.bson.Document;
import org.bson.codecs.configuration.CodecRegistry;
import org.bson.conversions.Bson;
import org.springframework.data.mongodb.core.MongoClientFactoryBean;
import org.springframework.data.mongodb.core.MongoClientOptionsFactoryBean;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;

import com.itbank.springProject.db.ShareProjectDTO;
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

import oracle.sql.DATE;

public class testmongo2 {


	public static void main(String[] args) {

		
		MongoClient mongoClient = new MongoClient("34.73.189.101", 27017);

		MongoDatabase tagDB = mongoClient.getDatabase("tag");

		MongoCollection<Document> commentColl = tagDB.getCollection("shareProject");
		
		
		commentColl.deleteMany(new Document());

		Document temp = new Document();
		temp.append("star", -1);

		MongoCursor<Document> cursor = commentColl.find().sort(temp).iterator();
		
		while (cursor.hasNext()) {
			System.out.println(cursor.next().toJson());
		}
		
		
		
		List<ShareProjectDTO> shareList = new ArrayList<>();
		
		ShareProjectDTO dto=null;
		

	}

}
