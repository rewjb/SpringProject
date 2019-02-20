package com.itbank.springProject.db;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

@Repository("Mongo_ShareProjectDAO")
public class Mongo_ShareProjectDAO {

	@Autowired
	@Qualifier("mongoClient")
	MongoClient mongoClient;

	public void mongoTest(List<PlanDTO> sharePidList) {
		
		
		  MongoClientURI uri = new MongoClientURI(
			    "mongodb+srv://rew:1234@rewjubinmongo-g7aac.mongodb.net/test?retryWrites=true");

			MongoClient mongoClient = new MongoClient(uri);
			
			
			MongoDatabase database = mongoClient.getDatabase("tag");
			
		    MongoCollection<Document> collection = database.getCollection("place");
			
			
			List<Document> condition = new ArrayList<>();
			
			for (int i = 0; i < sharePidList.size(); i++) {
				condition.add(new Document("id", sharePidList.get(i).getPid()));
			}
			
			
			MongoCursor<Document> result = collection.find(new Document("$or", condition ) ).iterator();
			
			while (result.hasNext()) {
				System.out.println(result.next().toJson());
			}
	}

}
