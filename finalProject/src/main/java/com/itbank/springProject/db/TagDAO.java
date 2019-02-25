package com.itbank.springProject.db;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.WriteConcern;

@Repository("TagDAO")
public class TagDAO {
	
    public void mongoInsert(HashMap<String, String> list, Iterator<String> iter) {
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
            
    		int count = 1;
    		
    		while(iter.hasNext()){
    			String key = iter.next();
    			
    			//user 테이블에 데이터삽입
    			DBObject doc = new BasicDBObject();
    			doc.put(key,list.get(key));
    			coll.insert(doc);
    			System.out.println(count + ") " + key + " : " + list.get(key));
    			count++;
    		}
                    
            //모든 데이터 삭제
            //coll.remove(new BasicDBObject());
            
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
 
    }
    
    public void mongoDelete(HashMap<String, String> list, Iterator<String> iter) {
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
            
            //데이터 선택 삭제
            coll.remove(new BasicDBObject("", "")); //강감찬 삭제
            
        }catch (Exception e) {
			System.out.println(e.getMessage());
		}
    }
    
    public void mongoUpdate(HashMap<String, String> list, Iterator<String> iter) {
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
            
          //업데이트
          DBObject origin = new BasicDBObject("password123","바바바");
          DBObject set = new BasicDBObject("$set",new BasicDBObject("password123","ㅁㅁㅁ"));
          coll.update(origin, set);//앞이 조건 뒤에가 바뀌는 데이터
            
        }catch (Exception e) {
			System.out.println(e.getMessage());
		}
    }
    
    public void mongoSelect(String key) {
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
            
            //특정 조건에 맞는 데이터 출력
            DBObject o = new BasicDBObject();
            o.put(key,"$exists: true");
            //o.put(key,"{$exists: true}");
            DBCursor cursor = (DBCursor) coll.find(o);
            
            while(cursor.hasNext()){
                System.out.println(cursor.next().toString());
            }
            
        }catch (Exception e) {
			System.out.println(e.getMessage());
		}
    }
    
    public HashMap<String, String> mongoSelectAll() {
    	MongoClient mongoClient = null;
    	HashMap<String, String> map = new HashMap<>();
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
    		
    		
	            //user의 모든 데이터 가져오기
	          DBCursor cursor = coll.find();
	          while(cursor.hasNext()){
	              //커서의 이름중에 _id인 컬럼 값만 출력
	        	  String val = cursor.next().toString().replaceAll("\"", "").replaceAll("}", "");
	        	  String val2 = val.substring(val.indexOf(",")+1).replaceAll(" ", "");
	        	  String[] valRs = val2.split(":");
//	              System.out.print(val2.split(":")[0] + "-");
//	              System.out.println(val2.split(":")[1]);
	              map.put(valRs[0] + ".jpg", valRs[1]);
	          }
	          System.out.println("dmd");
    		
    	}catch (Exception e) {
    		System.out.println(e.getMessage());
    	}
    	return map;
    }
    
	@SuppressWarnings("unchecked")
	public static List sortByValue(final Map map) {

        List<String> list = new ArrayList<>();
        list.addAll(map.keySet());
      
        Collections.sort(list,new Comparator() {
             
            public int compare(Object o1,Object o2) {
                Object v1 = map.get(o1);
                Object v2 = map.get(o2);
                 
                return ((Comparable) v2).compareTo(v1);
            }           
        });
        //Collections.reverse(list); // 주석시 오름차순
        return list;
    }

}
