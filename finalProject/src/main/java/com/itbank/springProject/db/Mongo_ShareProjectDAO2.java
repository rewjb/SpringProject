package com.itbank.springProject.db;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Stack;

import javax.print.Doc;

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
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.UpdateOptions;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_COLOR_BURNPeer;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

//commentColl.deleteMany(new Document());
//ArrayList<String> asd = new ArrayList<>();
//Document tempInsert = new Document();
//tempInsert.append("pMid", "temp");
//tempInsert.append("ptitle", "안녕");
//tempInsert.append("star", null);
//tempInsert.append("star_join", null);
//tempInsert.append("tag", null);
//tempInsert.append("link", asd);
//commentColl.insertOne(tempInsert);
//데이터 초기화 주석

public class Mongo_ShareProjectDAO2 {

	
	private MongoClient mongoClient = new MongoClient("localhost", 27017);

	private MongoDatabase tagDB = mongoClient.getDatabase("tag");

	public MongoCollection<Document> commentColl = tagDB.getCollection("shareProjectComment");

	private int spaceCount = 0;
	
	

	// 경로의 저장을 위한 stack
	private Stack<String> stackID = new Stack<>();
	private String space;

	private ArrayList<Document> totalCommentList = new ArrayList<>();

	// HeadCommnet 삽입
	public void insertComment(Mongo_ShareProjectDTO MongoComment) {
		
		List<Document> findOptionList = new ArrayList<>();
		findOptionList.add(new Document("pMid", MongoComment.getpMid()));
		findOptionList.add(new Document("ptitle", MongoComment.getPtitle()));

		Document insertDocument = new Document();
		insertDocument.append("mid", MongoComment.getMid());
		insertDocument.append("content", MongoComment.getContent());
		insertDocument.append("reg_date", MongoComment.getReg_date());
		insertDocument.append("link", Arrays.asList());
		if (MongoComment.getLevel() == 1) {
			insertDocument.append("star", MongoComment.getStarValue());
		}

		String path = "link";
		for (int i = 1; i < MongoComment.getLevel(); i++) {
			if (i == (MongoComment.getLevel() - 1)) {
				path += ".$[abcd].link";
			} else {
				path += ".$[].link";
			}
		}
		System.out.println(path);
		Document insertDoc_path = new Document(path, insertDocument);
		if (MongoComment.getLevel() == 1) {
			System.out.println(insertDocument.toJson());
			commentColl.updateOne(new Document("$and", findOptionList), new Document("$push", insertDoc_path));
		} else {
			List<Document> optionList = new ArrayList<>();
			optionList.add(new Document("abcd.reg_date", MongoComment.getDistinction().split("&&")[1]));
			UpdateOptions options = new UpdateOptions().arrayFilters(optionList);
			commentColl.updateOne(new Document("$and", findOptionList), new Document("$push", insertDoc_path),  options);
		}
	}
	// ...HeadCommnet 삽입

	public void asdas(Mongo_ShareProjectDTO temp) {

		Date time = new Date();
		Document insertComment = new Document();
		insertComment.append("mid", "temp1");
		insertComment.append("star", 5);
		insertComment.append("time", time.toString());
		insertComment.append("comment", "그건 아닌듯..");
		insertComment.put("link", Arrays.asList());

		Document findCondition1 = new Document("mid", "temp");
		Document findCondition2 = new Document("ptitle", "안녕");

		ArrayList<Document> conditionList = new ArrayList<>();
		conditionList.add(findCondition1);
		conditionList.add(findCondition2);

		MongoCursor<Document> tempResult = commentColl.find(new Document("$and", conditionList)).iterator();
		Document tempDoc;
		double tempStar = 0;
		int tempStar_join = 0;

		while (tempResult.hasNext()) {

			tempDoc = tempResult.next();

			tempStar = tempDoc.get("star", Double.class);
			tempStar_join = tempDoc.get("star_join", Integer.class);
		}

		Document starPath = new Document("star",
				(double) (((int) insertComment.get("star")) + tempStar * tempStar_join) / (tempStar_join + 1));
		Document star_joinPath = new Document("star_join", tempStar_join + 1);

		commentColl.updateOne(new Document("$and", conditionList), new Document("$set", starPath));
		commentColl.updateOne(new Document("$and", conditionList), new Document("$set", star_joinPath));

		// Document pathCondition = new Document("link.$[].link.$[abcd].link",
		// new Document("pid","doc1_1_1"));
		Document commentPath = new Document("link", insertComment);
		commentColl.updateOne(new Document("$and", conditionList), new Document("$push", commentPath));

		MongoCursor<Document> result = commentColl.find().iterator();
		while (result.hasNext()) {
			System.out.println(result.next().toJson());
		}
	}

	public void asdsad() {

		MongoClient mongoClient = new MongoClient("localhost", 27017);

		Mongo_ShareProjectDTO MongoComment = new Mongo_ShareProjectDTO();

		MongoDatabase tagDB = mongoClient.getDatabase("tag");

		MongoCollection<Document> commentColl = tagDB.getCollection("shareProjectComment");

		MongoCursor<Document> result = commentColl.find().iterator();

		Document sad;

		while (result.hasNext()) {

			sad = result.next();

			System.out.println(sad.toJson());

			selectAll(sad);
		}
	}

