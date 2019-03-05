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

	// 아이디1000000212101
	// 아이디1000000348101
	// 아이디1000000354101
	testmongo2() {
		String userTagText = "Chinesearchitecture/Japanesearchitecture/Holyplaces/Placeofworship";
		String userTagArray[] = userTagText.split("/");

		ArrayList<tagPool> shareProjectList = new ArrayList<>();

		//작업
		HashMap<String, String> map = new HashMap<>();
		MongoClient mongoClient = new MongoClient("34.73.189.101", 27017);
		DB db = mongoClient.getDB("tag");
		// 컬렉션 가져오기
		DBCollection coll = db.getCollection("shareProject");
		DBCursor cursor = coll.find();
		String tag = "";
		String pMid_ptitle = "";
		DBObject nowDoc;

		while (cursor.hasNext()) {
			nowDoc = cursor.next();
			pMid_ptitle = nowDoc.get("pMid") + "/" + nowDoc.get("ptitle");
			tag = (String) nowDoc.get("tag");
			map.put(pMid_ptitle, tag);
		}

		tagPool inputTag = null;
		int temp = 0;
		Set key = map.keySet();
		Iterator<String> iter = key.iterator();
		String strKey = null;

		for (int i = 0; i < key.size(); i++) {
			strKey = iter.next();
			temp = 0;
			for (int j = 0; j < userTagArray.length; j++) {
				if (map.get(strKey).contains(userTagArray[i])) {
					++temp;
				}
			}
			inputTag = new tagPool();
			inputTag.setProjectInfo(strKey);
			inputTag.setCount(i);//원래 temp 들어감
			shareProjectList.add(inputTag);
		}

		//		for (int i = 0; i < shareProjectList.size(); i++) {
		//			System.out.print("정보="+shareProjectList.get(i).getProjectInfo()+"\t");
		//			System.out.println("카운트="+shareProjectList.get(i).getCount());
		//		}확인용 메서드

		for (int i = 0; i < shareProjectList.size(); i++) {
			for (int j = i; j < shareProjectList.size(); j++) {
				if (shareProjectList.get(j).getCount() > shareProjectList.get(i).getCount()) {
					inputTag = shareProjectList.get(j);
					shareProjectList.add(j, shareProjectList.get(i));
					shareProjectList.remove(j + 1);
					shareProjectList.add(i, inputTag);
					shareProjectList.remove(i + 1);
				}
			}
		} // 정렬 for문! 선택정렬임

		//		for (int i = 0; i < shareProjectList.size(); i++) {
		//			System.out.print("정보="+shareProjectList.get(i).getProjectInfo()+"\t");
		//			System.out.println("카운트="+shareProjectList.get(i).getCount());
		//		}확인용

	}

	//임시 내부 DTO
	class tagPool {

		private String ProjectInfo;
		private int count;

		public String getProjectInfo() {
			return ProjectInfo;
		}

		public void setProjectInfo(String projectInfo) {
			ProjectInfo = projectInfo;
		}

		public int getCount() {
			return count;
		}

		public void setCount(int count) {
			this.count = count;
		}
	}

	public static void main(String[] args) {

		MongoClient mongoClient = new MongoClient("34.73.189.101", 27017);

		MongoDatabase tagDB = mongoClient.getDatabase("tag");

		MongoCollection<Document> commentColl = tagDB.getCollection("shareProject");

		Document temp = new Document("reg_date", -1);
		temp.append("star", -1);

		System.out.println(temp.toJson());
		System.out.println(new Document("$sort", temp).toJson());

		MongoCursor<Document> cursor = commentColl.find().sort(temp).iterator();
		
		List<ShareProjectDTO> shareList = new ArrayList<>();
		
		ShareProjectDTO dto=null;
		
		while (cursor.hasNext()) {
			temp = cursor.next();
			dto = new ShareProjectDTO();
			dto.setMid(temp.getString("pMid"));
			dto.setPtitle(temp.getString("ptitle"));
			
			shareList.add(dto);
		}
		
		
		for (int i = 0; i < shareList.size(); i++) {
			System.out.println(shareList.get(i).getPtitle());
		}
		

	}

}
