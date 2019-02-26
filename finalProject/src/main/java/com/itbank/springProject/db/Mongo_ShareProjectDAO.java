package com.itbank.springProject.db;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Stack;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.eclipse.jdt.internal.compiler.codegen.DoubleCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.data.mongodb.core.MongoClientFactoryBean;
import org.springframework.data.mongodb.core.MongoClientOptionsFactoryBean;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoClientDbFactory;
import org.springframework.stereotype.Controller;
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
import com.mongodb.client.model.UpdateOptions;

@Controller
public class Mongo_ShareProjectDAO {

	MongoClient mongoClient = new MongoClient("localhost", 27017);

	public void insertHeadComment(List<PlanDTO> sharePidList) {
		
		MongoClient mongoClient = new MongoClient("localhost", 27017);

		Mongo_ShareProjectDTO MongoComment = new Mongo_ShareProjectDTO();

		MongoDatabase tagDB = mongoClient.getDatabase("tag");

		MongoCollection<Document> commentColl = tagDB.getCollection("shareProjectComment");
		
//		commentColl.deleteMany(new Document());
//		ArrayList<String> asd = new ArrayList<>();
//		Document tempInsert = new Document();
//		tempInsert.append("mid", "temp");
//		tempInsert.append("ptitle", "안녕");
//		tempInsert.append("star", null);
//		tempInsert.append("star_join", null);
//		tempInsert.append("tag", null);
//		tempInsert.append("link", asd);
//		commentColl.insertOne(tempInsert);
//		데이터 초기화 주석
		
		Date time = new Date();
		Document insertComment = new Document();
		insertComment.append("mid", "temp1");
		insertComment.append("star", 5);
		insertComment.append("time", time.toString());
		insertComment.append("comment", "그건 아닌듯..");
		insertComment.put("link", Arrays.asList());
		
		Document findCondition1 = new Document("mid","temp");
		Document findCondition2 = new Document("ptitle","안녕");
		 
		ArrayList<Document> conditionList = new ArrayList<>();
		conditionList.add(findCondition1);
		conditionList.add(findCondition2);
		
		
		MongoCursor<Document> tempResult  = commentColl.find(new Document("$and",conditionList)).iterator();
		Document tempDoc;
		double tempStar = 0;
		int tempStar_join = 0;
		
		while (tempResult.hasNext()) {
			
			tempDoc = tempResult.next();
			
			tempStar =  tempDoc.get("star", Double.class);
			tempStar_join = tempDoc.get("star_join",Integer.class);
		}
		
		Document starPath=  new Document("star", (double)(((int)insertComment.get("star"))+tempStar*tempStar_join)/(tempStar_join+1));
		Document star_joinPath=  new Document("star_join", tempStar_join+1);
		
		commentColl.updateOne(new Document("$and",conditionList) , new Document("$set", starPath));
		commentColl.updateOne(new Document("$and",conditionList) , new Document("$set", star_joinPath));
		
//		Document pathCondition =  new Document("link.$[].link.$[abcd].link", new Document("pid","doc1_1_1"));
		Document commentPath=  new Document("link", insertComment);
		commentColl.updateOne(new Document("$and",conditionList) , new Document("$push", commentPath));
		
		MongoCursor<Document> result = commentColl.find().iterator();
		while (result.hasNext()) {
			System.out.println(result.next().toJson());
		}

	}

	Mongo_ShareProjectDAO() {
		
		MongoClient mongoClient = new MongoClient("localhost", 27017);

		Mongo_ShareProjectDTO MongoComment = new Mongo_ShareProjectDTO();

		MongoDatabase tagDB = mongoClient.getDatabase("tag");

		MongoCollection<Document> commentColl = tagDB.getCollection("shareProjectComment");
		
		MongoCursor<Document> result = commentColl.find().iterator();
		
		Document sad ;
		while (result.hasNext()) {
			
			sad = result.next();
			
			System.out.println(sad.toJson());
			
			selectAll(sad);
		}

	}
	
	Document field;

	int spaceCount = 0;

	String space;

	Stack<String> stackID = new Stack<>();
	
	ArrayList<Document> totalCommentList = new ArrayList<>();
	
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

			stackID.push((String) list.get(i).get("mid"));
			for (int j = 0; j < stackID.size(); j++) {
				System.out.print(stackID.get(j) + "/");
			}
			
			System.out.println();
			System.out.println("------------------------------------------------");

			System.out.println(space + "mid = " + list.get(i).get("mid"));
			System.out.println(space + "star = " + list.get(i).get("star"));
			System.out.println(space + "content = " + list.get(i).get("comment"));
			System.out.println(space + "time = " + list.get(i).get("time"));
			
			
//			totalCommentList.add(e);
			
			selectAll(list.get(i));

			if (stackID.size() != 0) {
				stackID.pop();
			}
		}
		--spaceCount;
	}
	
	public static void main(String[] args) {
		new Mongo_ShareProjectDAO();
	}

}