	private void selectAll(Document result) {
		++spaceCount;

		List<Document> list;

		list = (List<Document>) result.get("link");


			if (list != null) {

				for (int i = 0; i < list.size(); i++) {

					System.out.println();

					space = "";
					for (int j = 0; j < spaceCount; j++) {
						space += "\t";
					}

					stackID.push((String) list.get(i).get("mid") + "&&" + (String) list.get(i).get("reg_date"));
					System.out.print("구분값 = " + stackID.get(stackID.size() - 1) + "/ 레벨 = " + spaceCount);

					System.out.println();
					System.out.println("------------------------------------------------");

					System.out.println(space + "mid = " + list.get(i).get("mid"));
					System.out.println(space + "star = " + list.get(i).get("star"));
					System.out.println(space + "content = " + list.get(i).get("content"));
					System.out.println(space + "time = " + list.get(i).get("reg_date"));

					// totalCommentList.add(e);

					selectAll(list.get(i));

					if (stackID.size() != 0) {
						stackID.pop();
					}
				}
			}
			--spaceCount;
	}
	// 메서드 : selectAll 종료

	public static void asdsadsad(String[] args) {

		MongoClient mongoClient = new MongoClient("localhost", 27017);

		Mongo_ShareProjectDTO MongoComment = new Mongo_ShareProjectDTO();

		MongoDatabase tagDB = mongoClient.getDatabase("tag");

		MongoCollection<Document> commentColl = tagDB.getCollection("shareProjectComment");

		Date time = new Date();
		Document insertComment = new Document();
		insertComment.append("mid", "temp2");
		insertComment.append("star", 5);
		insertComment.append("time", time.toString());
		insertComment.append("comment", "뭐가 아닌가요 ? ");
		insertComment.put("link", Arrays.asList());

		Document findCondition1 = new Document("mid", "temp");
		Document findCondition2 = new Document("ptitle", "안녕");

		ArrayList<Document> conditionList = new ArrayList<>();
		conditionList.add(findCondition1);
		conditionList.add(findCondition2);

		MongoCursor<Document> tempResult = commentColl.find(new Document("$and", conditionList)).iterator();
		Document tempDoc;
		double tempStar = 0;
		int tempStar_join = 0;

		while (tempResult.hasNext()) {

			tempDoc = tempResult.next();

			tempStar = tempDoc.get("star", Double.class);
			tempStar_join = tempDoc.get("star_join", Integer.class);
		}

		Document starPath = new Document("star",
				(double) (((int) insertComment.get("star")) + tempStar * tempStar_join) / (tempStar_join + 1));
		Document star_joinPath = new Document("star_join", tempStar_join + 1);

		commentColl.updateOne(new Document("$and", conditionList), new Document("$set", starPath));
		commentColl.updateOne(new Document("$and", conditionList), new Document("$set", star_joinPath));

		// Document pathCondition = new Document("link.$[].link.$[abcd].link",
		// new Document("pid","doc1_1_1"));

		Document commentPath = new Document("link.$[parent].link", insertComment);
		List<Document> option = new ArrayList<>();
		option.add(new Document("parent.time", "Mon Feb 25 19:37:24 KST 2019"));
		UpdateOptions options = new UpdateOptions().arrayFilters(option);

		commentColl.updateOne(new Document("$and", conditionList), new Document("$push", commentPath), options);

		MongoCursor<Document> result = commentColl.find().iterator();
		while (result.hasNext()) {
			System.out.println(result.next().toJson());
		}

	}

	// 실행
	public static void main(String[] args) {

		Mongo_ShareProjectDTO testDTO = new Mongo_ShareProjectDTO();

		testDTO.setpMid("temp");
		testDTO.setPtitle("안녕");
		testDTO.setMid("유주빈112");
		testDTO.setContent("너무 좋아요1dddㅇㅁㄴㅇㄴㅁㅇ아나");
		testDTO.setReg_date(new Date().toString());
		testDTO.setStarValue(5);
		testDTO.setDistinction("유주빈112&&Tue Feb 26 12:56:31 KST 2019");
		testDTO.setLevel(3);

		
		
		
		Mongo_ShareProjectDAO2 testDAO = new Mongo_ShareProjectDAO2();
		
//		insert문 완료!
//		testDAO.insertComment(testDTO);
		
		
//		testDAO.commentColl.deleteMany(new Document());
//		ArrayList<String> asd = new ArrayList<>();
//		Document tempInsert = new Document();
//		tempInsert.append("pMid", "temp");
//		tempInsert.append("ptitle", "안녕");
//		tempInsert.append("star", 0);
//		tempInsert.append("star_join", 0);
//		tempInsert.append("tag", "");
//		tempInsert.append("link", asd);
//		testDAO.commentColl.insertOne(tempInsert);
		//데이터 초기화 주석



		MongoCursor<Document> result = testDAO.commentColl.find().iterator();
		while (result.hasNext()) {
			Document tempdoc = result.next();
			System.out.println(tempdoc.toJson());
			testDAO.selectAll(tempdoc);
		}

	}

}
