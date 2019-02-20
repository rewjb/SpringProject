package com.itbank.springProject.rew.controller;

import java.awt.Event;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Stack;

import org.bson.BSON;
import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoGridFSException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.UpdateOptions;

public class mongoDB_read_update {

	Document field;

	int spaceCount = 0;

	String space;

	Stack<String> stackID = new Stack<>();

	public mongoDB_read_update() {

		 MongoClientURI uri = new MongoClientURI(
				    "mongodb+srv://rew:1234@rewjubinmongo-g7aac.mongodb.net/test?retryWrites=true");

		MongoClient mongoClient = new MongoClient(uri);
		MongoDatabase database = mongoClient.getDatabase("test");

		MongoCollection<Document> collection = database.getCollection("test2");
		System.out.println(collection.getNamespace());

		collection.deleteMany(new Document());

		Date date = new Date();

		Document doc2 = new Document();
		doc2.append("pid", "doc2");
		doc2.append("content", "doc2 ?��?��?��");
		doc2.append("time", date);
		doc2.put("link", Arrays.asList());

		Document doc1_1_1 = new Document();
		doc1_1_1.append("pid", "doc1_1_1");
		doc1_1_1.append("content", "doc1_1_1 ?��?��?��");
		doc1_1_1.append("time", date);
		doc1_1_1.put("link", Arrays.asList());

		Document doc1_1_2 = new Document();
		doc1_1_2.append("pid", "doc1_1_2");
		doc1_1_2.append("content", "doc1_1_2 ?��?��?��");
		doc1_1_2.append("time", date);
		doc1_1_2.put("link", Arrays.asList());

		Document doc1_2 = new Document();
		doc1_2.append("pid", "doc1_2");
		doc1_2.append("content", "doc1_2 ?��?��?��");
		doc1_2.append("time", date);
		doc1_2.put("link", Arrays.asList());

		Document doc1_1 = new Document();
		doc1_1.append("pid", "doc1_1");
		doc1_1.append("content", "doc1_1 ?��?��?��");
		doc1_1.append("time", date);
		doc1_1.put("link", Arrays.asList(doc1_1_1, doc1_1_2));

		Document doc1 = new Document();
		doc1.append("pid", "doc1");
		doc1.append("content", "doc1 ?��?��?��");
		doc1.append("time", date);
		doc1.append("link", Arrays.asList(doc1_1, doc1_2));

		Document first = new Document();
		first.append("link", Arrays.asList(doc1, doc2));
		

		collection.insertOne(first);
		
		collection.updateOne(new Document(),new Document( "$set" ,new Document("id","rew")) );
		


		MongoCursor<Document> result = collection.find(new Document("id","rew")).iterator();
		while (result.hasNext()) {

			Document str = result.next();
			System.out.println(str.toJson());
			selectAll(str);

		}

		System.out.println();
		System.out.println("update!!");
		update("doc1/doc1_2/", "Thu Jan 31 09:07:43 KST 2019", collection);

	}

	private void update(String path, String date, MongoCollection<Document> collection) {

		int pathCount = path.split("/").length - 1;
		System.out.println("?��?���??�� ?�� ?�� =" + pathCount);
		System.out.println("?��?�� 경로 =" + path);
		System.out.println("?���? ?���? =" + date);
		
	    Document temp=  new Document("link.$[].link.$[abcd].content","aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
	    Document temp2 = new Document("abcd.pid","doc1_1");
	    
	    List<Document> bb = new ArrayList<>();
	    bb.add(temp2);
	    UpdateOptions aa = new UpdateOptions().arrayFilters(bb);
	    
	   
		collection.updateOne( new Document("link.pid" , "doc1"), new Document("$set", temp )  , aa);
		//"booksToRead.${_id:1}.referrer.${\"userId\": 3}.type : "general friend"
		MongoCursor<Document> result = collection.find().iterator();
		//System.out.println(result.next().toJson());
		selectAll(result.next());
	//	db.temp.update({"com.A": '?��?��'}, { $set: { "com.$.A": "?���?" }})
	}

	private void selectAll(Document result) {
		++spaceCount;

		List<Document> list;
		
		list = (List<Document>) result.get("link");

		for (int i = 0; i < list.size(); i++) {

			System.out.println();

			space = "";
			for (int j = 0; j < spaceCount; j++) {
				space += "\t";
			}

			stackID.push((String) list.get(i).get("pid"));
			for (int j = 0; j < stackID.size(); j++) {
				System.out.print(stackID.get(j) + "/");
			}
			System.out.println();
			System.out.println("------------------------------------------------");

			System.out.println(space + "pid = " + list.get(i).get("pid"));
			System.out.println(space + "content = " + list.get(i).get("content"));
			System.out.println(space + "time = " + list.get(i).get("time"));
			
			selectAll(list.get(i));

			if (stackID.size() != 0) {
				stackID.pop();
			}
		}
		--spaceCount;
	}

	public static void main(String[] args) {
		new mongoDB_read_update();
	}

}
