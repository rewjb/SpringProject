package com.itbank.springProject.db;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoClientFactoryBean;
import org.springframework.data.mongodb.core.MongoClientOptionsFactoryBean;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoClientDbFactory;
import org.springframework.stereotype.Repository;

import com.itbank.springProject.rew.controller.mongoDB_delete;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class Mongo_ShareProjectDAO {

	
	MongoClient mongoClient;
	MongoDatabase database;
	
	public MongoClient getMongoClient() {
		return mongoClient;
	}

	public void setMongoClient(MongoClient mongoClient) {
		this.mongoClient = mongoClient;
		database = mongoClient.getDatabase("tag");
	}

	public void mongoTest(List<PlanDTO> sharePidList) {
		
		if (sharePidList.size() > 0) {
			
			MongoCollection<Document> collectionPlace = database.getCollection("place");
			MongoCollection<Document> collectionsharePlace = database.getCollection("sharePlace");

			List<Document> condition = new ArrayList<>();

			for (int i = 0; i < sharePidList.size(); i++) {
				if (sharePidList.get(i).getPid()!=null) {
					condition.add(new Document("id", sharePidList.get(i).getPid()));
					System.out.println("아이디" + sharePidList.get(i).getPid());
				}
			}

			MongoCursor<Document> result = collectionPlace.find(new Document("$or", condition)).iterator();

			ArrayList<String> singleTagList = new ArrayList<>();
			String tempSingleTag[];

			while (result.hasNext()) {

				tempSingleTag = result.next().get("tag").toString().split("/");

				for (int i = 0; i < tempSingleTag.length; i++) {
					if (!singleTagList.contains(tempSingleTag[i])) {
						singleTagList.add(tempSingleTag[i]);
					}
				}
			}

			String insertTag = "";
			for (int i = 0; i < singleTagList.size(); i++) {
				insertTag += singleTagList.get(i)+"/";
			}
			
			Document insertDocument = new Document("mid" , sharePidList.get(0).getMid());
			insertDocument.append("ptitle", sharePidList.get(0).getPtitle());
			insertDocument.append("tag", insertTag);

			collectionsharePlace.insertOne(insertDocument);
			
			MongoCursor<Document> result2 = collectionsharePlace.find().iterator();
			
			while (result2.hasNext()) {
				System.out.println(result2.next().toJson());
			}
			
		}
	}

}
