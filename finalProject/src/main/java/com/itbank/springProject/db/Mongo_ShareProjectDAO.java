package com.itbank.springProject.db;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.itbank.springProject.rew.controller.mongoDB_delete;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.MongoClientURI;
import com.mongodb.WriteConcern;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.UpdateOptions;
import com.mongodb.client.result.UpdateResult;
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

@Repository("Mongo_ShareProjectDAO")
public class Mongo_ShareProjectDAO {

	// private MongoTemplate mongoTemplate;

	private MongoClient mongoClient = new MongoClient("35.190.134.214", 27017);

	private MongoDatabase tagDB = mongoClient.getDatabase("tag");

	public MongoCollection<Document> commentColl = tagDB.getCollection("shareProject");

	private int spaceCount = 0;

	// 경로의 저장을 위한 stack
	private Stack<String> stackID = new Stack<>();
	private String space;
	
	public Map<String, String> createProjectTagMap(){
		//작업
		HashMap<String, String> map = new HashMap<>();
		MongoClient mongoClient = new MongoClient("35.190.134.214", 27017);
		DB db = mongoClient.getDB("tag");
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
		map.put(pMid_ptitle, tag);
		}
		return map;
	}

	public void createProjectInMongo(ShareProjectDTO shareDTO, String  insertTag) {
		// commentColl.deleteMany(new Document());
		// 잠시 삭제
		Document newDocument = new Document();
		newDocument.append("pMid", shareDTO.getMid());
		newDocument.append("ptitle", shareDTO.getPtitle());
		newDocument.append("star", 0.0);
		newDocument.append("star_join", 0);
		newDocument.append("tag", insertTag);
		newDocument.append("link", Arrays.asList());
		commentColl.insertOne(newDocument);

		MongoCursor<Document> result = commentColl.find().iterator();
		while (result.hasNext()) {
			System.out.println(result.next().toJson());
		}

	}

	// ...프로젝트 공유시 몽고에 최초 1회 넣어주는 메서드

	// 댓글 삭제하는 메서드
	public String deleteComment(Mongo_ShareProjectDTO MongoComment, String dist) {

		UpdateResult result;

		// System.out.println("DAO로 넘어온 DTO 값="+MongoComment);

		List<Document> findOptionList = new ArrayList<>();
		findOptionList.add(new Document("pMid", MongoComment.getpMid()));
		findOptionList.add(new Document("ptitle", MongoComment.getPtitle()));

		String path = "link";
		for (int i = 1; i < MongoComment.getLevel(); i++) {
			if (i == (MongoComment.getLevel() - 1)) {
				path += ".$[abcd].link";
			} else {
				path += ".$[].link";
			}
		}

		// System.out.println(path);
		Document updateDocument = new Document();
		updateDocument.append(path, new Document("reg_date", dist.split("&&")[1]));

		// System.out.println(updateDocument.toJson());

		Document temp = new Document();
		temp.append(path, updateDocument);

		// Document temp= new Document("link.$[].link.$[abcd].link", new
		// Document("pid","doc1_1_1"));
		// Document temp2 = new Document("abcd.pid","doc1_1");

		List<Document> optionList = new ArrayList<>();
		optionList.add(new Document("abcd.reg_date", MongoComment.getDistinction().split("&&")[1]));
		UpdateOptions options = new UpdateOptions().arrayFilters(optionList);

		if (MongoComment.getLevel() == 1) {
			path = "link";
			result = commentColl.updateOne(new Document("$and", findOptionList), new Document("$pull", updateDocument));
		} else {
			result = commentColl.updateOne(new Document("$and", findOptionList), new Document("$pull", updateDocument),
					options);
		}

		String resultString = "no";

		if (result.getModifiedCount() > 0) {
			resultString = "yes";
		}

		return resultString;
	}
	// ...댓글 삭제하는 메서드

	// 대댓글 수정하는 메서드
	public String updateComment(Mongo_ShareProjectDTO MongoComment) {

		UpdateResult result;

		// System.out.println("DAO로 넘어온 DTO 값="+MongoComment);

		List<Document> findOptionList = new ArrayList<>();
		findOptionList.add(new Document("pMid", MongoComment.getpMid()));
		findOptionList.add(new Document("ptitle", MongoComment.getPtitle()));

		String path = "link";
		for (int i = 0; i < MongoComment.getLevel(); i++) {
			if (i == (MongoComment.getLevel() - 1)) {
				path += ".$[abcd].content";
			} else {
				path += ".$[].link";
			}
		}

		// System.out.println(path);
		Document updateDocument = new Document();
		updateDocument.append(path, MongoComment.getContent());

		// System.out.println(updateDocument.toJson());

		Document temp = new Document();
		temp.append(path, updateDocument);

		// System.out.println("답글이네");
		List<Document> optionList = new ArrayList<>();
		optionList.add(new Document("abcd.reg_date", MongoComment.getDistinction().split("&&")[1]));
		UpdateOptions options = new UpdateOptions().arrayFilters(optionList);

		if (MongoComment.getLevel() == 1) {
			result = commentColl.updateOne(new Document("$and", findOptionList), new Document("$set", updateDocument),
					options);
		} else {
			result = commentColl.updateOne(new Document("$and", findOptionList), new Document("$set", updateDocument),
					options);
		}

		String resultString = "no";

		if (result.getModifiedCount() > 0) {
			resultString = "yes";
		}

		return resultString;
	}
	// ...대댓글 수정하는 메서드

	// HeadCommnet 삽입
	public Document insertComment(Mongo_ShareProjectDTO MongoComment) {

		List<Document> findOptionList = new ArrayList<>();
		findOptionList.add(new Document("pMid", MongoComment.getpMid()));
		findOptionList.add(new Document("ptitle", MongoComment.getPtitle()));

		Document insertDocument = new Document();
		insertDocument.append("mid", MongoComment.getMid());
		insertDocument.append("content", MongoComment.getContent());
		insertDocument.append("reg_date", new Date().toString());
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
		Document insertDoc_path = new Document(path, insertDocument);

		UpdateResult result;

		// System.out.println(path);

		if (MongoComment.getLevel() == 1) {

			// System.out.println("첫댓글을 !!");

			// System.out.println(new Document("$and",
			// findOptionList).toJson());
			// System.out.println( new Document("$push",
			// insertDoc_path).toJson());

			result = commentColl.updateOne(new Document("$and", findOptionList), new Document("$push", insertDoc_path));

			MongoCursor<Document> tempResult = commentColl.find(new Document("$and", findOptionList)).iterator();

			// System.out.println("여기 실행되니 ?");

			Document tempDoc;
			double tempStar = 0;
			int tempStar_join = 0;

			while (tempResult.hasNext()) {

				tempDoc = tempResult.next();

				tempStar = tempDoc.get("star", Double.class);
				tempStar_join = tempDoc.get("star_join", Integer.class);
			}

			Document starPath = new Document("star",
					(double) (((int) insertDocument.get("star")) + tempStar * tempStar_join) / (tempStar_join + 1));
			Document star_joinPath = new Document("star_join", tempStar_join + 1);

			commentColl.updateOne(new Document("$and", findOptionList), new Document("$set", starPath));
			commentColl.updateOne(new Document("$and", findOptionList), new Document("$set", star_joinPath));

		} else {
			// System.out.println("답글이네");
			List<Document> optionList = new ArrayList<>();
			optionList.add(new Document("abcd.reg_date", MongoComment.getDistinction().split("&&")[1]));
			UpdateOptions options = new UpdateOptions().arrayFilters(optionList);
			result = commentColl.updateOne(new Document("$and", findOptionList), new Document("$push", insertDoc_path),
					options);
		}

		if (result.getMatchedCount() > 0) {
			return insertDocument;
		} else {
			return null;
		}

	}
	// ...HeadCommnet 삽입

	// 전부 선택하는 메서드
	public List<Document> selectAll(Mongo_ShareProjectDTO mongoDTO) {

		Document findCondition1 = new Document("pMid", mongoDTO.getpMid());
		Document findCondition2 = new Document("ptitle", mongoDTO.getPtitle());

		ArrayList<Document> conditionList = new ArrayList<>();
		conditionList.add(findCondition1);
		conditionList.add(findCondition2);

		MongoCursor<Document> cursor = commentColl.find(new Document("$and", conditionList)).iterator();

		List<Document> list = new ArrayList<>();
		readAllComment(cursor.next(), list);
		return list;
	}
	// ...전부 선택하는 메서드

	// 모든 댓글을 읽는 메서드! = > 전부 선택하는 메서드와 쌍을 이룬다.
	private void readAllComment(Document result, List<Document> totalCommentList) {
		++spaceCount;

		int tempI = 0;

		List<Document> list;

		list = (List<Document>) result.get("link");

		if (list != null) {

			for (int i = 0; i < list.size(); i++) {

				tempI = list.size() - i - 1;

				// System.out.println();

				space = "";
				for (int j = 0; j < spaceCount; j++) {
					space += "\t";
				}

				stackID.push((String) list.get(tempI).get("mid") + "&&" + (String) list.get(tempI).get("reg_date"));
				// System.out.print("구분값 = " + stackID.get(stackID.size() - 1) +
				// "/ 레벨 = " + spaceCount);

				// System.out.println();
				// System.out.println("------------------------------------------------");

				// System.out.println(space + "mid = " +
				// list.get(tempI).get("mid"));
				// System.out.println(space + "star = " +
				// list.get(tempI).get("star"));
				// System.out.println(space + "content = " +
				// list.get(tempI).get("content"));
				// System.out.println(space + "time = " +
				// list.get(tempI).get("reg_date"));

				list.get(tempI).append("level", spaceCount);
				list.get(tempI).append("distinction", stackID.get(stackID.size() - 1));

				totalCommentList.add(list.get(tempI));

				// totalCommentList.add(e);

				readAllComment(list.get(tempI), totalCommentList);

				if (stackID.size() != 0) {
					stackID.pop();
				}
			}
		}
		--spaceCount;
	}
	// 모든 댓글을 읽는 메서드! = > 전부 선택하는 메서드와 쌍을 이룬다.

}
