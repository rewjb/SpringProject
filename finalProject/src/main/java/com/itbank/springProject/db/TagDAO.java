package com.itbank.springProject.db;

import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.WriteConcern;

@Repository("TagDAO")
public class TagDAO {
	
	public void insert(String name, String tag) {
		
        MongoClient mongoClient = null;
        
        try{
            mongoClient = new MongoClient("localhost",27017);
            System.out.println("접속 성공");
            //쓰기권한 부여
            WriteConcern w = new WriteConcern(1,2000);//쓰게 락 갯수, 연결 시간 2000 //쓰레드 쓰게되면 2개 동시에 쓸 경우도 생기니까
            mongoClient.setWriteConcern(w);
            //데이터베이스 연결
            DB db = mongoClient.getDB("tag");
            //컬렉션 가져오기
            DBCollection coll = db.getCollection("place");
            
            //user 테이블에 데이터삽입
            DBObject doc = new BasicDBObject();
            doc.put(name,tag);
            coll.insert(doc);
            
        }catch (Exception e) {
			e.printStackTrace();
		}
	}

}
